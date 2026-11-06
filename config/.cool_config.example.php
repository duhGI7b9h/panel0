<?php

/*

 .----------------.  .----------------.  .----------------.  .----------------. 
| .--------------. || .--------------. || .--------------. || .--------------. |
| |     ______   | || |     ____     | || |     ____     | || |   _____      | |
| |   .' ___  |  | || |   .'    `.   | || |   .'    `.   | || |  |_   _|     | |
| |  / .'   \_|  | || |  /  .--.  \  | || |  /  .--.  \  | || |    | |       | |
| |  | |         | || |  | |    | |  | || |  | |    | |  | || |    | |   _   | |
| |  \ `.___.'\  | || |  \  `--'  /  | || |  \  `--'  /  | || |   _| |__/ |  | |
| |   `._____.'  | || |   `.____.'   | || |   `.____.'   | || |  |________|  | |
| |              | || |              | || |              | || |              | |
| '--------------' || '--------------' || '--------------' || '--------------' |
 '----------------'  '----------------'  '----------------'  '----------------' 

	  by @悟空 https://t.me/Cool_WuKong

*/


# ┌──────────────────────────────────────────────────────────┐
# │                     主题设置                             │
# └──────────────────────────────────────────────────────────┘
$Cool_Config['Cool_js_version'] = '2.0'; 		    // 可随便写，每次获得最新授权文件就改变这个值进行强制缓存刷新，避免旧的浏览器缓存继续生效
$Cool_Config['theme_style_color'] = 'cyan';		    // 主题配色选项，可选择：purple（紫色）、red（红色）、cyan（青色）、green（绿色）、dark（黑色）
$Cool_Config['layout_typer'] = 'rightVertical';		// 主题布局样式，可选：rightVertical 或 Horizontal


# ┌──────────────────────────────────────────────────────────┐
# │                       首页                               │
# └──────────────────────────────────────────────────────────┘
$Cool_Config['subscribe_type'] = ['ss','ssr','v2ray'];    // 'ss','ssr','v2ray' 选择网站支持的代理协议，会影响复制订阅链接和一键导入按钮的显示，若无ss，则不显示相关ss订阅

$Cool_Config['index_import_buttons'] = [];          // 不在首页显示的一键导入按钮， quantumult | shadowrocket | surfboard | quantumultx | trojan

$Cool_Config['enable_index_placard'] = true;        // 是否在用户登录后弹出重要公告
$Cool_Config['enable_index_placard_time'] = true;   // 重要公告弹窗是否24小时只弹一次
$Cool_Config['index_placard_content'] = '
<p class="description badge-dot">欢迎光临本站！</p></h3>
<p class="description badge-dot"><i class="bg-warning"></i>你能来到本站说明你已经知道本站是干嘛的了。</p>
<p class="description badge-dot"><i class="bg-warning"></i>首先记住一点, 墙外非法外之地，请注意你的言行，低调是唯一的墙外生存之道。</p>
<p class="description badge-dot"><i class="bg-warning"></i>其次你要熟悉下左侧的菜单栏，记住 <a href="/user">用户中心</a> 的位置。</p>
<p class="description badge-dot"><i class="bg-warning"></i>然后使用任何节点，需遵循节点所属国家的相关法律以及中国法律。</p>
<p class="description badge-dot"><i class="bg-warning"></i>最后有问题请点击右下角联系客服。</p>
';   // 重要公告的内容


# ┌──────────────────────────────────────────────────────────┐
# │                     共享账号                             │
# └──────────────────────────────────────────────────────────┘
$Cool_Config['show_share'] = true;   // 是否显示共享账号
$Cool_Config['share_account'] = [    // 一个array为一个共享账号
    'AppleID' => [
        array(
            'account' => 'Wukong',	// 帐号
            'passwd' => '123456',	// 密码
            'class' => 1			// 用户等级要求		
            
        )
    ], 
    'Netflix共享' => [
        array(
            'account' => 'Wukong',	// 帐号
            'passwd' => '123456',	// 密码
            'class' => 3			// 用户等级要求		
            
        )
    ],  
];


# ┌──────────────────────────────────────────────────────────┐
# │                        商店                              │
# └──────────────────────────────────────────────────────────┘
$Cool_Config['enable_shop_trail'] = false;   // 商店是否显示新用户试用计划,只有在用户等级小于等于0的情况下才会显示
$Cool_Config['shop_trail_shopid'] = '';   // 试用计划的商品ID

