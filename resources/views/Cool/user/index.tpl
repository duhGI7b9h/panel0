<!DOCTYPE html>
  <html lang="zh-CN">
   <head> 
    <title>用户中心 — {$config["appName"]}</title> 

	{include file='user/header.tpl'}

<style>
	.nav-pills .nav-link {
		font-weight: 500;
		transition: all .15s ease;
		box-shadow: 0 4px 6px rgba(50,50,93,.11),0 1px 3px rgba(0,0,0,.08);
	}
	
	@media (max-width:575.98px) {
		.nav-pills .nav-item {
			margin-bottom: 1rem
		}
	}
	
	@media (max-width:767.98px) {
		.nav-pills:not(.nav-pills-circle) .nav-item {
			padding-right: 0
		}
	}

	.btn:not(:last-child){
		margin-right:.5rem
	}
</style>
    <!-- BEGIN: Content-->
    <div class="app-content content">
        <div class="content-overlay"></div>
        <div class="header-navbar-shadow"></div>
        <div class="content-wrapper">
            <div class="content-body">
                <!-- Dashboard Analytics Start -->
                <section id="dashboard-analytics">
                    <div class="row">
                        <div class="col-lg-6 col-md-12 col-sm-12">			  
                            <div class="card bg-analytics text-white">
                                <div class="card-content">
                                    <div class="card-body text-center">
                                        <img src="/theme/cool/assets/images/elements/decore-left.png" class="img-left" alt="card-img-left">
                                        <img src="/theme/cool/assets/images/elements/decore-right.png" class="img-right" alt="card-img-right">
                                        <div class="avatar avatar-xl bg-primary shadow mt-0">
                                            <div class="avatar-content">
                                                <i class="feather icon-award white font-large-1"></i>
                                            </div>
                                        </div>
                                        <div class="text-center">
                                            <h1 class="mb-2 text-white">Hi, {$user->user_name}</h1>
                                            <p class="m-auto w-75">欢迎使用 <strong>{$config["appName"]}</strong>，期待给您带来优秀的网络加速服务</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
						<div class="col-xl-3 col-md-6">
			              <div class="card card-stats">
			                <!-- Card body -->
			                <div class="card-body">
			                  <div class="row">
			                    <div class="col">
			                    	{if $user->quantitypay == '1'}
			                    	  <span class="h3 font-weight-bold mb-0">按量付费</span>
				                      <h5 class="card-title text-uppercase text-muted mb-0" style="font-size: 14px;">按量付费启用中</h5>
			                    	{else}
				                      <span class="h3 font-weight-bold mb-0">VIP{$user->class}<small> 用户</small></span>
				                      <h5 class="card-title text-uppercase text-muted mb-0" style="font-size: 14px;">到期时间：{$user->class_expire}</h5>
				                    {/if}
			                    </div>
		                        <div class="avatar bg-rgba-primary p-50 m-0">
                                    <div class="avatar-content">
                                        <i class="feather icon-user font-medium-5" style="color:#7367f0"></i>
                                    </div>
                                </div>
			                  </div>
			                </div>
			              </div>
			              <div class="card card-stats">
			                <!-- Card body -->
			                <div class="card-body">
			                  <div class="row">
			                    <div class="col">
			                      <span class="h3 font-weight-bold mb-0">{$user->online_ip_count()} / {if $user->node_connector == 0}∞{else}{$user->node_connector}{/if}</span>
			                      <h5 class="card-title text-uppercase text-muted mb-0" style="font-size: 14px;">在线设备</h5>
			                    </div>
		                        <div class="avatar bg-rgba-warning p-50 m-0">
                                    <div class="avatar-content">
                                        <i class="feather icon-server text-warning font-medium-5"></i>
                                    </div>
                                </div>
			                  </div>
			                </div>
				          </div>
			            </div>
						<div class="col-xl-3 col-md-6">
			              <div class="card card-stats">
			                <!-- Card body -->
			                <div class="card-body">
			                  <div class="row">
			                    <div class="col">
			                      <span class="h3 font-weight-bold mb-0">¥ {$user->money}</span>
			                      <h5 class="card-title text-uppercase text-muted mb-0" style="font-size: 14px;">账户余额 </h5>
			                    </div>
		                        <div class="avatar bg-rgba-success p-50 m-0">
                                    <div class="avatar-content">
                                        <i class="feather icon-credit-card text-success font-medium-5"></i>
                                    </div>
                                </div>
			                  </div>
			                </div>
			              </div>
			              <div class="card card-stats">
			                <!-- Card body -->
			                <div class="card-body">
			                  <div class="row">
			                    <div class="col">
			                      <span class="h3 font-weight-bold mb-0">{if $user->node_speedlimit!=0}{$user->node_speedlimit} <small>Mbps</small>{else}不限{/if}</span>
			                      <h5 class="card-title text-uppercase text-muted mb-0" style="font-size: 14px;">宽带速率</h5>
			                    </div>
		                        <div class="avatar bg-gradient-info p-50 m-0">
                                    <div class="avatar-content">
                                        <i class="feather icon-bar-chart-2 text-gradient-info font-medium-5"></i>
                                    </div>
                                </div>
			                  </div>
			                </div>
				          </div>
			            </div>
                    </div>
                    <div class="row">
                        <div class="col-md-6 col-12">
                            <div class="card">
                                <div class="card-content">
                                    <div class="card-body">
                                        <div class="row pb-50">
                                            <div class="col-lg-12 col-12 d-flex justify-content-between flex-column order-lg-1 order-2 mt-lg-0 mt-2">
                                                <div>
                                                    <h4 class="text-bold-500 mb-25"><i class="feather icon-volume-1"></i> 最新公告<a href="/user/announcement" class="btn btn-primary btn-sm btn-round btn-icon icon-left" style="right:10px;position:absolute;">查看公告日志</a></h4>
                                                    
                                                    <hr />
                                                    <h5 class="font-medium-1">
                                                        <p>{$ann->content}</p>
                                                    </h5>
                                                </div>
                                            </div>
                                        </div>
                                        <hr />
                                        <div class="row avg-sessions pt-50">
                                            <div class="col-12">
                                                <p><b><span style="line-height:29px;font-size:14px;float: right;">更新时间：{$ann->date}</span></b></p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="card">
                                <div class="card-content">
                                    <div class="card-body">
                                        <div class="row">
                                            <div class="col-lg-12 col-12 d-flex justify-content-between flex-column order-lg-1 order-2 mt-lg-0 mt-2">
                                                <div>
                                                    <h4 class="text-bold-500 mb-25"><i class="feather icon-cloud"></i> 分级订阅</h4>
                                                </div>
                                            </div>
                                        </div>
                                        <hr />
										<p class="description">选择订阅的节点等级&nbsp;:&nbsp;</p>
										<select id="node_class" class="form-control">
											<option value="-1">请选择节点等级</option>
										{foreach $levels as $level}
											<option value="{$level->level}">{$level->name}</option>
										{/foreach}	
										</select>
										<button id="get_node_class" class="btn btn-primary btn-sm mt-1">确认提交</button>
										<blockquote class=" mt-1">
											<p>当只需要使用你所在等级的节点列表时, 可以使用此功能获取分级订阅.</p>
											<p>将返回 SSR 和 V2Ray 订阅链接,请注意区别放入相对应的客户端.</p>
										</blockquote>
										<div id="sub_node_class" class="col-sm-8" style="display:none">
											<div class="input-group" style="padding:0">
												<input id="sub_node_ssr" type="text" class="form-control form-control-sm" name="input2"  value="" readonly disabled />
												<div class="input-group-append">
												  <button id="node_class_ssr_copy" class="copy-text btn btn-sm btn-primary text-white" data-clipboard-text="">复制 SSR</button>
											    </div>
											</div>
							                <br>
											<div class="input-group">
												<input id="sub_node_v2ray" type="text" class="form-control form-control-sm" name="input2" value="" readonly disabled />
												<div class="input-group-append">
												  <button id="node_class_v2ray_copy" class="copy-text btn btn-sm btn-primary text-white" data-clipboard-text="">复制 v2ray</button>
											    </div>
											</div>
										</div>
									</div>
								</div>
					        </div> 
						        
                            <div class="card">
                                <div class="card-content">
                                    <div class="card-body">
                                        <div class="row pb-50">
                                            <div class="col-lg-12 col-12 d-flex justify-content-between flex-column order-lg-1 order-2 mt-lg-0 mt-2">
                                                <div>
                                                    <h4 class="text-bold-500 mb-25"><i class="feather icon-bookmark"></i> 进阶配置<span style="line-height:29px;font-size:14px;float: right;">
                                                    		<button type="button" id="reset-link" class="btn btn-light btn-sm waves-effect waves-light float-right"><i class="fa fa-repeat fa-lg icon-ver"></i>&nbsp;重置订阅</button>
                                                    	</span></h4>
                                                    <hr />
                                                <h5 class="font-medium-1">
													<div class="nav-wrapper">
														<ul class="nav nav-pills node-pills nav-fill flex-column flex-md-row" id="tabs-icons-text" role="tablist">
															<li class="nav-item">
																<a class="nav-link node-link mb-sm-3 mb-md-0 active" id="tabs-icons-text-1-tab" data-toggle="tab" href="#tabs-icons-text-1" role="tab" aria-controls="tabs-icons-text-1" aria-selected="true"><i class="cool-ssr"></i>&nbsp;&nbsp;通用</a>
															</li>
															<li class="nav-item">
																<a class="nav-link node-link mb-sm-3 mb-md-0" id="tabs-icons-text-2-tab" data-toggle="tab" href="#tabs-icons-text-2" role="tab" aria-controls="tabs-icons-text-2" aria-selected="false"><i class="fa fa-windows fa-lg"></i>&nbsp;&nbsp;Windows</a>
															</li>
															<li class="nav-item">
																<a class="nav-link node-link mb-sm-3 mb-md-0" id="tabs-icons-text-3-tab" data-toggle="tab" href="#tabs-icons-text-3" role="tab" aria-controls="tabs-icons-text-3" aria-selected="false"><i class="fa fa-apple fa-lg"></i>&nbsp;&nbsp;MacOS</a>
															</li>
															<li class="nav-item">
																<a class="nav-link node-link mb-sm-3 mb-md-0" id="tabs-icons-text-4-tab" data-toggle="tab" href="#tabs-icons-text-4" role="tab" aria-controls="tabs-icons-text-4" aria-selected="false"><i class="fa fa-mobile fa-lg"></i>&nbsp;&nbsp;iOS</a>
															</li>
															<li class="nav-item">
																<a class="nav-link node-link mb-sm-3 mb-md-0" id="tabs-icons-text-5-tab" data-toggle="tab" href="#tabs-icons-text-5" role="tab" aria-controls="tabs-icons-text-5" aria-selected="false"><i class="fa fa-android fa-lg"></i>&nbsp;&nbsp;Android</a>
															</li>
														</ul>
													</div>
										
													<div class="tab-content" id="myTabContent">
														<div class="tab-pane fade show active" id="tabs-icons-text-1" role="tabpanel" aria-labelledby="tabs-icons-text-1-tab">
															<p>
															(1)&nbsp;[ SS ][{if (in_array("ss",$Cool_Config['subscribe_type']))}全站支持{else}暂不支持{/if}]:&nbsp;
									                        </p>
									                        <p>
															<button id="general_ss" class="copy-config btn btn-sm btn-outline-primary"  onclick=Copyconfig("/user/getUserAllURL?type=ss","#general_ss","")>全部 URL</button>
															</p>
															<p>
															(2)&nbsp;[ SSR ][全站支持]:&nbsp;
									                        </p>
									                        <p>
															<button class="copy-text btn btn-sm btn-outline-primary" data-clipboard-text="{$subInfo["ssr"]}&extend=1">订阅链接</button>
															<button id="general_ssr" class="copy-config btn btn-sm btn-outline-primary" onclick=Copyconfig("/user/getUserAllURL?type=ssr","#general_ssr","")>全部 URL</button>
															</p>
															<p>
															(3)&nbsp;[ VMess ][全站支持]:&nbsp;
									                        </p>
									                        <p>
															<button class="copy-text btn btn-sm btn-outline-primary" data-clipboard-text="{$subInfo['v2ray']}&extend=1">订阅链接</button>
															<button id="general_v2ray" class="copy-config btn btn-sm btn-outline-primary" onclick=Copyconfig("/user/getUserAllURL?type=v2ray","#general_v2ray","")>全部 URL</button>
															</p>
														</div> 
														<div class="tab-pane fade" id="tabs-icons-text-2" role="tabpanel" aria-labelledby="tabs-icons-text-2-tab">
															<p>
															(1)&nbsp;SS - [ SS ][{if (in_array("ss",$Cool_Config['subscribe_type']))}全站支持使用方法{else}暂不支持{/if}]:&nbsp;
															</p>
															<p>
															<a class="btn btn-sm btn-outline-primary" href="/doc/#/Windows/Shadowsocks" target="_blank">教程文档</a>
															<button id="win_ss" class="copy-config btn btn-sm btn-outline-primary" onclick=Copyconfig("/user/getUserAllURL?type=ss","#win_ss","")>全部 URL</button>
															</p>
															
															<p>
															<p>
															(2)&nbsp;SSTap[ SSR ]使用方法:&nbsp;
															</p>
															<p>
															<a class="btn btn-sm btn-outline-primary" href="/doc/#/Windows/SSTap" target="_blank">教程文档</a>
															<button class="copy-text btn btn-sm btn-outline-primary" data-clipboard-text="{$subInfo['ssr']}&extend=1">复制订阅</button>
															<button id="win_ssr" class="copy-config btn btn-sm btn-outline-primary" onclick=Copyconfig("/user/getUserAllURL?type=ssr","#win_ssr","")>全部 URL</button>
															</p>
															
															<p>
															(3)&nbsp;V2rayN[ VMess ]使用方法:&nbsp;
															</p>
															<p>
															<a class="btn btn-sm btn-outline-primary" href="/doc/#/Windows/V2rayN" target="_blank">教程文档</a>
															<button class="copy-text btn btn-sm btn-outline-primary" data-clipboard-text="{$subInfo['v2ray']}&extend=1">复制订阅</button>
															<button id="win_ssr" class="copy-config btn btn-sm btn-outline-primary" onclick=Copyconfig("/user/getUserAllURL?type=v2ray","#general_v2ray","")>全部 URL</button>
															</p>
															
														    <p>
															(4)&nbsp;ClashR[ SS/SSR/VMess ]使用方法:&nbsp;
															</p>
															<p>
															<a class="btn btn-sm btn-outline-primary" href="/doc/#/Windows/Clash-for-Windows" target="_blank">教程文档</a> 
															<a class="btn btn-sm btn-outline-primary" href="{$subInfo['clashr']}" target="_blank">配置下载</a>
															<a class="btn btn-sm btn-outline-primary" href="clash://install-config?url={urlencode($subInfo['clashr'])}">ClashR 一键导入</a>
															</p>
														</div>
														<div class="tab-pane fade" id="tabs-icons-text-3" role="tabpanel" aria-labelledby="tabs-icons-text-3-tab">
														    <p>
															(1)&nbsp;Surge[ SS/VMess ]使用方法:&nbsp;
															</p>
															<p>
															<a class="btn btn-sm btn-outline-primary" href="/doc/#/macOS/Surge" target="_blank">教程文档</a>
															<button class="copy-text btn btn-sm btn-outline-primary" data-clipboard-text="{$subInfo['surge4']}">4.x 托管</button>
															<button class="copy-text btn btn-sm btn-outline-primary" data-clipboard-text="{$subInfo['surge3']}">3.x 托管</button>
															<button class="copy-text btn btn-sm btn-outline-primary" data-clipboard-text="{$subInfo['surge_node']}">3.x 节点</button>
															<button class="copy-text btn btn-sm btn-outline-primary" data-clipboard-text="{$subInfo['surge2']}">2.x 托管</button>
															</p>
															
															<p>
															(2)&nbsp;ShadowsocksX-NG[ SSR ]:&nbsp;
															</p>
															<p>
															<a class="btn btn-sm btn-outline-primary" href="/doc/#/macOS/ShadowsocksX-NG" target="_blank">教程文档</a>
															<button class="copy-text btn btn-sm btn-outline-primary" data-clipboard-text="{$subInfo["ssr"]}&extend=1">订阅链接</button>
															<button id="general_ssr" class="copy-config btn btn-sm btn-outline-primary" onclick=Copyconfig("/user/getUserAllURL?type=ssr","#general_ssr","")>全部 URL</button>
															</p>
															<p>
															(3)&nbsp;ClashXR[ SS/SSR/VMess ]:&nbsp;
															</p>
															<p>
															<a class="btn btn-sm btn-outline-primary" href="/doc/#/macOS/ClashX" target="_blank">教程文档</a>
															<button type="button" class="copy-text btn btn-sm btn-outline-primary" data-clipboard-text="{$subInfo['clashr']}">复制订阅</button>
															<a class="btn btn-sm btn-outline-primary" href="clash://install-config?url={urlencode($subInfo['clashr'])}">ClashX 一键导入</a>
															</p>
														</div>
														<div class="tab-pane fade" id="tabs-icons-text-4" role="tabpanel" aria-labelledby="tabs-icons-text-4-tab">
														{if $display_ios_class >= 0}
															{if $user->class >= $display_ios_class}
															iOS账户(仅可用于登陆Apple ID):
														
															<div class="col-sm-6 input-group" style="padding:0">
																<input type="text" class="form-control form-control-sm" name="input1"  value="{$ios_account}" readonly disabled />
																<div class="input-group-append">
																   <a class="copy-text btn btn-sm btn-primary text-white" data-clipboard-text="{$ios_account}">复制</a>
															    </div>
														    </div>
														 <p> </p>
															<div class="col-sm-6 input-group" style="padding:0">
																<input type="text" class="form-control form-control-sm" name="input1" value="{$ios_password}" readonly disabled />
																<div class="input-group-append">
																   <a class="copy-text btn btn-sm btn-primary text-white" data-clipboard-text="{$ios_password}">复制</a>
															    </div>
															 </div>
									                   
															{/if}
														{/if}							

															<p>
															(1)&nbsp;Quantumult[ SS/SSR/VMess ]:&nbsp;
															</p>
															<p>
															<a class="btn btn-sm btn-outline-primary" href="/doc/#/iOS/Quantumult_sub" target="_blank">教程文档</a>
															<button class="copy-text btn btn-sm btn-outline-primary" data-clipboard-text="{$subInfo['quantumult_v2']}&extend=1">V2 订阅</button>
															<button class="copy-text btn btn-sm btn-outline-primary" data-clipboard-text="{$subInfo['ssr']}&extend=1">SSR 订阅</button>
															<button id="" type="button" class="copy-config btn btn-sm btn-outline-primary" onclick=Copyconfig("/link/{$ssr_sub_token}?quantumult=2","#quan_sub","quantumult://settings?configuration=clipboard")>混合一键订阅</button>
													
															</p>
															
															<p>
															(2)&nbsp;Shadowrocket[ SS/SSR/VMess ]:&nbsp;
															</p>
															<p>
															<a class="btn btn-sm btn-outline-primary" href="/doc/#/iOS/Shadowrocket" target="_blank">教程文档</a>
															<button class="copy-text btn btn-sm btn-outline-primary" data-clipboard-text="{$subInfo['shadowrocket']}">SS(R)+V2复制订阅</button>
															<button class="btn btn-sm btn-outline-primary" onclick=AddSub("{$subInfo['shadowrocket']}","sub://")>SS(R)+V2一键订阅</button>
															</p>
														</div>
														<div class="tab-pane fade" id="tabs-icons-text-5" role="tabpanel" aria-labelledby="tabs-icons-text-5-tab">
															
															<p>
															(1)&nbsp;SSR[ SSR ]使用方法:&nbsp;
									                        </p>
									                        <p>
															<a class="btn btn-sm btn-outline-primary" href="/doc/#/Android/ShadowsocksR" target="_blank">教程文档</a>
															<button type="button" class="copy-text btn btn-sm btn-outline-primary" data-clipboard-text="{$subInfo['ssr']}&extend=1">复制订阅</button>
															</p>
															
															<p>
															(2)&nbsp;V2rayNG[ SS/VMess ]使用方法:&nbsp;
									                        </p>
									                        <p>
															<a class="btn btn-sm btn-outline-primary" href="/doc/#/Android/V2rayNG" target="_blank">教程文档</a>
															<button type="button" class="copy-text btn btn-sm btn-outline-primary" data-clipboard-text="{$subInfo['v2ray']}&extend=1">复制订阅</button>
															</p>
															<p>
															(3)&nbsp;ClashRA[ SS/SSR/VMess ]使用方法:&nbsp;
															</p>
															<p>
															<a class="btn btn-sm btn-outline-primary" href="/doc/#/Android/ClashRA" target="_blank">教程文档</a> 
															<a class="btn btn-sm btn-outline-primary" href="{$subInfo['clashr']}" target="_blank">配置下载</a>
															<button type="button" class="copy-text btn btn-sm btn-outline-primary" data-clipboard-text="{$subInfo['clashr']}">复制订阅</button>
															</p>
														</div>
													</div>
												</h5>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    
                        <div class="col-12 col-md-6 col-lg-6">
                            <div class="card">
                                <div class="card-header d-flex justify-content-between align-items-end">
                                    <h4><i class="fa fa-bolt"></i> 快速使用</h4>
                                    	<span style="line-height:29px;font-size:14px;float: right;">
                    						{if $user->isAbleToCheckin() }
                                    			<button type="button" id="checkin" class="btn btn-primary btn-sm waves-effect waves-light float-right"><i class="far fa-calendar-check fa-lg icon-ver"></i>&nbsp;每日签到</button>
                                    		{else}
                                				<button type="button" class="btn btn-primary disabled btn-sm waves-effect waves-light float-right"><i class="far fa-calendar-check fa-lg icon-ver"></i>&nbsp;已签到</button>
                                    		{/if}
                                    	</span>
                                </div>
                                <hr />
                                <div class="card-content">
                                    <div class="card-body pt-0">
										<div class="btn-group mt-1">
                	                    	<a href="/user/shop" class="btn btn-v2ray round waves-effect waves-light"><i class="fas fa-store"></i>&nbsp;&nbsp;商店&nbsp;</a>&nbsp;&nbsp;
                                        </div>
                                        <div class="btn-group mt-1">
                	                    	<a href="/doc" class="btn btn-quantumult round waves-effect waves-light"><i class="fas fa-book"></i>&nbsp;&nbsp;软件和教程&nbsp;</a>&nbsp;&nbsp;
                                        </div>
                                        <div class="btn-group mt-1">
                                            <a href="/user/node" class="btn btn-shadowrocket round waves-effect waves-light"><i class="fas fa-server"></i>&nbsp;&nbsp;线路列表&nbsp;</a>
                                        </div>
                                        <hr />
                                        
	                                    <div class="dropdown">
                                            {if (in_array("ssr",$Cool_Config['subscribe_type']))}
    	                                        <!-- SSR订阅 -->
    											<div class="btn-group mt-1">
    	                                        	<button type="button" class="btn btn-ssr round dropdown-toggle waves-effect waves-light" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="cool-ssr"></i>&nbsp;&nbsp;SSR 订阅</button>&nbsp;&nbsp;
    	                                        	<div class="dropdown-menu dropdown-node dropdown-menu-right" x-placement="bottom-end" style="position: absolute; transform: translate3d(-14px, 38px, 0px); top: 0px; left: 0px; will-change: transform;">
    	                                              <button type="button" class="dropdown-item copy-text" data-clipboard-text="{$subUrl}{$ssr_sub_token}?sub=1">复制 SSR 订阅</button>
    	                                              <button type="button" class="dropdown-item" href="##" onclick="importSublink('ssr')">一键导入 SSR</button>
    	                                        	</div>
    	                                        </div>
    	                                    {/if}
	                                    
                                            {if (in_array("v2ray",$Cool_Config['subscribe_type']))}
                                                <!-- V2ray订阅 -->
        										<div class="btn-group mt-1">
                                                	<button type="button" class="btn btn-v2ray round waves-effect waves-light copy-text" data-clipboard-text="{$subUrl}{$ssr_sub_token}?sub=3"><i class="cool-v2rayng"></i>复制 V2Ray 订阅</button>
                                                </div>
                                            {/if}
	                                        <br />
    	                                    {if (in_array("ss",$Cool_Config['subscribe_type'])) || (in_array("v2ray",$Cool_Config['subscribe_type']))}
    	                                        <!-- Clash订阅 -->
    											<div class="btn-group mt-1">
    	                                        	<button type="button" class="btn btn-clash round dropdown-toggle waves-effect waves-light" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="cool-clash"></i>&nbsp;&nbsp;Clash 订阅</button>&nbsp;&nbsp;
    	                                        	<div class="dropdown-menu dropdown-node dropdown-menu-right" x-placement="bottom-end" style="position: absolute; transform: translate3d(-14px, 38px, 0px); top: 0px; left: 0px; will-change: transform;">
    	                                              <button type="button" class="dropdown-item copy-text" data-clipboard-text="{$subUrl}{$ssr_sub_token}?clash=1">复制 Clash 订阅</button>
    	                                              <button type="button" class="dropdown-item" href="##" onclick="importSublink('clash')">一键导入 Clash</button>
    	                                        	</div>
    	                                        </div>
    	                                    {/if}
    	                                    
    	                                    {if (in_array("ss",$Cool_Config['subscribe_type'])) || (in_array("ssr",$Cool_Config['subscribe_type']))}
    	                                        <!-- ClashR订阅 -->
    											<div class="btn-group mt-1">
    	                                        	<button type="button" class="btn btn-clashr round dropdown-toggle waves-effect waves-light" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="cool-clash"></i>&nbsp;&nbsp;ClashR 订阅</button>&nbsp;&nbsp;
    	                                        	<div class="dropdown-menu dropdown-node dropdown-menu-right" x-placement="bottom-end" style="position: absolute; transform: translate3d(-14px, 38px, 0px); top: 0px; left: 0px; will-change: transform;">
    	                                              <button type="button" class="dropdown-item copy-text" data-clipboard-text="{$subUrl}{$ssr_sub_token}?clash=2">复制 ClashR 订阅</button>
    	                                              <button type="button" class="dropdown-item" href="##" onclick="importSublink('clashr')">一键导入 ClashR</button>
    	                                        	</div>
    	                                        </div>
    	                                    {/if}
    	                                    
    	                                    {if (!in_array("trojan",$Cool_Config['index_import_buttons']))}
                                                <!-- trojan订阅 -->
                                                <div class="btn-group mt-1">
                                                    <button type="button" class="btn btn-pill btn-trojan copy-text round" data-clipboard-text="{$subInfo['trojan']}"><i class="cool-v2rayng text-white"></i>&nbsp;&nbsp;复制 Trojan 订阅&nbsp;&nbsp;</button>
                                                </div>
    	                                    {/if}
    	                                    
	                                    </div> 
	                                   
	                                    <div class="dropdown">
                	                    {if (in_array("ss",$Cool_Config['subscribe_type']))}
    	                                    <!-- surge -->
                                            <div class="btn-group mt-1">
                                                <button type="button" class="btn btn-pill btn-surge dropdown-toggle round waves-effect waves-light" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="cool-surge text-white"></i>&nbsp;&nbsp;Surge 订阅&nbsp;&nbsp;</button>&nbsp;&nbsp;
                                                <div class="dropdown-menu dropdown-node dropdown-menu-right">
                                                    <button type="button" class="dropdown-item copy-text" data-clipboard-text="{$subUrl}{$ssr_sub_token}?surge=2">复制 Surge 2 节点订阅</button>
                                                    <button type="button" class="dropdown-item copy-text" data-clipboard-text="{$subUrl}{$ssr_sub_token}?surge=3">复制 Surge 3 节点订阅</button>
                                                    <button type="button" class="dropdown-item copy-text" data-clipboard-text="{$subUrl}{$ssr_sub_token}?surge=4">复制 Surge 4 节点订阅</button>
                                                </div>
                                            </div>
	                                    {/if}
	                                    
	                                    {if (!in_array("shadowrocket",$Cool_Config['index_import_buttons']))}
                                            <!-- Shadowrocket订阅 -->
                                            <div class="btn-group mt-1">
                                            	<button type="button" class="btn btn-shadowrocket round dropdown-toggle waves-effect waves-light" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="cool-shadowrocket"></i>&nbsp;&nbsp;Shadowrocket 订阅</button>&nbsp;&nbsp;
                                            	<div class="dropdown-menu dropdown-node dropdown-menu-right" x-placement="bottom-end" style="position: absolute; transform: translate3d(-14px, 38px, 0px); top: 0px; left: 0px; will-change: transform;">
                                                  <button type="button" class="dropdown-item copy-text" data-clipboard-text="{$subUrl}{$ssr_sub_token}?list=shadowrocket">复制 Shadowrocket 订阅</button>
                                                  <button type="button" class="dropdown-item" href="##" onclick="importSublink('shadowrocket')">一键导入 Shadowrocket</button>
                                            	</div>
                                            </div>
	                                    {/if}
	                                    
                                        {if (in_array("ss",$Cool_Config['subscribe_type'])) || (in_array("v2ray",$Cool_Config['subscribe_type']))}
                                            <!-- 订阅 -->
                                            <div class="btn-group mt-1">
                                                <button type="button" class="btn btn-pill btn-kitsunebi copy-text round" data-clipboard-text="{$subUrl}{$ssr_sub_token}?list=kitsunebi"><i class="cool-kitsunebi text-white"></i>&nbsp;&nbsp;复制 Kitsunebi 订阅&nbsp;&nbsp;</button>
                                            </div>
                                        {/if}
	                                    </div> 
	                                   
	                                    <div class="dropdown">
	                                    {if (!in_array("quantumult",$Cool_Config['index_import_buttons']))}
	                                        <!-- Quantumult订阅 -->
	                                        <div class="btn-group mt-1">
	                                        	<button type="button" class="btn btn-quantumult round dropdown-toggle waves-effect waves-light" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="cool-quantumult"></i>&nbsp;&nbsp;Quantumult 订阅</button>&nbsp;&nbsp;
	                                        	<div class="dropdown-menu dropdown-node dropdown-menu-right" x-placement="bottom-end" style="position: absolute; transform: translate3d(-14px, 38px, 0px); top: 0px; left: 0px; will-change: transform;">
	                                              <button type="button" class="dropdown-item copy-text" data-clipboard-text="{$subUrl}{$ssr_sub_token}?sub=1">复制 SSR 订阅</button>
	                                              <button type="button" class="dropdown-item copy-text" data-clipboard-text="{$subUrl}{$ssr_sub_token}?list=quantumult">复制 V2ray 订阅</button>
	                                              <div class="dropdown-divider"></div>
	                                              <button type="button" class="dropdown-item" href="##" onclick="importSublink('quantumult')">一键导入 SSR 节点订阅</button>
	                                              <button type="button" class="dropdown-item" href="##" onclick="importSublink('quantumult_v2')">一键导入 V2ray 节点订阅</button>
	                                        	</div>
	                                        </div>
                                        {/if}
                                        {if (!in_array("quantumultx",$Cool_Config['index_import_buttons']))}
	                                       	<!-- Quantumult X订阅 -->
	                                        <div class="btn-group mt-1">
	                                            <button type="button" class="btn btn-pill btn-quantumultx copy-text round" data-clipboard-text="{$subUrl}{$ssr_sub_token}?list=quantumultx"><i class="cool-quantumultx text-white"></i>&nbsp;&nbsp;复制 Quantumult X 订阅&nbsp;&nbsp;</button>&nbsp;&nbsp;
	                                        </div>
                                        {/if}
                                        
	                                    {if (!in_array("surfboard",$Cool_Config['index_import_buttons']))}
	                                        <!-- surfboard订阅 -->
	                                        <div class="btn-group mt-1">
                                                <button type="button" class="btn btn-pill btn-surfboard copy-text round" data-clipboard-text="{$subUrl}{$ssr_sub_token}?surfboard=1"><i class="cool-surfboard text-white"></i>&nbsp;&nbsp;复制 Surfboard 订阅&nbsp;&nbsp;</button>
                                            </div>
                                        </div>
                                        {/if}
                                    </div>
                                </div>
                            </div>
            
                            <div class="card">
                                <div class="card-header d-flex justify-content-between align-items-end">
                                    <h4><i class="feather icon-pie-chart"></i> 流量使用情况</h4>
                                </div>
                                    <hr />
                                <div class="card-content">
                                    <div class="card-body pt-0">
                                        <div id="session-chart" class="mb-1"></div>
										<ul class="list-group list-group-flush customer-info">
	                                        <li class="list-group-item d-flex justify-content-between ">
	                                            <div class="series-info">
	                                                <i class="fa fa-circle font-small-3" style="color:#7e72f1"></i>
	                                                <span class="text-bold-600">可用 - {($user->transfer_enable==0)?0:($user->transfer_enable-($user->u+$user->d))/$user->transfer_enable*100}%</span>
	                                            </div>
	                                            <div class="product-result">
	                                                <span>{if $user->quantitypay == '1'}按量付费启用中{else}{$user->unusedTraffic()}{/if}</span>
	                                            </div>
	                                        </li>
	                                        <li class="list-group-item d-flex justify-content-between ">
	                                            <div class="series-info">
	                                                <i class="fa fa-circle font-small-3 text-warning"></i>
	                                                <span class="text-bold-600">已用 - {($user->transfer_enable==0)?0:$user->last_day_t/$user->transfer_enable*100}%</span>
	                                            </div>
	                                            <div class="product-result">
	                                                <span>{$user->LastusedTraffic()}</span>
	                                            </div>
	                                        </li>
	                                        <li class="list-group-item d-flex justify-content-between ">
	                                            <div class="series-info">
	                                                <i class="fa fa-circle font-small-3 text-danger"></i>
	                                                <span class="text-bold-600">今日已用 - {($user->transfer_enable==0)?0:($user->u+$user->d-$user->last_day_t)/$user->transfer_enable*100}%</span>
	                                            </div>
	                                            <div class="product-result">
	                                                <span>{$user->TodayusedTraffic()}</span>
	                                            </div>
	                                        </li>
                                    	</ul>
                                    </div>
                                </div>
                            </div>
                            {if $Cool_Config['enable_index_placard'] == true}
                             <div class="modal fade" id="tos_notify" tabindex="-1" role="dialog">
                        		  <div class="modal-dialog modal-dialog-centered" role="document">
                        		    <div class="modal-content">
                        		      <div class="modal-header">
                        		        <h4 id="modal-title">重要公告</h4>
                        		        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        		          <span aria-hidden="true">×</span>
                        		        </button>
                        		      </div>
                        		      <div class="modal-body">
                                          {$Cool_Config['index_placard_content']}
                                      </div>
                        			</div>
                        		  </div>
                        		</div>
                            {/if}
                        </div>
                    </div>
                </select>
            </div>
        </div>
    </div>
    <!-- END: Content-->

    <!-- BEGIN: Footer-->
		{include file='user/footer.tpl'}
    <!-- END: Footer-->
    
	<script src="/theme/cool/assets/vendors/js/charts/apexcharts.min.js"></script>
	<script src="/theme/cool/assets/js/scripts/pages/dashboard-ecommerce.js"></script>
	<script>
	  var sessionChartoptions = {
	    chart: {
	      type: 'donut',
	      height: 325,
	      toolbar: {
	        show: false
	      }
	    },
	    dataLabels: {
	      enabled: false
	    },
	    series: [{($user->transfer_enable==0)?0:($user->transfer_enable-($user->u+$user->d))/$user->transfer_enable*100}, {($user->transfer_enable==0)?0:$user->last_day_t/$user->transfer_enable*100}, {($user->transfer_enable==0)?0:($user->u+$user->d-$user->last_day_t)/$user->transfer_enable*100}],
	    legend: { show: false },
	    comparedResult: [2, -3, 8],
	    labels: ['可用', '已用', '今日已用'],
	    stroke: { width: 0 },
	    colors: ['#7367F0', '#FF9F43', '#EA5455'],
	    fill: {
	      type: 'gradient',
	      gradient: {
	        gradientToColors: ['#A9A2F6', '#ffc085', '#f29292']
	      }
	    }
	  }
	</script>
	
    {if $Cool_Config['enable_index_placard'] == true}
    <script>
      {if $Cool_Config['enable_index_placard_time'] == true}
          function setCookie(name, value) {
              var exp = new Date();
              exp.setTime(exp.getTime() + 1 * 60 * 1000*60*24);
              document.cookie = name + "=" + escape(value) + ";expires=" + exp.toGMTString() + ";path=/";
              }
      
          function ReadCookie(name) {
              var arr, reg = new RegExp("(^| )" + name + "=([^;]*)(;|$)");
              if (arr = document.cookie.match(reg)) return unescape(arr[2]);
              else return null;
              }
              if (ReadCookie("cnxad_lunbo") == "" || ReadCookie("cnxad_lunbo") == null) {
                  $('#tos_notify').modal('show');
                  setCookie("cnxad_lunbo", "yes");
                  }
      {else}
            $("#tos_notify").modal();
      {/if}
    </script>
    {/if}
      
	<script>
		$("#reset-link").click(function () {
			swal('重置成功', "请变更或添加您的订阅链接！～～",'success');
			window.setTimeout("location.href='/user/url_reset'", 1200);
		});
	</script>
</body>
<!-- END: Body-->
</html>