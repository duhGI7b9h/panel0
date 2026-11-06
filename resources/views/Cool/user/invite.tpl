<!DOCTYPE html>
  <html lang="zh-CN">
   <head> 
    <title>邀请中心 — {$config["appName"]}</title>
    
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
                            <h2 class="content-header-title float-left mb-0">邀请注册</h2>
                            <div class="breadcrumb-wrapper col-12">
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item"><a href="/user">Home</a>
                                    </li>
                                    <li class="breadcrumb-item"><a href="/user/invite">Generalize</a>
                                    </li>
                                </ol>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="content-body">
                <div class="card card-hero">
                  <div class="card-header" style="border-radius: 3px;box-shadow: 0 2px 6px #ffc36f;border: none;background-image: linear-gradient(to bottom, #ffa425, #ffc36f) ">
                    <div class="card-icon">
                      <i class="fas fa-laugh-squint" style="color:#ffc36f"></i>
                    </div>
                    <div style="display:inline-block">
						<div class="card-description">累计获得返利金额</div>
						<h4 class="mt-2">¥ {sprintf("%.2f",$paybacks_sum)}</h4>
					</div>
					<h4 class="mt-2" style="display:inline-block">/</h4>
					<div style="display:inline-block" class="ml-1">
						<div class="card-description">可提现返利金额</div>
						<h4 class="mt-2">¥ {$user->back_money}</h4>
					</div>
                    <div class="mt-2">
                      <a class="btn btn-outline-white mr-1 mb-1 waves-effect waves-light" data-toggle="modal" data-target="#request-withdraw-modal">
                        <i class="fas fa-dollar-sign"></i> 创建提现申请
                      </a>
                    </div>
                  </div>
                </div>
                <div class="card">
					<div class="card-header">
						<h4>邀请链接</h4>
					</div>
					<div class="card-body">
						{if $config['code_payback'] > 0}
	                    <p>每次TA充值时，您都会获得TA的充值金额 <b>{$config["code_payback"]}%</b> 的返利</p>
	                    {/if}
	                    {if $config['invite_gift'] > 0}
	                    <p>您将一次性获得 <b>{$config['invite_gift']}GB</b> 流量奖励</p>
	                    {/if}
	                    {if $config['invite_get_money'] > 0}
	                    <p>TA将获得 <b>{$config["invite_get_money"]}</b> 元奖励作为初始资金</p>
	                    {/if}
						<p class="mr-4"><i class="bg-warning"></i>剩余可邀请次数: <code>{$user->invite_num}</code></p>
						<p class="mr-4"><i class="bg-warning"></i>发送邀请链接给有需要的人, 邀请他人注册时, 请将以下链接发给被邀请者:</p>
					<p class="form-group">
						<input type="text" class="form-control col-md-3" name="input1" value="{$config["baseUrl"]}/auth/register?code={$code->code}" readonly="" disabled="">
					</p>
					<p>
						<button type="button" class="copy-text btn btn-primary" data-clipboard-text="{$config["baseUrl"]}/auth/register?code={$code->code}"><i class="ni ni-ungroup ni-lg icon-ver"></i>&nbsp;点击复制</button>
					</p>
					</div>
				</div>
			  
                <div class="card">
                  <div class="card-header">
                    <h4>邀请链接设置</h4>
                  </div>
                  <div class="card-body">
                    <div class="buttons">
                      {if $config['invite_price']>=0}
                      <a href="##" class="btn btn-primary" data-toggle="modal" data-target="#buy-invite-modal">购买邀请次数</a>
                      {/if}
                      {if $config['custom_invite_price']>=0}
                      <a href="##" class="btn btn-primary"  data-toggle="modal" data-target="#custom-invite-modal">定制邀请链接</a>
                      {/if}
                      <button class="btn btn-danger" data-toggle="modal" data-target="#reset-invite-modal">重置邀请链接</button>
                    </div>
                  </div>
                </div>
                <section> 
				   <div class="row"> 
				    <div class="col-12"> 
				     <div class="card"> 
				      <div class="card-header"> 
				       <ul class="nav nav-pills"> 
				        <li class="nav-item mr-1 mr-md-0"> <a href="#nav-tab-1" class="nav-link d-flex py-75 active" data-toggle="tab"> <span>邀请记录</span> </a> </li> 
				        <li class="nav-item mr-1 mr-md-0"> <a href="#nav-tab-2" class="nav-link d-flex py-75" data-toggle="tab"> <span>返利记录</span> </a> </li> 
				       </ul> 
				      </div> 
				      <div class="card-body"> 
				       <div class="tab-content"> 
				        <div class="tab-pane active" id="nav-tab-1"> 
				         <div class="table-responsive"> 
				          <table class="table table-striped table-md"> 
				           <tbody>
				            <tr> 
				             <th scope="col">被邀请用户ID</th> 
				             <th scope="col">用户邮箱</th> 
				             <th scope="col">注册时间</th> 
				            </tr> {if count($invite_user) == 0} 
				            <tr> 
				             <td colspan="3"><strong>无邀请记录</strong></td> 
				            </tr> {else} {foreach $invite_user as $invite_users} 
				            <tr> 
				             <td>{$invite_users->id}</td> 
				             <td>{$invite_users->email}</td> 
				             <td>{$invite_users->reg_date}</td> 
				            </tr> {/foreach} {/if} 
				           </tbody>
				          </table> 
				         </div> 
				         <div class="pagination-render float-right">
				           {$invite_user->render()} 
				         </div> 
				        </div> 
				        <div class="tab-pane" id="nav-tab-2"> 
				         <div class="table-responsive"> 
				          <table class="table table-striped table-md"> 
				           <tbody>
				            <tr> 
				             <th scope="col">ID</th> 
				             <th scope="col">用户邮箱</th> 
				             <th scope="col">获得返利</th> 
				             <th scope="col">返利时间</th> 
				            </tr> {if count($paybacks) == 0} 
				            <tr> 
				             <td colspan="3"><strong>无返利记录</strong></td> 
				            </tr> {else} {foreach $paybacks as $payback} 
				            <tr> 
				             <td>{$payback->id}</td> 
				             <td>{$payback->user_email}</td> 
				             <td>{$payback->ref_get} 元</td> 
				             <td>{date('Y-m-d H:i:s', $payback->datetime)}</td> 
				            </tr> {/foreach} {/if} 
				           </tbody>
				          </table> 
				         </div> 
				         <div class="pagination-render float-right">
				           {$paybacks->render()} 
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
        	<!-- 工单提现 -->
			<div class="modal fade" tabindex="-1" role="dialog" id="request-withdraw-modal" style="display: none;" aria-hidden="true"> 
			   <div class="modal-dialog" role="document"> 
			    <div class="modal-content"> 
			     <div class="modal-header"> 
			      <h5 class="modal-title">创建提现申请</h5> 
			      <button type="button" class="close" data-dismiss="modal" aria-label="Close"> <span aria-hidden="true">&times;</span> </button> 
			     </div> 
			     <div class="modal-body"> 
			      <div class="form-group"> 
			       <p>由于安全原因，当前仅接受拥有有效套餐的用户的提现申请<br /><br />通过 &middot; <a href="/user/ticket">工单支持</a> &middot; 来进行提现<br /><br />工单内容请填写准确的收款支付宝账号+提现金额<br /><br />当您申请提现后,我们会在1天内处理您的提现申请并回复</p> 
			      </div> 
			     </div> 
			     <div class="modal-footer bg-whitesmoke br"> 
			      <button type="button" class="btn btn-secondary" data-dismiss="modal">取消</button> 
			     </div> 
			    </div> 
			   </div> 
			</div>
			
            <!-- 重置链接 -->
			<div class="modal fade" tabindex="-1" role="dialog" id="reset-invite-modal">
				<div class="modal-dialog modal-dialog-centered modal-dialog-centered modal-dialog-scrollable" role="document">
				  <div class="modal-content">
				    <div class="modal-header">
				      <h5 class="modal-title">重置邀请链接</h5>
				      <button type="button" class="close" data-dismiss="modal" aria-label="Close">
				        <span aria-hidden="true">&times;</span>
				      </button>
				    </div>
				    <div class="modal-body">
				      <p>确定要要重置邀请链接吗？点击确定后会重置并自动刷新本页。</p>
				    </div>
				    <div class="modal-footer bg-whitesmoke br">
				        <a type="button" class="btn btn-primary" style="color:white" id="reset-link">确定</a>
				        <button type="button" class="btn btn-secondary" data-dismiss="modal">取消</button>
				    </div>
				  </div>
				</div>
			</div>
			
			<!-- 购买链接 -->
			{if $config['invite_price']>=0}
				<div class="modal fade" tabindex="-1" role="dialog" id="buy-invite-modal">
				<div class="modal-dialog modal-dialog-centered modal-dialog-centered modal-dialog-scrollable" role="document">
				  <div class="modal-content">
				    <div class="modal-header">
				        <h5 class="modal-title">购买邀请次数</h5>
				        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
				          <span aria-hidden="true">&times;</span>
				        </button>
				      </div>
				      <div class="modal-body">
				        <div class="form-group">
				          <p>价格为 <code>{$config['invite_price']}</code> 元 / 次</p>
				          <label>请输入想要购买的次数</label>
				          <input id="buy-invite-num" type="number" class="form-control">
				        </div>
				      </div>
				      <div class="modal-footer bg-whitesmoke br">
				        <button type="button" class="btn btn-primary" onclick="buy_Invite()">确定</button>
				        <button type="button" class="btn btn-secondary" data-dismiss="modal">取消</button>
				      </div>
				    </div>
				  </div>
				</div>
			{/if}
			
			{if $config['custom_invite_price']>=0}
				<div class="modal fade" tabindex="-1" role="dialog" id="custom-invite-modal">
					<div class="modal-dialog modal-dialog-centered modal-dialog-centered modal-dialog-scrollable" role="document">
					  <div class="modal-content">
					    <div class="modal-header">
				        <h5 class="modal-title">定制邀请链接</h5>
				        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
				          <span aria-hidden="true">&times;</span>
				        </button>
				      </div>
				      <div class="modal-body">
				        <div class="form-group">
				          <p>价格为 <code>{$config['custom_invite_price']}</code> 元 / 次</p>
				          <label>输入链接后缀</label>
				          <input id="custom-invite-link" type="text" class="form-control">
				        </div>
				      </div>
				      <div class="modal-footer bg-whitesmoke br">
				        <button type="button" class="btn btn-primary" onclick="custom_invite_confirm()">确定</button>
				        <button type="button" class="btn btn-secondary" data-dismiss="modal">取消</button>
				      </div>
				    </div>
				  </div>
				</div>
			{/if}
    <!-- END: Content-->

    <!-- BEGIN: Footer-->
		{include file='user/footer.tpl'}
    <!-- END: Footer-->

</body>
<!-- END: Body-->

</html>