<!DOCTYPE html>
  <html lang="zh-CN">
   <head> 
    <title>中转规则 — {$config["appName"]}</title> 

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
                            <h2 class="content-header-title float-left mb-0">中转规则</h2>
                            <div class="breadcrumb-wrapper col-12">
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item"><a href="/user">Home</a>
                                    </li>
                                    <li class="breadcrumb-item"><a href="/user/relay">My Relay</a>
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
        						    <p>中转规则一般由中国中转至其他国外节点</p>
                                    <p>请设置端口号为您自己的端口</p>
                                    <p>优先级越大，代表其在多个符合条件的规则并存时会被优先采用，当优先级一致时，先添加的规则会被采用。</p>
                                    <p>节点不设置中转时，这个节点就可以当作一个普通的节点来做代理使用。
						             <a class="btn btn-primary btn-icon icon-left" style="float: right;color:white" href="/user/relay/create"><i class="fas fa-plus"></i> 新建规则</a></p>
						           </div> 
                                </div>
                            </div>
                        </div> 
			         </div> 
			        </div> 
				 <section> 
				   <div class="row"> 
				    <div class="col-12"> 
				     <div class="card"> 
				      <div class="card-header"> 
				       <ul class="nav nav-pills"> 
				        <li class="nav-item mr-1 mr-md-0"> <a href="#nav-tab-1" class="nav-link d-flex py-75 active" data-toggle="tab"> <span>规则表</span> </a> </li> 
				        <li class="nav-item mr-1 mr-md-0"> <a href="#nav-tab-2" class="nav-link d-flex py-75" data-toggle="tab"> <span>链路表</span> </a> </li> 
				       </ul> 
				      </div> 
				      <div class="card-body"> 
				       <div class="tab-content"> 
				        <div class="tab-pane active" id="nav-tab-1"> 
				         <div class="table-responsive"> 
				         
				         {$rules->render()}
				          <table class="table table-striped table-md"> 
				           <tbody>
                            <tr>
                                <!--	<th>ID</th>   -->
                                <th>起源节点</th>
                                <th>目标节点</th>
                                <th>端口</th>
                                <th>优先级</th>
                                <th>操作</th>
                            </tr>
                            {foreach $rules as $rule}
                                <tr>
                                    <!--<td>#{$rule->id}</td>-->
                                    {if $rule->source_node_id == 0}
                                        <td>所有节点</td>
                                    {else}
                                        <td>{$rule->Source_Node()->name}</td>
                                    {/if}

                                    {if $rule->Dist_Node() == null}
                                        <td>不进行中转</td>
                                    {else}
                                        <td>{$rule->Dist_Node()->name}</td>
                                    {/if}

                                    <td>{if $rule->port == 0}所有端口{else}{$rule->port}{/if}</td>
                                    <td>{$rule->priority}</td>
                                    <td>
                                        <a class="btn btn-brand"
                                           {if $rule->user_id == 0}disabled{else}href="/user/relay/{$rule->id}/edit"{/if}>编辑</a>
                                        <a class="btn btn-brand-accent" id="delete" value="{$rule->id}"
                                           {if $rule->user_id == 0}disabled{else}href="javascript:void(0);"
                                           onClick="delete_modal_show('{$rule->id}')"{/if}>删除</a>
                                    </td>
                                </tr>
                            {/foreach}
				           </tbody>
				          </table> 
				         </div> 
				         <div class="pagination-render float-right">
				           {$rules->render()}
				         </div> 
				        </div> 
				        
				        <div class="tab-pane" id="nav-tab-2"> 
				         <div class="table-responsive"> 
				          <table class="table table-striped table-md"> 
				           <tbody>
                                <tr>
                                    <th>端口</th>
                                    <th>始发节点</th>
                                    <th>终点节点</th>
                                    <th>途径节点</th>
                                    <th>状态</th>
                                </tr>

                                {foreach $pathset as $path}
                                    <tr>
                                        <td>{$path->port}</td>
                                        <td>{$path->begin_node->name}</td>
                                        <td>{$path->end_node->name}</td>
                                        <td>{$path->path}</td>
                                        <td>{$path->status}</td>
                                    </tr>
                                {/foreach}
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
				   </div>
                </section>

    <!-- END: Content-->

    <!-- BEGIN: Footer-->
		{include file='user/footer.tpl'}
    <!-- END: Footer-->
	
</body>
<!-- END: Body-->

</html>