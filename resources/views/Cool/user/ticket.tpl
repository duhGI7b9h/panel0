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
						             该页面记录您所有工单记录<br />
						             <a class="btn btn-primary btn-icon icon-left" style="float: right;color:white" data-toggle="modal" data-target="#ticket-create-modal"><i class="fas fa-plus"></i> 创建工单</a>
						            <br />请认真详细描述您的问题，客服在收到您的工单后24小时内回复。      
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
					      <h4 class="card-title"><i class="fas fa-ticket-alt"></i> 工单列表</h4> 
					     </div> 
					     <div class="card-content"> 
					      <div class="card-body"> 
					       <div class="table-responsive"> 
					        <table class="table table-hover-animation mb-0"> 
					         <thead> 
				               <tr> 
				                <th><strong>工单ID</strong></th> 
				                <th><strong>发起时间</strong></th> 
				                <th><strong>工单标题</strong></th> 
				                <th><strong>工单状态</strong></th> 
				                <th><strong>操作</strong></th> 
				               </tr> 
					         </thead> 
				              <tbody> 
				               {if count($tickets) == 0}
				                 <tr class="shadow-sm"> 
				                  <td colspan="5"><strong>无工单记录</strong></td> 
				                 </tr>
				               {else}
				                {foreach $tickets as $ticket}
				                 <tr class="shadow-sm"> 
				                   <td>{$ticket->id}</td>
				                   <td>{$ticket->datetime()}</td> 
				                   <td>{$ticket->title}</td> 
				                   <td><strong>{if $ticket->status==1}<span class="btn btn-bold btn-sm btn-font-sm btn-label-danger">处理中</span>{else}<span class="btn btn-bold btn-sm btn-font-sm  btn-label-success">已完成</span>{/if}</strong></td> 
				                   <td>
				                     {if $ticket->status==1}
				                         <a class="btn btn-primary btn-sm" href="/user/ticket/{$ticket->id}/view">查看</a>
				                         <button type="button" class="btn btn-danger btn-sm" id="ticket-off-377" onclick="ticket_off({$ticket->id},0)">关闭工单</button>
				                     {else}
				                         <a class="btn btn-primary btn-sm" href="/user/ticket/{$ticket->id}/view">查看</a>
				                     {/if}
				                   </td> 
				                 </tr>
				                {/foreach}
				               {/if}
				              </tbody>  
					        </table> 
					       </div> 
					      </div> 
					     </div> 
					    </div> 
					   </div>
					  </div>   
					</div>
				   </div>
				  </div> 
					<!-- modal --> 
				      <div class="modal fade" id="ticket-create-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true"> 
				       <div class="modal-dialog modal-lg modal-dialog-centered" role="document"> 
				        <div class="modal-content"> 
				         <div class="modal-header"> 
				          <h5 class="modal-title"><strong>创建新工单</strong></h5> 
				         </div> 
				         <form id="ticket-create-text-form"> 
				          <div class="modal-body"> 
				           <div class="form-group"> 
				            <label for="recipient-name" class="form-control-label">标题</label> 
				            <input type="text" class="form-control" id="ticket-create-title-text" name="ticket_create_title_text" /> 
				           </div> 
				           <div class="form-group"> 
				            <label for="message-text" class="form-control-label">内容</label> 
				            <textarea class="form-control" style="height: 200px;" id="ticket-create-content-text" name="ticket_create_content_text"></textarea> 
				           </div> 
				          </div> 
				          <div class="modal-footer"> 
				           <button type="button" class="btn btn-primary" id="ticket-create-click">确定</button> 
				           <button type="button" class="btn btn-secondary" data-dismiss="modal">取消</button> 
				          </div> 
				         </form> 
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