<!DOCTYPE html>
  <html lang="zh-CN">
   <head> 
    <title>工单系统 — {$config["appName"]}</title> 

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
                            <h2 class="content-header-title float-left mb-0">工单系统</h2>
                            <div class="breadcrumb-wrapper col-12">
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item"><a href="/user">Home</a>
                                    </li>
                                    <li class="breadcrumb-item"><a href="/user/ticket">My Tickets</a>
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
			         <div class="col-sm-12"> 
						<div class="card overflow-hidden">
                            <div class="card-content">
                                <div class="card-body">
						           <div class="alert-text">
						             请认真详细描述您的问题，客服在收到您的工单后24小时内回复。<br />
						             <a class="btn btn-primary btn-icon icon-left" style="float: right;color:white" data-toggle="modal" data-target="#ticket-Reply-modal"> 回复工单</a>
						            <br />您可以回复已关闭的工单重新进行开启。    
						           </div> 
                                </div>
                            </div>
                        </div> 
			         </div> 
			        </div> 
					  <div class="row"> 
					   <div class="col-12"> 
					    <div class="card"> 
					     <div class="card-header"> 
					      <h4 class="card-title"><strong> 工单详情</strong></h4> 
					     </div> 
					     <div class="card-content"> 
							<div class="card-body">
								{foreach $ticketset as $ticket}
                                    <div class="d-flex justify-content-start align-items-center mb-1">
                                        <div class="avatar mr-1">
                                            <img src="/theme/cool/assets/images/images.png" alt="avtar img holder" height="45" width="45">
                                        </div>
                                        <div class="user-page-info">
                                            <p class="mb-0">{$ticket->User()->user_name}</p>
                                            <span class="font-small-2">回复时间：{$ticket->datetime()}</span>
                                        </div>
                                        <div class="ml-auto user-like"><i class="feather icon-message-square"></i></div>
                                    </div>
                                    <p>{$ticket->content} </p>
                                    <hr />
                            	{/foreach}
                            </div> 
					     </div> 
					    </div> 
					   </div>
					  </div>   
					</div>
				   </div>
				  </div> 
			         <!-- modal -->
			         <div class="modal fade" id="ticket-Reply-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true"> 
			          <div class="modal-dialog modal-dialog-centered" role="document"> 
			           <div class="modal-content"> 
			            <div class="modal-header"> 
			             <h5 class="modal-title"><strong>回复工单</strong></h5> 
			            </div> 
			             <div class="modal-body"> 
			              <div class="form-group"> 
			               <label for="ticket-Reply-content-text" class="form-control-label">内容</label> 
			               <textarea class="form-control" style="height: 200px;" id="ticket-reply-content-text" name="ticket-reply-content-text"></textarea> 
			              </div> 
			             </div> 
			             <div class="modal-footer"> 
			              <button type="button" class="btn btn-primary" onclick="ticket_relay({$ticket->id})">确定</button> 
			              <button type="button" class="btn btn-secondary" data-dismiss="modal">取消</button> 
			             </div> 
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