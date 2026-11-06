{if $Cool_Config['layout_typer'] == 'rightVertical'}
		<meta charset="UTF-8" /> 
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	    <meta http-equiv="X-UA-Compatible" content="IE=edge">
	    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui">
	    <link rel="shortcut icon" type="image/x-icon" href="/favicon.ico">
	    
	    <!-- BEGIN: Vendor CSS-->
	    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free@5.8.2/css/all.min.css">
	    <link rel="stylesheet" type="text/css" href="/theme/cool/assets/vendors/css/vendors.min.css">
	    <!-- END: Vendor CSS-->
	
	    <!-- BEGIN: Theme CSS-->
	    <link rel="stylesheet" type="text/css" href="/theme/cool/assets/css/bootstrap.css">
	    <link rel="stylesheet" type="text/css" href="/theme/cool/assets/css/bootstrap-extended.css">
	    <link rel="stylesheet" type="text/css" href="/theme/cool/assets/css/cool.css">
	    <link rel="stylesheet" type="text/css" href="/theme/cool/assets/css/theme/style-{$Cool_Config['theme_style_color']}.css">
		<!-- END: Theme CSS-->
	
	    <!-- BEGIN: Page CSS-->
	    <link rel="stylesheet" type="text/css" href="/theme/cool/assets/css/plugins/sweetalert2.min.css">
	    <!-- END: Page CSS-->
	</head>
	<!-- END: Head-->
	
	<!-- BEGIN: Body-->
	<body class="vertical-layout vertical-menu-modern dark-layout 2-columns navbar-floating footer-static pace-done menu-expanded" data-open="click" data-menu="vertical-menu-modern" data-col="2-columns">
	    <!-- BEGIN: Header-->
	    <nav class="header-navbar navbar-expand-lg navbar navbar-with-menu floating-nav navbar-light navbar-shadow">
	        <div class="navbar-wrapper">
	            <div class="navbar-container content">
	                <div class="navbar-collapse" id="navbar-mobile">
	                    <div class="mr-auto float-left bookmark-wrapper d-flex align-items-center">
		                    <ul class="nav navbar-nav">
		                        <li class="nav-item mobile-menu d-xl-none mr-auto"><a class="nav-link nav-menu-main menu-toggle hidden-xs" href="#"><i class="ficon feather icon-menu"></i></a></li>
		                    </ul>
		                    <ul class="nav navbar-nav bookmark-icons">
	                            <li class="nav-item d-none d-lg-block"><a class="nav-link" href="/user/profile" data-toggle="tooltip" data-placement="top" title="" data-original-title="My Account"><i class="ficon feather icon-user"></i></a></li>
	                        </ul>
		                    <ul class="nav navbar-nav bookmark-icons">
	                            <li class="nav-item d-none d-lg-block"><a class="nav-link" href="/user/code" data-toggle="tooltip" data-placement="top" title="" data-original-title="My wallet"><i class="ficon feather icon-credit-card"></i></a></li>
	                        </ul>

	                    </div>
	                    <ul class="nav navbar-nav float-right">
	                    	<li class="nav-item d-none d-lg-block"><a class="nav-link nav-link-expand"><i class="ficon feather icon-maximize"></i></a></li>
	                        <li class="dropdown dropdown-notification nav-item"><a href="#" data-toggle="dropdown" id="tongzhi" class="nav-link notification-toggle nav-link-lg beep"><i class="ficon feather icon-bell"></i></a>
								<div class="dropdown-menu dropdown-list dropdown-menu-right">
						          <div class="dropdown-header">温馨提示
						            {*<div class="float-right">
						              <a href="#" onclick="aready()">知道了</a>
						            </div>*}
						          </div>
						          <div class="dropdown-list-content dropdown-list-icons">
						            <a href="/user/announcement" class="dropdown-item dropdown-item-unread">
						              <div class="dropdown-item-icon bg-primary text-white">
						                <i class="fas fa-code"></i>
						              </div>
						              <div class="dropdown-item-desc">
						                查看公告日志!
						                <div class="time text-primary">{$time}</div>
						              </div>
						            </a>
						            {if $user->lastSsTime() == '从未使用过' and $user->class>=0}
						            <a href="/doc/#/" class="dropdown-item">
						                  <div class="dropdown-item-icon bg-info text-white">
						                    <i class="fas fa-bell"></i>
						                  </div>
						                  <div class="dropdown-item-desc">
						                    无从下手？<b>点我下载客户端或查看教程</b>，轻松上手！
						                    <div class="time">{$time}</div>
						                  </div>
						                </a>
						            {/if}
						            {if substr($user->unusedTraffic(),0,-2) <= 0 and $user->class != 0}
						            <a href="/user/shop" class="dropdown-item">
						              <div class="dropdown-item-icon bg-danger text-white">
						                <i class="fas fa-exclamation-triangle"></i>
						              </div>
						              <div class="dropdown-item-desc">
						                您的流量已用尽，无法继续使用本站服务。如需更多流量，请前往商店购买流量加油包。
						                <div class="time">{$time}</div>
						              </div>
						            </a>
						            {/if}
						            {if $user->class == 0}
						            <a href="/user/shop" class="dropdown-item">
						              <div class="dropdown-item-icon bg-danger text-white">
						                <i class="fas fa-exclamation-triangle"></i>
						              </div>
						              <div class="dropdown-item-desc">
						                您的会员计划已过期，请及时到商店购买。
						                <div class="time">{$time}</div>
						              </div>
						            </a>user-nav d-sm-flex d-none
						            {/if}
						            {if substr($user->unusedTraffic(),0,-2) <= 5 && substr($user->unusedTraffic(),0,-2) > 0 && {substr($user->unusedTraffic(),-2)} == 'GB'}
						            <a href="/user/shop" class="dropdown-item">
						              <div class="dropdown-item-icon bg-danger text-white">
						                <i class="fas fa-exclamation-triangle"></i>
						              </div>
						              <div class="dropdown-item-desc">
						                您的可用流量不足5GB，如需更多流量，可前往会员商店购买套餐或流量加油包。
						                <div class="time">{$time}</div>
						              </div>
						            </a>
						            {/if}
						            {if $class_left_days < 5 && substr($user->unusedTraffic(),0,-2) > 5}
						            <a href="/user/shop" class="dropdown-item">
						              <div class="dropdown-item-icon bg-danger text-white">
						                <i class="fas fa-exclamation-triangle"></i>
						              </div>
						              <div class="dropdown-item-desc">
						                您的套餐即将到期，请及时到商店续费或购买套餐。
						                <div class="time">{$time}</div>
						              </div>
						            </a>
						            {/if}
						          </div>
						        </div>
	                        </li>
	                        <li class="dropdown dropdown-user nav-item"><a class="dropdown-toggle nav-link dropdown-user-link" href="#" data-toggle="dropdown">
	                                <div class="user-nav d-sm-flex d-none"><span class="user-name text-bold-600">{$user->user_name}</span><span class="user-status">{$user->email}</span></div><span><img class="round" src="{$user->gravatar}" alt="avatar" height="40" width="40"></span>
	                            </a>
	                            <div class="dropdown-menu dropdown-menu-right">
	                            	<a class="dropdown-item" href="/user/profile"><i class="feather icon-user"></i> 我的账号</a>
	                            	<a class="dropdown-item" href="/user/code"><i class="feather icon-credit-card""></i> 我的背包</a>
	                            	<a class="dropdown-item" href="/user/invite"><i class="feather icon-paperclip"></i> 推荐计划</a>
	                            	{if $user->isAdmin()}
	                            		<a class="dropdown-item" href="/admin"><i class="feather icon-message-square"></i> 管理中心</a>
	                            	{/if}
	                                <div class="dropdown-divider"></div>
	                                <a class="dropdown-item" href="/user/logout"><i class="feather icon-power"></i> 退出登录</a>
	                            </div>
	                        </li>
	                    </ul>
	                </div>
	            </div>
	        </div>
	    </nav>
	
	    <!-- END: Header-->
	       
		<!-- BEGIN: Main Menu-->
	    <div class="main-menu menu-fixed menu-light menu-accordion menu-shadow" data-scroll-to-active="true">
	        <div class="navbar-header">
	            <ul class="nav navbar-nav flex-row">
	                <li class="nav-item mr-auto"><a class="navbar-brand" href="/user">
	                        <div class="brand-logo"></div>
	                        <h2 class="brand-text mb-0">Cool</h2>
	                    </a></li>
	                <li class="nav-item nav-toggle"><a class="nav-link modern-nav-toggle pr-0" data-toggle="collapse"><i class="icon-x d-block d-xl-none font-medium-4 primary toggle-icon feather icon-disc"></i><i class="toggle-icon icon-disc font-medium-4 d-none d-xl-block collapse-toggle-icon primary feather" data-ticon="icon-disc"></i></a></li>
	            </ul>
	        </div>
	        <div class="shadow-bottom"></div>
	        <div class="main-menu-content">
	            <ul class="navigation navigation-main sidebarnav" data-menu="menu-navigation">
	                <li class="nav-item"><a href="/user"><i class="feather icon-home"></i><span class="menu-title">首页</span></a></li>
	                <li class="nav-item"><a href="/user/shop"><i class="feather icon-shopping-cart"></i><span class="menu-title">商店</span></a></li>
	                
	                <li class="nav-item navigation-header"><span>我的</span></li>
	                <li class="nav-item"><a href="/user/profile"><i class="feather icon-user"></i><span class="menu-title">我的账号</span></a></li>
	                <li class="nav-item"><a href="/user/code"><i class="feather icon-credit-card"></i><span class="menu-title">我的钱包</span></a></li>
	                
	                {if $user->is_admin==1 || $user->is_agent == 1}
	                	<li class="nav-item"><a class="nav-a" href="/user/agent"><i class="feather icon-users"></i><span class="menu-title">代理中心</span></a></li>
	                {/if}
	                
	                <li class="nav-item"><a href="/user/invite"><i class="feather icon-paperclip"></i><span class="menu-title">邀请注册</span></a></li>
	                
	                <li class="navigation-header"><span>使用</span></li>
	                <li class="nav-item"><a href="/user/node"><i class="feather icon-server"></i><span class="menu-title">节点列表</span></a></li>
	                <li class="nav-item"><a href="/user/subscribe_log"><i class="feather icon-align-left"></i><span class="menu-title">订阅记录</span></a></li>
	                <li class="nav-item"><a href="/doc/"><i class="feather icon-book"></i><span class="menu-title">使用教程</span></a></li>
	                {if $Cool_Config['show_share'] == true}
	                	<li class="nav-item"><a href="/user/share-account"><i class="feather icon-share-2"></i><span class="menu-title">共享账号</span></a></li>
	            	{/if} 
	                <li class="nav-item"><a href="/user/edit"><i class="feather icon-settings"></i><span class="menu-title">节点设置</span></a></li>
	                <li class="nav-item"><a href="/user/ticket"><i class="feather icon-headphones"></i><span class="menu-title">工单系统</span></a></li>
	                
	                <li class="nav-item"><a href="/user/detect"><i class="feather icon-sliders"></i><span class="menu-title">审计系统</span></a></li>
	                
	                {if $Cool_Config['enable_telegram_button'] == true || $Cool_Config['enable_tencent_button'] == true || $user->isAdmin()}
	                	<hr />
					{/if}
					
	            	{if $Cool_Config['enable_telegram_button'] == true}
					    <div class="{if !$user->isAdmin()}mb-2{/if} hide-sidebar-mini" style="padding: 1rem 2.5rem">
					        <a href="{$Cool_Config['telegram_group_link']}" onclick="joinTelegramGroup()" class="btn btn-primary waves-effect waves-light btn-block btn-icon-split">
					            <i class="fab fa-telegram-plane"></i>&nbsp;&nbsp;加入 Telegram
					        </a>
					    </div>
	            	{/if}
	            	
	            	{if $Cool_Config['enable_tencent_button'] == true}
					    <div class="{if !$user->isAdmin()}mb-2{/if} hide-sidebar-mini" style="padding: 1rem 2.5rem 0;">
					        <a href="{$Cool_Config['tencent_group_link']}" onclick="joinQQGroup()" class="btn btn-clash waves-effect waves-light btn-block btn-icon-split">
					            <i class="fab fa-qq"></i>&nbsp;&nbsp;加入 QQ 群
					        </a>
					    </div>
	            	{/if}
	            	
	            	{if $user->isAdmin()}
		            	<div class="{if !$user->isAdmin()}mb-2{/if} hide-sidebar-mini" style="padding: 1rem 2.5rem;">
					        <a href="/admin" class="btn btn-warning  btn-block btn-icon-split" style="color:#FFFFFF">
					            <i class="fas fa-tachometer-alt"></i>&nbsp;&nbsp;管理面板
					        </a>
					    </div>
	            	{/if}
	            	
					{if $can_backtoadmin}
	                    <div class="{if !$can_backtoadmin}mb-2{/if} hide-sidebar-mini" style="padding: 0rem 2.5rem;">
		                  <a href="/user/backtoadmin" class="btn btn-warning  btn-block btn-icon-split" style="color:#FFFFFF">
		                      <i class="fas fa-tachometer-alt"></i>&nbsp;&nbsp;返回管理员身份
		                  </a>
	            		</div>
                	{/if}
	            </ul>
	        </div>
	    </div>
	    <!-- END: Main Menu-->
{else}
	{include file='user/header_info.tpl'}
{/if}