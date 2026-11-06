<!DOCTYPE html>
<html lang="zh-CN">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no, user-scalable=no">
        <title>重置密码 &mdash; {$config["appName"]}</title>
        <!-- ico -->
        <link rel="shortcut icon" href="/favicon.ico" />
      
	    <link rel="stylesheet" type="text/css" href="/theme/cool/assets/css/cool.css">
	    <link rel="stylesheet" type="text/css" href="/theme/cool/assets/css/notify.css">
        <link rel="stylesheet" type="text/css" href="/theme/cool/assets/css/components.css">
    	<link rel="stylesheet" type="text/css" href="/theme/cool/assets/css/bootstrap.css">
	    <link rel="stylesheet" type="text/css" href="/theme/cool/assets/css/bootstrap-extended.css">
	    <link rel="stylesheet" type="text/css" href="/theme/cool/assets/css/theme/style-purple.css">
        <link rel="stylesheet" type="text/css" href="/theme/cool/assets/vendors/css/vendors.min.css">
	    <link rel="stylesheet" type="text/css" href="/theme/cool/assets/css/plugins/sweetalert2.min.css">
	    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free@5.8.2/css/all.min.css">
      
        {if $Cool_Config['enable_crisp'] == true && $Cool_Config['enable_crisp_outside'] == true}
        	{include file='crisp.tpl'}
        {/if}
      
        {if $Cool_Config['enable_chatra'] == true && $Cool_Config['enable_crisp_outside'] == true}
        	{include file='chatra.tpl'}
        {/if}
        
        <script>
            var isWeixin = function () {
            var ua = navigator.userAgent.toLowerCase();
            return ua.match(/MicroMessenger/i) == "micromessenger";
            };
            if (isWeixin() == true) {
                $('body').html('<h5 style="margin:20px">不支持在微信内访问<br>请点击右上角菜单<br>选择浏览器打开</h5>')
            }
        </script>
    </head>

	<!-- BEGIN: Body-->
	<body class="vertical-layout vertical-menu-modern 1-column  navbar-floating footer-static bg-full-screen-image blank-page blank-page">
	    <!-- BEGIN: Content-->
	    <div class="app-content content">
	        <div class="content-wrapper">
	            <div class="content-body">
	                <section class="row flexbox-container">
		                    <div class="col-xl-8 col-11 d-flex justify-content-center">
		                        <div class="card bg-authentication rounded-0 mb-0">
		                            <div class="row m-0">
		                                <div class="col-lg-6 d-lg-block d-none text-center align-self-center px-1 py-0">
		                                    <img src="/theme/cool/assets/images/pages/forgot-password.png" alt="branding logo">
		                                </div>
		                                <div class="col-lg-6 col-12 p-0">
		                                    <div class="card rounded-0 mb-0 px-2 py-1">
		                                        <div class="card-header pb-1">
		                                            <div class="card-title">
		                                                <h4 class="mb-0">重置密码</h4>
		                                            </div>
		                                        </div>
		                                        <p class="px-2 mb-0">请填写新密码</p>
		                                        <div class="card-content">
		                                            <div class="card-body">
		                                                <form class="form-group" action="javascript:void(0);"> 
		 		                                            <fieldset class="form-label-group position-relative has-icon-left">
		                                                        <div class="input-group login-form">
																	<input id="password" type="password" class="form-control" name="password" placeholder="填写新密码" required="" /> 
																</div>
		                                                        <div class="form-control-position">
		                                                            <i class="feather icon-lock"></i>
		                                                        </div>
		                                                        <label for="password">密码</label>
		                                                    </fieldset>
		 		                                            <fieldset class="form-label-group position-relative has-icon-left">
		                                                        <div class="input-group login-form">
																	<input id="repasswd" type="password" class="form-control" name="password" placeholder="重复新密码" required="" /> 
																</div>
		                                                        <div class="form-control-position">
		                                                            <i class="feather icon-lock"></i>
		                                                        </div>
		                                                        <label for="repasswd">重复密码</label>
		                                                    </fieldset>
			                                                <div class="float-md-left d-block mb-1">
			                                                    <a href="/auth/login" class="btn btn-outline-primary btn-block px-75 waves-effect waves-light">返回登录</a>
			                                                </div>
			                                                <div class="float-md-right d-block mb-1">
			                                                    <a href="javascript:void(0);" id="reset-button" class="btn btn-primary btn-block px-75 waves-effect waves-light">立即找回</a>
			                                                </div>
		                                                </form>
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
	    <!-- END: Content-->
    <!-- 结束:1:页面 -->

    <!-- 开始:JavaScript -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="/theme/cool/assets/js/fuck.js"></script>
    <script src="/theme/cool/assets/js/notify.js"></script>
    <script src="/theme/cool/assets/js/sweetalert2.min.js"></script>

	<script>
        $('#reset-button').click(function() {
            $("#reset-button").text('正在重置');
            $('#reset-button').attr('disabled', true);
			$.ajax({
                type: "POST",
                url: "/password/token/{$token}",
                dataType: "json",
                data: {
                    password: $("#password").val(),
                    repasswd: $("#repasswd").val(),
                },
                success: function (data) {
                    if (data.ret == 1) {
                        swal.fire({
                            type: 'success',
                            title: '重置密码成功',
                            confirmButtonText: '前往登录',
                            confirmButtonClass: 'btn btn-info',
                            onClose: () => {
                                window.setTimeout("location.href='/user'", 100);
                            }
                        });
                    } else {
                        $.notify({
                            title: '<strong>重置失败</strong>',
                            message: data.msg
                        },{
                            type: 'danger',
                            placement: { 
                                from: "top", 
                                align: "center"
                            },
                            timer: 2000,
                            animate: {
                                enter: 'animated zoomIn',
                                exit: 'animated zoomOut'
                            }
                        });
                    }
                    $("#reset-button").text('重置');
                    $('#reset-button').attr('disabled', false);
                }
            });
        });
    </script>
    <!-- 结束:JavaScript -->
  </body>
</html>