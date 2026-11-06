<!DOCTYPE html>
  <html lang="zh-CN">
   <head> 
    <title>节点设置 — {$config["appName"]}</title>
   {include file='user/header.tpl'} 
    <!-- BEGIN: Content-->
    <div class="app-content content">
        <div class="content-overlay"></div>
        <div class="header-navbar-shadow"></div>
        <div class="content-wrapper">
            <div class="content-header row">
                <div class="content-header-left col-md-9 col-12 mb-2">
                    <div class="row breadcrumbs-top">
                        <div class="col-12">
                            <h2 class="content-header-title float-left mb-0">节点设置</h2>
                            <div class="breadcrumb-wrapper col-12">
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item"><a href="/user">Home</a>
                                    </li>
                                    <li class="breadcrumb-item"><a href="/user/edit">Server Settings</a>
                                    </li>
                                </ol>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="content-body">
				<section id="page-account-settings">
                    <div class="row">
                        <div class="col-md-3 mb-2 mb-md-0">
                            <ul class="nav nav-pills flex-column mt-md-0 mt-1">
                                <li class="nav-item">
                                    <a class="nav-link d-flex py-75 active" id="password-tab" data-toggle="pill" href="#password" aria-expanded="true">
                                        <i class="feather icon-globe mr-50 font-medium-3"></i>连接密码</a>
                                </li>
                                
                                {if $Cool_Config['show_method'] == true}
	                                <li class="nav-item">
	                                    <a class="nav-link d-flex py-75" id="method-tab" data-toggle="pill" href="#method" aria-expanded="false">
	                                        <i class="feather icon-lock mr-50 font-medium-3"></i>加密方式</a>
	                                </li>
	                            {/if}
	                            
	                            {if $config['port_price'] > 0}
	                                <li class="nav-item">
	                                    <a class="nav-link d-flex py-75" id="port-tab" data-toggle="pill" href="#port" aria-expanded="false">
	                                        <i class="feather icon-refresh-cw mr-50 font-medium-3"></i>重置端口</a>
	                                </li>
	                            {/if}
                                
                                {if $config['port_price_specify'] > 0}
	                                <li class="nav-item">
	                                    <a class="nav-link d-flex py-75" id="port-specify-tab" data-toggle="pill" href="#port-specify" aria-expanded="false">
	                                        <i class="feather icon-settings mr-50 font-medium-3"></i>钦定端口</a>
	                                </li>
	                            {/if}
	                            
                                {if $Cool_Config['show_protocol'] == true}
	                                <li class="nav-item">
	                                    <a class="nav-link d-flex py-75" id="protocol-obfs-tab" data-toggle="pill" href="#protocol-obfs" aria-expanded="false">
	                                        <i class="feather icon-feather mr-50 font-medium-3"></i>协议和混淆</a>
	                                </li>
	                            {/if}
                            </ul>
                        </div>
                        <!-- right content section -->
                        <div class="col-md-9">
                            <div class="card">
                                <div class="card-content">
                                    <div class="card-body">
                                        <div class="tab-content">
											<div role="tabpanel" class="tab-pane active" id="password" aria-labelledby="password-tab" aria-expanded="true">
							                    <div class="card">
													<div class="header"> 
											          <h5 class="title"><strong>连接密码</strong></h5> 
											        </div>
											        <hr />
													<div class="body" id="ss-pwd-body"> 
														<p>您需要了解的是修改此密码同时也会变更您 V2Ray 节点的 UUID，请注意及时更新托管订阅。
															<br><br>当前连接密码：<code id="ss-current-password">{$user->passwd}</code></p>
											            <div class="form-group">
											            	<div class="input-group mb-3">
											                	<input id="ss-password" type="text" class="form-control" placeholder="请输入新密码" aria-label="">
											                	<div class="input-group-append">
											                		<button id="ss-random-password" class="btn btn-warning" type="button">随机生成</button>
											                	</div>
											            	</div>
											            </div>
											        </div>
							                    	<div class="col-13 d-flex flex-sm-row flex-column justify-content-end">
							                    		<button id="ss-pwd-update" class="btn btn-primary">提交更改</button>
							                    	</div>
							                    </div>
							                </div>
							                
                                            <div class="tab-pane fade" id="method" role="tabpanel" aria-labelledby="method-tab" aria-expanded="false">
							                    <div class="card">
													<div class="header"> 
											          <h5 class="title"><strong>加密方式</strong></h5> 
											        </div>
											        <hr />
													<div class="body" id="method-confirm-body"> 
											           <p>SS/SSD/SSR 支持的加密方式有所不同<br />请根据实际情况来进行选择<br /><br />
											             当前加密方式: <code id="current-method">[{if URL::CanMethodConnect($user->method) == 2}SS/SSD{else}SS/SSR{/if} 可连接] {$user->method}</code>
											           </p>
											           <div class="form-group">
											             <select id="method-select" class="form-control">
											               {$method_list = $config_service->getSupportParam('method')}
											               {foreach $method_list as $method}
											               <option value="{$method}">[{if URL::CanMethodConnect($method) == 2}SS/SSD{else}SS/SSR{/if} 可连接] {$method}</option>
											               {/foreach}
											             </select>
											           </div>
											        </div> 
							                    	<div class="col-13 d-flex flex-sm-row flex-column justify-content-end">
							                    		<button id="method-confirm" class="btn btn-primary">提交更改</button>
							                    	</div>
							                    </div>
                                            </div>
                                            
                                            <div class="tab-pane fade" id="port" role="tabpanel" aria-labelledby="port-tab" aria-expanded="false">
												<div class="card">
													<div class="header"> 
											          <h5 class="title"><strong>重置端口</strong></h5> 
											        </div>
											        <hr />
													<div class="body" id="port-body"> 
											          <div id="reset-port-modal-body-re"> 
											           <p>随机更换一个端口使用，价格：<code>{$config['port_price']}</code>元/次</p> 
											           <p>重置后1分钟内生效</p> 
											           <p>当前端口：<code id="current-port">{$user->port}</code></p> 
											          </div> 
											         </div> 
							                    	<div class="col-13 d-flex flex-sm-row flex-column justify-content-end">
							                    		<button id="reset-port" class="btn btn-primary">提交更改</button>
							                    	</div>
							                    </div>
                                            </div>
                                            
                                            <div class="tab-pane fade" id="port-specify" role="tabpanel" aria-labelledby="port-specify-tab" aria-expanded="false">
                                                <div class="card">
													<div class="header"> 
											          <h5 class="title"><strong>指定端口</strong></h5> 
											        </div>
											        <hr />
													<div class="body" id="port-specify-body"> 
											          <div id="port-specify-modal-body-re"> 
											           <p>价格：<code>{$config['port_price_specify']}</code>元/次</p> 
											           <p>端口范围：<code>{$config['min_port']}～{$config['max_port']}</code></p> 
											           <p>当前端口：<code id="current-port-2">{$user->port}</code></p> 
											           <div class="form-group"> 
											            <input id="port-specify-reset" type="text" class="form-control" placeholder="请输入想钦定的端口号" aria-label="" /> 
											           </div> 
											          </div> 
											        </div> 
							                    	<div class="col-13 d-flex flex-sm-row flex-column justify-content-end">
							                    		<button id="port-specify-set" class="btn btn-primary">提交更改</button>
							                    	</div>
							                    </div>
                                            </div>
                                            
                                            
                                            
                                            <div class="tab-pane fade" id="protocol-obfs" role="tabpanel" aria-labelledby="protocol-obfs-modal-tab" aria-expanded="false">
                                                <div class="card">
													<div class="header"> 
											          <h5 class="title"><strong>协议和混淆</strong></h5> 
											        </div>
											        <hr />
											         <div class="modal-body" id="protocol-obfs-modal-body"> 
														<p>如果需要兼容 SS/SSD 请设置为 origin 或 <br />选择带_compatible的兼容选项<br />
														 auth_chain 系为实验性协议，可能造成不稳定或无法使用，开启前请询问是否支持<br /><br />
														 当前协议: <code id="current-protocol">[{if URL::CanProtocolConnect($user->protocol) == 3}SS/SSD/SSR{else}SSR{/if} 可连接] {$user->protocol}</code>
														</p>
														<div class="form-group">
														   <select id="protocol-selection" class="form-control">
														     {$protocol_list = $config_service->getSupportParam('protocol')}
														     {foreach $protocol_list as $protocol}
														     <option value="{$protocol}">[{if URL::CanProtocolConnect($protocol) == 3}SS/SSD/SSR{else}SSR{/if} 可连接] {$protocol}</option>
														     {/foreach}
														   </select>
														   <br />
														 
														   <p>当前混淆方式: <code id="current-obfs">[{if URL::CanObfsConnect($user->obfs) >= 3}SS/SSD/SSR{elseif URL::CanObfsConnect($user->obfs) == 1}SSR{else}SS/SSD{/if} 可连接] {$user->obfs}</code></p>
														   <select id="obfs" class="form-control">
														     {$obfs_list = $config_service->getSupportParam('obfs')}
														     {foreach $obfs_list as $obfs}
														     <option value="{$obfs}">[{if URL::CanObfsConnect($obfs) >= 3}SS/SSD/SSR{else}{if URL::CanObfsConnect($obfs) == 1}SSR{else}SS/SSD{/if}{/if} 可连接] {$obfs}</option>
														     {/foreach}
														   </select>  
														</div>
														<p>当前混淆参数: <code id="current-obfs-param">{$user->obfs_param}</code></p>
										                <div class="form-group">
										                  <input id="obfs-param" type="text" class="form-control" placeholder="请输入混淆参数" aria-label="">
										                </div>
								                    	<div class="col-13 d-flex flex-sm-row flex-column justify-content-end">
								                    		<button id="protocol-obfs-confirm" class="btn btn-primary">提交更改</button>
								                    	</div>
								                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
			</div>

           </div>
        </div>
				
    <!-- END: Content-->

    <!-- BEGIN: Footer-->
		{include file='user/footer.tpl'}
    <!-- END: Footer-->

</body>
<!-- END: Body-->

</html>