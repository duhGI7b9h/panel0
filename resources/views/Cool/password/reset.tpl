<!DOCTYPE html>
<html lang="zh-CN">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no, user-scalable=no">
        <title>找回密码 &mdash; {$config["appName"]}</title>
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
		                                                <h4 class="mb-0">忘记密码了？</h4>
		                                            </div>
		                                        </div>
		                                        <p class="px-2 mb-0">我们将会发送一封包含重置密码链接的邮件到您的邮箱</p>
		                                        <div class="card-content">
		                                            <div class="card-body">
		                                                <form class="form-group" action="javascript:void(0);"> 
		 		                                            <fieldset class="form-label-group position-relative has-icon-left">
		                                                        <div class="input-group login-form">
																	<input id="email" class="form-control" type="text" placeholder="邮箱" name="email" autocomplete="off" tabindex="1" required>
																</div>
		                                                        <div class="form-control-position">
		                                                            <i class="feather icon-mail"></i>
		                                                        </div>
		                                                        <label for="email">邮箱</label>
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
        $('#reset-button').click(function(e) {
            $("#reset-button").text('正在发送');
            $('#reset-button').attr('disabled', true);
            $.ajax({
                type: "POST",
                url: "/password/reset",
                dataType: "json",
                data: {
                    email: $("#email").val(),
                },
                success: function (data) {
                    if (data.ret == 1) {
                        $.notify({
                            title: '<strong>重置密码邮件已发送</strong>',
                            message: '如长时间未收到，请查看邮件垃圾箱，国内邮箱接收可能会延迟。<br>您需要从邮件中点击链接进行设置新密码'
                        },{
                            type: 'success',
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
                    } else {
                        $.notify({
                            title: '<strong>发送失败</strong>',
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
                    $("#reset-button").text('立即找回');
                    $('#reset-button').attr('disabled', false);
                }
            });
        });
    </script>
    <!-- 结束:JavaScript -->
    
  </body>
</html>