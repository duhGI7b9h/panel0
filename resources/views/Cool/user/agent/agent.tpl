<!DOCTYPE html>
  <html lang="zh-CN">
   <head> 
    <title>代理中心 — {$config["appName"]}</title> 

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
                            <h2 class="content-header-title float-left mb-0">代理中心</h2>
                            <div class="breadcrumb-wrapper col-12">
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item"><a href="/user">Home</a>
                                    </li>
                                    <li class="breadcrumb-item"><a href="/user/agent">Agency Center</a>
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
						                <h3>说明</h3>
						                <p>代理商用户于此购买和开通节点订阅</p> 
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
					      <h4 class="card-title">客户记录</h4> 
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
					    <div class="card">
							<div class="card-header"> 
							    <h4 class="card-title">添加用户(邮箱=密码)</h4> 
							</div> 
							<div class="card-body">
								<div class="form-group">
									<label>用户昵称：</label>
									<input id="userName" class="form-control" type="text" placeholder="请填写用户昵称...">
								</div>
								<div class="form-group">
									<label>填写邮箱：</label>
									<input id="email" class="form-control" type="text" placeholder="请输入用户邮箱...">
								</div>
								<label>选择套餐：</label>
								<fieldset>
								<select id="sptype" class="form-control">
									<option value="0"><a href="javascript:void(0)" onclick="return false;">选择您要开通的套餐</a></option>
									{foreach $shop_name as $key => $value}
										<option value="{$value["id"]}">{$value["name"]}--{$value["price"]}</option>
									{/foreach}
								</select>
								</fieldset>
								<div class="custom-control custom-checkbox mt-3">
									<input id="issend" type="checkbox" class="custom-control-input icon-ver">
									<label class="custom-control-label" for="issend">是否发送注册成功邮件,提交后勿关闭页面,等待刷新</label>
								</div>
							</div>
							<div class="modal-footer">
								<button id="adds_input" type="button" class="btn btn-primary">确认提交</button>
							</div>
						</div>
					   </div>
					  </div>   
					</div>
				   </div>
				  </div> 
        <!-- END: Content-->
				<!--pay modal-->
				    <div class="modal fade" id="user_modal" tabindex="-1" role="dialog" aria-labelledby="userModalLabel" aria-hidden="true">
					  <div class="modal-dialog modal-dialog-centered" role="document">
					    <div class="modal-content">
					      <div class="modal-header">
					        <h4 id="userModalLabel">用户信息确认</h4>
					        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
					          <span aria-hidden="true">&times;</span>
					        </button>
					      </div>
					      <div class="modal-body">
							<!-- Card body -->
							<div class="card-body">
								<p id="userid" class="description">ID：</p>
								<p id="user_email" class="description">邮箱：</p>
								<select id="shop_id" class="form-control">
									<option value="0"><a href="javascript:void(0)" onclick="return false;">选择您要开通的套餐</a></option>
									{foreach $shop_name as $shop}
										<option value="{$shop->id}">{$shop->name}--{$shop->price}</option>
									{/foreach}
								</select>
							</div>	 
					      </div>
						  <div class="modal-footer">
			                    <button id="user_input" type="button" class="btn btn-primary">确认提交</button>
			               </div>
					    </div>
					  </div>
					</div>
				<!--delete modal-->
				   <div class="modal fade" id="delete_modal" tabindex="-1" role="dialog" aria-labelledby="deleteidModalLabel" aria-hidden="true">
					  <div class="modal-dialog modal-dialog-centered" role="document">
					    <div class="modal-content">
					      <div class="modal-header">
					        <h4 id="deleteidModalLabel" class="text-danger">删除信息确认</h4>
					        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
					          <span aria-hidden="true">&times;</span>
					        </button>
					      </div>
					      <div class="modal-body">
							<!-- Card body -->
							<div class="card-body">
								<p id="deleteid" class="description">ID：</p>
								<p id="delete_email" class="description">邮箱：</p>
					        </div>
					      </div>
						   <div class="modal-footer">
			                    <button id="delete_input" type="button" class="btn btn-danger">确认提交</button>
			               </div>
					   </div>
					 </div>
				   </div>
			    </div>
			  </div>
			  
			  
		    <!-- BEGIN: Footer-->
				{include file='user/footer.tpl'}
		    <!-- END: Footer-->

            <script src="https://cdn.jsdelivr.net/npm/datatables.net@1.10.19"></script>  
            <script src="/theme/cool/assets/js/dataTables.material.min.js"></script>
			<script>
                {include file='table/js_1.tpl'}
                    window.addEventListener('load', () => {
                        table_1 = $('#table_1').DataTable({
                           order: [[1, 'desc']],
                           stateSave: true,
                           serverSide: true,
                           ajax: {
                               url: "/user/agent/ajax",
                               type: "POST",
                           },
                           columns: [
                               {literal}
                               {"data": "id"},
                               {"data": "email"},
                               {"data": "money"},
                               {"data": "transfer_enable"},
                               {"data": "class"},
                               {"data": "class_expire"},
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
                        })
                        {include file='table/js_3.tpl'}
                    });
    	    </script>
		
            <script>
				function del(delete_id,delete_email) {
					$("#deleteid").html("用户ID: "+delete_id);
					$("#delete_email").html("邮箱: "+delete_email);
					deleteid = delete_id;
			        $("#delete_modal").modal();
				}
			
				function buy(id,user_email) {
					$("#userid").html("用户ID: " + id);
					$("#user_email").html("邮箱: " + user_email);
					userid = id;
					$("#user_modal").modal();
				}
			
			    $("#user_input").click(function () {
					$.ajax({
						type: "POST",
						url: "agentbuy",
						dataType: "json",
						data: {
							shopid: $("#shop_id").val(),
							userid: userid
						},
						success: function (data) {
							if (data.ret) {
								swal.fire({
			                       title: data.msg,
			                       text: "赶快刷新下本页的客户记录查看吧~!", 
			                       type:"success"
			                       });
			                  window.setTimeout("location.href=window.location.href", 1000);
							} else {
								swal.fire('Oops...',data.msg,'error');
							}
						},
						error: function (jqXHR) {
							swal.fire('Oops...',jqXHR.status,'error');
						}
					});
				});
			 
			    $("#delete_input").click(function () {
					$.ajax({
						type: "DELETE",
						url: "/user/agentdelete",
						dataType: "json",
						data: {
							deleteid: deleteid
						},
						success: function (data) {
							if (data.ret) {
			                  $("#delete_modal").modal('hide');
								swal.fire({
			                       title: "删除结果",
			                       text: data.msg, 
			                       type:"success"
			                    });
			                    window.setTimeout("location.href=window.location.href", 1000);
							} else {
			                    $("#delete_modal").modal('hide');
								swal.fire('Oops...',data.msg,'error');
							}
						},
						error: function (jqXHR) {
							swal.fire('Oops...',jqXHR.status,'error');
						}
					});
				});
			</script>
			<!--删除用户-->
			
			<!--添加用户操作-->
			<script>
    			  //检查输入字符合法性逻辑
    			  function checkByteLength(str,minlen,maxlen) {
        			    if (str == null) return false;
        			    //为空返回false
        			    var l = str.length;
        			    var blen = 0;
        			    for(i=0; i<l; i++) {
        			      //循环取得检验值的长度
        			      if ((str.charCodeAt(i) & 0xff00) != 0) {
        			        blen ++;
        			      }
        			      blen ++;
        			    }
        			    if (blen > maxlen || blen < minlen) {
        			      //判断长度是否合法
        			      return false;
        			    }
        			    return true;
    			  }
    			
    			  //检查输入字符合法性逻辑
    			  function validateUsername(value){
    			    var patn = /^[a-zA-Z]+[a-zA-Z0-9]+$/; 
    			    if(!checkByteLength(value,4,16)) return false;
    			
    			    var pattern = /^[A-Za-z0-9\u4e00-\u9fa5]+$/gi;
    				if (pattern.test(value)) {
    			      return true; 
    			    }else{
    			      return false;
    			    }
    			  }
    			  
    			  function validateEmail(value){
    			    var pattern = /^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/;
    				if (pattern.test(value)) {
    			      return true; 
    			    }else{
    			      return false;
    			    }
    			  }   
			
			    //单个注册调用
			    $(document).ready(function() {
    			    var $$ = document;
    			    
    			    var $$getValue = (elementId) => $$.getElementById(elementId).value;
    			    
    			    function addUser() {
    			        var name = document.getElementById("userName").value;
    			        
    				  	var email = document.getElementById("email").value;
    				  	
    					var shopId = document.getElementById("sptype").value;
    					
    			        if ($$.getElementById('issend').checked) {
    						var issend=1;
    			        } else {
    						var issend=0;
    					}
    					
    					/*用户昵称检测*/
    					if(!validateUsername($("#userName").val())) {
    			  　　　　　swal.fire('Oops...', "用户名不合法,仅支持4~16位字母数字或中文",'error');
    			            return false;
    			        }
    			        
    					/*邮箱检测*/
    					if(!validateEmail($("#email").val())) {
    			  　　　　　swal.fire('Oops...', "邮箱不合法,请检查后输入",'error');
    			            return false;
    			        }
    			        
    					 /* 邮箱检测 */
    			         if($("#email").val()==null || $("#email").val()==''){
    			           swal.fire('Oops...', "邮箱不能为空！",'error');
    			           return;
    			         }
    			         
    			     	/*套餐检测*/
    					if (shopId == "" || shopId == 0){
    						swal.fire('Oops...', "请选择要开通的套餐！",'error');
    			            return;
    			        }
    			         $.ajax({
    			            type: "POST",
    			            url: "/user/addUser",
    			            dataType: "json",
    			            data: {
    			                "userName": name,
    			              	"email": email,
    							"shopId": shopId,
    			                 issend
    			            },
    			            success: function (data) {
    			             	var html='';
    			                if (data.ret == "0"){
    			                  	swal.fire('Oops...',data.msg,'error');
    			                }else {
    			                  swal.fire({
    			                        title: "添加用户成功",
    			                        type:"success"
    			                  });
    			                  window.setTimeout("location.href=window.location.href", 2000);
    			                }   
    			              
    			            },
    			            error: function (jqXHR) {
    			                swal.fire('Oops...',jqXHR.status,'error');
    			            }
    			        });
    			    }
    			
    			    $("#adds_input").click(function () {
    			        addUser();
    			    });
			    })
			</script>
</body>
</html>