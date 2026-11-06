<!DOCTYPE html>
<html lang="zh-CN">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no, user-scalable=no">
        <title>注册 &mdash; {$config["appName"]}</title>
        <!-- ico -->
        <link rel="shortcut icon" href="/favicon.ico" />
      
	    <link rel="stylesheet" type="text/css" href="/theme/cool/assets/css/cool.css">
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
	                                    <img src="/theme/cool/assets/images/pages/register.jpg" alt="branding logo">
	                                </div>
	                                <div class="col-lg-6 col-12 p-0">
	                                    <div class="card rounded-0 mb-0 px-2" id="pjax-auth">
	                                        <div class="card-header pb-1">
	                                            <div class="card-title">
	                                                <h4 class="mb-0">注册</h4>
	                                            </div>
	                                        </div>
	                                        <p class="px-2">Fill the below form to create a new account.</p>
		                                        <div class="card-content">
		                                            <div class="card-body pt-1">
		                                                <form class="form-group" action="javascript:void(0);" method="POST" novalidate="" id="login-form">
		                                                    <fieldset class="form-label-group position-relative has-icon-left">
		                                                        <div class="input-group login-form">
																	<input id="name" class="form-control" type="text" placeholder="昵称" name="name" required>
																</div>
		                                                        <div class="form-control-position">
		                                                            <i class="feather icon-user"></i>
		                                                        </div>
		                                                        <label for="name">昵称</label>
		                                                    </fieldset>
		                                                    
		                                                    <fieldset class="form-label-group position-relative has-icon-left">
		                                                        <div class="input-group login-form">
																	<input id="email" class="form-control" type="text" placeholder="邮箱" name="email"  required>
																</div>
		                                                        <div class="form-control-position">
		                                                            <i class="feather icon-mail"></i>
		                                                        </div>
		                                                        <label for="email">邮箱</label>
		                                                    </fieldset>
															
															{if $enable_email_verify == 'true'} 			      
	             		                                        <fieldset class="form-label-group position-relative has-icon-left">
			                                                        <div class="input-group login-form">
																		<input id="email_code" class="form-control" type="text" placeholder="验证码" name="email_code" required><button class="btn btn-primary" type="button" id="email_verify">获取验证码</button> 
																	</div>
			                                                        <div class="form-control-position">
			                                                            <i class="fa fa-code"></i>
			                                                        </div>
			                                                        <label for="email_code">邮箱验证码</label>
			                                                    </fieldset>
			                                                {/if}
		                                                    
		                                                    <fieldset class="form-label-group position-relative has-icon-left">
		                                                        <div class="input-group login-form">
																	<input id="passwd" class="form-control" type="password" placeholder="密码" name="passwd"required>
																</div>
		                                                        <div class="form-control-position">
		                                                            <i class="feather icon-lock"></i>
		                                                        </div>
		                                                        <label for="passwd">密码</label>
		                                                    </fieldset>
		                                                    
		                                                    <fieldset class="form-label-group position-relative has-icon-left">
		                                                        <div class="input-group login-form">
																	<input id="repasswd" class="form-control" type="password" placeholder="重复密码" name="repasswd" required>
																</div>
		                                                        <div class="form-control-position">
		                                                            <i class="feather icon-lock"></i>
		                                                        </div>
		                                                        <label for="repasswd">重复密码</label>
		                                                    </fieldset>	
		                                                    
		                                                    <fieldset class="form-label-group position-relative has-icon-left">
		                                                        <div class="input-group login-form">
																	<input id="code" class="form-control" type="text" placeholder="邀请码 (没有邀请码请留空)" name="code" >
																</div>
		                                                        <div class="form-control-position">
		                                                            <i class="feather icon-thumbs-up"></i>
		                                                        </div>
		                                                        <label for="repasswd">邀请码</label>
		                                                    </fieldset>	
													      {if $geetest_html != null}
													          <div class="form-group">
													              <div class="form-group form-group-label">
													                  <div id="embed-captcha"></div>
													              </div>
													          </div>
													      {/if}
	                                                    <div class="form-group d-flex justify-content-between align-items-center">
	                                                        <div class="text-left">
	                                                            <fieldset class="checkbox">
	                                                                <div class="vs-checkbox-con vs-checkbox-primary">
	                                                                    <input type="checkbox" id="agree" name="agree" checked="checked">
	                                                                    <span class="vs-checkbox">
	                                                                        <span class="vs-checkbox--check">
	                                                                            <i class="vs-icon feather icon-check"></i>
	                                                                        </span>
	                                                                    </span>
	                                                                    <span>注册即代表同意 <a href="/tos" target="blank" class="kt-link kt-login__link kt-font-bold">服务条款.</a></span>
	                                                                </div>
	                                                            </fieldset>
	                                                        </div>
	                                                    </div>
	                                                    <a href="/auth/login" class="btn btn-outline-primary float-left btn-inline">登录</a>
	                                                    <button type="submit" class="btn btn-primary float-right" id="register-button">注册</button>
	                                                </form>
	                                            </div>
	                                        </div><br />
            								<div class="text-center text-small">
            					              Copyright © 2020 {$config["appName"]}
            					              <div class="mt-1 mb-1" id="copyright">Powered by <a href="/staff">SSPANEL</a> <div class="bullet"></div>
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

        <!-- 开始:JavaScript -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <script src="/theme/cool/assets/js/fuck.js"></script>
		<script src="/theme/cool/assets/js/notify.js"></script>
        <script src="/theme/cool/assets/js/sweetalert2.min.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.1/jquery.validate.min.js"></script>
		
		<!-- 开始:极验 -->
		{if $geetest_html != null}
			<script src="//static.geetest.com/static/tools/gt.js"></script>
			<script>
				var handlerEmbed = function (captchaObj) {
				  captchaObj.onSuccess(function () {
				      validate = captchaObj.getValidate();
				  });
				  captchaObj.appendTo("#embed-captcha");
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
		
		{if $recaptcha_sitekey != null}
			<script src="https://recaptcha.net/recaptcha/api.js" async defer></script>
		{/if}
		<!-- 结束:极验 --> 
        
        <script>
            // 注册后自动登录
            function login(email,passwd) {
                $.ajax({
                    type:"POST",
                    url:"/auth/login",
                    dataType:"json",
                    data:{
                        email: email,
                        passwd: passwd,
                        code: '',
                        remember_me: 1
                    },
                });
                window.setTimeout("location.href='/user'", 500);
            };
            "use strict";
            var KTLoginGeneral = function() {
                var handleSignInFormSubmit = function() {
                    $('#register-button').click(function(e) {
                        e.preventDefault();
                        var btn = $(this);
                        var form = $(this).closest('form');
                        form.validate({
                            rules: {
                                name: {
                                    required: true
                                },
                                email: {
                                    required: true
                                },
                                                                
                              	email_code: {
                                    required: true
                                },
                                                                
                              	passwd: {
                                    required: true,
                                    minlength: 8
                                },
                                repasswd: {
                                    required: true
                                },
                                agree: {
                                    required: true
                                }                            
                            },
                            messages: {
                                name: "请填写昵称",
                                email: "请填写邮箱",
                                email_code: "请填写邮箱验证码",                                
                              	passwd: {
                                    required: "请填写密码",
                                    minlength: "密码至少需要8位以上"
                                },
                                repasswd: "请再次填写密码",
                                agree: "使用本站服务必须同意服务条款"
                            },
                            errorPlacement: function(error, element) {
                            error.appendTo( element.parent() ); 
                            element.addClass('is-invalid');
                            error.addClass('invalid-feedback');
                            }
                        });
                        if (!form.valid()) {
                            $.notify({
                                message: '<strong>请完善注册资料</strong>'
                            },{
                                type: 'danger',
                                placement: { 
                                    from: "top", 
                                    align: "center"
                                },
                                timer: 1000,
                                animate: {
                                    enter: 'animated zoomIn',
                                    exit: 'animated zoomOut'
                                }
                            });
                            return;
                        };
                        
						{if $geetest_html != null}
						  validate = captcha.getValidate();
						  if (typeof validate === 'undefined' || !validate) {
						    swal.fire('请验证身份', '请滑动验证码来完成验证。', 'info');
						    return;
						  }
						{/if}
                        
                        $("#register-button").text('注册中');
                        $('#register-button').attr('disabled', true);

            			code = $("#code").val();
                      
                        {if $Cool_Config['enable_register_email_restrict'] == true}
                        	var email = $("#email").val()+$("#email_postfix").val();
                      	{else}
                        	var email = $("#email").val();
                        {/if}
                        
                        $.ajax({
                            type: "POST",
                            url: "/auth/register",
                            dataType: "json",
                            data: {
					              email: email,
					              name: $("#name").val(),
					              passwd: $("#passwd").val(),
					              repasswd: $("#repasswd").val(),
					              {if $recaptcha_sitekey != null}
					              recaptcha: grecaptcha.getResponse(),
					              {/if}
					              code: code
					            {if $enable_email_verify == 'true'},
					              emailcode: $("#email_code").val()
					            {/if}
					            {if $geetest_html != null},
					              geetest_challenge: validate.geetest_challenge,
					              geetest_validate: validate.geetest_validate,
					              geetest_seccode: validate.geetest_seccode
				            	{/if}                          
                            },
                            success: function (data) {
                                if (data.ret == 1) {
                                    swal.fire({
                                        type: 'success',
                                        title: '注册成功',
                                        confirmButtonText: '转入用户中心',
                                        confirmButtonClass: 'btn btn-info',
                                        onClose: () => {
                                            login(email, $("#passwd").val());
                                        }
                                    });
                                } else {
                                    $("#register-button").text('注册');
                                    $('#register-button').attr('disabled', false);
                                    {if $geetest_html != null}
					                	captcha.reset();
					                {/if}
					                $("#code").val(code);
                                    $.notify({
                                        message: '<strong>'+data.msg+'</strong>'
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
                            }
                        });
                    });
                    
                }
                return {
                    init: function() {
                        handleSignInFormSubmit();
                    }
                };
            }();
            jQuery(document).ready(function() {
                KTLoginGeneral.init();
            });
        </script> 
        
	{if $enable_email_verify == 'true'}
		<script>
            // 计时器
            var wait = 60;
            function time(o) {
                if (wait == 0) {
                    o.removeAttr("disabled");
                    o.text("获取验证码");
                    wait = 60;
                } else {
                    o.attr("disabled", "disabled");
                    o.text("重新发送(" + wait + ")");
                    wait--;
                    setTimeout(function () {
                        time(o)
                    },
                    1000)
                }
            }
			
			// 验证码
            $("#email_verify").click(function () {
                $("#email_verify").text('正在发送');
                $('#email_verify').attr('disabled', true);
                $.ajax({
                    type: "POST",
                    url: "send",
                    dataType: "json",
                    data: {
                        email: $("#email").val()
                    },
                    success: function (data) {
                        if (data.ret) {
                            $.notify({
                                title: '<strong>已发送验证码</strong>',
                                message: '如长时间未收到，请查看邮件垃圾箱；国内邮箱可能出现延迟。'
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
                            time($("#email_verify"));
                            $('#email_verify').attr('disabled', false);
                        } else {
                            $.notify({
                                title: '<strong>发送验证码失败</strong>',
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
                            $("#email_verify").text('获取验证码');
                            $('#email_verify').attr('disabled', false);
                        }
                    }
                });
            });
        </script> 
	{/if}
		<script>
            {*dumplin：轮子1.js读取url参数*}
            function getQueryVariable(variable) {
                var query = window.location.search.substring(1);
                var vars = query.split("&");
                for (var i = 0; i < vars.length; i++) {
                    var pair = vars[i].split("=");
                    if (pair[0] == variable) {
                        return pair[1];
                    }
                }
                return "";
            }

            {*dumplin:轮子2.js写入cookie*}
            function setCookie(cname, cvalue, exdays) {
                var d = new Date();
                d.setTime(d.getTime() + (exdays * 24 * 60 * 60 * 1000));
                var expires = "expires=" + d.toGMTString();
                document.cookie = cname + "=" + cvalue + "; " + expires;
            }

            {*dumplin:轮子3.js读取cookie*}
            function getCookie(cname) {
                var name = cname + "=";
                var ca = document.cookie.split(';');
                for (var i = 0; i < ca.length; i++) {
                    var c = ca[i].trim();
                    if (c.indexOf(name) == 0) return c.substring(name.length, c.length);
                }
                return "";
            }

            {*dumplin:读取url参数写入cookie，自动跳转隐藏url邀请码*}
            if (getQueryVariable('code') != '') {
                setCookie('code', getQueryVariable('code'), 30);
                window.location.href = '/auth/register';
            }

         
            {*dumplin:读取cookie，自动填入邀请码框*}
            if ((getCookie('code')) != '') {
                $("#code").val(getCookie('code'));
            }
          
        </script> 
		<!-- 结束:JavaScript -->  
    </body>
</html>