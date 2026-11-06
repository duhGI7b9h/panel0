<html>
<head>
	<meta charset="UTF-8"/>
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
	<title>{$config["appName"]}</title>
	<!-- Favicon -->
	<link href="/favicon.png" rel="icon" type="image/png">

	<!-- BEGIN: Vendor CSS-->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free@5.8.2/css/all.min.css">
	<!-- END: Vendor CSS-->
	
	<!-- BEGIN: Theme CSS-->
	<link rel="stylesheet" type="text/css" href="/theme/cool/assets/css/theme/style-{$Cool_Config['theme_style_color']}.css">
	<link rel="stylesheet" type="text/css" href="/theme/cool/assets/css/bootstrap.css">
	<link rel="stylesheet" type="text/css" href="/theme/cool/assets/css/cool.css">
	<link rel="stylesheet" type="text/css" href="/theme/cool/assets/css/bootstrap-extended.css">
	<link rel="stylesheet" type="text/css" href="/theme/cool/assets/css/components.css">
	<link rel="stylesheet" type="text/css" href="/theme/cool/assets/css/plugins/sweetalert2.min.css">
	<!-- END: Theme CSS-->
	<style>
		.goog-te-banner-frame{
			display:none
		}
		
		.icon-ver {
		    vertical-align:middle;
		}
		
		.col-xxxs {
		  float:none;
		  width: 17%;
		}
	</style>
</head>

