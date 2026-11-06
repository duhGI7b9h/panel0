<!DOCTYPE html>
  <html lang="zh-CN">
   <head> 
    <title>我的钱包 — {$config["appName"]}</title>
    
   {include file='user/header.tpl'} 
   <link rel="stylesheet" type="text/css" href="/theme/cool/assets/css/plugins/datatables.bootstrap4.min.css">
   
    <!-- BEGIN: Content-->
    <div class="app-content content">
        <div class="content-overlay"></div>
        <div class="header-navbar-shadow"></div>
        <div class="content-wrapper">
            <div class="content-header row">
                <div class="content-header-left col-md-9 col-12 mb-2">
                    <div class="row breadcrumbs-top">
                        <div class="col-12">
                            <h2 class="content-header-title float-left mb-0">我的钱包</h2>
                            <div class="breadcrumb-wrapper col-12">
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item"><a href="/user">Home</a>
                                    </li>
                                    <li class="breadcrumb-item"><a href="/user/code">My wallet</a>
                                    </li>
                                </ol>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="content-body">
                <div class="card card-hero">
                  <div class="card-header" style="border-radius: 3px;box-shadow: 0 2px 6px #d7d8dc;border: none;">
                    <div class="card-icon">
                      <i class="fa fa-jpy"></i>
                    </div>
                    <h4>¥ {$user->money}</h4>
                    <div class="card-description">账号可用余额</div>
                    <div class="mt-3">
                        <a href="#" id="top-up" class="btn btn-outline-white mr-1 mb-1 waves-effect waves-light">
                            <i class="feather icon-credit-card"></i> 在线充值
                        </a>
                    	<a href="#" class="btn btn-outline-white mr-1 mb-1 waves-effect waves-light" data-toggle="modal" data-target="#Recharge-code">
							<i class="fa fa-barcode"></i> 充值码充值
                    	</a>
                    </div>
                  </div>
                </div>
                <section>
                    <div class="row">
                        <div class="col-12">
                            <div class="card">
                                <div class="card-header">
                                    <h4>订单记录</h4>
                                </div>
                                <div class="card-content">
                                    <div class="card-body">
                        			 	<blockquote class="blockquote mb-0">
                        			 		<p class="description badge-dot mr-4"><i class="bg-warning"></i>显示表项: {include file='table/checkbox.tpl'}</p>
                        			 	</blockquote>
                                       <!-- Light table -->
                        		   	  <div class="table-responsive">
		   	                                {include file='table/table.tpl'}
                        		   	  </div>
                        			</div>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
                <section>
                    <div class="row">
                        <div class="col-12">
                            <div class="card">
                                <div class="card-header">
                                    <h4>购买记录</h4>
                                    {if $Cool_Config['refund'] == true}
                            		    <button type="button" id="shop_ref" class="btn btn-primary btn-sm waves-effect waves-light float-right"><i class="feather icon-feather"></i>&nbsp;&nbsp;套餐折算</button>
                            		{/if}
                                </div>
                                <div class="card-content">
                                    <div class="card-body">
                                        <div class="table-responsive">
                                            <table class="table add-rows">
                                                <thead>
								                  <tr>
								                    <th>ID</th>
								                    <th>商品名称</th>
								                    <th>价格</th>
								                    <th>购买时间</th>
								                    <th>续费时间</th>
								                    <th>续费时重置流量</th>
								                    <th>操作</th>
								                  </tr>
                                                </thead>
                                                <tbody>
													{if count($shops) == 0}
									                    <tr>
									                      <td colspan="7"><strong>无购买记录</strong></td>
									                    </tr>
									                {else}
													{foreach $shops as $shop}
									                  <tr>
									                    <td class="badge-dot mr-4"><i class="bg-warning"></i>{$shop->id}</td>
									                    {if $shop->shop()->id == 0}
									                    <td>{$shop->coupon}</td>
									                    {else}
									                    <td>{$shop->shop()->name}</td>
									                    {/if}
									                    <td>¥{$shop->price}</td>
									                    <td>{date('Y-m-d H:i:s', $shop->datetime)}</td>
									                    {if $shop->renew==0}
									                        <td>不自动续费</td>
									                    {else}
									                        <td>在 {$shop->renew_date()} 续费</td>
									                    {/if}
									
									                    {if $shop->shop()->auto_reset_bandwidth==0}
									                        <td>不自动重置</td>
									                    {else}
									                        <td>自动重置</td>
									                    {/if}
									                    
									                    <td>
									                        {if $shop->renew==0}
									                            无操作
									                        {else}
									                            <a href="javascript:void(0);" onClick="delete_modal_show('{$shop->id}')" class="btn btn-sm btn-primary">关闭自动续费</a>
									                        {/if}
									                    </td>
									                  </tr>
													{/foreach}
													{/if}
                                                </tbody>
                                            </table>
                                        <div class="pagination-render float-right">
					                      {$shops->render()}
					                    </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
            </div>
			<div id="topup-page" class="main-content" style="display: none">
		        <section class="section">
		        	<div class="section-body">
		            	<div class="row">
		            		<div class="col-12">
	                    		<div class="card">
	                        		<div class="card-header">
										<div class="section-header">
						            		<div class="section-header-back">
						            			<a id="back-to-main" href="##" class="btn btn-icon"><i class="fa fa-arrow-left"></i></a>
						            		</div>
							        	</div>
			                        </div>
			                        <div class="card-content">
										<div class="card-body">
											{if $pmw!==''} {$pmw} {/if} 
										</div>
			                        </div>
			                    </div>
			                  </div>
				            </div>
				        </div>
				    </div>    
		        </section>
		    </div>
		    
				<!-- 充值码 -->
				<div class="modal fade" tabindex="-1" role="dialog" id="Recharge-code">
					<div class="modal-dialog " role="document">
					  <div class="modal-content">
					    <div class="modal-header">
					      <h5 class="modal-title">使用充值码</h5>
					      <button type="button" class="close" data-dismiss="modal" aria-label="Close">
					        <span aria-hidden="true">&times;</span>
					      </button>
					    </div>
					    <div class="modal-body">
					      <div class="form-group">
					        <label>请输入充值码</label>
					        <input id="pay_code" type="text" class="form-control">
					      </div>
					    </div>
					    <div class="modal-footer bg-whitesmoke br">
					      <button type="button" class="btn btn-primary" onclick="codeTopup()">充值</button>
					      <button type="button" class="btn btn-secondary" data-dismiss="modal">取消</button>
					    </div>
					  </div>
					</div>
				</div>
				
				<!-- f2fpay -->
				{if $config['payment_system'] == 'f2fpay' || $config['payment_system'] == 'f2fpay_payjs'|| $config['payment_system'] == 'materialpay'}
					<div class="modal fade" tabindex="-1" role="dialog" id="f2fpay-modal">
						<div class="modal-dialog" role="document">
							<div class="modal-dialog" role="document">
							  <div class="modal-content">
							    <div class="modal-header">
							      <h5 class="modal-title">扫码支付</h5>
							      <button type="button" class="close" data-dismiss="modal" aria-label="Close">
							        <span aria-hidden="true">&times;</span>
							      </button>
							    </div>
							    <div class="modal-body">
							      <div id="qrarea" style="text-align: center"></div>
							    </div>
							    <div class="modal-footer bg-whitesmoke br">
							      <button type="button" class="btn btn-secondary" data-dismiss="modal">关闭</button>
							    </div>
							  </div>
							</div>
						</div>
					</div>
				{/if}
				
				<!-- Payjs -->
				{if $config['payment_system'] == 'payjs'}
					<div class="modal fade" tabindex="-1" role="dialog" id="wxpay-modal">
						<div class="modal-dialog" role="document">
							<div class="modal-dialog" role="document">
							  <div class="modal-content">
							    <div class="modal-header">
							      <h5 class="modal-title">打开微信，扫码支付</h5>
							      <button type="button" class="close" data-dismiss="modal" aria-label="Close">
							        <span aria-hidden="true">&times;</span>
							      </button>
							    </div>
							    <div class="modal-body">
							      <div id="qrarea" style="text-align: center"></div>
							    </div>
							    <div class="modal-footer bg-whitesmoke br">
							      <button type="button" class="btn btn-secondary" data-dismiss="modal">关闭</button>
							    </div>
							  </div>
							</div>
						</div>
					</div>
				{/if}
				
        		{if $config['payment_system'] == 'idtpay'}
				   <div class="modal fade" id="dialog-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true"> 
				    <div class="modal-dialog modal-sm modal-dialog-centered" role="document"> 
				     <div class="modal-content"> 
				      <div class="modal-header"> 
				       <h5 class="modal-title kt-font-boldest" id="dialog-title"></h5> 
				      </div> 
				      <div class="modal-body"> 
				       <p class="display-5" id="dialog-msg"></p> 
				      </div> 
				      <!--<div class="modal-footer">
				             <button type="button" class="btn btn-secondary" data-dismiss="modal" id="dialog-ok">知道了</button>
				      </div>--> 
				     </div> 
				    </div> 
				   </div> 
				  </div>
				{/if}
				
				{if $Cool_Config['refund'] == true}
    			  <div class="modal fade" id="shop_ref_modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true"> 
    			    <div class="modal-dialog modal-sm modal-dialog-centered" role="document"> 
    			     <div class="modal-content"> 
    			      <div class="modal-header"> 
    			       <h5 class="modal-title kt-font-boldest" id="shop_ref_title">折算确认</h5> 
    			      </div> 
                        <div class="modal-body">
            				<label class="row col-12 col-form-label kt-font-boldest" id="zs_name">商品名称：{$shop_status->name}</label>
            				<label class="row col-12 col-form-label kt-font-boldest" id="zs_type">商品等级：{$user->class}</label>
            				<label class="row col-12 col-form-label kt-font-boldest" id="zs_the">折算方式：使用时长</label>
            				<label class="row col-12 col-form-label kt-font-boldest" id="zs_ppt">剩余比例：{$percentage} %</label>
            				<label class="row col-12 col-form-label kt-font-boldest" id="zs_used">扣除时长：{$date_last} 天</label>
            				<label class="row col-12 col-form-label kt-font-boldest" id="zs_money">返还金额：{$get_money} 元</label>
            			</div>
    			      <div class="modal-footer">
    			             <button type="button" class="btn btn-primary" data-dismiss="modal" id="shop_ref_ok">确认折算</button>
    			             <button type="button" class="btn btn-secondary" data-dismiss="modal">关闭</button>
    			      </div>
    			     </div> 
    			    </div> 
    			   </div> 
    			  </div>
				{/if}
				
            	<!--delete modal-->
            	   <div class="modal fade" id="delete_modal" tabindex="-1" role="dialog" aria-labelledby="deleteidModalLabel" aria-hidden="true">
            		  <div class="modal-dialog modal-dialog-centered" role="document">
            		    <div class="modal-content">
                		  <div class="modal-header">
    					      <h5 class="modal-title">删除订单确认</h5>
    					      <button type="button" class="close" data-dismiss="modal" aria-label="Close">
    					        <span aria-hidden="true">×</span>
    					      </button>
    					  </div>
            		      <div class="modal-body">
            				<!-- Card body -->
            				<div class="card-body">
            					<p id="delete_id" class="description">订单ID：</p>
            					<p id="delete_total" class="description">应付价格：</p>
            		        </div>
            		      </div>
            			   <div class="modal-footer">
                                <button id="Confirm_delete" type="button" class="btn btn-primary">确认提交</button>
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

  	<script>
		$(document).ready(function() {
		    $("#top-up").click(function() {
		    	$(".content-body").toggle();
		        $(".main-content").toggle();
		    });
		    $("#back-to-main").click(function(e) {
		    	$(".content-body").toggle();
		        $(".main-content").toggle();
		    });
		});
	</script>
	
    <script src="//cdn.jsdelivr.net/npm/datatables.net@1.10.19"></script>  
    <script src="/theme/cool/assets/js/dataTables.material.min.js"></script>
    <script>
    function del(delete_id, delete_total) {
    	$("#delete_id").html("订单ID: "+delete_id);
    	$("#delete_total").html("应付价格: "+delete_total);
    	deleteid = delete_id;
        $("#delete_modal").modal();
    }
    
     {include file='table/js_1.tpl'}
        window.addEventListener('load', () => {
           table_1 = $('#table_1').DataTable({
               order: [[1, 'desc']],
               stateSave: true,
               serverSide: true,
               ajax: {
                   url: "/user/mycart/ajax",
                   type: "POST",
               },
               columns: [
                   {literal}
                   {"data": "id"},
                   {"data": "tradeno"},
                   {"data": "shopid"},
                   {"data": "total"},
                   {"data": "coupon"},
                   {"data": "datetime"},
    			   {"data": "status"},
    			   {"data": "op", "orderable": false}
    			   {/literal}
                ],
    			"columnDefs": [
                    {
                        targets: ['_all'],
                        className: 'mdl-data-table__cell--non-numeric'
                    }
                ],
                {include file='table/lang_chinese.tpl'}
            });
    	   {include file='table/js_3.tpl'}
            function delete_id() {
                $.ajax({
                    type: "DELETE",
                    url:"/user/order_delete",
                    dataType: "json",
                    data: {
                        deleteid: deleteid
                    },
                    success: data => {
                        if (data.ret) {
                            swal.fire({
                                type: 'success',
                                title: '删除成功',
                                showCloseButton: true,
                                text: data.msg
                            });
                            {include file='table/js_delete.tpl'}
    						window.setTimeout("location.href=window.location.href", 1500);
                        } else {
                            swal.fire({
                                type: 'error',
                                title: '删除失败',
                                showCloseButton: true,
                                text: data.msg
                            });
                        }
                    },
                    error: jqXHR => {
                        Swal.fire(jqXHR.status + "  发生了错误。");
                    }
                });
            }
    		$("#Confirm_delete").on("click", delete_id);
    		
       })
    </script>
</body>
<!-- END: Body-->
</html>