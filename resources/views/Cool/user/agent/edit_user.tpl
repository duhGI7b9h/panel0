<!DOCTYPE html>
  <html lang="zh-CN">
   <head> 
    <title>编辑用户 — {$config["appName"]}</title> 

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
                            <h2 class="content-header-title float-left mb-0">编辑用户 #{$id}</h2>
                        </div>
                    </div>
                </div>
            </div>
            <div class="content-body">
                <div class="card">
    				<div class="card-header">
    					<div class="card-toolbar">
    						<ul class="nav nav-tabs mb-3">
    							<li class="nav-item mr-2">
    								<a class="nav-link d-flex align-items-center active" href="#user_edit_tab_1" data-toggle="tab">
    								    <i class="feather icon-user mr-25"></i>
    									<span class="d-none d-sm-block">用户编辑</span>
    								</a>
    							</li>
    							<li class="nav-item mr-2">
    								<a class="nav-link d-flex align-items-center" href="#user_edit_tab_2" data-toggle="tab">
    								    <i class="feather icon-shopping-cart mr-25"></i>
    									<span class="d-none d-sm-block">开通套餐</span>
    								</a>
    							</li>
    							<li class="nav-item mr-2">
    								<a class="nav-link d-flex align-items-center" href="#user_edit_tab_3" data-toggle="tab">
    								    <i class="feather icon-info mr-25"></i>
    									<span class="d-none d-sm-block">用户详情</span>
    								</a>
    							</li>
    						</ul>
    					</div>
    				</div>
    
    				<div class="card-body">
					    <div class="tab-content">
							<div class="tab-pane show px-7 active" id="user_edit_tab_1" role="tabpanel">
								<div class="row">
									<div class="col-xl-2"></div>
									<div class="col-xl-7 my-2">
										<div class="form-group row">
											<label class="col-form-label col-3 text-lg-right text-left">头像</label>
											<div class="users-view-image">
												<div class="users-view-image rounded mb-1 ml-1">
							                        <img src="{$agent_user->gravatar}" class="rounded-circle" alt="avatar" style="width:150px;height:150px">
												</div>
											</div>
										</div>
										<div class="form-group row">
											<label class="col-form-label col-3 text-lg-right text-left">昵称</label>
											<div class="col-9">
												<input class="form-control" type="text" value="{$agent_user->user_name}" id="user_name" name="user_name"/>
											</div>
										</div>
										<div class="form-group row">
											<label class="col-form-label col-3 text-lg-right text-left">邮箱</label>
											<div class="col-9">
												<input class="form-control" type="text" value="{$agent_user->email}" id="email" name="email"/>
											</div>
										</div>
										<div class="form-group row">
											<label class="col-form-label col-3 text-lg-right text-left">新密码</label>
											<div class="col-9">
												<input class="form-control" id="passwd" type="password" value="" name="password" placeholder="不修改密码请留空"/>
											</div>
										</div>
										<div class="form-group row mb-2">
											<label class="col-form-label col-3 text-lg-right text-left">用户启用</label>
											<div class="custom-control custom-switch ml-1" style="margin-top:10px">
                                                <input type="checkbox" class="custom-control-input" id="customSwitch3" {if $agent_user->enable === 1}checked="checked"{/if}>
                                                <label class="custom-control-label" for="customSwitch3"></label>
                                            </div>
										</div>
										<div class="form-group row">
											<label class="col-form-label col-3"> </label>
											<div class="col-9">
												<button type="button" class="btn btn-primary" onclick="edit_user('{$id}')" >保存</button>
											</div>
										</div>
									</div>
								</div>
							</div>
       
							<div class="tab-pane show px-7" id="user_edit_tab_2" role="tabpanel">
								<div class="row">
									<div class="col-xl-2"></div>
									<div class="col-xl-7 my-2">
										<div class="form-group row">
											<label class="col-form-label col-3 text-lg-right text-left">开通套餐</label>
											<div class="col-9">
												<select class="form-control" id="edit_user_shop" >
													{foreach $shop_name as $key => $value}
                										<option value="{$value["id"]}">{$value["name"]}--{$value["price"]}</option>
                									{/foreach}
												</select>
												<br />
												<p>为用户指定套餐需从您的账号余额扣除相应的金额<br />
    												<br />同时获得相应比例的返利金额到代理余额<br />
    												<br />套餐详情可至商店查看
                                                </p>
											</div>
										</div>
										<div class="form-group row">
											<label class="col-form-label col-3 text-lg-right text-left"></label>
											<div class="col-9">
												<button type="button" class="btn btn-primary" onclick="buy_user_shop('{$id}')">保存</button>
											</div>
										</div>
									</div>
								</div>
							</div>
							
							<div class="tab-pane px-7" id="user_edit_tab_3" role="tabpanel">
								<div class="row">
									<div class="col-xl-2"></div>
									<div class="col-xl-7">
										<div class="my-2">
											<div class="form-group row">
												<label class="col-form-label col-3 text-lg-right text-left">订阅地址</label>
												<div class="col-9">
												  <div class="dropdown">
            								        <!-- SSR订阅 -->
            											<div class="btn-group">
            	                                        	<button type="button" class="btn btn-ssr round dropdown-toggle waves-effect waves-light" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="cool-ssr"></i>&nbsp;&nbsp;SSR 订阅</button>&nbsp;&nbsp;
            	                                        	<div class="dropdown-menu dropdown-node dropdown-menu-right" x-placement="bottom-end" style="position: absolute; transform: translate3d(-14px, 38px, 0px); top: 0px; left: 0px; will-change: transform;">
            	                                              <button type="button" class="dropdown-item copy-text" data-clipboard-text="{$subInfo["ssr"]}">复制 SSR 订阅</button>
            	                                              <button type="button" class="dropdown-item" href="##" onclick="importSublink('ssr')">一键导入 SSR</button>
            	                                        	</div>
            	                                        </div>
                                                    <!-- V2ray订阅 -->
                										<div class="btn-group">
                                                        	<button type="button" class="btn btn-v2ray round waves-effect waves-light copy-text" data-clipboard-text="{$subInfo["v2ray"]}"><i class="cool-v2rayng"></i>复制 V2Ray 订阅</button>&nbsp;&nbsp;
                                                        </div>
                                                        
                                                    <!-- Clash订阅 -->
            											<div class="btn-group">
            	                                        	<button type="button" class="btn btn-clash round dropdown-toggle waves-effect waves-light" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="cool-clash"></i>&nbsp;&nbsp;Clash 订阅</button>&nbsp;&nbsp;
            	                                        	<div class="dropdown-menu dropdown-node dropdown-menu-right" x-placement="bottom-end" style="position: absolute; transform: translate3d(-14px, 38px, 0px); top: 0px; left: 0px; will-change: transform;">
            	                                              <button type="button" class="dropdown-item copy-text" data-clipboard-text="{$subInfo["clash"]}">复制 Clash 订阅</button>
            	                                              <button type="button" class="dropdown-item" href="##" onclick="importSublink('clash')">一键导入 Clash</button>
            	                                        	</div>
            	                                        </div>
            	                                        
                                                    <!-- ClashR订阅 -->
            											<div class="btn-group">
            	                                        	<button type="button" class="btn btn-clashr round dropdown-toggle waves-effect waves-light" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="cool-clash"></i>&nbsp;&nbsp;ClashR 订阅</button>&nbsp;&nbsp;
            	                                        	<div class="dropdown-menu dropdown-node dropdown-menu-right" x-placement="bottom-end" style="position: absolute; transform: translate3d(-14px, 38px, 0px); top: 0px; left: 0px; will-change: transform;">
            	                                              <button type="button" class="dropdown-item copy-text" data-clipboard-text="{$subInfo["clashr"]}">复制 ClashR 订阅</button>
            	                                              <button type="button" class="dropdown-item" href="##" onclick="importSublink('clashr')">一键导入 ClashR</button>
            	                                        	</div>
            	                                        </div>
            	                                        
                                                    <!-- trojan订阅 -->
                                                        <div class="btn-group">
                                                            <button type="button" class="btn btn-pill btn-trojan copy-text round" data-clipboard-text="{$subInfo['trojan']}"><i class="cool-v2rayng text-white"></i>&nbsp;&nbsp;复制 Trojan 订阅&nbsp;&nbsp;</button>&nbsp;&nbsp;
                                                        </div>
                                                        
                                                    <!-- surge -->
                                                    <div class="btn-group">
                                                        <button type="button" class="btn btn-pill btn-surge dropdown-toggle round waves-effect waves-light" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="cool-surge text-white"></i>&nbsp;&nbsp;Surge 订阅&nbsp;&nbsp;</button>&nbsp;&nbsp;
                                                        <div class="dropdown-menu dropdown-node dropdown-menu-right">
                                                            <button type="button" class="dropdown-item copy-text" data-clipboard-text="{$subInfo["surge2"]}">复制 Surge 2 节点订阅</button>
                                                            <button type="button" class="dropdown-item copy-text" data-clipboard-text="{$subInfo["surge3"]}">复制 Surge 3 节点订阅</button>
                                                            <button type="button" class="dropdown-item copy-text" data-clipboard-text="{$subInfo["surge4"]}">复制 Surge 4 节点订阅</button>
                                                        </div>
                                                    </div>
                                 
                                                    <!-- Shadowrocket订阅 -->
                                                    <div class="btn-group">
                                                    	<button type="button" class="btn btn-shadowrocket round dropdown-toggle waves-effect waves-light" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="cool-shadowrocket"></i>&nbsp;&nbsp;Shadowrocket 订阅</button>&nbsp;&nbsp;
                                                    	<div class="dropdown-menu dropdown-node dropdown-menu-right" x-placement="bottom-end" style="position: absolute; transform: translate3d(-14px, 38px, 0px); top: 0px; left: 0px; will-change: transform;">
                                                          <button type="button" class="dropdown-item copy-text" data-clipboard-text="{$subInfo["shadowrocket"]}">复制 Shadowrocket 订阅</button>
                                                          <button type="button" class="dropdown-item" href="##" onclick="importSublink('shadowrocket')">一键导入 Shadowrocket</button>
                                                    	</div>
                                                    </div>
                                                    
                                                    <!-- 订阅 -->
                                                    <div class="btn-group ">
                                                        <button type="button" class="btn btn-pill btn-kitsunebi copy-text round" data-clipboard-text="{$subInfo["kitsunebi"]}"><i class="cool-kitsunebi text-white"></i>&nbsp;&nbsp;复制 Kitsunebi 订阅&nbsp;&nbsp;</button>&nbsp;&nbsp;
                                                    </div>
                                                    
                                                    <!-- Quantumult订阅 -->
        	                                        <div class="btn-group ">
        	                                        	<button type="button" class="btn btn-quantumult round dropdown-toggle waves-effect waves-light" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="cool-quantumult"></i>&nbsp;&nbsp;Quantumult 订阅</button>&nbsp;&nbsp;
        	                                        	<div class="dropdown-menu dropdown-node dropdown-menu-right" x-placement="bottom-end" style="position: absolute; transform: translate3d(-14px, 38px, 0px); top: 0px; left: 0px; will-change: transform;">
        	                                              <button type="button" class="dropdown-item copy-text" data-clipboard-text="{$subInfo["ssr"]}">复制 SSR 订阅</button>
        	                                              <button type="button" class="dropdown-item copy-text" data-clipboard-text="{$subInfo["quantumult_v2"]}">复制 V2ray 订阅</button>
        	                                              <div class="dropdown-divider"></div>
        	                                              <button type="button" class="dropdown-item" href="##" onclick="importSublink('quantumult')">一键导入 SSR 节点订阅</button>
        	                                              <button type="button" class="dropdown-item" href="##" onclick="importSublink('quantumult_v2')">一键导入 V2ray 节点订阅</button>
        	                                        	</div>
        	                                        </div>
        	                                        
                                                    <!-- Quantumult X订阅 -->
        	                                        <div class="btn-group">
        	                                            <button type="button" class="btn btn-pill btn-quantumultx copy-text round" data-clipboard-text="{$subInfo["quantumultx"]}"><i class="cool-quantumultx text-white"></i>&nbsp;&nbsp;复制 Quantumult X 订阅&nbsp;&nbsp;</button>&nbsp;&nbsp;
        	                                        </div>
        	                                        
                                                    <!-- surfboard订阅 -->
        	                                        <div class="btn-group">
                                                        <button type="button" class="btn btn-pill btn-surfboard copy-text round" data-clipboard-text="{$subInfo["surfboard"]}"><i class="cool-surfboard text-white"></i>&nbsp;&nbsp;复制 Surfboard 订阅&nbsp;&nbsp;</button>
                                                    </div>
                                                    
												  </div>                   
												</div>
											</div>
											<div class="form-group row">
												<label class="col-form-label col-3 text-lg-right text-left">重置订阅</label>
												<div class="col-8" style="margin-top:8px">
													<button type="button" class="btn btn-primary btn-sm" onclick="edit_user_reset_link('{$id}')">重置</button>
													<div class="mt-2">重置该用户的订阅链接, 重置后用户将无法使用旧的订阅</div>
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
		</div>
	</div> 
    <!-- END: Content-->
			
    <!-- BEGIN: Footer-->
		{include file='user/footer.tpl'}
    <!-- END: Footer-->
    
</body>
</html>