<body>
{$ssr_prefer = URL::SSRCanConnect($user, $mu)}
	<!-- Main content -->
	  <div class="main-content" id="panel" style="overflow-y: auto;">
	    <div class="container-fluid">
	      <!-- Table -->
	      <div class="row">
	        <div class="col-lg-12 col-sm-12">
			<!-- Custom form validation -->
	            <div class="card mt-1">
	              <!-- Card header -->
	              <div class="card-header" style="padding:.8rem 1.2rem">
	                <h5 class="mb-0">配置信息</h5>
	              </div>
	              <!-- Card body -->
	              <div class="card-body">
	                <div class="nav-wrapper">
						<ul class="nav nav-pills nav-fill" id="ssrtype" role="tablist">
							<li class="nav-item">
								<a class="nav-link mb-sm-3 mb-md-0 active" id="ssrtype-1-tab" data-toggle="tab" href="#ssrtype-1" role="tab" aria-controls="ssrtype-1" aria-selected="true"><i class="fa fa-plane fa-lg icon-ver"></i> ShadowsocksR</a>
							</li>
							<li class="nav-item">
								<a class="nav-link mb-sm-3 mb-md-0" id="ssrtype-2-tab" data-toggle="tab" href="#ssrtype-2" role="tab" aria-controls="ssrtype-2" aria-selected="false"><i class="fa  fa-fighter-jet fa-lg icon-ver"></i> Shadowsocks</a>
							</li>
						</ul>
					</div>
					<div class="tab-content" id="myTabContent1">
						<div class="tab-pane fade show active" id="ssrtype-1" role="tabpanel" aria-labelledby="ssrtype-1-tab">
							{if URL::SSRCanConnect($user, $mu)}
	                            {$ssr_item = $node->getItem($user, $mu, $relay_rule_id, 0)}
	                            {if $ssr_item['obfs']=="v2ray"}
	                                <p>您好，Shadowsocks V2Ray-Plugin 节点需要您的加密方式使用 AEAD 系列。请您到 资料编辑
	                                    页面修改后再来查看此处。</p>
	                            {else}
	                                <p>服务器地址：{$ssr_item['address']}<br>
	                                    服务器端口：{$ssr_item['port']}<br>
	                                    加密方式：{$ssr_item['method']}<br>
	                                    密码：{$ssr_item['passwd']}<br>
	                                    协议：{$ssr_item['protocol']}<br>
	                                    协议参数：{$ssr_item['protocol_param']}<br>
	                                    混淆：{$ssr_item['obfs']}<br>
	                                    混淆参数：{$ssr_item['obfs_param']}<br></p>
	                            {/if}
	                        {else}
	                            <p>您好，您目前的 加密方式，混淆，或者协议设置在 ShadowsocksR 客户端下无法连接。请您选用 Shadowsocks
	                                客户端来连接，或者到 资料编辑 页面修改后再来查看此处。</p>
	                            <p>同时, ShadowsocksR 单端口多用户的连接不受您设置的影响,您可以在此使用相应的客户端进行连接~</p>
	                        {/if}
						</div> 
						<div class="tab-pane fade" id="ssrtype-2" role="tabpanel" aria-labelledby="ssrtype-2-tab">
							
							{if URL::SSCanConnect($user, $mu)}
	                            {$ss_item = $node->getItem($user, $mu, $relay_rule_id, 1)}
	                            {if $ss_item['obfs']=="v2ray" && URL::CanMethodConnect($user->method)!=2}
	                                <p>您好，Shadowsocks V2Ray-Plugin 节点需要您的加密方式使用 AEAD 系列。请您到 资料编辑
	                                    页面修改后再来查看此处。</p>
	                            {else}
	                                <p>服务器地址：{$ss_item['address']}<br>
	                                    服务器端口：{$ss_item['port']}<br>
	                                    加密方式：{$ss_item['method']}<br>
	                                    密码：{$ss_item['passwd']}<br>
	                                    混淆：{$ss_item['obfs']}<br>
	                                    混淆参数：{$ss_item['obfs_param']}<br></p>
	                            {/if}
	                        {else}
	                            <p>您好，您目前的 加密方式，混淆，或者协议设置在 Shadowsocks 客户端下无法连接。请您选用 ShadowsocksR
	                                客户端来连接，或者到 资料编辑 页面修改后再来查看此处。</p>
	                        {/if}
						</div>
					</div>
	              </div>
	            </div><!--card-->
			</div>	
			<div class="col-lg-12 col-sm-12">
				<div class="card">
	              <!-- Card header -->
	              <div class="card-header" style="padding:.8rem 1.2rem">
	                <h5 class="mb-0">配置Json</h5>
	              </div>
	              <!-- Card body -->
	              <div class="card-body">
	                <div class="nav-wrapper">
						<ul class="nav nav-pills nav-fill" id="ssrtypejson" role="tablist">
							<li class="nav-item">
								<a class="nav-link mb-sm-3 mb-md-0 active" id="ssrtypejson-3-tab" data-toggle="tab" href="#ssrtypejson-3" role="tab" aria-controls="ssrtypejson-3" aria-selected="true"><i class="fa fa-plane fa-lg icon-ver"></i> ShadowsocksR</a>
							</li>
							<li class="nav-item">
								<a class="nav-link mb-sm-3 mb-md-0" id="ssrtypejson-4-tab" data-toggle="tab" href="#ssrtypejson-4" role="tab" aria-controls="ssrtypejson-4" aria-selected="false"><i class="fa  fa-fighter-jet fa-lg icon-ver"></i> Shadowsocks</a>
							</li>
						</ul>
					</div>
					<div class="tab-content" id="myTabContent2">
						<div class="tab-pane fade show active" id="ssrtypejson-3" role="tabpanel" aria-labelledby="ssrtypejson-3-tab">
							 <div class="text-left">
	                        {if URL::SSRCanConnect($user, $mu)}
	                                            {if $ssr_item['obfs']=="v2ray"}
	                                                <p>您好，Shadowsocks V2Ray-Plugin 节点需要您的加密方式使用 AEAD 系列。请您到 资料编辑
	                                                    页面修改后再来查看此处。</p>
	                                            {else}
	
						        <div class="card-main"> 
						        	<div class="card-inner"> 
						        		<pre style="color:#e83e8c">
	{
	    "server": "{$ssr_item['address']}",
	    "local_address": "127.0.0.1",
	    "local_port": 1080,
	    "timeout": 300,
	    "workers": 1,
	    "server_port": {$ssr_item['port']},
	    "password": "{$ssr_item['passwd']}",
	    "method": "{$ssr_item['method']}",
	    "obfs": "{$ssr_item['obfs']}",
	    "obfs_param": "{$ssr_item['obfs_param']}",
	    "protocol": "{$ssr_item['protocol']}",
	    "protocol_param": "{$ssr_item['protocol_param']}"
	}
							        	</pre> 
							        </div> 
							    </div> 
	                                   {/if}
	                        {else}
	                            <p>您好，您目前的 加密方式，混淆，或者协议设置在 ShadowsocksR 客户端下无法连接。请您选用 Shadowsocks 客户端来连接，或者到
	                                资料编辑 页面修改后再来查看此处。</p>
	                        {/if}
	                       </div>
						</div> 
						<div class="tab-pane fade" id="ssrtypejson-4" role="tabpanel" aria-labelledby="ssrtypejson-4-tab">
							 <div class="text-left">
	                        {if URL::SSCanConnect($user, $mu)}
	                                            {if $ss_item['obfs']=="v2ray" && URL::CanMethodConnect($user->method)!=2}
	                                                <p>您好，Shadowsocks V2Ray-Plugin 节点需要您的加密方式使用 AEAD 系列。请您到 资料编辑
	                                                    页面修改后再来查看此处。</p>
	                                            {else}
						        <div class="card-main"> 
						        	<div class="card-inner"> 
						        		<pre style="color:#e83e8c">
	{
	        "server": "{$ss_item['address']}",
	        "local_address": "127.0.0.1",
	        "local_port": 1080,
	        "timeout": 300,
	        "workers": 1,
	        "server_port": {$ss_item['port']},
	        "password": "{$ss_item['passwd']}",
	        "method": "{$ss_item['method']}",
	        "plugin": "{URL::getJsonObfs($ss_item)}"
	}
							        	</pre> 
							        </div> 
							    </div> 
	                                   {/if}
	                        {else}
	                            <p>您好，您目前的 加密方式，混淆，或者协议设置在 Shadowsocks 客户端下无法连接。请您选用 ShadowsocksR 客户端来连接，或者到
	                                资料编辑 页面修改后再来查看此处。</p>
	                        {/if}
	                      </div>
						</div>
					</div>
	              </div>
	            </div><!--card-->
			</div>
			<div class="col-lg-12 col-sm-12">
				<div class="card">
	              <!-- Card header -->
	              <div class="card-header" style="padding:.8rem 1.2rem">
	                <h5 class="mb-0">配置链接</h5>
	              </div>
	              <!-- Card body -->
	              <div class="card-body">
	                <div class="nav-wrapper">
						<ul class="nav nav-pills nav-fill" id="ssrtypelink" role="tablist">
							<li class="nav-item">
								<a class="nav-link mb-sm-3 mb-md-0 active" id="ssrtypelink-5-tab" data-toggle="tab" href="#ssrtypelink-5" role="tab" aria-controls="ssrtypelink-5" aria-selected="true"><i class="fa fa-plane fa-lg icon-ver"></i> ShadowsocksR</a>
							</li>
							<li class="nav-item">
								<a class="nav-link mb-sm-3 mb-md-0" id="ssrtypelink-6-tab" data-toggle="tab" href="#ssrtypelink-6" role="tab" aria-controls="ssrtypelink-6" aria-selected="false"><i class="fa  fa-fighter-jet fa-lg icon-ver"></i> Shadowsocks</a>
							</li>
						</ul>
					</div>
					<div class="tab-content" id="myTabContent3">
						<div class="tab-pane fade show active" id="ssrtypelink-5" role="tabpanel" aria-labelledby="ssrtypelink-5-tab">
							
							{if URL::SSRCanConnect($user, $mu)}
	                            {if $ssr_item['obfs']=="v2ray"}
	                                <p>您好，Shadowsocks V2Ray-Plugin 节点需要您的加密方式使用 AEAD 系列。请您到 资料编辑
	                                    页面修改后再来查看此处。</p>
	                            {else}
	                                <p><a class="copy-text" href="javascript:void(0);" data-clipboard-text="{URL::getItemUrl($ssr_item, 0)}">点我复制配置链接</a>
	                                </p>
	                                <p><a href="{URL::getItemUrl($ssr_item, 0)}">iOS 上用 Safari
	                                        打开点我即可直接添加</a></p>
	                            {/if}
	                        {else}
	                            <p>您好，您目前的 加密方式，混淆，或者协议设置在 ShadowsocksR 客户端下无法连接。请您选用 Shadowsocks 客户端来连接，或者到
	                                资料编辑 页面修改后再来查看此处。</p>
	                        {/if}
						</div> 
						<div class="tab-pane fade" id="ssrtypelink-6" role="tabpanel" aria-labelledby="ssrtypelink-6-tab">
							
							{if URL::SSCanConnect($user, $mu)}
	                            {if $ss_item['obfs']=="v2ray" && URL::CanMethodConnect($user->method)!=2}
	                                <p>您好，Shadowsocks V2Ray-Plugin 节点需要您的加密方式使用 AEAD 系列。请您到 资料编辑
	                                    页面修改后再来查看此处。</p>
	                            {else}
	                                <p><a class="copy-text" href="javascript:void(0);" data-clipboard-text="{URL::getItemUrl($ss_item, 1)}">点我复制配置链接</a>
	                                </p>
	                                <p><a href="{URL::getItemUrl($ss_item, 1)}">iOS 上用 Safari 打开点我即可直接添加</a>
	                                </p>
	                            {/if}
	                        {else}
	                            <p>您好，您目前的 加密方式，混淆，或者协议设置在 Shadowsocks 客户端下无法连接。请您选用 ShadowsocksR 客户端来连接，或者到
	                                资料编辑 页面修改后再来查看此处。</p>
	                        {/if}
						</div>
					</div>
	              </div>
	            </div><!--card-->
			</div>
			<div class="col-lg-12 col-sm-12">
				<div class="card">
	              <!-- Card header -->
	              <div class="card-header" style="padding:.8rem 1.2rem">
	                <h5 class="mb-0">配置二维码</h5>
	              </div>
	              <!-- Card body -->
	              <div class="card-body">
	                <div class="nav-wrapper">
						<ul class="nav nav-pills nav-fill" id="ssrtypecode" role="tablist">
							<li class="nav-item">
								<a class="nav-link mb-sm-3 mb-md-0 active" id="ssrtypecode-7-tab" data-toggle="tab" href="#ssrtypecode-7" role="tab" aria-controls="ssrtypecode-7" aria-selected="true"><i class="fa fa-plane fa-lg icon-ver"></i> ShadowsocksR</a>
							</li>
							<li class="nav-item">
								<a class="nav-link mb-sm-3 mb-md-0" id="ssrtypecode-8-tab" data-toggle="tab" href="#ssrtypecode-8" role="tab" aria-controls="ssrtypecode-8" aria-selected="false"><i class="fa  fa-fighter-jet fa-lg icon-ver"></i> Shadowsocks</a>
							</li>
						</ul>
					</div>
					<div class="tab-content" id="myTabContent4">
						<div class="tab-pane fade show active" id="ssrtypecode-7" role="tabpanel" aria-labelledby="ssrtypecode-7-tab">
							
							{if URL::SSRCanConnect($user, $mu)}
	                            {if $ssr_item['obfs']=="v2ray"}
	                                <p>您好，Shadowsocks V2Ray-Plugin 节点需要您的加密方式使用 AEAD 系列。请您到 资料编辑
	                                    页面修改后再来查看此处。</p>
	                            {else}
	                                <div class="text-center">
	                                    <div id="ss-qr-n"></div>
	                                </div>
	                            {/if}
	                        {else}
	                            <p>您好，您目前的 加密方式，混淆，或者协议设置在 ShadowsocksR 客户端下无法连接。请您选用 Shadowsocks 客户端来连接，或者到
	                                资料编辑 页面修改后再来查看此处。</p>
	                        {/if}
						</div> 
						<div class="tab-pane fade" id="ssrtypecode-8" role="tabpanel" aria-labelledby="ssrtypecode-8-tab">
							<div class="text-center">
							{if URL::SSCanConnect($user, $mu)}
	                            {if $ss_item['obfs']=="v2ray" && URL::CanMethodConnect($user->method)!=2}
	                                <p>您好，Shadowsocks V2Ray-Plugin 节点需要您的加密方式使用 AEAD 系列。请您到 资料编辑
	                                    页面修改后再来查看此处。</p>
	                            {else}
                                    <div class="text-center">
                                        <div id="ss-qr"></div>
                                    </div>
	                            {/if}
	                        {else}
	                            <p>您好，您目前的 加密方式，混淆，或者协议设置在 Shadowsocks 客户端下无法连接。请您选用 ShadowsocksR 客户端来连接，或者到
	                                资料编辑 页面修改后再来查看此处。</p>
	                        {/if}
	                        </div>
						</div>
					</div>
	              </div>
	            </div><!--card-->
			</div>	
		  </div><!--row-->
		  
		    <!-- BEGIN: Footer-->
		    <footer>
		        <p class="clearfix blue-grey lighten-2"><span class="float-md-left d-block d-md-inline-block">Copyright © {$config["appName"]}丨Theme by<a class="text-bold-800 grey darken-2" href="https://t.me/Cool_WuKong" target="_blank"> Cool</a></span>
		            <button class="btn btn-primary btn-icon scroll-top" type="button"><i class="feather icon-arrow-up"></i></button>
		        </p>
		    </footer>
		    <!-- END: Footer-->
	    
	      </div><!-- Page content -->
	  </div><!-- Main content -->
  

	<script type='text/javascript' src='http://cdn.staticfile.org/jquery/2.1.1/jquery.min.js'></script>
	<script src="/theme/cool/assets/js/clipboard.min.js"></script>
	<script src="/theme/cool/assets/vendors/js/vendors.min.js"></script>
	<script src="/theme/cool/assets/js/sweetalert2.min.js"></script>
	<script src="/theme/cool/assets/js/cool.js?v62"></script>
	<script type="text/javascript" src="/theme/cool/assets/js/scripts/jquery.qrcode.min.js"></script>
	
	<script>
	    {if URL::SSCanConnect($user, $mu)}
		    var text_qrcode = '{URL::getItemUrl($ss_item, 1)}';
	           jQuery('#ss-qr').qrcode({
	            	"text": text_qrcode
	           });
	    {/if}
	    
	    {if URL::SSRCanConnect($user, $mu)}
	       	var text_qrcode2 =  '{URL::getItemUrl($ssr_item, 0)}';
	           jQuery('#ss-qr-n').qrcode({
	            	"text": text_qrcode2
	           });
	    {/if}
	</script>

  </body>
</html>