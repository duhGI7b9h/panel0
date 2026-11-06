<?php
/**
 * Created by PhpStorm.
 * User: tonyzou
 * Date: 2018/9/24
 * Time: 下午4:23
 */

namespace App\Services\Gateway;

use App\Models\Paylist;
use App\Models\Payback;
use App\Models\User;
use App\Models\Code;
use App\Services\Config;
use App\Services\CoolConfig;
use App\Utils\Telegram;
use Slim\Http\{Request, Response};

abstract class AbstractPayment
{
    /**
     * @param Request   $request
     * @param Response  $response
     * @param array     $args
     */
    abstract public function purchase($request, $response, $args);

    /**
     * @param Request   $request
     * @param Response  $response
     * @param array     $args
     */
    abstract public function notify($request, $response, $args);

    /**
     * @param Request   $request
     * @param Response  $response
     * @param array     $args
     */
    abstract public function getReturnHTML($request, $response, $args);

    /**
     * @param Request   $request
     * @param Response  $response
     * @param array     $args
     */
    abstract public function getStatus($request, $response, $args);

    abstract public function getPurchaseHTML();

    public static function add_payback($form_user, $to_user, $price)
    {
        $check_gift = Payback::where('userid', '=', $to_user->id)->where('ref_by', '=', $form_user->id)->first();

        # 返利比例不为 0
        if ($form_user->rebate !== 0) {
            # 如果用户循环返利 || 用户不是循环循环 和 config 所有用户循环 || 用户不是循环 和 是第一次返利
            if ( ($form_user->c_rebate === 1) || ($form_user->c_rebate === 0 && MetronSetting::get('c_rebate') === true) || ($form_user->c_rebate === 0 && $check_gift == null) ) { 
                # 如果用户比例 大于 0
                if ($form_user->rebate > 0) {
                    $ref_money = bcmul($price, ($form_user->rebate/100), 2);
                # 如果用户比例小于 0
                } else if ($form_user->rebate < 0) {
                    $ref_money = bcmul($price, ($_ENV['code_payback']/100), 2);
                }
                $form_user->back_money += $ref_money;
                $form_user->save();

                $Payback = new Payback();
                $Payback->total = $price;
                $Payback->userid = $to_user->id;
                $Payback->ref_by = $form_user->id;
                $Payback->ref_get = $ref_money;
                $Payback->datetime = time();
                $Payback->save();
            }
        }
    }

    public function postPayment($pid, $method)
    {
        $p = Paylist::where('tradeno', $pid)->first();

        if ($p->status == 1) {
            return json_encode(['errcode' => 0]);
        }

        $p->status = 1;
        $p->save();
        $user = User::find($p->userid);
        $user->money += $p->total;
        $user->save();
        $codeq = new Code();
        $codeq->code = $method;
        $codeq->isused = 1;
        $codeq->type = -1;
        $codeq->number = $p->total;
        $codeq->usedatetime = date('Y-m-d H:i:s');
        $codeq->userid = $user->id;
        $codeq->save();

        if ($user->ref_by >= 1) {
            $gift_user = User::where('id', '=', $user->ref_by)->first();
            $gift_user->money += ($codeq->number * (Config::get('code_payback') / 100));
            $gift_user->save();
            $Payback = new Payback();
            $Payback->total = $codeq->number;
            $Payback->userid = $user->id;
            $Payback->ref_by = $user->ref_by;
            $Payback->ref_get = $codeq->number * (Config::get('code_payback') / 100);
            $Payback->datetime = time();
            $Payback->save();
        }

        if ($user->ref_by != '' && $user->ref_by != 0 && $user->ref_by != null) {
            CoolConfig::add_payback( User::find($user->ref_by), $user, $codeq->number);
        }

        if (Config::get('enable_donate') == true) {
            if ($user->is_hide == 1) {
                Telegram::Send('一位不愿透露姓名的大老爷给我们捐了 ' . $codeq->number . ' 元!');
            } else {
                Telegram::Send($user->user_name . ' 大老爷给我们捐了 ' . $codeq->number . ' 元！');
            }
        }
        
        if (CoolConfig::get('Telegram_Payment') == true) {
            $messageText = 'Hi，管理员'.PHP_EOL . $user->user_name . ' 大老爷给我们捐了 ' . $codeq->number . ' 元！';
            $bot = new BotApi(Config::get('telegram_token'));
            $adminUser = User::where('is_admin', '=', '1')->get();
            $recharge_url = Config::get('baseUrl').'/admin/code';
            $keyboard = new \TelegramBot\Api\Types\Inline\InlineKeyboardMarkup(
                [
                    [
                        ['text' => '点击查看', 'url' => $recharge_url]
                    ]
                ]
            );
            foreach ($adminUser as $user) {
                if ($user->telegram_id != null) {
                    try {
                        $bot->sendMessage($user->telegram_id, $messageText, null, null, null, $keyboard);
                    } catch (Exception $e) {
                        
                    }
                }
            }
        }
        return 0;
    }

    public static function generateGuid()
    {
        mt_srand((double)microtime() * 10000);
        $charid = strtoupper(md5(uniqid(mt_rand() + time(), true)));
        $hyphen = chr(45);
        $uuid = chr(123)
            . substr($charid, 0, 8) . $hyphen
            . substr($charid, 8, 4) . $hyphen
            . substr($charid, 12, 4) . $hyphen
            . substr($charid, 16, 4) . $hyphen
            . substr($charid, 20, 12)
            . chr(125);
        $uuid = str_replace(['}', '{', '-'], '', $uuid);
        $uuid = substr($uuid, 0, 8);
        return $uuid;
    }
}
