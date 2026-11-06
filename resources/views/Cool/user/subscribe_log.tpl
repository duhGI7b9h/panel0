<!DOCTYPE html>
  <html lang="zh-CN">
   <head> 
    <title>订阅记录 — {$config["appName"]}</title> 

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
                            <h2 class="content-header-title float-left mb-0">订阅记录</h2>
                            <div class="breadcrumb-wrapper col-12">
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item"><a href="/user">Home</a>
                                    </li>
                                    <li class="breadcrumb-item"><a href="/user/subscribe_log">Subscription history</a>
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
						            您可在此查询您账户所有的订阅记录，确保您的账户没有被盗用。      
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
					      <h4 class="card-title"><i class="fa fa-desktop"></i> 订阅列表</h4> 
					     </div> 
					     <div class="card-content"> 
					      <div class="card-body"> 
					       <div class="table-responsive"> 
					        <table class="table table-hover-animation mb-0"> 
					         <thead> 
				               <tr> 
	                            <th>ID</th>
	                            <th>订阅类型</th>
	                            <th>IP</th>
	                            <th>归属地</th>
	                            <th>时间</th>
	                            <th>User-Agent</th>
				               </tr> 
					         </thead> 
				              <tbody> 
		                          {if count($logs) == 0}
		                          <tr>
		                            <td colspan="6"><strong>暂无订阅记录</strong></td>
		                          </tr>
		                          {else}
		                          {foreach $logs as $log}
		                          <tr>
		                            <td>#{$log->id}</td>
		                            <td>{$log->subscribe_type}</td>
		                            <td>{$log->request_ip}</td>
		                            {assign var="location" value=$iplocation->getlocation($log->request_ip)}
		                            <td>{iconv("gbk", "utf-8//IGNORE", $location.country)} {iconv("gbk", "utf-8//IGNORE", $location.area)}</td>
		                            <td>{$log->request_time}</td>
		                            <td>{$log->request_user_agent}</td>
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
    <!-- END: Content-->

    <!-- BEGIN: Footer-->
		{include file='user/footer.tpl'}
    <!-- END: Footer-->
	
</body>
<!-- END: Body-->

</html>