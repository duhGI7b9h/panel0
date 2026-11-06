<?php
/**
 * Created by PhpStorm.
 * User: tonyzou
 * Date: 2018/9/27
 * Time: 8:16 AM
 */

namespace App\Services\Gateway;

use App\Services\Auth;
use App\Services\Config;
use App\Services\Gateway\AlipaySubmit;
use App\Services\Gateway\AlipayNotify;
use App\Models\Paylist;

class PcexPay extends AbstractPayment
{

    public function isHTTPS()
    {
        define('HTTPS', false);
        if (defined('HTTPS') && HTTPS) {
            return true;
        }
        if (!isset($_SERVER)) {
            return false;
        }
        if (!isset($_SERVER['HTTPS'])) {
            return false;
        }
        if ($_SERVER['HTTPS'] === 1) {  //Apache
            return true;
        }

        if ($_SERVER['HTTPS'] === 'on') { //IIS
            return true;
        }

        if ($_SERVER['SERVER_PORT'] == 443) { //其他
            return true;
        }
        return false;
    }


    public function purchase($request, $response, $args)
    {
        $alipay_config['partner'] = Config::get('pcexpay_id');
		$alipay_config['key'] = Config::get('pcexpay_key');
		
		//签名方式 不需修改
		$alipay_config['sign_type'] = strtoupper('MD5');
		
		//字符编码格式 目前支持 gbk 或 utf-8
		$alipay_config['input_charset'] = strtolower('utf-8');
		
		//访问模式,根据自己的服务器是否支持ssl访问，若支持请选择https；若不支持请选择http
		$alipay_config['transport'] = $this->isHTTPS() ? 'https' : 'http';
		
		$url = ($this->isHTTPS() ? 'https://' : 'http://') . $_SERVER['HTTP_HOST'];
		
		//支付API地址
		$alipay_config['apiurl']  = 'https://smpay.io/';
        
        $notify_url = Config::get("baseUrl") . '/payment/pcexnotify';
        //需http://格式的完整路径，不能加?id=123这类自定义参数

        //页面跳转同步通知页面路径
        $return_url = Config::get("baseUrl") . '/user/code';
        //需http://格式的完整路径，不能加?id=123这类自定义参数，不能写成http://localhost/

		//支付方式
        $type = $request->getParam('type');
		//付款金额
        $price = $request->getParam('price');
        //商品名称
        $name = '会员充值' . $price . '元';
		//站点名称
        $sitename = Config::get('appName');
        
        $user = Auth::getUser();
		$pl = new Paylist();
        $pl->userid = $user->id;
        $pl->total = $price;
        $pl->tradeno = time() . 'UID' . $user->id;
        $pl->save();
        $out_trade_no = $pl->tradeno;
        
        //构造要请求的参数数组，无需改动
		$parameter = array(
				"pid" => trim($alipay_config['partner']),
				"type" => $type,
				"notify_url"	=> $notify_url,
				"return_url"	=> $return_url,
				"out_trade_no"	=> $out_trade_no,
				"name"	=> $name,
				"money"	=> $price,
				"sitename"	=> $sitename
		);
    	$alipaySubmit = new AlipaySubmit($alipay_config);
		$html_text = $alipaySubmit->buildRequestForm($parameter);
		echo $html_text;
    }

	public function notify($request, $response, $args)
    {
        $alipay_config['partner'] = Config::get('pcexpay_id');
		$alipay_config['key'] = Config::get('pcexpay_key');
		
		//签名方式 不需修改
		$alipay_config['sign_type'] = strtoupper('MD5');
		
		//字符编码格式 目前支持 gbk 或 utf-8
		$alipay_config['input_charset'] = strtolower('utf-8');
		
		//访问模式,根据自己的服务器是否支持ssl访问，若支持请选择https；若不支持请选择http
		$alipay_config['transport'] = $this->isHTTPS() ? 'https' : 'http';
		$alipay_config['apiurl']  = 'https://smpay.io/';
		
		//计算得出通知验证结果
		$alipayNotify = new AlipayNotify($alipay_config);
		$verify_result = $alipayNotify->verifyNotify();
		
		if($verify_result) {//验证成功
		
			$out_trade_no = $request->getParam('out_trade_no');
		
			$trade_no = $request->getParam('trade_no');
		
			//交易状态
			$trade_status = $request->getParam('trade_status');
		
			//支付方式
			$type = $request->getParam('type');

			if ($trade_status == 'TRADE_SUCCESS') {
				switch ($type) {
					case 'alipay':
						$payment = "支付宝";
						break;
					case 'wxpay':
						$payment = "微信";
						break;
					case 'qqpay':
						$payment = 'qq钱包';
						break;
					default:
						$payment = '蜂维易支付';
						break;
				}
				$this->postPayment($out_trade_no, $payment);
				echo "success";		//请不要修改或删除
		    }
			
			/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		}
		else {
		    //验证失败
		    echo "fail";
		}
		
    }

    public function getPurchaseHTML()
    {
        return '
        					<form class="codepay" name="codepay" action="/user/code/codepay" method="get">
								<div class="form-group row mb-2">
				                    <label class="col-form-label text-md-right col-12 col-md-3 col-lg-3">金额</label>
				                    	<div class="col-sm-12 col-md-7">
				                    		<div class="form-label-group position-relative has-icon-left">
	                                            <input type="text" class="form-control" id="price" name="price" placeholder="输入充值金额后，点击你要付款的应用图标即可" autofocus="autofocus" type="number" min="0.01" max="1000" step="0.01" required="required">
	                                            <div class="form-control-position">
	                                                <i class="fa fa-jpy"></i>
	                                            </div>
	                                        </div>
				                       </div>
				                    </div>
				                    <div class="form-group row mb-2">
				                      <label class="col-form-label text-md-right col-12 col-md-3 col-lg-3"></label>
				                      <div class="col-sm-12 col-md-7">
				                        <button class="btn btn-flat waves-attach" id="btnSubmit" type="submit" name="type" value="1" ><img src="/images/alipay.jpg" width="50px" height="50px" /></button>
				                      </div>
				                    </div>
				                </div>
        					</form>
				                    
';
    }

    public function getReturnHTML($request, $response, $args)
    {
        // TODO: Implement getReturnHTML() method.
    }

    public function getStatus($request, $response, $args)
    {
        // TODO: Implement getStatus() method.
    }
}
