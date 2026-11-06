<!DOCTYPE html>
  <html lang="zh-CN">
   <head> 
    <title>我的账号 — {$config["appName"]}</title>

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
                            <h2 class="content-header-title float-left mb-0">我的账号</h2>
                            <div class="breadcrumb-wrapper col-12">
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item"><a href="/user">Home</a>
                                    </li>
                                    <li class="breadcrumb-item"><a href="/user/profile">My Account</a>
                                    </li>
                                </ol>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="content-body">
                <!-- account setting page start -->
                <section id="page-account-settings">
                    <div class="row">
                        <!-- left menu section -->
                        <div class="col-xl-4 order-xl-2">
				          <div class="card card-profile">
				            <img src="/theme/cool/assets/images/user-info.jpg" alt="Image placeholder" class="card-img-top">
				            <div class="row justify-content-center">
				              <div class="col-lg-3 order-lg-2">
				                <div class="card-profile-image">
				                  <a href="#">
				                    <img src="/theme/cool/assets/images/images.png" class="rounded-circle">
				                  </a>
				                </div>
				              </div>
				            </div>
							<div class="card-header text-center border-0 pt-8 pt-md-4 pb-0 pb-md-4">
									<a href="/user/node" class="btn btn-sm btn-info mr-4">查看节点</a>
									<a href="/user/shop" class="btn btn-sm btn-primary  float-right">前往商店</a>
							</div>
				            <div class="card-body pt-0">
				              <div class="row">
				                <div class="col">
				                  <div class="card-profile-stats d-flex justify-content-center">
				                    <div>
				                      <span class="heading">Lv.{$user->class}</span>
				                      <span class="description">Class</span>
				                    </div>
				                    <div>
				                      <span class="heading">{$user->money}</span>
				                      <span class="description">Money</span>
				                    </div>
				                    <div>
				                      <span class="heading">{$user->unusedTraffic()}</span>
				                      <span class="description">Traffic</span>
				                    </div>
				                  </div>
				                </div>
				              </div>
				              <div class="text-center">
				                <h5 class="h3" style="padding:0.8em">{$user->user_name}</h5>
								<a class="btn btn-sm btn-danger" style="color:white" data-toggle="modal" data-target="#delete-account-modal">删除账号</a>
							  </div>
				            </div>
				          </div>
				        </div>
				    	<div class="col-xl-8 order-xl-1">
				          <div class="row">
				            <div class="col-lg-6 doudong">
				              <div class="card bg-gradient-danger border-0">
				                <!-- Card body --><a href="javascript:void(0);" data-toggle="modal" data-target="#pwd-up">
				                <div class="card-body">
				                  <div class="row">
				                    <div class="col">
				                      <span class="h2 font-weight-bold mb-0 text-white">修改登陆密码</span>
				                    </div>
				                    <div class="col-auto">
				                      <div class="icon icon-shape bg-white text-dark rounded-circle shadow">
				                        <i class="fa fa-lock"></i>
				                      </div>
				                    </div>
				                  </div>
				                  <p class="mt-3 mb-0 text-sm">
				                    <span class="text-white mr-2"><i class="ni ni-lock-circle-open icon-ver"></i>&nbsp;定期修改为高强度密码以保护您的账号.</span>
				                  </p>
				                </div>
								</a>
				              </div>
				            </div>
				            <div class="col-lg-6 doudong">
				              <div class="card bg-gradient-warning border-0">
				                <!-- Card body --><a href="javascript:void(0);" data-toggle="modal" data-target="#sublink-modal">
								<div class="card-body">
				                  <div class="row">
				                    <div class="col">
				                      <span class="h2 font-weight-bold mb-0 text-white">重置订阅</span>
				                    </div>
				                    <div class="col-auto">
				                      <div class="icon icon-shape bg-white text-dark rounded-circle shadow">
				                        <i class="fa fa-link"></i>
				                      </div>
				                    </div>
				                  </div>
				                  <p class="mt-3 mb-0 text-sm">
				                    <span class="text-white mr-2"><i class="ni ni-single-copy-04 icon-ver"></i>&nbsp;重置并获取新的订阅地址.</span>
				                  </p>
				                </div>
				              </div>
				            </div>
				          </div>
						  <div class="row">
				            <div class="col-lg-6 doudong">
				              <div class="card bg-gradient-info border-0">
				                <!-- Card body --><a href="javascript:void(0);" data-toggle="modal" data-target="#telegram">
				                <div class="card-body">
				                  <div class="row">
				                    <div class="col">
									      <span class="h2 font-weight-bold mb-0 text-white">绑定TG账号</span>
									</div>
				                    <div class="col-auto">
				                      <div class="icon icon-shape bg-white text-dark rounded-circle shadow">
				                        <i class="fa fa-paper-plane-o"></i>
				                      </div>
				                    </div>
				                  </div>
				                  <p class="mt-3 mb-0 text-sm">
				                    <span class="mr-2 text-white"><i class="ni ni-send icon-ver"></i>&nbsp;绑定后可加入 Telegram 群组签到等.</span>
				                  </p>
				                </div>
								</a>
				              </div>
				            </div>
				            <div class="col-lg-6 doudong">
				              <div class="card bg-gradient-success border-0">
				                <!-- Card body --><a href="javascript:void(0);" data-toggle="modal" data-target="#step2-modal">
				                <div class="card-body">
				                  <div class="row">
				                    <div class="col">
				                      <span class="h2 font-weight-bold mb-0 text-white">二步验证</span>
				                    </div>
				                    <div class="col-auto">
				                      <div class="icon icon-shape bg-white text-dark rounded-circle shadow">
				                        <i class="fa fa-shield"></i>
				                      </div>
				                    </div>
				                  </div>
				                  <p class="mt-3 mb-0 text-sm">
				                    <span class="text-white mr-2"><i class="ni ni-palette icon-ver"></i>&nbsp;为您的帐号添加额外的安全保障.</span>
				                  </p>
				                </div>
								</a>
				              </div>
				            </div>
				          </div>
						  <div class="row">
				            <div class="col-lg-6 doudong">
				              <div class="card bg-gradient-primary border-0">
				                <!-- Card body --><a href="javascript:void(0);" data-toggle="modal" data-target="#dailymail-modal">
				                <div class="card-body">
				                  <div class="row">
				                    <div class="col">
				                      <span class="h2 font-weight-bold mb-0 text-white">每日邮件提醒设置</span>
				                    </div>
				                    <div class="col-auto">
				                      <div class="icon icon-shape bg-white text-dark rounded-circle shadow">
				                        <i class="fa fa-envelope-o"></i>
				                      </div>
				                    </div>
				                  </div>
				                  <p class="mt-3 mb-0 text-sm">
				                    <span class="text-white mr-2"><i class="ni ni-email-83 icon-ver"></i>&nbsp;当前的设置&nbsp;:&nbsp;{if $user->sendDailyMail==1}发送{else}不发送{/if}</span>
				                  </p>
				                </div>
								</a>
				              </div>
				            </div>
				            <div class="col-lg-6 doudong">
				              <div class="card bg-gradient-dark border-0">
				                <!-- Card body --><a href="javascript:void(0);" data-toggle="modal" data-target="#unblock-ip">
				                <div class="card-body">
				                  <div class="row">
				                    <div class="col">
				                      <span class="h2 font-weight-bold mb-0 text-white">IP 解封</span>
				                    </div>
				                    <div class="col-auto">
				                      <div class="icon icon-shape bg-white text-dark rounded-circle shadow">
				                        <i class="fa fa-power-off"></i>
				                      </div>
				                    </div>
				                  </div>
				                  <p class="mt-3 mb-0 text-sm">
				                    <span class="text-white mr-2"><i class="ni ni-button-power icon-ver"></i>&nbsp;当前的IP: &nbsp;{$Block}</span>
				                  </p>
				                </div>
								</a>
				              </div>
				            </div>
				          </div>
				        </div>
                    </div>
                </section>
                <!-- account setting page end -->
            </div>
            
			<div class="row">
				<div class="col">
					<div class="card">
	                  <div class="card-header">
	                    <h4>最近五分钟使用IP</h4>
	                  </div>
	                  <div class="card-body">
	                    <table class="table table-striped">
	                      <thead>
	                        <tr>
	                          <th scope="col">IP</th>
	                          <th scope="col">归属地</th>
	                        </tr>
	                      </thead>
	                      <tbody>
			                {if empty($userip)}
			                   <tr class="shadow-sm"> 
			                    <td colspan="2"><strong>最近5分钟未使用服务</strong></td> 
			                   </tr> 
			                {else}
			                  {foreach $userip as $single=>$location}
			                   <tr class="shadow-sm"> 
			                        <td>{$single}</td>
                                    <td>{$location}</td>
			                   </tr>
			                   {/foreach}
			                {/if}
	                      </tbody>
	                    </table>
	                  </div>
	                </div><!--card-->
				  
				<div class="card">
	                  <div class="card-header">
	                    <h4>登录记录</h4>
	                  </div>
	                  <div class="card-body">
	                    <table class="table table-striped">
	                      <thead>
	                        <tr>
	                          <th scope="col">IP</th>
	                          <th scope="col">归属地</th>
	                          <th scope="col">登录时间</th>
	                        </tr>
	                      </thead>
	                      <tbody>
			                {if empty($userloginip)}
			                   <tr class="shadow-sm"> 
			                    <td colspan="3"><strong>无登录记录</strong></td> 
			                   </tr> 
			                {else}
			                   {foreach $userloginip as $single=>$location}
			                     <tr class="shadow-sm"> 
			                      <td>{$single}</td> 
			                      <td>{$location['location']}</td>
			                      <td>{$location['logintime']}</td> 
			                     </tr> 
			                   {/foreach}
			                {/if}
	                      </tbody>
	                    </table>
	                  </div>
	            </div><!--card-->
				  
				</div>
		      </div><!--row-->
        </div>
    </div>
    
    <!-- pass Modal -->
		<div class="modal fade" id="pwd-up" tabindex="-1" role="dialog" aria-labelledby="pwd-upModalLabel" aria-hidden="true">
		  <div class="modal-dialog modal-dialog-centered" role="document">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h4 id="pwd-upModalLabel">修改密码</h4>
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		          <span aria-hidden="true">&times;</span>
		        </button>
		      </div>
		      <form class="form-horizontal" id="user_profile_password_update"> 
			      <div class="modal-body">
					<!-- Card body -->
					<div class="form-group">
						<label>当前密码:</label>
						<input id="oldpwd" class="form-control" type="password" placeholder="Old passwd">
					</div>
					<div class="form-group">
						<label>新密码:</label>
						<input id="pwd" class="form-control" type="password" placeholder="New passwd">
					</div>
					<div class="form-group">
						<label>重复新密码</label>
						<input id="repwd" class="form-control" type="password" placeholder="RE New passwd">
					</div>
					 
			      </div>
				  <div class="modal-footer">
	                    <button id="pwd-update" type="button" class="btn btn-primary">确认提交</button>
	               </div>
			    </div>
			 </form> 
		  </div>
		</div>
		
		
		<!-- telegram  Modal -->
		<div class="modal fade" id="telegram" tabindex="-1" role="dialog" aria-labelledby="telegramModalLabel" aria-hidden="true">
		  <div class="modal-dialog modal-dialog-centered" role="document">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h4 id="telegramModalLabel">Telegram</h4>
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		          <span aria-hidden="true">&times;</span>
		        </button>
		      </div>
				<div class="modal-body">

			{if $config['enable_telegram'] == 'true'}
				{if $user->telegram_id == null}
					<div class="modal-body">
						<span><h4 class="card-title"><span>1</span>&nbsp;&nbsp;使用快捷命令绑定</h4></span>
						<span>- 在 Telegram 添加机器人账号 <a href="https://t.me/{$telegram_bot}" target="_blank">@{$telegram_bot}</a></span>
						<br /><br /> 
						<span>- 发送命令 <code class="cursor_onclick copy-modal" data-clipboard-text="/start {$bind_token}">/start {$bind_token}</code> 给机器人</span>
						<br /><br /> 
						<span><h4 class="card-title"><span>2</span>&nbsp;&nbsp;当前设备一键绑定</h4></span>
					    <div class="col-12 kt-align-center"> 
					        <a href="https://t.me/{$telegram_bot}?start={$bind_token}" target="_blank" class="btn btn-info"><i class="fa fa-telegram"></i> 一键绑定 Telegram</a> 
					    </div> 	
					    <br />
						 <p><code>- 请注意: Telegram 需要翻墙才能使用</code></p>
					
					 	 <p>- 使用以上其中一种方式进行绑定 Telegram 账号</p>
						
						 <p>- 绑定成功后机器人将回复您当前绑定的账号。</p>
						
						 <p>- 在聊天输入框发送 <code>/start</code></p>
						
						 <p>- 开始使用 Telegram 功能</p>
					</div>
				{else}
					<div class="modal-body">
						<span><h4 class="card-title">Telegram 设置</h4></span>
						<span>- <code>请注意: 解绑账号后对应的TG账号将被群组封禁</code> </span>
						<br /><br />
						<div class="col-12 kt-align-center"> 
							<a href="/user/telegram_reset" class="btn btn-light">解绑TG账号</a>
						</div>	
						<br />
						<p>- TG群组仅限绑定网站账号的TG用户加入</p>
						<p>- 如果您因为解绑账号或未绑账号进群导致被封禁</p>
						<p>- 请重新绑定账号后，跟机器人申请解封方可加入群组</p>
						
						<span><h4 class="card-title">如何解除群组封禁</h4></span>          
						          
						<p>- 使用 Telegram 私聊机器人 <a href="https://t.me/{$telegram_bot}" target="_blank">@{$telegram_bot}</a></p>
						
						<p>- 向机器人发送 <code>/start</code> 命令</p>
						
						<p>- 在信息中点击 <code>资料编辑</code> -> <code>群组解封</code> -> <code>点击提交解封</code></p>
				
						<p>- 然后重新发送 <code>/my</code> 命令 -> <code>加入用户群</code></span> </p>
	
					</div>
				{/if}
			{else}
					<div class="modal-body">
					  <div class="card-body">
						<p class="description">当前本站未开启 Telegram 功能.</p>
					  </div>
					</div>
			{/if}
				</div>
				<div class="modal-footer">
	                 <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
	            </div>
		    </div>
		  </div>
		</div>
		
		<!-- ssrlink Modal -->
		<div class="modal fade" id="sublink-modal" tabindex="-1" role="dialog" aria-labelledby="wechat-upModalLabel" aria-hidden="true">
		  <div class="modal-dialog modal-dialog-centered" role="document">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h4 id="sublink-upModalLabel">重置订阅</h4>
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		          <span aria-hidden="true">&times;</span>
		        </button>
		      </div>
		      <div class="modal-body">
				<!-- Card body -->
				<div class="card-body">
					<p class="kt-callout__desc">重置节点订阅链接后，原订阅链接将失效，并生成新的订阅链接</p> 
				</div>	 
		      </div>
			  <div class="modal-footer">
                    <button id="sublink-reset" type="button" class="btn btn-primary">立即重置</button>
               </div>
		    </div>
		  </div>
		</div>
		
	{if $user->ga_enable == 1}
		<!-- 两部验证 -->
		<div class="modal fade" id="step2-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true"> 
			<div class="modal-dialog modal-dialog-centered" role="document"> 
				<div class="modal-content"> 
				 <div class="modal-header"> 
				  <h5 class="modal-title"><strong>关闭二步验证</strong></h5>  
				 </div> 
				 <div class="modal-body"> 
				  <code>关闭二步验证后，登录账号将不再验证动态码，您的账号安全性将下降。</code>
				  <br /><br />
				  <div class="form-group">
				   <label>登录密码</label> 
				   <div class="input-group"> 
				    <input class="form-control" type="password" id="ga-passwd" name="ga_passwd" /> 
				    <div class="input-group-append cursor_onclick ga_passwd-password"> 
				     <span class="input-group-text"><i class="fa fa-eye-slash" id="ga_passwd-none"></i><i class="fa fa-eye" id="ga_passwd-show" style="display: none"></i></span> 
				    </div> 
				   </div> 
				  </div> 
				 </div> 
				 <div class="modal-footer"> 
				  <button type="button" class="btn btn-primary" id="ga-enable-false">确定关闭</button> 
				  <button type="button" class="btn btn-secondary" data-dismiss="modal">关闭</button> 
				 </div> 
				</div> 
			</div> 
		</div> 
   {else}
		<!-- step2 Modal -->
		<div class="modal fade" id="step2-modal" tabindex="-1" role="dialog" aria-labelledby="step2-upModalLabel" aria-hidden="true">
		  <div class="modal-dialog modal-dialog-centered" role="document">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h4 id="step2-upModalLabel">二步验证</h4>
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		          <span aria-hidden="true">&times;</span>
		        </button>
		      </div>
				<div class="modal-body">
					<p><code>请使用二步验证APP扫描二维码，推荐使用 Google Authenticator</code></p>
					<div id="ga-qr" style="text-align: center"></div>
				</div>
				<div class="modal-footer"> 
					<button type="button" class="btn btn-primary" data-dismiss="modal" data-toggle="modal" href="#step2-2-modal">下一步</button> 
					<button type="button" class="btn btn-secondary" data-dismiss="modal">关闭</button> 
				</div> 
		    </div>
		  </div>
		</div>
		<div class="modal fade" id="step2-2-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true"> 
			<div class="modal-dialog modal-dialog-centered" role="document"> 
				<div class="modal-content"> 
					 <div class="modal-header"> 
						<h5 class="modal-title"><strong>验证动态码</strong></h5> 
					 </div>
					 <div class="modal-body"> 
						<div class="form-group"> 
							<label>确认动态码：</label>
							<input class="form-control" type="number" id="ga-code" name="ga-code" /> 
						</div> 
					 </div> 
					 <div class="modal-footer"> 
						<button type="button" class="btn btn-primary" id="ga-enable-true">确定开启</button> 
						<button type="button" class="btn btn-secondary" data-dismiss="modal">关闭</button> 
					 </div> 
				</div> 
			</div> 
		</div>
    {/if}
			
	     <!-- 每日邮件 --> 
	      <div class="modal fade" id="dailymail-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true"> 
	       <div class="modal-dialog modal-dialog-centered" role="document"> 
	        <div class="modal-content"> 
	         <div class="modal-header"> 
	          <h5 class="modal-title"><strong>每日邮件设置</strong></h5> 
	         </div> 
	         <div class="modal-body" id="dailymail-modal-body"> 
	          <div id="dailymail-modal-body-content"> 
	           <p>开启后您将在每日0点接收到您账户当前流量使用情况和公告信息，并且您可在最新接收到的邮件下方链接进入最新的官网链接</p> 
	           <p>当前状态：<code>{if $user->sendDailyMail==1}发送{else}不发送{/if}</code></p>
	           <p> </p>
	           <div class="form-group"> 
	            <label>修改状态</label> 
	            <select class="form-control" id="dailymail">
	              {if $user->sendDailyMail!=1}
	                <option value="1">我需要接收每日邮件</option>
	              {else}
	                <option value="0">我不需要接收每日邮件</option>
	              {/if}
	     		</select> 
	           </div> 
	          </div> 
	         </div> 
	         <div class="modal-footer"> 
	          <button type="button" class="btn btn-primary" id="user_profile_dailymail">保存更改</button> 
	          <button type="button" class="btn btn-secondary" data-dismiss="modal">关闭</button> 
	         </div> 
	        </div> 
	       </div> 
	      </div>
		
		<!-- unblock IP Modal -->
		<div class="modal fade" id="unblock-ip" tabindex="-1" role="dialog" aria-labelledby="unblock-ipModalLabel" aria-hidden="true">
		  <div class="modal-dialog modal-dialog-centered" role="document">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h4 id="unblock-ipModalLabel">解封IP</h4>
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		          <span aria-hidden="true">&times;</span>
		        </button>
		      </div>
		      <div class="modal-body">
				<p class="description">当前状态&nbsp;:&nbsp;<span id="ajax-block">{$Block}</span></p> 
		      </div>
			  <div class="modal-footer">
                    <button id="unblock" type="button" class="btn btn-primary">提交解封</button>
               </div>
		    </div>
		  </div>
		</div>
	  <!-- Modal -->
	  
	  <!-- 删除账号 --> 
      <div class="modal fade" id="delete-account-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true"> 
       <div class="modal-dialog modal-dialog-centered" role="document"> 
        <div class="modal-content"> 
         <div class="modal-header"> 
          <h5 class="modal-title"><strong>删除账号</strong></h5> 
         </div> 
         <form class="kt-form" id="user_profile_delete_account"> 
          <div class="modal-body"> 
           <p class="text-danger">注意：您的所有数据都会被永久删除，并且无法找回。</p> 
           <p class="text-danger">请谨慎操作！请谨慎操作！请谨慎操作！</p> 
           <div class="form-group"> 
            <label>账号密码确认</label> 
            <div class="input-group"> 
             <input class="form-control" type="password" id="delete_passwd" name="delete_passwd" /> 
             <div class="input-group-append cursor_onclick delete_passwd-password"> 
              <span class="input-group-text"><i class="fa fa-eye-slash" id="delete_passwd-none"></i><i class="fa fa-eye" id="delete_passwd-show" style="display: none"></i></span> 
             </div> 
            </div> 
           </div> 
          </div> 
          <div class="modal-footer"> 
           <button type="button" class="btn btn-danger" id="kill">确定删除</button> 
           <button type="button" class="btn btn-secondary" data-dismiss="modal">关闭</button> 
          </div> 
         </form> 
        </div> 
       </div> 
      </div> 
    <!-- END: Content-->

    <!-- BEGIN: Footer-->
		{include file='user/footer.tpl'}
    <!-- END: Footer-->
	
	{if $user->ga_enable != 1}
		<script type="text/javascript" src="/theme/cool/assets/js/scripts/jquery.qrcode.min.js"></script>
		<script>
	        var ga_qr_text = '{$user->getGAurl()}';
		    // 二步验证 二维码
		    jQuery('#ga-qr').qrcode({
		        "text": ga_qr_text
		    });
	    </script> 
    {/if}
</body>
<!-- END: Body-->
</html>