$Cool_Config['plan_1_enable'] = true;    // 是否显示第一个商品计划
$Cool_Config['plan_1_name'] = '月付';    // 第一个商品计划的名字

$Cool_Config['plan_2_enable'] = true;    // 是否显示第二个商品计划
$Cool_Config['plan_2_name'] = '半年付';    // 第二个商品计划的名字

$Cool_Config['plan_3_enable'] = true;    // 是否显示第三个商品计划
$Cool_Config['plan_3_name'] = '年付';    // 第三个商品计划的名字

$Cool_Config['plan_4_enable'] = false;    // 是否显示第四个商品计划
$Cool_Config['plan_4_name'] = '定制';     // 第四个商品计划的名字

$Cool_Config['shops_price'] = [			// 最多可设置四个商品计划，需要你设置对应的商品ID
  'plan_1' => [				// 代表第一个商品计划，如果未开启第一个计划，请不要填写
    'p1_price_1'=>'1',		// 代表第一个商品计划中的商品id
    'p1_price_2'=>'',
    'p1_price_3'=>'',
    'p1_price_4'=>'',
    'p1_price_5'=>'',
    'p1_price_6'=>''
	],
  'plan_2' => [
    'p2_price_1'=>'2',
    'p2_price_2'=>'',
    'p2_price_3'=>'',
    'p2_price_4'=>'',
    'p2_price_5'=>'',
    'p2_price_6'=>''
	],
  'plan_3' => [
    'p3_price_1'=>'3',
    'p3_price_2'=>'',
    'p3_price_3'=>'',
    'p3_price_4'=>'',
    'p3_price_5'=>'',
    'p3_price_6'=>''
	],
  'plan_4' => [
    'p4_price_1'=>'',
    'p4_price_2'=>'',
    'p4_price_3'=>'',
    'p4_price_4'=>'',
    'p4_price_5'=>'',
    'p4_price_6'=>''
	]
]; 

$Cool_Config['shop_enable_traffic_package'] = true;   // 商店是否显示流量叠加包的选项（仅在用户购买过商品后才会显示）
$Cool_Config['shop_traffic_package'] = '0.5';		// 1G 流量多少元

$Cool_Config['quantit_show'] = true; 			// 商店是否显示按量付费的选项
$Cool_Config['quantit_shop'] = true; 			// 开启按量付费是否需要购买过套餐
$Cool_Config['quantit_money'] = '1'; 			// 每使用1G流量扣多少元
$Cool_Config['quantit_class'] = '1'; 			// 按量等级设置
$Cool_Config['quantit_connector'] = '2';		// 按量设备数
$Cool_Config['quantit_speedlimit'] = '100.00'; 	// 按量端口速率 格式100.00

$Cool_Config['refund'] = false;             // 是否开启套餐折算功能 可用于客户自主升级套餐等
$Cool_Config['refund_rate'] = '0.9';        // 折算费率,0.9代表 (套餐原价/天数)*剩余天数*0.9*100% = 结算余额,考虑到有优惠码的情况，这里一般填优惠码的费率
$Cool_Config['resund_list'] = ['8','8'];    // 禁止退款的套餐商品ID，数组形式  逗号隔开


# ┌──────────────────────────────────────────────────────────┐
# │                     通用设置                             │
# └──────────────────────────────────────────────────────────┘
$Cool_Config['enable_telegram_button'] = true;    	// 是否显示侧边栏 Telegram 按钮
$Cool_Config['telegram_group_link'] = '##';   		// Telegram 按钮的链接
$Cool_Config['enable_tencent_button'] = false;    	// 是否显示侧边栏 QQ群 按钮·
$Cool_Config['tencent_group_link'] = '##';   		// QQ 按钮的链接

// 循环返利
$Cool_Config['all_rebate'] = false;            // 设置为 true 所有用户都循环返利, false 除了单独用户设置为循环外,其他用户只会获取被邀请用户首次充值金额


# ┌──────────────────────────────────────────────────────────┐
# │                     TG机器人                             │
# └──────────────────────────────────────────────────────────┘
$Cool_Config['Telegram_Ticket'] = true;     // 开启工单的TG通知
$Cool_Config['Telegram_Payment'] = true;    // 用户充值提醒


