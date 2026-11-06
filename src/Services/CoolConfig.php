<?php

namespace App\Services;

use App\Models\{ User, Code, Shop, Bought, Payback, Paytake };

use App\Utils\{GA, Hash, Check, Tools, DatatablesHelper};

use App\Controllers\{ UserController };

use App\Services\{
    Auth,
    Mail,
    Config,
    Payment,
    BitPayment,
    Gateway\ChenPay
};

use Ozdemir\Datatables\Datatables;

use Exception;

class CoolConfig extends \App\Controllers\BaseController
{
    public static function get($key)
    {
        global $Cool_Config;
        return $Cool_Config[$key];
    }

    public static function getPublicConfig()
    {
        global $Cool_Config;
        return $Cool_Config;
    }
    
    /**
     * 返利
     * $form_user  邀请人
     * $to_user    被邀请人
     */
    public static function add_payback($form_user, $to_user, $price)
    {
        $check_gift = Payback::where('userid', '=', $to_user->id)->where('ref_by', '=', $form_user->id)->first();

        # 返利比例不为 0
        if ($form_user->rebate !== 0) {
            # 如果用户循环返利 || 用户不是循环循环 和 config 所有用户循环 || 用户不是循环 和 是第一次返利
            if ( ($form_user->c_rebate === 1) || ($form_user->c_rebate === 0 && CoolConfig::get('all_rebate') === true) || ($form_user->c_rebate === 0 && $check_gift == null) ) { 
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
    
    public function agent($request, $response, $args)
    {
        $Shops = Shop::where("status", 1)->orderBy("id", "asc")->get();
        
    	$table_config['total_column'] = array("id" => "ID","email"=>"邮箱", "money"=>"余额", "transfer_enable" => "剩余流量", "class" => "等级", "class_expire"=>"等级到期","op"=>"操作");
        $table_config['default_show_column'] = array("id", "email", "money", "transfer_enable", "class", "class_expire", "op");
												
        $table_config['ajax_url'] = 'agent/ajax';
            
        return $this->view()
          ->assign('shop_name', $Shops)
          ->assign('table_config', $table_config)
          ->assign('time', date("Y-m-d H:i:s",time()))
          ->display('user/agent/agent.tpl');
    } 
    
    public function agent_user($request, $response, $args)
    {
        $user = $this->user;

        $id = $args['id'];
        
        $agent_user = User::where('id', $id)->where("agent_id", $user->id)->first();
        
        $Shops = Shop::where("status", 1)->orderBy("id", "asc")->get();
        
        return $this->view()
            ->assign('id', $id)
            ->assign('agent_user', $agent_user)
            ->assign('shop_name', $Shops)
            ->assign('time', date("Y-m-d H:i:s",time()))
            ->assign('subInfo', \App\Controllers\LinkController::getSubinfo($agent_user, 0))
            ->display('user/agent/edit_user.tpl');
    }
    
    public function agent_user_save($request, $response, $args)
    {
        $user = $this->user;
        
        if ($user == null || !$user->isLogin) {
            $res['ret'] = -1;
            return $response->getBody()->write(json_encode($res));
        }

        $id       = $args['id'];
        $agent_user = User::where('id', $id)->where("agent_id", $user->id)->first();

        $mode      = $request->getParam('mode');
        $name      = $request->getParam('name');
        $email     = trim($request->getParam('email'));
        $email     = strtolower($email);
        $password  = $request->getParam('passwd');
        $enable    = (int) $request->getParam('enable');
        $shopid    = (int) $request->getParam('shopid');

        switch ($mode) {
            case 'edit_user': 
                // 昵称验证
                if ($name == ''){
                    $res['ret'] = 0;
                    $res['msg'] = '昵称不允许留空';
                    return $response->getBody()->write(json_encode($res));
                }
                
                if (strlen($name) > 24) {
                    $res['ret'] = 0;
                    $res['msg'] = '昵称太长了';
                    return $response->getBody()->write(json_encode($res));
                }

                // 检测邮箱
                if ($agent_user->email != $email) {
                    if ($email == '') {
                        return $response->getBody()->write(json_encode(['ret' => 0, 'msg' => '未填写邮箱']));
                    }

                    if (!Check::isEmailLegal($email)) {
                        return $response->getBody()->write(json_encode(['ret' => 0, 'msg' => '邮箱无效']));
                    }
                    
                    $checkemail = User::where('email', '=', $email)->first();
                    if ($checkemail != null) {
                        return $response->getBody()->write(json_encode(['ret' => 0, 'msg' => '此邮箱已存在']));
                    }
                }
                
                // 检测密码
                if ($password != '') {
                    if (strlen($password) < 8) {
                        $res['ret'] = 0;
                        $res['msg'] = '密码需8位以上';
                        return $response->getBody()->write(json_encode($res));
                    }
                    $agent_user->pass = Hash::passwordHash($password);
                    $agent_user->save();
                    $agent_user->clean_link();
                }

                $agent_user->user_name    = $name;
                $agent_user->email        = $email;
                $agent_user->enable       = $enable;
                
                if (!$agent_user->save()){
                    $res['ret'] = 0;
                    $res['msg'] = '保存失败';
                    return $response->getBody()->write(json_encode($res));
                }
                
                $res['ret'] = 1;
                $res['msg'] = '保存成功';
                return $response->getBody()->write(json_encode($res));
                
            case 'buy_shop': 
                // 开通套餐
                if ($shopid > 0) {
                    
                    $shop = Shop::where("id", $shopid)->where("status", 1)->first();
                    
                    if ($shop != null) {
                        if ($user->money < $shop->price) {
                            $res['ret'] = 0;
                            $res['msg'] = '套餐开通失败，原因是您的钱包余额不足!';
                            return $response->getBody()->write(json_encode($res));
                        }
    
                        $user->money = bcsub($user->money, $shop->price, 2);
                        $user->save();
                        
                        $bought           = new Bought();
                        $bought->userid   = $agent_user->id;
                        $bought->shopid   = $shop->id;
                        $bought->datetime = time();
                        $bought->renew    = 0;
                        $bought->coupon   = '';
                        $bought->price    = $shop->price;
                        $bought->save();
                        $shop->buy($agent_user);

                        CoolConfig::add_payback($user, $agent_user, $shop->price);
                        $res['ret'] = 1;
                        $res['msg'] = '套餐开通成功';
                        return $response->getBody()->write(json_encode($res));
                    } else {
                        $res['ret'] = 0;
                        $res['msg'] = '套餐开通失败，原因是套餐不存在!';
                        return $response->getBody()->write(json_encode($res));
                    }
                } else {
                    $res['ret'] = 1;
                    $res['msg'] = '不开通套餐无需保存';
                    return $response->getBody()->write(json_encode($res));
                }
                break;
            case 'reset_link': 
                $agent_user->clean_link();
                $res['ret'] = 1;
                $res['msg'] = '重置成功';
                return $response->getBody()->write(json_encode($res));
        }

        $res['ret'] = 0;
        $res['msg'] = '未知错误';
        return $response->getBody()->write(json_encode($res));
    }
    
    public function agentlist($request, $response, $args) 
    {
    	$id = $this->user->id;
        $datatables = new Datatables(new DatatablesHelper());
        $datatables->query('Select id as op, id, email, money, class, transfer_enable, class_expire from user where agent_id='.$id);
      
        $datatables->edit('DT_RowId', function ($data) {
            return 'row_1_'.$data['id'];
        });
        
		$datatables->edit('op', function ($data) {
		    return '    <button class="btn btn-primary btn-sm dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">操作                 </button>
                        	<div class="dropdown-menu dropdown-node dropdown-menu-right" >
                                <a href="/user/agent/view/' . $data['id'] . '" class="btn"><span><i class="fa fa-edit"></i></span><span> 编辑用户</span></a><br/>
                                <a onClick="del(\''.$data["id"].'\', \''.$data["email"].'\')"' . ' class="btn"><span><i class="fa fa-trash-o"></i></span><span> 删除用户</span></a>
                        	</div>';
		});
                    
        $datatables->edit('DT_RowId', function ($data) {
            return 'row_1_'.$data['id'];
        });
        
        $datatables->edit('email', function ($data) {
            $email = $data['email'];
            return $email;
        });
        
        $datatables->edit('money', function ($data) {
        	$money = $data['money'];
            return $money;
        });
        
        $datatables->edit('transfer_enable', function ($data) {
            $transfer_enable  = Tools::flowAutoShow($data['transfer_enable']);;
            return $transfer_enable;
        });
        
        $datatables->edit('class', function ($data) {
            $class  = $data['class'];
            return $class;
        });
        
        $datatables->edit('class_expire', function ($data) {
            $class_expire = $data['class_expire'];
            return $class_expire;
        });
        
        $body = $response->getBody();
        $body->write($datatables->generate());
    }
    
  	public function agentbuy($request, $response, $args)
    {
      $userId = $request->getParam('userid');
      $shopId = $request->getParam('shopid');
      $credit = $this->user->creta;
      $shop = Shop::where("id", $shopId)->where("status", 1)->first();

        if ($shop == null) {
            $res['ret'] = 0;
            $res['msg'] = "请选择套餐！";
            return $response->getBody()->write(json_encode($res));
        }

      $price = $shop->price * ((100 - $credit) / 100);
      $user = $this->user;

        if (bccomp($user->money , $price,2)==-1) {
            $res['ret'] = 0;
            $res['msg'] = '喵喵喵~ 当前余额不足，总价为' . $price . '元。请充值~！';
            return $response->getBody()->write(json_encode($res));
        } else {
            $user->money = bcsub($user->money , $price,2);
	        $user->save();
        }
      
      $userr = User::where("id", $userId)->first();
        if ($user->save()) {
            $shop->buy($userr);
            $res['ret'] = 1;
            $res['msg'] = "购买成功";
            return $response->getBody()->write(json_encode($res));
        }

    }  
    
    public function addDelete($request, $response, $args)
    {
        $id = $request->getParam('deleteid');
        $user = User::where('id', $id)->where('money', '<=', 0)->where('is_agent', '<>', 1)->where('is_admin', '<>', 1)->first();
      
        	if ($user != null) {
        	    $user->kill_user();
        	    $res['ret'] = 1;
        	    $res['msg'] = "删除成功!";
        	  return $response->getBody()->write(json_encode($res));
        	} else {
        	    $res['ret'] = 0;
        	    $res['msg'] = "删除失败,用户不存在";
        	    return $response->getBody()->write(json_encode($res));
        	}
      
    } 
    
    //单个用户创建(代理商)
  	public function addUser($request, $response, $args)
    {
        $userName = $request->getParam('userName');
      	$email = $request->getParam('email');
        $shopId = $request->getParam('shopId');
        $issend = $request->getParam('issend');
        $shop = Shop::where("id", $shopId)->where("status", 1)->first();
        $credit = $this->user->creta;
      	$agentid = $this->user->id;

        if (!Check::isEmailLegal($email)) {
            $res['ret'] = 0;
            $res['msg'] = "邮箱无效！";
            return $response->getBody()->write(json_encode($res));
        }

        $DbUser = User::where('email', '=', $email)->first();
      
        if ($DbUser != null) {
            $result['ret'] = 0;
            $result['msg'] = "此邮箱已经注册";
            return $response->getBody()->write(json_encode($result));
        }

        $price = $shop->price * ((100 - $credit) / 100);
      	$user = $this->user;
         if (bccomp($user->money , $price,2)==-1) {
          $res['ret'] = 0;
          $res['msg'] = '喵喵喵~ 当前余额不足，总价为' . $price . '元。</br><a href="/user/code">点击进入充值界面</a>';
          return $response->getBody()->write(json_encode($res));
        }
        $user->money = bcsub($user->money , $price,2);
      	$user->save(); 
      
        $user = new User();
        $user->user_name = $userName;
        $user->email = $email;
        $user->pass = Hash::passwordHash($email);
        $user->passwd = Tools::genRandomChar(6);
        $user->t = 0;
        $user->u = 0;
        $user->d = 0;
      	$user->plan = 'A';
      	$user->transfer_enable = Tools::toGB(Config::get('defaultTraffic'));
        $user->port = Tools::getAvPort();
      	$user->switch = '1';
      	$user->enable = '1';
      	$user->type = '1';
      	$user->last_get_gift_time = '0';
      	$user->last_check_in_time = '0';
      	$user->last_rest_pass_time = '0';
      	$user->reg_date = date("Y-m-d H:i:s");
      	$user->invite_num = (int) Config::getconfig('Register.string.defaultInviteNum');
      	$user->money = '0';
      	$user->ref_by = '0';
      	$user->expire_time = '0';
        $user->method = Config::getconfig('Register.string.defaultMethod');
      	$user->is_email_verify = '0';
      	$user->reg_ip = $_SERVER["REMOTE_ADDR"];
      	$user->node_speedlimit = (int) Config::getconfig('Register.string.defaultSpeedlimit');
      	$user->node_connector = (int) Config::getconfig('Register.string.defaultConn');
      	$user->is_admin = '0';
        $user->im_type = '1';
        $user->im_value = null;
      	$user->last_day_t = '0';
      	$user->sendDailyMail = '0';
      	$user->class = (int) Config::getconfig('Register.string.defaultClass');
      	$user->class_expire = date("Y-m-d H:i:s", time() + Config::get('user_class_expire_default') * 3600);
        $user->expire_in = date("Y-m-d H:i:s", time() + Config::get('user_expire_in_default') * 86400);
      	$user->theme = Config::get('theme');
      
        $ga = new GA();
        $secret = $ga->createSecret();
        $user->ga_token = $secret;
        $user->ga_enable = 0;
      
      	$user->pac = null;
      	$user->remark = null;
      
      	$groups = explode(',', Config::getconfig('Register.string.random_group'));
        $user->node_group=$groups[array_rand($groups)];
      	
        $user->auto_reset_day       = Config::getconfig('Register.string.reg_auto_reset_day');
        $user->auto_reset_bandwidth = Config::getconfig('Register.string.reg_auto_reset_bandwidth');
        $user->protocol             = Config::getconfig('Register.string.defaultProtocol');
        $user->protocol_param       = Config::getconfig('Register.string.defaultProtocol_param');
        $user->obfs                 = Config::getconfig('Register.string.defaultObfs');
        $user->obfs_param           = Config::getconfig('Register.string.defaultObfs_param');
        $user->forbidden_ip         = Config::getconfig('Register.string.reg_forbidden_ip');
        $user->forbidden_port       = Config::getconfig('Register.string.reg_forbidden_port');
        $user->disconnect_ip = null;
      	$user->is_hide = 0;
      	$user->is_multi_user = 0;
      	$user->telegram_id = null;
        
       	$user->is_agent = 0;
        $user->agent_id = $agentid;
		$user->creta = 0;
        //用户注册成功之后才执行添加套餐的操作
        if ($user->save()) {
            $ssr_sub_token = UserController::GenerateSSRSubCode($user->id,0);
            User::where('id', $user->id)->update(['ssrlink' => $ssr_sub_token]);
            $shopId = $request->getParam('shopId');
            $shop = Shop::where("id", $shopId)->where("status", 1)->first();
            $shop->buy($user);
            $addsum = User::where('id', $user->id)->get();
            if ($issend == '1') {
                $subject = Config::get('appName') . '-注册通知';
                $to = $user->email;
                $text = '您好, 恭喜您成功注册本站!';
                try {
                  	Mail::send($to, $subject, 'news/warn.tpl', [
                      	'user' => $user, 'text' => $text
                  	], [
                  	]);
                } catch (Exception $e) {
                  	echo $e->getMessage();
                }
        	}
        }
      return $response->getBody()->write(json_encode($addsum));
    }
}
