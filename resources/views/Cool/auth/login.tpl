<!DOCTYPE html>
<html lang="zh-CN">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no, user-scalable=no">
        <title>登录 &mdash; {$config["appName"]}</title>
        <!-- ico -->
        <link rel="shortcut icon" href="/favicon.ico" />
        
      	<link rel="stylesheet" type="text/css" href="/theme/cool/assets/css/cool.css">
        <link rel="stylesheet" type="text/css" href="/theme/cool/assets/vendors/css/vendors.min.css">
    	<link rel="stylesheet" type="text/css" href="/theme/cool/assets/css/bootstrap.css">
	    <link rel="stylesheet" type="text/css" href="/theme/cool/assets/css/bootstrap-extended.css">
	    <link rel="stylesheet" type="text/css" href="/theme/cool/assets/css/plugins/sweetalert2.min.css">
	    <link rel="stylesheet" type="text/css" href="/theme/cool/assets/css/theme/style-purple.css">
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
	<body class="vertical-layout vertical-menu-modern 1-column  navbar-floating footer-static bg-full-screen-image  blank-page blank-page" data-open="click" data-menu="vertical-menu-modern" data-col="1-column">
	    <!-- BEGIN: Content-->
	    <div class="app-content content">
	        <div class="content-overlay"></div>
	        <div class="header-navbar-shadow"></div>
	        <div class="content-wrapper">
	            <div class="content-header row">
	            </div>
	            <div class="content-body">
	                <section class="row flexbox-container">
	                    <div class="col-xl-8 col-11 d-flex justify-content-center">
	                        <div class="card bg-authentication rounded-0 mb-0">
	                            <div class="row m-0">
	                                <div class="col-lg-6 d-lg-block d-none text-center align-self-center px-1 py-0">
	                                    <img src="/theme/cool/assets/images/pages/login.png" alt="branding logo">
	                                </div>
	                                <div class="col-lg-6 col-12 p-0">
	                                    <div class="card rounded-0 mb-0 px-2" id="pjax-auth">
	                                        <div class="card-header pb-1">
	                                            <div class="card-title">
	                                                <h4 class="mb-0">登录</h4>
	                                            </div>
	                                        </div>
	                                        <p class="px-2">Welcome back, please login to your account.</p>
		                                        <div class="card-content">
		                                            <div class="card-body pt-1">
		                                                <form class="form-group" action="javascript:void(0);" method="POST" novalidate="" id="login-form">
		                                                    <fieldset class="form-label-group position-relative has-icon-left">
		                                                        <div class="input-group login-form">
																	<input id="email" class="form-control" type="text" placeholder="邮箱" name="email" autocomplete="off" tabindex="1" required>
																</div>
		                                                        <div class="form-control-position">
		                                                            <i class="feather icon-user"></i>
		                                                        </div>
		                                                        <label for="email">邮箱</label>
		                                                    </fieldset>
		
		                                                    <fieldset class="form-label-group position-relative has-icon-left">
		                                                        <div class="input-group login-form">
																	<input id="password" class="form-control" type="password" placeholder="密码" name="password" tabindex="2" required>
																</div>
		                                                        <div class="form-control-position">
		                                                            <i class="feather icon-lock"></i>
		                                                        </div>
		                                                        <label for="password">密码</label>
		                                                    </fieldset>
		                                                    
                                                            <fieldset class="form-label-group position-relative has-icon-left">
                            		                            <div class="input-group login-form">       
                            										<input id="2fa-code" class="form-control" type="number" placeholder="二步验证动态码,未设置为空即可" name="code_2fa">
                                                                </div>
                                                                <div class="form-control-position">
                                                                    <i class="feather icon-pocket"></i>
                                                                </div>
                                                                <label for="password">密码</label>
                                                            </fieldset>
                                                            
										                  {if $geetest_html != null}
											                  <div class="input-group mb-4">
											                    <div class="embed-captcha"></div>
											                  </div>
										                  {/if}
	                                                    <div class="form-group d-flex justify-content-between align-items-center">
	                                                        <div class="text-left">
	                                                            <fieldset class="checkbox">
	                                                                <div class="vs-checkbox-con vs-checkbox-primary">
	                                                                    <input type="checkbox">
	                                                                    <span class="vs-checkbox">
	                                                                        <span class="vs-checkbox--check">
	                                                                            <i class="vs-icon feather icon-check"></i>
	                                                                        </span>
	                                                                    </span>
	                                                                    <span>记住我</span>
	                                                                </div>
	                                                            </fieldset>
	                                                        </div>
	                                                        <div class="text-right"><a href="/password/reset" class="card-link">忘记密码?</a></div>
	                                                    </div>
	                                                    <a href="/auth/register" class="btn btn-outline-primary float-left btn-inline">注册</a>
	                                                    <button type="submit" class="btn btn-primary float-right login-button">登录</button>
	                                                </form>
	                                            </div>
	                                        </div>
	                                        
	                                        <div class="login-footer">
	                                            <div class="divider">
	                                                <div class="divider-text">OR</div>
	                                            </div>
	                                            <div class="footer-btn d-inline">
	                                                <button type="button" class="btn btn-block btn-primary white" id="telegram-login" data-toggle="modal" data-target="#telegram-modal"><i class="fab fa-telegram-plane"></i>&nbsp;&nbsp;使用 Telegram 登录</button>
	                                            </div>
                								<div class="text-center mt-1 text-small">
                					              Copyright © 2020 {$config["appName"]}
                					              <div class="mt-1" id="copyright">Powered by <a href="/staff">SSPANEL</a> <div class="bullet"></div>
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
	    
        <!-- 开始:modal -->
        <!-- 开始:telegram登录 -->
        <div class="modal fade" id="telegram-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLongTitle"><strong>Telegram 一键登录</strong></h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
				          <span aria-hidden="true">&times;</span>
				        </button>
                    </div>
                    <div class="modal-body">
                        <div class="text-center mt-1 mb-1" id="telegram-login-box">
                        </div>
                        <div class="text-center mb-1">
                            <div class="text-job text-muted">或者添加机器人账号 <a href="https://t.me/@{$telegram_bot}"  target="_blank">@{$telegram_bot}</a>，发送下面的数字给它
                            </div>
                        </div>
                        <div class="text-center">
                            <h2><code id="code_number" style="color: #6777ef">{$login_number}</code></h2>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">取消</button>
                    </div>
                </div>
            </div>
        </div>
        <!-- 结束:telegram登录 -->
        <!-- 结束:modal -->

        <!-- 开始:JavaScript -->
		<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <script src="/theme/cool/assets/js/fuck.js"></script>
        <script src="/theme/cool/assets/js/notify.js"></script>
        <script src="/theme/cool/assets/js/sweetalert2.min.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.4.1/js/bootstrap.min.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.1/jquery.validate.min.js"></script>

		<!-- 开始:极验 -->
		{if $geetest_html != null}
		  <script src="//static.geetest.com/static/tools/gt.js"></script>
		  <script>
		    captcha = '';
		    var handlerEmbed = function (captchaObj) {
		      captchaObj.onSuccess(function () {
		          validate = captchaObj.getValidate();
		      });
		      captchaObj.appendTo(".embed-captcha");
		      captcha = captchaObj;
		    };
		    initGeetest({
		      gt: "{$geetest_html->gt}",
		      challenge: "{$geetest_html->challenge}",
		      product: "embed",
		      width: "100%",
		      offline: {if $geetest_html->success}0{else}1{/if}
		    }, handlerEmbed);
		  </script>
		{/if}
		<!-- 结束:极验 --> 
        
        <!-- 开始:登录js -->
        <script>
            $('.login-button').click(function() {
                var btn = $(this);
                var form = $(this).closest('form');
                form.validate({
                    rules: {
                        email: {
                            required: true,
                        },
                        password: {
                            required: true
                        }
                    },
                    messages: {
                        email: {
                            required: "请填写邮箱",
                        },
                        password: "请填写密码"
                    },
                    errorPlacement: function(error, element) {
                      error.appendTo( element.parent() ); 
                      element.addClass('is-invalid');
                      error.addClass('invalid-feedback');
                    }
                });
                if (!form.valid()) {
                    return;
                }
				
				{if $geetest_html != null}
				  validate = captcha.getValidate();
				  if (typeof validate === 'undefined' || !validate) {
				    swal.fire('请验证身份', '请滑动验证码来完成验证。', 'info');
				    return;
				  }
				{/if}
				
				$(".login-button").text('正在登录').attr('disabled', true);
				
                $.ajax({
                    type: "POST",
                    url: "/auth/login",
                    dataType: "json",
                    data: {
			          email: $("#email").val(),
			          passwd: $("#password").val(),
			          code: $("#2fa-code").val(),{if $recaptcha_sitekey != null}
			          recaptcha: grecaptcha.getResponse(),{/if}
			          remember_me: $("#remember-me:checked").val(){if $geetest_html != null},
			          geetest_challenge: validate.geetest_challenge,
			          geetest_validate: validate.geetest_validate,
			          geetest_seccode: validate.geetest_seccode{/if}                           
			        },
                    success: function (data) {
                        if (data.ret == 1){
                        	$.notify({ title: '<strong>'+data.msg+'</strong>', message: '正在转入用户中心' },{ type: 'success', placement: { from: "top", align: "center"}, });
                            window.setTimeout("location.href='/user'", 1000);
                        }else if(data.ret == 2) {
                        	$(".login-button").text('登录').attr('disabled', false);
                            $.notify({
                                    message: '<strong>'+data.msg+'</strong>'
                                },{
                                    type: 'warning',
                                    placement: { 
                                        from: "top", 
                                        align: "center"
                                    },
                                    timer: 500,
                                    animate: {
                                        enter: 'animated zoomIn',
                                        exit: 'animated zoomOut'
                                    }
                                });
                        } else{
                        	$(".login-button").text('登录').attr('disabled', false);
                        	$.notify({
                                title: '<strong>登录失败</strong>',
                                message: data.msg
                            },{
                                type: 'danger',
                                placement: { 
                                    from: "top", 
                                    align: "center"
                                },
                                timer: 500,
                                animate: {
                                    enter: 'animated zoomIn',
                                    exit: 'animated zoomOut'
                                }
                            });
                        };
                    }
                });
            });
        </script>
        <!-- 结束: 登录js -->

        <!-- 开始:telegram登录js -->
        <script>
            $(document).ready(function () {
              var el = document.createElement('script');
              document.getElementById('telegram-login-box').append(el);
              el.onload = function () {
                $('#telegram-alert').remove()
              }
              el.src = 'https://telegram.org/js/telegram-widget.js?4';
              el.setAttribute('data-size', 'large')
              el.setAttribute('data-telegram-login', '{$telegram_bot}')
              el.setAttribute('data-auth-url', '{$base_url}/auth/telegram_oauth')
              el.setAttribute('data-request-access', 'write')
            });
        </script>
        <script>
            $(document).ready(function () {
                $("#telegram-login").click(
                    function () {
                        tgLogin();
                    }
                );
                function tgLogin() {
                    $.ajax({
                        type: "POST",
                        url: "qrcode_check",
                        dataType: "json",
                        data: {
                          token: "{$login_token}",
                          number: "{$login_number}"
                        },
                        success: (data) => {
                        if (data.ret > 0) {
                            clearTimeout(tid);
                            $.ajax({
                                type: "POST",
                                url: "/auth/qrcode_login",
                                dataType: "json",
                                data: {
                                  token: "{$login_token}",
                                  number: "{$login_number}"
                                },
                                success: (data) => {
                                    if (data.ret) {
                                        swal.fire({
                                            type: 'success',
                                            title: '登录成功',
                                            html: '正在转入用户中心',
                                            showConfirmButton: false
                                        });
                                        window.setTimeout("location.href='/user'", 2000);
                                    }
                                },
                                error: (jqXHR) => {
                                    $.notify({
                                        title: '<strong>Telegram登录失败</strong>',
                                        message: '请使用账号密码登录'
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
                            });
                        } else {
                            if (data.ret === -1) {
                            $('#code_number').replaceWith('<code id="code_number">此数字已经过期，请刷新页面后重试。</code>');
                            }
                        }
                    },
                    error: (jqXHR) => {
                        if (jqXHR.status !== 200 && jqXHR.status !== 0) {
                            swal('TG登录失败','请使用账号密码登录', 'error');
                        }
                    }
                });
                tid = setTimeout(tgLogin, 2500); //循环调用触发setTimeout
                }
            })
        </script>
        <!-- 结束:telegram登录js -->
        
        <script>
            var isWeixin = function () {
            var ua = navigator.userAgent.toLowerCase();
            return ua.match(/MicroMessenger/i) == "micromessenger";
            };
            if (isWeixin() == true) {
                $('#pjax-auth').html(''+
                '<div class="kt-login__signin flipInX animated" id="pjax-auth">'+
                '<div class="kt-login__head">'+
                '<h2 class="kt-login__title kt-font-danger">不支持在微信内访问</h2>'+
                '<div class="kt-login__desc">请点击右上角菜单，选择浏览器打开</div>'+
                '</div>'+
                '</div>');
                $('#auth-page-tab').hide();
                }
        </script>
        <!-- 结束:JavaScript -->
    </body>
</html>