# ┌──────────────────────────────────────────────────────────┐
# │                     在线客服                             │
# └──────────────────────────────────────────────────────────┘
// Crisp客服 配置
$Cool_Config['enable_crisp'] = false;   // 是否启用 Crisp 在线客服系统 https://crisp.chat
$Cool_Config['enable_crisp_outside'] = false;   // 是否对未登录的用户也启用 Crisp，设置为 false 的话，着陆页和登录/注册等页面不会显示 Crisp 和 charta
$Cool_Config['crisp_wesite_id'] = '';    // Crisp 的网站ID，格式为 '18b46e92-eb21-76d3-bfb7-8f2ae9adba64'

// Chatra客服 配置
$Cool_Config['enable_chatra'] = false;    // 是否启用 Chatra 在线客服系统 https://chatra.io
$Cool_Config['chatra_id'] = '';    // Chatra 的 ChatraID，可以在 Chatra 提供的网站代码里找到


# ┌──────────────────────────────────────────────────────────┐
# │                     节点列表                             │
# └──────────────────────────────────────────────────────────┘
$Cool_Config['show_node_load'] = true;  		// 是否显示节点的负载
$Cool_Config['show_online_user'] = true;		// 是否显示节点的在线人数
$Cool_Config['show_node_traffic_rate'] = true;  // 是否显示节点的流量倍率
$Cool_Config['show_node_speedlimit'] = true;	// 是否显示节点的限速

$Cool_Config['show_welfare_nodes'] = true;      // 是否显示公益节点
$Cool_Config['show_one_nodes'] = true;      	// 是否显示 V1 节点
$Cool_Config['show_two_nodes'] = true;      	// 是否显示 V2 节点
$Cool_Config['show_three_nodes'] = true;  	    // 是否显示 V3 节点

$Cool_Config['node_Single_port'] = true;	    //  若节点配置两个单端口，便设置为True
$Cool_Config['show_node_select'] = true;		// 是否开启节点筛选
$Cool_Config['node_select'] = [  				// 节点标签，一个array为一个标签，若不开启节点筛选则无效
    array(
    	'id' => '2',							// 序号，从 2 开始，按递增的顺序填写
      	'label' => 'IPLC',						// 节点标签，通过节点备注来识别
    ),
    array(
    	'id' => '3',
      	'label' => 'Netflix',
    ),
    array(
    	'id' => '4',
      	'label' => 'GAME',
    )
    
];

/*
'美国'=>'us'	'香港'=>'hk'	'荷兰'=>'nl'
'新加'=>'sg'	'日本'=>'jp'	'罗马'=>'ro'
'回国'=>'cn'	'中国'=>'cn'	'澳大'=>'au'
'台湾'=>'tw'	'菲律'=>'ph'	'澳门'=>'mo'
'俄罗'=>'ru'	'韩国'=>'kr'	'马来'=>'my'
'德国'=>'de'	'英国'=>'gb'	'法国'=>'fr'
'越南'=>'vn'	'印度'=>'in'	'印尼'=>'id'
*/
$Cool_Config['node_label'] = [  				// 节点页面国家选择项，一个array代表一个国家，需输入英文缩写及中文，上面有对应表
    array(
    	'en' => 'hk',							// 英文缩写
      	'label' => '香港',						// 中文
    ),
    array(
    	'en' => 'tw',			
      	'label' => '台湾',
    ),
    array(
    	'en' => 'us',
      	'label' => '美国',
    ),
    array(
    	'en' => 'jp',
      	'label' => '日本',
    ),
    array(
    	'en' => 'kr',
      	'label' => '韩国',
    ),
    array(
    	'en' => 'de',
      	'label' => '德国',
    ),
    array(
    	'en' => 'fr',
      	'label' => '法国',
    ),
    array(
    	'en' => 'ru',
      	'label' => '俄罗斯',
    ),
    array(
    	'en' => 'cn',
      	'label' => '回国',
    )
    
];


# ┌──────────────────────────────────────────────────────────┐
# │                     节点设置                             │
# └──────────────────────────────────────────────────────────┘
$Cool_Config['show_protocol'] = true;   // 是否允许用户自定义混淆和协议
$Cool_Config['show_method'] = true;     // 是否允许用户自定义加密方式

?>