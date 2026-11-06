<!DOCTYPE html>
  <html lang="zh-CN">
   <head> 
    <title>审计记录 — {$config["appName"]}</title> 

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
                            <h2 class="content-header-title float-left mb-0">审计记录</h2>
                            <div class="breadcrumb-wrapper col-12">
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item"><a href="/user">Home</a>
                                    </li>
                                    <li class="breadcrumb-item"><a href="/user/detect/log">Audit record</a>
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
						             <h2>说明</h2>
						            <p>系统中所有审计记录。</p> 
									<p>关于隐私：注意，我们仅用以下规则进行实时匹配和记录匹配到的规则，您的通信方向和通信内容我们不会做任何记录，请您放心。也请您理解我们对于这些不当行为的管理，谢谢</p>     
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
					      <h4 class="card-title">记录</h4> 
					     </div> 
					     <div class="card-content"> 
					      <div class="card-body"> 
					       <div class="table-responsive"> 
					        <table class="table table-hover-animation mb-0"> 
					         <thead> 
		                        <tr>
		                          <th>审计编号</th>
		                          <th>线路ID</th>
		                          <th>线路名称</th>
		                          <th>审计ID</th>
		                          <th>审计名称</th>
		                          <th>审计描述</th>
		                          <th>正则表达式</th>
		                          <th>类型</th>
		                          <th>触发时间</th>
		                        </tr>
					         </thead> 
				              <tbody> 
		                          {if count($logs) == 0}
		                          <tr>
		                            <td colspan="9"><strong>暂无审计记录</strong></td>
		                          </tr>
		                          {else}
			                        {foreach $logs as $log}
				                        {if $log->DetectRule() != null}
				                        <tr>
				                          <td>#{$log->id}</td>
				                          <td>{$log->node_id}</td>
				                          <td>{$log->Node()->name}</td>
				                          <td>{$log->list_id}</td>
				                          <td>{$log->DetectRule()->name}</td>
				                          <td>{$log->DetectRule()->text}</td>
				                          <td>{$log->DetectRule()->regex}</td>
				                          {if $log->DetectRule()->type == 1}
				                          <td>数据包明文匹配</td>
				                          {/if}
				                          {if $log->DetectRule()->type == 2}
				                          <td>数据包 hex 匹配</td>
				                          {/if}
				                          <td>{date('Y-m-d H:i:s',$log->datetime)}</td>
				                        </tr>
				                        {/if}
			                        {/foreach}
		                          {/if}
				              </tbody>  
					        </table> 
					       </div> 
		                    {if $rules != null}
		                    <div class="pagination-render float-right">
		                      {$rules->render()}
		                    </div>
		                    {/if}
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
<!-- END: Body-->

</html>