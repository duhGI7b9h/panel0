<!DOCTYPE html>
  <html lang="zh-CN">
   <head> 
    <title>商店 — {$config["appName"]}</title> 

	{include file='user/header.tpl'}

    <!-- BEGIN: Content-->
    <div class="app-content content">
        <div class="content-overlay"></div>
        <div class="header-navbar-shadow"></div>
        <div class="content-wrapper">
            <div class="content-header row">
                <div class="content-header-left col-md-8 col-12 mb-2">
                    <div class="row breadcrumbs-top">
                        <div class="col-12">
                            <h2 class="content-header-title float-left mb-0">商店</h2>
                            <div class="breadcrumb-wrapper col-12">
                                <ol class="breadcrumb shop-navigate">
                                    <li class="breadcrumb-item"><a href="/user">Home</a>
                                    </li>
                                    <li class="breadcrumb-item"><a href="/user/shop">Store</a>
                                    </li>
                                </ol>
                            </div>
                        </div>
                    </div>
                </div>
               
                {if $Cool_Config['shop_enable_traffic_package'] == true && $user->class > 0}
	                <a class="btn btn-primary btn-icon icon-left waves-effect waves-light right traffic-style" data-toggle="modal" data-target="#traffic_package_modal"><i class="fas fa-gas-pump"></i>&nbsp;&nbsp;流量包购买</a>
	            {/if}
                {if $Cool_Config['quantit_show'] == true}
                    <a class="btn btn-primary btn-icon icon-left waves-effect waves-light right byvolum-style" data-toggle="modal" data-target="#Byvolume-modal"><i class="fab fa-paypal"></i>&nbsp;&nbsp;按量付费</a>
                {/if}
            </div>
			<div class="row" id="mytab">
				<div class="col">
					<div class="card">
					<div class="card-body">
						<ul class="nav node-pills nav-pills nav-fill flex-column flex-md-row" id="tabs-icons-text" role="tablist">
							{if $Cool_Config['plan_1_enable'] == true}
								<li class="nav-item">
									<a class="nav-link mb-sm-3 mb-md-0 active" id="tabs-icons-text-1-tab" data-toggle="tab" href="#tabs-icons-text-1" role="tab" aria-controls="tabs-icons-text-1" aria-selected="true"> {$Cool_Config['plan_1_name']}</a>
								</li>
							{/if}
							
							{if $Cool_Config['plan_2_enable'] == true}
								<li class="nav-item">
									<a class="nav-link mb-sm-3 mb-md-0" id="tabs-icons-text-2-tab" data-toggle="tab" href="#tabs-icons-text-2" role="tab" aria-controls="tabs-icons-text-2" aria-selected="true"> {$Cool_Config['plan_2_name']} </a>
								</li>
							{/if}
							
							{if $Cool_Config['plan_3_enable'] == true}
								<li class="nav-item">
									<a class="nav-link mb-sm-3 mb-md-0" id="tabs-icons-text-3-tab" data-toggle="tab" href="#tabs-icons-text-3" role="tab" aria-controls="tabs-icons-text-3" aria-selected="true"> {$Cool_Config['plan_3_name']} </a>
								</li>
							{/if}
							
							{if $Cool_Config['plan_4_enable'] == true}
								<li class="nav-item">
									<a class="nav-link mb-sm-3 mb-md-0" id="tabs-icons-text-4-tab" data-toggle="tab" href="#tabs-icons-text-4" role="tab" aria-controls="tabs-icons-text-4" aria-selected="true"> {$Cool_Config['plan_4_name']} </a>
								</li>
							{/if}
							
							{if $Cool_Config['enable_shop_trail'] == true && $user->class <= 0}
								<li class="nav-item">
									<a class="nav-link mb-sm-3 mb-md-0" id="tabs-icons-text-5-tab" data-toggle="tab" href="#tabs-icons-text-5" role="tab" aria-controls="tabs-icons-text-5" aria-selected="true"> 试用计划</a>
								</li>
							{/if}
						</ul>
					</div>
					</div>
				</div>
			  </div>
			<div class="tab-content" id="myTabContent">
				<div class="tab-pane fade show active" id="tabs-icons-text-1" role="tabpanel" aria-labelledby="tabs-icons-text-1-tab">
					<div class="row">
					{foreach $shops_p_c1 as $shop}
					<div class="col-lg-4 col-md-6 col-sm-6">
					 <!-- Pricing card -->
						<div class="card card-pricing border-0 mb-4 text-center">
							<div class="card-header">
								<h4 class="text-primary" style="margin:0 auto">{$shop->name}</h4>
							</div>
							<hr />
							<div class="card-body px-lg-7">
								<div class="shop-title">￥{$shop->price}</div>
								<span class=" text-muted">每次续费</span>
									<ul class="shop-info my-3" style="text-align:left">
									<div class="mb-2"> 
			                           <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="24px" height="24px" viewbox="0 0 24 24" version="1.1" class="kt-svg-icon"> 
			                            <g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd"> 
			                             <rect x="0" y="0" width="24" height="24" /> 
			                             <path d="M5,5 L5,15 C5,15.5948613 5.25970314,16.1290656 5.6719139,16.4954176 C5.71978107,16.5379595 5.76682388,16.5788906 5.81365532,16.6178662 C5.82524933,16.6294602 15,7.45470952 15,7.45470952 C15,6.9962515 15,6.17801499 15,5 L5,5 Z M5,3 L15,3 C16.1045695,3 17,3.8954305 17,5 L17,15 C17,17.209139 15.209139,19 13,19 L7,19 C4.790861,19 3,17.209139 3,15 L3,5 C3,3.8954305 3.8954305,3 5,3 Z" fill="#000000" fill-rule="nonzero" transform="translate(10.000000, 11.000000) rotate(-315.000000) translate(-10.000000, -11.000000) " /> 
			                             <path d="M20,22 C21.6568542,22 23,20.6568542 23,19 C23,17.8954305 22,16.2287638 20,14 C18,16.2287638 17,17.8954305 17,19 C17,20.6568542 18.3431458,22 20,22 Z" fill="#000000" opacity="0.3" /> 
			                            </g> 
			                           </svg> {if !$shop->bandwidth()=='0'}套餐流量：
			                           <b>{$shop->bandwidth()} GB</b>{else}&nbsp;套餐流量：<b>无限量</b>{/if} 
			                          </div> 
			                          <div class="mb-2"> 
			                           <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="24px" height="24px" viewbox="0 0 24 24" version="1.1" class="kt-svg-icon"> 
			                            <g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd"> 
			                             <polygon points="0 0 24 0 24 24 0 24" /> 
			                             <path d="M11.2600599,5.81393408 L2,16 L22,16 L12.7399401,5.81393408 C12.3684331,5.40527646 11.7359848,5.37515988 11.3273272,5.7466668 C11.3038503,5.7680094 11.2814025,5.79045722 11.2600599,5.81393408 Z" fill="#000000" opacity="0.3" /> 
			                             <path d="M12.0056789,15.7116802 L20.2805786,6.85290308 C20.6575758,6.44930487 21.2903735,6.42774054 21.6939717,6.8047378 C21.8964274,6.9938498 22.0113578,7.25847607 22.0113578,7.535517 L22.0113578,20 L16.0113578,20 L2,20 L2,7.535517 C2,7.25847607 2.11493033,6.9938498 2.31738608,6.8047378 C2.72098429,6.42774054 3.35378194,6.44930487 3.7307792,6.85290308 L12.0056789,15.7116802 Z" fill="#000000" /> 
			                            </g> 
			                           </svg>&nbsp;会员等级： 
			                           <b>[Lv.{$shop->user_class()}]会员</b> 
			                          </div> 
			                          <div class="mb-2"> 
			                           <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="24px" height="24px" viewbox="0 0 24 24" version="1.1" class="kt-svg-icon"> 
			                            <g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd"> 
			                             <polygon points="0 0 24 0 24 24 0 24" /> 
			                             <path d="M12,4.25932872 C12.1488635,4.25921584 12.3000368,4.29247316 12.4425657,4.36281539 C12.6397783,4.46014562 12.7994058,4.61977315 12.8967361,4.81698575 L14.9389263,8.95491503 L19.5054023,9.61846284 C20.0519472,9.69788046 20.4306287,10.2053233 20.351211,10.7518682 C20.3195865,10.9695052 20.2170993,11.1706476 20.0596157,11.3241562 L16.7552826,14.545085 L17.5353298,19.0931094 C17.6286908,19.6374458 17.263103,20.1544017 16.7187666,20.2477627 C16.5020089,20.2849396 16.2790408,20.2496249 16.0843804,20.1472858 L12,18 L12,4.25932872 Z" fill="#000000" opacity="0.3" /> 
			                             <path d="M12,4.25932872 L12,18 L7.91561963,20.1472858 C7.42677504,20.4042866 6.82214789,20.2163401 6.56514708,19.7274955 C6.46280801,19.5328351 6.42749334,19.309867 6.46467018,19.0931094 L7.24471742,14.545085 L3.94038429,11.3241562 C3.54490071,10.938655 3.5368084,10.3055417 3.92230962,9.91005817 C4.07581822,9.75257453 4.27696063,9.65008735 4.49459766,9.61846284 L9.06107374,8.95491503 L11.1032639,4.81698575 C11.277344,4.464261 11.6315987,4.25960807 12,4.25932872 Z" fill="#000000" /> 
			                            </g> 
			                           </svg>{if !$shop->expire()=='0'}&nbsp;等级时长： 
			                           <b>{$shop->class_expire()} 天</b>{else}&nbsp;等级时长：<b>无限期</b>{/if} 
			                          </div> 
			                          <div class="mb-2"> 
			                           <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="24px" height="24px" viewbox="0 0 24 24" version="1.1" class="kt-svg-icon"> 
			                            <g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd"> 
			                             <rect x="0" y="0" width="24" height="24" /> 
			                             <path d="M12,21 C7.581722,21 4,17.418278 4,13 C4,8.581722 7.581722,5 12,5 C16.418278,5 20,8.581722 20,13 C20,17.418278 16.418278,21 12,21 Z" fill="#000000" opacity="0.3" /> 
			                             <path d="M13,5.06189375 C12.6724058,5.02104333 12.3386603,5 12,5 C11.6613397,5 11.3275942,5.02104333 11,5.06189375 L11,4 L10,4 C9.44771525,4 9,3.55228475 9,3 C9,2.44771525 9.44771525,2 10,2 L14,2 C14.5522847,2 15,2.44771525 15,3 C15,3.55228475 14.5522847,4 14,4 L13,4 L13,5.06189375 Z" fill="#000000" /> 
			                             <path d="M16.7099142,6.53272645 L17.5355339,5.70710678 C17.9260582,5.31658249 18.5592232,5.31658249 18.9497475,5.70710678 C19.3402718,6.09763107 19.3402718,6.73079605 18.9497475,7.12132034 L18.1671361,7.90393167 C17.7407802,7.38854954 17.251061,6.92750259 16.7099142,6.53272645 Z" fill="#000000" /> 
			                             <path d="M11.9630156,7.5 L12.0369844,7.5 C12.2982526,7.5 12.5154733,7.70115317 12.5355117,7.96165175 L12.9585886,13.4616518 C12.9797677,13.7369807 12.7737386,13.9773481 12.4984096,13.9985272 C12.4856504,13.9995087 12.4728582,14 12.4600614,14 L11.5399386,14 C11.2637963,14 11.0399386,13.7761424 11.0399386,13.5 C11.0399386,13.4872031 11.0404299,13.4744109 11.0414114,13.4616518 L11.4644883,7.96165175 C11.4845267,7.70115317 11.7017474,7.5 11.9630156,7.5 Z" fill="#000000" /> 
			                            </g> 
			                           </svg>&nbsp;重置周期： 
			                           <b class="kt-text-themecolor">{if $shop->reset() == 0 }到期清零{else}每 {$shop->reset()}天 重置{/if}</b> 
			                          </div> 
			                          <div class="mb-2"> 
			                           <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="24px" height="24px" viewbox="0 0 24 24" version="1.1" class="kt-svg-icon"> 
			                            <g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd"> 
			                             <rect x="0" y="0" width="24" height="24" /> 
			                             <path d="M8,2.5 C7.30964406,2.5 6.75,3.05964406 6.75,3.75 L6.75,20.25 C6.75,20.9403559 7.30964406,21.5 8,21.5 L16,21.5 C16.6903559,21.5 17.25,20.9403559 17.25,20.25 L17.25,3.75 C17.25,3.05964406 16.6903559,2.5 16,2.5 L8,2.5 Z" fill="#000000" opacity="0.3" /> 
			                             <path d="M8,2.5 C7.30964406,2.5 6.75,3.05964406 6.75,3.75 L6.75,20.25 C6.75,20.9403559 7.30964406,21.5 8,21.5 L16,21.5 C16.6903559,21.5 17.25,20.9403559 17.25,20.25 L17.25,3.75 C17.25,3.05964406 16.6903559,2.5 16,2.5 L8,2.5 Z M8,1 L16,1 C17.5187831,1 18.75,2.23121694 18.75,3.75 L18.75,20.25 C18.75,21.7687831 17.5187831,23 16,23 L8,23 C6.48121694,23 5.25,21.7687831 5.25,20.25 L5.25,3.75 C5.25,2.23121694 6.48121694,1 8,1 Z M9.5,1.75 L14.5,1.75 C14.7761424,1.75 15,1.97385763 15,2.25 L15,3.25 C15,3.52614237 14.7761424,3.75 14.5,3.75 L9.5,3.75 C9.22385763,3.75 9,3.52614237 9,3.25 L9,2.25 C9,1.97385763 9.22385763,1.75 9.5,1.75 Z" fill="#000000" fill-rule="nonzero" /> 
			                            </g> 
			                           </svg>&nbsp;同时在线： 
			                           <b class="kt-text-themecolor">{if !$shop->connector()=='0'}{$shop->connector()} 个{else}不限{/if}客户端</b> 
			                          </div> 
			                          <div class="mb-2"> 
			                           <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="24px" height="24px" viewbox="0 0 24 24" version="1.1" class="kt-svg-icon"> 
			                            <g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd"> 
			                             <rect x="0" y="0" width="24" height="24" /> 
			                             <rect fill="#000000" opacity="0.3" x="2" y="3" width="20" height="18" rx="2" /> 
			                             <path d="M9.9486833,13.3162278 C9.81256925,13.7245699 9.43043041,14 9,14 L5,14 C4.44771525,14 4,13.5522847 4,13 C4,12.4477153 4.44771525,12 5,12 L8.27924078,12 L10.0513167,6.68377223 C10.367686,5.73466443 11.7274983,5.78688777 11.9701425,6.75746437 L13.8145063,14.1349195 L14.6055728,12.5527864 C14.7749648,12.2140024 15.1212279,12 15.5,12 L19,12 C19.5522847,12 20,12.4477153 20,13 C20,13.5522847 19.5522847,14 19,14 L16.118034,14 L14.3944272,17.4472136 C13.9792313,18.2776054 12.7550291,18.143222 12.5298575,17.2425356 L10.8627389,10.5740611 L9.9486833,13.3162278 Z" fill="#000000" fill-rule="nonzero" /> 
			                             <circle fill="#000000" opacity="0.3" cx="19" cy="6" r="1" /> 
			                            </g> 
			                           </svg>&nbsp;峰值速率： 
			                           <b class="kt-text-themecolor">{if !$shop->speedlimit()=='0'}{$shop->speedlimit()} {else}不限{/if} Mbps</b> 
			                         </div>
								</ul>
							</div>
							<div class="card-footer bg-primary">
								<a href="javascript:void(0);" class="text-white" onclick="{if $user->quantitypay == '1'}nobuy(){else}buy('{$shop->id}',{$shop->auto_renew}){/if}"><i class="fa fa-arrow-right"></i>&nbsp;&nbsp;立即订阅</a>
							</div>
						</div>
					</div>
					{/foreach}
					</div>
					
				</div><!--row-->
				{if count($shops_p_c2) != 0}
				<div class="tab-pane fade" id="tabs-icons-text-2" role="tabpanel" aria-labelledby="tabs-icons-text-2-tab">
					<div class="row card-wrapper">
					{foreach $shops_p_c2 as $shop}
					<div class="col-lg-4 col-md-6 col-sm-6">
					 <!-- Pricing card -->
						<div class="card card-pricing border-0 text-center mb-4">
							<div class="card-header">
								<h4 class="text-primary" style="margin:0 auto">{$shop->name}</h4>
							</div>
							<hr />
							<div class="card-body px-lg-7">
								<div class="shop-title">￥{$shop->price}</div>
								<span class=" text-muted">每次续费</span>
									<ul class="shop-info my-3" style="text-align:left">
									<div class="mb-2"> 
			                           <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="24px" height="24px" viewbox="0 0 24 24" version="1.1" class="kt-svg-icon"> 
			                            <g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd"> 
			                             <rect x="0" y="0" width="24" height="24" /> 
			                             <path d="M5,5 L5,15 C5,15.5948613 5.25970314,16.1290656 5.6719139,16.4954176 C5.71978107,16.5379595 5.76682388,16.5788906 5.81365532,16.6178662 C5.82524933,16.6294602 15,7.45470952 15,7.45470952 C15,6.9962515 15,6.17801499 15,5 L5,5 Z M5,3 L15,3 C16.1045695,3 17,3.8954305 17,5 L17,15 C17,17.209139 15.209139,19 13,19 L7,19 C4.790861,19 3,17.209139 3,15 L3,5 C3,3.8954305 3.8954305,3 5,3 Z" fill="#000000" fill-rule="nonzero" transform="translate(10.000000, 11.000000) rotate(-315.000000) translate(-10.000000, -11.000000) " /> 
			                             <path d="M20,22 C21.6568542,22 23,20.6568542 23,19 C23,17.8954305 22,16.2287638 20,14 C18,16.2287638 17,17.8954305 17,19 C17,20.6568542 18.3431458,22 20,22 Z" fill="#000000" opacity="0.3" /> 
			                            </g> 
			                           </svg> {if !$shop->bandwidth()=='0'}套餐流量： 
			                           <b>{$shop->bandwidth()} GB</b>{else}&nbsp;套餐流量：<b>无限量</b>{/if} 
			                          </div> 
			                          <div class="mb-2"> 
			                           <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="24px" height="24px" viewbox="0 0 24 24" version="1.1" class="kt-svg-icon"> 
			                            <g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd"> 
			                             <polygon points="0 0 24 0 24 24 0 24" /> 
			                             <path d="M11.2600599,5.81393408 L2,16 L22,16 L12.7399401,5.81393408 C12.3684331,5.40527646 11.7359848,5.37515988 11.3273272,5.7466668 C11.3038503,5.7680094 11.2814025,5.79045722 11.2600599,5.81393408 Z" fill="#000000" opacity="0.3" /> 
			                             <path d="M12.0056789,15.7116802 L20.2805786,6.85290308 C20.6575758,6.44930487 21.2903735,6.42774054 21.6939717,6.8047378 C21.8964274,6.9938498 22.0113578,7.25847607 22.0113578,7.535517 L22.0113578,20 L16.0113578,20 L2,20 L2,7.535517 C2,7.25847607 2.11493033,6.9938498 2.31738608,6.8047378 C2.72098429,6.42774054 3.35378194,6.44930487 3.7307792,6.85290308 L12.0056789,15.7116802 Z" fill="#000000" /> 
			                            </g> 
			                           </svg>&nbsp;会员等级： 
			                           <b>[Lv.{$shop->user_class()}]会员</b> 
			                          </div> 
			                          <div class="mb-2"> 
			                           <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="24px" height="24px" viewbox="0 0 24 24" version="1.1" class="kt-svg-icon"> 
			                            <g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd"> 
			                             <polygon points="0 0 24 0 24 24 0 24" /> 
			                             <path d="M12,4.25932872 C12.1488635,4.25921584 12.3000368,4.29247316 12.4425657,4.36281539 C12.6397783,4.46014562 12.7994058,4.61977315 12.8967361,4.81698575 L14.9389263,8.95491503 L19.5054023,9.61846284 C20.0519472,9.69788046 20.4306287,10.2053233 20.351211,10.7518682 C20.3195865,10.9695052 20.2170993,11.1706476 20.0596157,11.3241562 L16.7552826,14.545085 L17.5353298,19.0931094 C17.6286908,19.6374458 17.263103,20.1544017 16.7187666,20.2477627 C16.5020089,20.2849396 16.2790408,20.2496249 16.0843804,20.1472858 L12,18 L12,4.25932872 Z" fill="#000000" opacity="0.3" /> 
			                             <path d="M12,4.25932872 L12,18 L7.91561963,20.1472858 C7.42677504,20.4042866 6.82214789,20.2163401 6.56514708,19.7274955 C6.46280801,19.5328351 6.42749334,19.309867 6.46467018,19.0931094 L7.24471742,14.545085 L3.94038429,11.3241562 C3.54490071,10.938655 3.5368084,10.3055417 3.92230962,9.91005817 C4.07581822,9.75257453 4.27696063,9.65008735 4.49459766,9.61846284 L9.06107374,8.95491503 L11.1032639,4.81698575 C11.277344,4.464261 11.6315987,4.25960807 12,4.25932872 Z" fill="#000000" /> 
			                            </g> 
			                           </svg>{if !$shop->expire()=='0'}&nbsp;等级时长： 
			                           <b>{$shop->class_expire()} 天</b>{else}&nbsp;等级时长：<b>无限期</b>{/if} 
			                          </div> 
			                          <div class="mb-2"> 
			                           <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="24px" height="24px" viewbox="0 0 24 24" version="1.1" class="kt-svg-icon"> 
			                            <g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd"> 
			                             <rect x="0" y="0" width="24" height="24" /> 
			                             <path d="M12,21 C7.581722,21 4,17.418278 4,13 C4,8.581722 7.581722,5 12,5 C16.418278,5 20,8.581722 20,13 C20,17.418278 16.418278,21 12,21 Z" fill="#000000" opacity="0.3" /> 
			                             <path d="M13,5.06189375 C12.6724058,5.02104333 12.3386603,5 12,5 C11.6613397,5 11.3275942,5.02104333 11,5.06189375 L11,4 L10,4 C9.44771525,4 9,3.55228475 9,3 C9,2.44771525 9.44771525,2 10,2 L14,2 C14.5522847,2 15,2.44771525 15,3 C15,3.55228475 14.5522847,4 14,4 L13,4 L13,5.06189375 Z" fill="#000000" /> 
			                             <path d="M16.7099142,6.53272645 L17.5355339,5.70710678 C17.9260582,5.31658249 18.5592232,5.31658249 18.9497475,5.70710678 C19.3402718,6.09763107 19.3402718,6.73079605 18.9497475,7.12132034 L18.1671361,7.90393167 C17.7407802,7.38854954 17.251061,6.92750259 16.7099142,6.53272645 Z" fill="#000000" /> 
			                             <path d="M11.9630156,7.5 L12.0369844,7.5 C12.2982526,7.5 12.5154733,7.70115317 12.5355117,7.96165175 L12.9585886,13.4616518 C12.9797677,13.7369807 12.7737386,13.9773481 12.4984096,13.9985272 C12.4856504,13.9995087 12.4728582,14 12.4600614,14 L11.5399386,14 C11.2637963,14 11.0399386,13.7761424 11.0399386,13.5 C11.0399386,13.4872031 11.0404299,13.4744109 11.0414114,13.4616518 L11.4644883,7.96165175 C11.4845267,7.70115317 11.7017474,7.5 11.9630156,7.5 Z" fill="#000000" /> 
			                            </g> 
			                           </svg>&nbsp;重置周期： 
			                           <b class="kt-text-themecolor">{if $shop->reset() == 0 }到期清零{else}每 {$shop->reset()}天 重置{/if}</b> 
			                          </div> 
			                          <div class="mb-2"> 
			                           <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="24px" height="24px" viewbox="0 0 24 24" version="1.1" class="kt-svg-icon"> 
			                            <g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd"> 
			                             <rect x="0" y="0" width="24" height="24" /> 
			                             <path d="M8,2.5 C7.30964406,2.5 6.75,3.05964406 6.75,3.75 L6.75,20.25 C6.75,20.9403559 7.30964406,21.5 8,21.5 L16,21.5 C16.6903559,21.5 17.25,20.9403559 17.25,20.25 L17.25,3.75 C17.25,3.05964406 16.6903559,2.5 16,2.5 L8,2.5 Z" fill="#000000" opacity="0.3" /> 
			                             <path d="M8,2.5 C7.30964406,2.5 6.75,3.05964406 6.75,3.75 L6.75,20.25 C6.75,20.9403559 7.30964406,21.5 8,21.5 L16,21.5 C16.6903559,21.5 17.25,20.9403559 17.25,20.25 L17.25,3.75 C17.25,3.05964406 16.6903559,2.5 16,2.5 L8,2.5 Z M8,1 L16,1 C17.5187831,1 18.75,2.23121694 18.75,3.75 L18.75,20.25 C18.75,21.7687831 17.5187831,23 16,23 L8,23 C6.48121694,23 5.25,21.7687831 5.25,20.25 L5.25,3.75 C5.25,2.23121694 6.48121694,1 8,1 Z M9.5,1.75 L14.5,1.75 C14.7761424,1.75 15,1.97385763 15,2.25 L15,3.25 C15,3.52614237 14.7761424,3.75 14.5,3.75 L9.5,3.75 C9.22385763,3.75 9,3.52614237 9,3.25 L9,2.25 C9,1.97385763 9.22385763,1.75 9.5,1.75 Z" fill="#000000" fill-rule="nonzero" /> 
			                            </g> 
			                           </svg>&nbsp;同时在线： 
			                           <b class="kt-text-themecolor">{if !$shop->connector()=='0'}{$shop->connector()} 个{else}不限{/if}客户端</b> 
			                          </div> 
			                          <div class="mb-2"> 
			                           <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="24px" height="24px" viewbox="0 0 24 24" version="1.1" class="kt-svg-icon"> 
			                            <g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd"> 
			                             <rect x="0" y="0" width="24" height="24" /> 
			                             <rect fill="#000000" opacity="0.3" x="2" y="3" width="20" height="18" rx="2" /> 
			                             <path d="M9.9486833,13.3162278 C9.81256925,13.7245699 9.43043041,14 9,14 L5,14 C4.44771525,14 4,13.5522847 4,13 C4,12.4477153 4.44771525,12 5,12 L8.27924078,12 L10.0513167,6.68377223 C10.367686,5.73466443 11.7274983,5.78688777 11.9701425,6.75746437 L13.8145063,14.1349195 L14.6055728,12.5527864 C14.7749648,12.2140024 15.1212279,12 15.5,12 L19,12 C19.5522847,12 20,12.4477153 20,13 C20,13.5522847 19.5522847,14 19,14 L16.118034,14 L14.3944272,17.4472136 C13.9792313,18.2776054 12.7550291,18.143222 12.5298575,17.2425356 L10.8627389,10.5740611 L9.9486833,13.3162278 Z" fill="#000000" fill-rule="nonzero" /> 
			                             <circle fill="#000000" opacity="0.3" cx="19" cy="6" r="1" /> 
			                            </g> 
			                           </svg>&nbsp;峰值速率： 
			                           <b class="kt-text-themecolor">{if !$shop->speedlimit()=='0'}{$shop->speedlimit()} {else}不限{/if} Mbps</b> 
			                         </div>
								</ul>
							</div>
							<div class="card-footer bg-primary">
								<a href="javascript:void(0);" class="text-white" onclick="{if $user->quantitypay == '1'}nobuy(){else}buy('{$shop->id}',{$shop->auto_renew}){/if}"><i class="fa fa-arrow-right"></i>&nbsp;&nbsp;立即订阅</a>
							</div>
						</div>
					</div>
					{/foreach}
					</div>
				</div><!--row-->
				{/if}
				
				{if count($shops_p_c3) != 0}
				<div class="tab-pane fade" id="tabs-icons-text-3" role="tabpanel" aria-labelledby="tabs-icons-text-3-tab">
					<div class="row card-wrapper">
					{foreach $shops_p_c3 as $shop}
					<div class="col-lg-4 col-md-6 col-sm-6">
					 <!-- Pricing card -->
						<div class="card card-pricing border-0 text-center mb-4">
							<div class="card-header">
								<h4 class="text-primary" style="margin:0 auto">{$shop->name}</h4>
							</div>
							<hr />
							<div class="card-body px-lg-7">
								<div class="shop-title">￥{$shop->price}</div>
								<span class=" text-muted">每次续费</span>
									<ul class="shop-info my-3" style="text-align:left">
									<div class="mb-2"> 
			                           <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="24px" height="24px" viewbox="0 0 24 24" version="1.1" class="kt-svg-icon"> 
			                            <g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd"> 
			                             <rect x="0" y="0" width="24" height="24" /> 
			                             <path d="M5,5 L5,15 C5,15.5948613 5.25970314,16.1290656 5.6719139,16.4954176 C5.71978107,16.5379595 5.76682388,16.5788906 5.81365532,16.6178662 C5.82524933,16.6294602 15,7.45470952 15,7.45470952 C15,6.9962515 15,6.17801499 15,5 L5,5 Z M5,3 L15,3 C16.1045695,3 17,3.8954305 17,5 L17,15 C17,17.209139 15.209139,19 13,19 L7,19 C4.790861,19 3,17.209139 3,15 L3,5 C3,3.8954305 3.8954305,3 5,3 Z" fill="#000000" fill-rule="nonzero" transform="translate(10.000000, 11.000000) rotate(-315.000000) translate(-10.000000, -11.000000) " /> 
			                             <path d="M20,22 C21.6568542,22 23,20.6568542 23,19 C23,17.8954305 22,16.2287638 20,14 C18,16.2287638 17,17.8954305 17,19 C17,20.6568542 18.3431458,22 20,22 Z" fill="#000000" opacity="0.3" /> 
			                            </g> 
			                           </svg> {if !$shop->bandwidth()=='0'}套餐流量： 
			                           <b>{$shop->bandwidth()} GB</b>{else}&nbsp;套餐流量：<b>无限量</b>{/if} 
			                          </div> 
			                          <div class="mb-2"> 
			                           <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="24px" height="24px" viewbox="0 0 24 24" version="1.1" class="kt-svg-icon"> 
			                            <g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd"> 
			                             <polygon points="0 0 24 0 24 24 0 24" /> 
			                             <path d="M11.2600599,5.81393408 L2,16 L22,16 L12.7399401,5.81393408 C12.3684331,5.40527646 11.7359848,5.37515988 11.3273272,5.7466668 C11.3038503,5.7680094 11.2814025,5.79045722 11.2600599,5.81393408 Z" fill="#000000" opacity="0.3" /> 
			                             <path d="M12.0056789,15.7116802 L20.2805786,6.85290308 C20.6575758,6.44930487 21.2903735,6.42774054 21.6939717,6.8047378 C21.8964274,6.9938498 22.0113578,7.25847607 22.0113578,7.535517 L22.0113578,20 L16.0113578,20 L2,20 L2,7.535517 C2,7.25847607 2.11493033,6.9938498 2.31738608,6.8047378 C2.72098429,6.42774054 3.35378194,6.44930487 3.7307792,6.85290308 L12.0056789,15.7116802 Z" fill="#000000" /> 
			                            </g> 
			                           </svg>&nbsp;会员等级： 
			                           <b>[Lv.{$shop->user_class()}]会员</b> 
			                          </div> 
			                          <div class="mb-2"> 
			                           <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="24px" height="24px" viewbox="0 0 24 24" version="1.1" class="kt-svg-icon"> 
			                            <g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd"> 
			                             <polygon points="0 0 24 0 24 24 0 24" /> 
			                             <path d="M12,4.25932872 C12.1488635,4.25921584 12.3000368,4.29247316 12.4425657,4.36281539 C12.6397783,4.46014562 12.7994058,4.61977315 12.8967361,4.81698575 L14.9389263,8.95491503 L19.5054023,9.61846284 C20.0519472,9.69788046 20.4306287,10.2053233 20.351211,10.7518682 C20.3195865,10.9695052 20.2170993,11.1706476 20.0596157,11.3241562 L16.7552826,14.545085 L17.5353298,19.0931094 C17.6286908,19.6374458 17.263103,20.1544017 16.7187666,20.2477627 C16.5020089,20.2849396 16.2790408,20.2496249 16.0843804,20.1472858 L12,18 L12,4.25932872 Z" fill="#000000" opacity="0.3" /> 
			                             <path d="M12,4.25932872 L12,18 L7.91561963,20.1472858 C7.42677504,20.4042866 6.82214789,20.2163401 6.56514708,19.7274955 C6.46280801,19.5328351 6.42749334,19.309867 6.46467018,19.0931094 L7.24471742,14.545085 L3.94038429,11.3241562 C3.54490071,10.938655 3.5368084,10.3055417 3.92230962,9.91005817 C4.07581822,9.75257453 4.27696063,9.65008735 4.49459766,9.61846284 L9.06107374,8.95491503 L11.1032639,4.81698575 C11.277344,4.464261 11.6315987,4.25960807 12,4.25932872 Z" fill="#000000" /> 
			                            </g> 
			                           </svg>{if !$shop->expire()=='0'}&nbsp;等级时长： 
			                           <b>{$shop->class_expire()} 天</b>{else}&nbsp;等级时长：<b>无限期</b>{/if} 
			                          </div> 
			                          <div class="mb-2"> 
			                           <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="24px" height="24px" viewbox="0 0 24 24" version="1.1" class="kt-svg-icon"> 
			                            <g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd"> 
			                             <rect x="0" y="0" width="24" height="24" /> 
			                             <path d="M12,21 C7.581722,21 4,17.418278 4,13 C4,8.581722 7.581722,5 12,5 C16.418278,5 20,8.581722 20,13 C20,17.418278 16.418278,21 12,21 Z" fill="#000000" opacity="0.3" /> 
			                             <path d="M13,5.06189375 C12.6724058,5.02104333 12.3386603,5 12,5 C11.6613397,5 11.3275942,5.02104333 11,5.06189375 L11,4 L10,4 C9.44771525,4 9,3.55228475 9,3 C9,2.44771525 9.44771525,2 10,2 L14,2 C14.5522847,2 15,2.44771525 15,3 C15,3.55228475 14.5522847,4 14,4 L13,4 L13,5.06189375 Z" fill="#000000" /> 
			                             <path d="M16.7099142,6.53272645 L17.5355339,5.70710678 C17.9260582,5.31658249 18.5592232,5.31658249 18.9497475,5.70710678 C19.3402718,6.09763107 19.3402718,6.73079605 18.9497475,7.12132034 L18.1671361,7.90393167 C17.7407802,7.38854954 17.251061,6.92750259 16.7099142,6.53272645 Z" fill="#000000" /> 
			                             <path d="M11.9630156,7.5 L12.0369844,7.5 C12.2982526,7.5 12.5154733,7.70115317 12.5355117,7.96165175 L12.9585886,13.4616518 C12.9797677,13.7369807 12.7737386,13.9773481 12.4984096,13.9985272 C12.4856504,13.9995087 12.4728582,14 12.4600614,14 L11.5399386,14 C11.2637963,14 11.0399386,13.7761424 11.0399386,13.5 C11.0399386,13.4872031 11.0404299,13.4744109 11.0414114,13.4616518 L11.4644883,7.96165175 C11.4845267,7.70115317 11.7017474,7.5 11.9630156,7.5 Z" fill="#000000" /> 
			                            </g> 
			                           </svg>&nbsp;重置周期： 
			                           <b class="kt-text-themecolor">{if $shop->reset() == 0 }到期清零{else}每 {$shop->reset()}天 重置{/if}</b> 
			                          </div> 
			                          <div class="mb-2"> 
			                           <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="24px" height="24px" viewbox="0 0 24 24" version="1.1" class="kt-svg-icon"> 
			                            <g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd"> 
			                             <rect x="0" y="0" width="24" height="24" /> 
			                             <path d="M8,2.5 C7.30964406,2.5 6.75,3.05964406 6.75,3.75 L6.75,20.25 C6.75,20.9403559 7.30964406,21.5 8,21.5 L16,21.5 C16.6903559,21.5 17.25,20.9403559 17.25,20.25 L17.25,3.75 C17.25,3.05964406 16.6903559,2.5 16,2.5 L8,2.5 Z" fill="#000000" opacity="0.3" /> 
			                             <path d="M8,2.5 C7.30964406,2.5 6.75,3.05964406 6.75,3.75 L6.75,20.25 C6.75,20.9403559 7.30964406,21.5 8,21.5 L16,21.5 C16.6903559,21.5 17.25,20.9403559 17.25,20.25 L17.25,3.75 C17.25,3.05964406 16.6903559,2.5 16,2.5 L8,2.5 Z M8,1 L16,1 C17.5187831,1 18.75,2.23121694 18.75,3.75 L18.75,20.25 C18.75,21.7687831 17.5187831,23 16,23 L8,23 C6.48121694,23 5.25,21.7687831 5.25,20.25 L5.25,3.75 C5.25,2.23121694 6.48121694,1 8,1 Z M9.5,1.75 L14.5,1.75 C14.7761424,1.75 15,1.97385763 15,2.25 L15,3.25 C15,3.52614237 14.7761424,3.75 14.5,3.75 L9.5,3.75 C9.22385763,3.75 9,3.52614237 9,3.25 L9,2.25 C9,1.97385763 9.22385763,1.75 9.5,1.75 Z" fill="#000000" fill-rule="nonzero" /> 
			                            </g> 
			                           </svg>&nbsp;同时在线： 
			                           <b class="kt-text-themecolor">{if !$shop->connector()=='0'}{$shop->connector()} 个{else}不限{/if}客户端</b> 
			                          </div> 
			                          <div class="mb-2"> 
			                           <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="24px" height="24px" viewbox="0 0 24 24" version="1.1" class="kt-svg-icon"> 
			                            <g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd"> 
			                             <rect x="0" y="0" width="24" height="24" /> 
			                             <rect fill="#000000" opacity="0.3" x="2" y="3" width="20" height="18" rx="2" /> 
			                             <path d="M9.9486833,13.3162278 C9.81256925,13.7245699 9.43043041,14 9,14 L5,14 C4.44771525,14 4,13.5522847 4,13 C4,12.4477153 4.44771525,12 5,12 L8.27924078,12 L10.0513167,6.68377223 C10.367686,5.73466443 11.7274983,5.78688777 11.9701425,6.75746437 L13.8145063,14.1349195 L14.6055728,12.5527864 C14.7749648,12.2140024 15.1212279,12 15.5,12 L19,12 C19.5522847,12 20,12.4477153 20,13 C20,13.5522847 19.5522847,14 19,14 L16.118034,14 L14.3944272,17.4472136 C13.9792313,18.2776054 12.7550291,18.143222 12.5298575,17.2425356 L10.8627389,10.5740611 L9.9486833,13.3162278 Z" fill="#000000" fill-rule="nonzero" /> 
			                             <circle fill="#000000" opacity="0.3" cx="19" cy="6" r="1" /> 
			                            </g> 
			                           </svg>&nbsp;峰值速率： 
			                           <b class="kt-text-themecolor">{if !$shop->speedlimit()=='0'}{$shop->speedlimit()} {else}不限{/if} Mbps</b> 
			                         </div>
								</ul>
							</div>
							<div class="card-footer bg-primary">
								<a href="javascript:void(0);" class="text-white" onclick="{if $user->quantitypay == '1'}nobuy(){else}buy('{$shop->id}',{$shop->auto_renew}){/if}"><i class="fa fa-arrow-right"></i>&nbsp;&nbsp;立即订阅</a>
							</div>
						</div>
					</div>
					{/foreach}
					</div>
				</div><!--row-->
				{/if}
				
				{if count($shops_p_c4) != 0}
				<div class="tab-pane fade" id="tabs-icons-text-4" role="tabpanel" aria-labelledby="tabs-icons-text-4-tab">
					<div class="row card-wrapper">
					{foreach $shops_p_c4 as $shop}
					<div class="col-lg-4 col-md-6 col-sm-6">
					 <!-- Pricing card -->
						<div class="card card-pricing border-0 text-center mb-4">
							<div class="card-header">
								<h4 class="text-primary" style="margin:0 auto">{$shop->name}</h4>
							</div>
							<hr />
							<div class="card-body px-lg-7">
								<div class="shop-title">￥{$shop->price}</div>
								<span class=" text-muted">每次续费</span>
									<ul class="shop-info my-3" style="text-align:left">
									<div class="mb-2"> 
			                           <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="24px" height="24px" viewbox="0 0 24 24" version="1.1" class="kt-svg-icon"> 
			                            <g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd"> 
			                             <rect x="0" y="0" width="24" height="24" /> 
			                             <path d="M5,5 L5,15 C5,15.5948613 5.25970314,16.1290656 5.6719139,16.4954176 C5.71978107,16.5379595 5.76682388,16.5788906 5.81365532,16.6178662 C5.82524933,16.6294602 15,7.45470952 15,7.45470952 C15,6.9962515 15,6.17801499 15,5 L5,5 Z M5,3 L15,3 C16.1045695,3 17,3.8954305 17,5 L17,15 C17,17.209139 15.209139,19 13,19 L7,19 C4.790861,19 3,17.209139 3,15 L3,5 C3,3.8954305 3.8954305,3 5,3 Z" fill="#000000" fill-rule="nonzero" transform="translate(10.000000, 11.000000) rotate(-315.000000) translate(-10.000000, -11.000000) " /> 
			                             <path d="M20,22 C21.6568542,22 23,20.6568542 23,19 C23,17.8954305 22,16.2287638 20,14 C18,16.2287638 17,17.8954305 17,19 C17,20.6568542 18.3431458,22 20,22 Z" fill="#000000" opacity="0.3" /> 
			                            </g> 
			                           </svg> {if !$shop->bandwidth()=='0'}套餐流量：
			                           <b>{$shop->bandwidth()} GB</b>{else}&nbsp;套餐流量：<b>无限量</b>{/if} 
			                          </div> 
			                          <div class="mb-2"> 
			                           <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="24px" height="24px" viewbox="0 0 24 24" version="1.1" class="kt-svg-icon"> 
			                            <g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd"> 
			                             <polygon points="0 0 24 0 24 24 0 24" /> 
			                             <path d="M11.2600599,5.81393408 L2,16 L22,16 L12.7399401,5.81393408 C12.3684331,5.40527646 11.7359848,5.37515988 11.3273272,5.7466668 C11.3038503,5.7680094 11.2814025,5.79045722 11.2600599,5.81393408 Z" fill="#000000" opacity="0.3" /> 
			                             <path d="M12.0056789,15.7116802 L20.2805786,6.85290308 C20.6575758,6.44930487 21.2903735,6.42774054 21.6939717,6.8047378 C21.8964274,6.9938498 22.0113578,7.25847607 22.0113578,7.535517 L22.0113578,20 L16.0113578,20 L2,20 L2,7.535517 C2,7.25847607 2.11493033,6.9938498 2.31738608,6.8047378 C2.72098429,6.42774054 3.35378194,6.44930487 3.7307792,6.85290308 L12.0056789,15.7116802 Z" fill="#000000" /> 
			                            </g> 
			                           </svg>&nbsp;会员等级： 
			                           <b>[Lv.{$shop->user_class()}]会员</b> 
			                          </div> 
			                          <div class="mb-2"> 
			                           <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="24px" height="24px" viewbox="0 0 24 24" version="1.1" class="kt-svg-icon"> 
			                            <g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd"> 
			                             <polygon points="0 0 24 0 24 24 0 24" /> 
			                             <path d="M12,4.25932872 C12.1488635,4.25921584 12.3000368,4.29247316 12.4425657,4.36281539 C12.6397783,4.46014562 12.7994058,4.61977315 12.8967361,4.81698575 L14.9389263,8.95491503 L19.5054023,9.61846284 C20.0519472,9.69788046 20.4306287,10.2053233 20.351211,10.7518682 C20.3195865,10.9695052 20.2170993,11.1706476 20.0596157,11.3241562 L16.7552826,14.545085 L17.5353298,19.0931094 C17.6286908,19.6374458 17.263103,20.1544017 16.7187666,20.2477627 C16.5020089,20.2849396 16.2790408,20.2496249 16.0843804,20.1472858 L12,18 L12,4.25932872 Z" fill="#000000" opacity="0.3" /> 
			                             <path d="M12,4.25932872 L12,18 L7.91561963,20.1472858 C7.42677504,20.4042866 6.82214789,20.2163401 6.56514708,19.7274955 C6.46280801,19.5328351 6.42749334,19.309867 6.46467018,19.0931094 L7.24471742,14.545085 L3.94038429,11.3241562 C3.54490071,10.938655 3.5368084,10.3055417 3.92230962,9.91005817 C4.07581822,9.75257453 4.27696063,9.65008735 4.49459766,9.61846284 L9.06107374,8.95491503 L11.1032639,4.81698575 C11.277344,4.464261 11.6315987,4.25960807 12,4.25932872 Z" fill="#000000" /> 
			                            </g> 
			                           </svg>{if !$shop->expire()=='0'}&nbsp;等级时长： 
			                           <b>{$shop->class_expire()} 天</b>{else}&nbsp;等级时长：<b>无限期</b>{/if} 
			                          </div> 
			                          <div class="mb-2"> 
			                           <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="24px" height="24px" viewbox="0 0 24 24" version="1.1" class="kt-svg-icon"> 
			                            <g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd"> 
			                             <rect x="0" y="0" width="24" height="24" /> 
			                             <path d="M12,21 C7.581722,21 4,17.418278 4,13 C4,8.581722 7.581722,5 12,5 C16.418278,5 20,8.581722 20,13 C20,17.418278 16.418278,21 12,21 Z" fill="#000000" opacity="0.3" /> 
			                             <path d="M13,5.06189375 C12.6724058,5.02104333 12.3386603,5 12,5 C11.6613397,5 11.3275942,5.02104333 11,5.06189375 L11,4 L10,4 C9.44771525,4 9,3.55228475 9,3 C9,2.44771525 9.44771525,2 10,2 L14,2 C14.5522847,2 15,2.44771525 15,3 C15,3.55228475 14.5522847,4 14,4 L13,4 L13,5.06189375 Z" fill="#000000" /> 
			                             <path d="M16.7099142,6.53272645 L17.5355339,5.70710678 C17.9260582,5.31658249 18.5592232,5.31658249 18.9497475,5.70710678 C19.3402718,6.09763107 19.3402718,6.73079605 18.9497475,7.12132034 L18.1671361,7.90393167 C17.7407802,7.38854954 17.251061,6.92750259 16.7099142,6.53272645 Z" fill="#000000" /> 
			                             <path d="M11.9630156,7.5 L12.0369844,7.5 C12.2982526,7.5 12.5154733,7.70115317 12.5355117,7.96165175 L12.9585886,13.4616518 C12.9797677,13.7369807 12.7737386,13.9773481 12.4984096,13.9985272 C12.4856504,13.9995087 12.4728582,14 12.4600614,14 L11.5399386,14 C11.2637963,14 11.0399386,13.7761424 11.0399386,13.5 C11.0399386,13.4872031 11.0404299,13.4744109 11.0414114,13.4616518 L11.4644883,7.96165175 C11.4845267,7.70115317 11.7017474,7.5 11.9630156,7.5 Z" fill="#000000" /> 
			                            </g> 
			                           </svg>&nbsp;重置周期： 
			                           <b class="kt-text-themecolor">{if $shop->reset() == 0 }到期清零{else}每 {$shop->reset()}天 重置{/if}</b> 
			                          </div> 
			                          <div class="mb-2"> 
			                           <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="24px" height="24px" viewbox="0 0 24 24" version="1.1" class="kt-svg-icon"> 
			                            <g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd"> 
			                             <rect x="0" y="0" width="24" height="24" /> 
			                             <path d="M8,2.5 C7.30964406,2.5 6.75,3.05964406 6.75,3.75 L6.75,20.25 C6.75,20.9403559 7.30964406,21.5 8,21.5 L16,21.5 C16.6903559,21.5 17.25,20.9403559 17.25,20.25 L17.25,3.75 C17.25,3.05964406 16.6903559,2.5 16,2.5 L8,2.5 Z" fill="#000000" opacity="0.3" /> 
			                             <path d="M8,2.5 C7.30964406,2.5 6.75,3.05964406 6.75,3.75 L6.75,20.25 C6.75,20.9403559 7.30964406,21.5 8,21.5 L16,21.5 C16.6903559,21.5 17.25,20.9403559 17.25,20.25 L17.25,3.75 C17.25,3.05964406 16.6903559,2.5 16,2.5 L8,2.5 Z M8,1 L16,1 C17.5187831,1 18.75,2.23121694 18.75,3.75 L18.75,20.25 C18.75,21.7687831 17.5187831,23 16,23 L8,23 C6.48121694,23 5.25,21.7687831 5.25,20.25 L5.25,3.75 C5.25,2.23121694 6.48121694,1 8,1 Z M9.5,1.75 L14.5,1.75 C14.7761424,1.75 15,1.97385763 15,2.25 L15,3.25 C15,3.52614237 14.7761424,3.75 14.5,3.75 L9.5,3.75 C9.22385763,3.75 9,3.52614237 9,3.25 L9,2.25 C9,1.97385763 9.22385763,1.75 9.5,1.75 Z" fill="#000000" fill-rule="nonzero" /> 
			                            </g> 
			                           </svg>&nbsp;同时在线： 
			                           <b class="kt-text-themecolor">{if !$shop->connector()=='0'}{$shop->connector()} 个{else}不限{/if}客户端</b> 
			                          </div> 
			                          <div class="mb-2"> 
			                           <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="24px" height="24px" viewbox="0 0 24 24" version="1.1" class="kt-svg-icon"> 
			                            <g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd"> 
			                             <rect x="0" y="0" width="24" height="24" /> 
			                             <rect fill="#000000" opacity="0.3" x="2" y="3" width="20" height="18" rx="2" /> 
			                             <path d="M9.9486833,13.3162278 C9.81256925,13.7245699 9.43043041,14 9,14 L5,14 C4.44771525,14 4,13.5522847 4,13 C4,12.4477153 4.44771525,12 5,12 L8.27924078,12 L10.0513167,6.68377223 C10.367686,5.73466443 11.7274983,5.78688777 11.9701425,6.75746437 L13.8145063,14.1349195 L14.6055728,12.5527864 C14.7749648,12.2140024 15.1212279,12 15.5,12 L19,12 C19.5522847,12 20,12.4477153 20,13 C20,13.5522847 19.5522847,14 19,14 L16.118034,14 L14.3944272,17.4472136 C13.9792313,18.2776054 12.7550291,18.143222 12.5298575,17.2425356 L10.8627389,10.5740611 L9.9486833,13.3162278 Z" fill="#000000" fill-rule="nonzero" /> 
			                             <circle fill="#000000" opacity="0.3" cx="19" cy="6" r="1" /> 
			                            </g> 
			                           </svg>&nbsp;峰值速率： 
			                           <b class="kt-text-themecolor">{if !$shop->speedlimit()=='0'}{$shop->speedlimit()} {else}不限{/if} Mbps</b> 
			                         </div>
								</ul>
							</div>
							<div class="card-footer bg-primary">
								<a href="javascript:void(0);" class="text-white" onclick="{if $user->quantitypay == '1'}nobuy(){else}buy('{$shop->id}',{$shop->auto_renew}){/if}"><i class="fa fa-arrow-right"></i>&nbsp;&nbsp;立即试用</a>
							</div>
						</div>
					</div>
					{/foreach}
					</div>
				</div>
				<!--row-->
				{/if}
		
				{if $Cool_Config['enable_shop_trail'] == true && $user->class <= 0}
				<div class="tab-pane fade" id="tabs-icons-text-5" role="tabpanel" aria-labelledby="tabs-icons-text-5-tab">
					<div class="row card-wrapper">
					{foreach $shops as $shop}
						{if $shop->id == $Cool_Config['shop_trail_shopid']}
						<div class="col-lg-4 col-md-6 col-sm-6">
						 <!-- Pricing card -->
							<div class="card card-pricing border-0 text-center mb-4">
								<div class="card-header">
									<h4 class="text-primary" style="margin:0 auto">{$shop->name}</h4>
								</div>
								<hr />
								<div class="card-body px-lg-7">
									<div class="shop-title">￥{$shop->price}</div>
									<span class=" text-muted">每次续费</span>
										<ul class="shop-info my-3" style="text-align:left">
										<div class="mb-2"> 
				                           <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="24px" height="24px" viewbox="0 0 24 24" version="1.1" class="kt-svg-icon"> 
				                            <g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd"> 
				                             <rect x="0" y="0" width="24" height="24" /> 
				                             <path d="M5,5 L5,15 C5,15.5948613 5.25970314,16.1290656 5.6719139,16.4954176 C5.71978107,16.5379595 5.76682388,16.5788906 5.81365532,16.6178662 C5.82524933,16.6294602 15,7.45470952 15,7.45470952 C15,6.9962515 15,6.17801499 15,5 L5,5 Z M5,3 L15,3 C16.1045695,3 17,3.8954305 17,5 L17,15 C17,17.209139 15.209139,19 13,19 L7,19 C4.790861,19 3,17.209139 3,15 L3,5 C3,3.8954305 3.8954305,3 5,3 Z" fill="#000000" fill-rule="nonzero" transform="translate(10.000000, 11.000000) rotate(-315.000000) translate(-10.000000, -11.000000) " /> 
				                             <path d="M20,22 C21.6568542,22 23,20.6568542 23,19 C23,17.8954305 22,16.2287638 20,14 C18,16.2287638 17,17.8954305 17,19 C17,20.6568542 18.3431458,22 20,22 Z" fill="#000000" opacity="0.3" /> 
				                            </g> 
				                           </svg> {if !$shop->bandwidth()=='0'}套餐流量： 
				                           <b>{$shop->bandwidth()} GB</b>{else}&nbsp;套餐流量：<b>无限量</b>{/if} 
				                          </div> 
				                          <div class="mb-2"> 
				                           <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="24px" height="24px" viewbox="0 0 24 24" version="1.1" class="kt-svg-icon"> 
				                            <g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd"> 
				                             <polygon points="0 0 24 0 24 24 0 24" /> 
				                             <path d="M11.2600599,5.81393408 L2,16 L22,16 L12.7399401,5.81393408 C12.3684331,5.40527646 11.7359848,5.37515988 11.3273272,5.7466668 C11.3038503,5.7680094 11.2814025,5.79045722 11.2600599,5.81393408 Z" fill="#000000" opacity="0.3" /> 
				                             <path d="M12.0056789,15.7116802 L20.2805786,6.85290308 C20.6575758,6.44930487 21.2903735,6.42774054 21.6939717,6.8047378 C21.8964274,6.9938498 22.0113578,7.25847607 22.0113578,7.535517 L22.0113578,20 L16.0113578,20 L2,20 L2,7.535517 C2,7.25847607 2.11493033,6.9938498 2.31738608,6.8047378 C2.72098429,6.42774054 3.35378194,6.44930487 3.7307792,6.85290308 L12.0056789,15.7116802 Z" fill="#000000" /> 
				                            </g> 
				                           </svg>&nbsp;会员等级： 
				                           <b>[Lv.{$shop->user_class()}]会员</b> 
				                          </div> 
				                          <div class="mb-2"> 
				                           <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="24px" height="24px" viewbox="0 0 24 24" version="1.1" class="kt-svg-icon"> 
				                            <g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd"> 
				                             <polygon points="0 0 24 0 24 24 0 24" /> 
				                             <path d="M12,4.25932872 C12.1488635,4.25921584 12.3000368,4.29247316 12.4425657,4.36281539 C12.6397783,4.46014562 12.7994058,4.61977315 12.8967361,4.81698575 L14.9389263,8.95491503 L19.5054023,9.61846284 C20.0519472,9.69788046 20.4306287,10.2053233 20.351211,10.7518682 C20.3195865,10.9695052 20.2170993,11.1706476 20.0596157,11.3241562 L16.7552826,14.545085 L17.5353298,19.0931094 C17.6286908,19.6374458 17.263103,20.1544017 16.7187666,20.2477627 C16.5020089,20.2849396 16.2790408,20.2496249 16.0843804,20.1472858 L12,18 L12,4.25932872 Z" fill="#000000" opacity="0.3" /> 
				                             <path d="M12,4.25932872 L12,18 L7.91561963,20.1472858 C7.42677504,20.4042866 6.82214789,20.2163401 6.56514708,19.7274955 C6.46280801,19.5328351 6.42749334,19.309867 6.46467018,19.0931094 L7.24471742,14.545085 L3.94038429,11.3241562 C3.54490071,10.938655 3.5368084,10.3055417 3.92230962,9.91005817 C4.07581822,9.75257453 4.27696063,9.65008735 4.49459766,9.61846284 L9.06107374,8.95491503 L11.1032639,4.81698575 C11.277344,4.464261 11.6315987,4.25960807 12,4.25932872 Z" fill="#000000" /> 
				                            </g> 
				                           </svg>{if !$shop->expire()=='0'}&nbsp;等级时长： 
				                           <b>{$shop->class_expire()} 天</b>{else}&nbsp;等级时长：<b>无限期</b>{/if} 
				                          </div> 
				                          <div class="mb-2"> 
				                           <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="24px" height="24px" viewbox="0 0 24 24" version="1.1" class="kt-svg-icon"> 
				                            <g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd"> 
				                             <rect x="0" y="0" width="24" height="24" /> 
				                             <path d="M12,21 C7.581722,21 4,17.418278 4,13 C4,8.581722 7.581722,5 12,5 C16.418278,5 20,8.581722 20,13 C20,17.418278 16.418278,21 12,21 Z" fill="#000000" opacity="0.3" /> 
				                             <path d="M13,5.06189375 C12.6724058,5.02104333 12.3386603,5 12,5 C11.6613397,5 11.3275942,5.02104333 11,5.06189375 L11,4 L10,4 C9.44771525,4 9,3.55228475 9,3 C9,2.44771525 9.44771525,2 10,2 L14,2 C14.5522847,2 15,2.44771525 15,3 C15,3.55228475 14.5522847,4 14,4 L13,4 L13,5.06189375 Z" fill="#000000" /> 
				                             <path d="M16.7099142,6.53272645 L17.5355339,5.70710678 C17.9260582,5.31658249 18.5592232,5.31658249 18.9497475,5.70710678 C19.3402718,6.09763107 19.3402718,6.73079605 18.9497475,7.12132034 L18.1671361,7.90393167 C17.7407802,7.38854954 17.251061,6.92750259 16.7099142,6.53272645 Z" fill="#000000" /> 
				                             <path d="M11.9630156,7.5 L12.0369844,7.5 C12.2982526,7.5 12.5154733,7.70115317 12.5355117,7.96165175 L12.9585886,13.4616518 C12.9797677,13.7369807 12.7737386,13.9773481 12.4984096,13.9985272 C12.4856504,13.9995087 12.4728582,14 12.4600614,14 L11.5399386,14 C11.2637963,14 11.0399386,13.7761424 11.0399386,13.5 C11.0399386,13.4872031 11.0404299,13.4744109 11.0414114,13.4616518 L11.4644883,7.96165175 C11.4845267,7.70115317 11.7017474,7.5 11.9630156,7.5 Z" fill="#000000" /> 
				                            </g> 
				                           </svg>&nbsp;重置周期： 
				                           <b class="kt-text-themecolor">{if $shop->reset() == 0 }到期清零{else}每 {$shop->reset()}天 重置{/if}</b> 
				                          </div> 
				                          <div class="mb-2"> 
				                           <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="24px" height="24px" viewbox="0 0 24 24" version="1.1" class="kt-svg-icon"> 
				                            <g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd"> 
				                             <rect x="0" y="0" width="24" height="24" /> 
				                             <path d="M8,2.5 C7.30964406,2.5 6.75,3.05964406 6.75,3.75 L6.75,20.25 C6.75,20.9403559 7.30964406,21.5 8,21.5 L16,21.5 C16.6903559,21.5 17.25,20.9403559 17.25,20.25 L17.25,3.75 C17.25,3.05964406 16.6903559,2.5 16,2.5 L8,2.5 Z" fill="#000000" opacity="0.3" /> 
				                             <path d="M8,2.5 C7.30964406,2.5 6.75,3.05964406 6.75,3.75 L6.75,20.25 C6.75,20.9403559 7.30964406,21.5 8,21.5 L16,21.5 C16.6903559,21.5 17.25,20.9403559 17.25,20.25 L17.25,3.75 C17.25,3.05964406 16.6903559,2.5 16,2.5 L8,2.5 Z M8,1 L16,1 C17.5187831,1 18.75,2.23121694 18.75,3.75 L18.75,20.25 C18.75,21.7687831 17.5187831,23 16,23 L8,23 C6.48121694,23 5.25,21.7687831 5.25,20.25 L5.25,3.75 C5.25,2.23121694 6.48121694,1 8,1 Z M9.5,1.75 L14.5,1.75 C14.7761424,1.75 15,1.97385763 15,2.25 L15,3.25 C15,3.52614237 14.7761424,3.75 14.5,3.75 L9.5,3.75 C9.22385763,3.75 9,3.52614237 9,3.25 L9,2.25 C9,1.97385763 9.22385763,1.75 9.5,1.75 Z" fill="#000000" fill-rule="nonzero" /> 
				                            </g> 
				                           </svg>&nbsp;同时在线： 
				                           <b class="kt-text-themecolor">{if !$shop->connector()=='0'}{$shop->connector()} 个{else}不限{/if}客户端</b> 
				                          </div> 
				                          <div class="mb-2"> 
				                           <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="24px" height="24px" viewbox="0 0 24 24" version="1.1" class="kt-svg-icon"> 
				                            <g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd"> 
				                             <rect x="0" y="0" width="24" height="24" /> 
				                             <rect fill="#000000" opacity="0.3" x="2" y="3" width="20" height="18" rx="2" /> 
				                             <path d="M9.9486833,13.3162278 C9.81256925,13.7245699 9.43043041,14 9,14 L5,14 C4.44771525,14 4,13.5522847 4,13 C4,12.4477153 4.44771525,12 5,12 L8.27924078,12 L10.0513167,6.68377223 C10.367686,5.73466443 11.7274983,5.78688777 11.9701425,6.75746437 L13.8145063,14.1349195 L14.6055728,12.5527864 C14.7749648,12.2140024 15.1212279,12 15.5,12 L19,12 C19.5522847,12 20,12.4477153 20,13 C20,13.5522847 19.5522847,14 19,14 L16.118034,14 L14.3944272,17.4472136 C13.9792313,18.2776054 12.7550291,18.143222 12.5298575,17.2425356 L10.8627389,10.5740611 L9.9486833,13.3162278 Z" fill="#000000" fill-rule="nonzero" /> 
				                             <circle fill="#000000" opacity="0.3" cx="19" cy="6" r="1" /> 
				                            </g> 
				                           </svg>&nbsp;峰值速率： 
				                           <b class="kt-text-themecolor">{if !$shop->speedlimit()=='0'}{$shop->speedlimit()} {else}不限{/if} Mbps</b> 
				                         </div>
									</ul>
								</div>
								<div class="card-footer bg-primary">
									<a href="javascript:void(0);" class="text-white" onclick="buy('{$shop->id}',{$shop->auto_renew})"><i class="fa fa-arrow-right"></i>&nbsp;&nbsp;立即试用</a>
								</div>
							</div>
						</div>
						{/if}
					{/foreach}
					</div>
				</div>
				{/if}
			</div>
	  
				<!--coupon modal-->
			    <div class="modal fade" id="coupon_modal" tabindex="-1" role="dialog" aria-labelledby="couponModalLabel" aria-hidden="true">
				  <div class="modal-dialog modal-dialog-centered" role="document">
				    <div class="modal-content">
				      <div class="modal-header">
				        <h4 id="couponModalLabel" class="ls-2">你有优惠码吗?</h4>
				        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
				          <span aria-hidden="true">&times;</span>
				        </button>
				      </div>
				      <div class="modal-body">
				    	<div id="dailymail-modal-body-content"> 
				    		<p>有的话，请在这里输入</p>
				    		<p>没有的话， 直接确定吧</p> 
							<div class="form-group">
								<label class="form-control-label">输入你的优惠码&nbsp;:&nbsp;</label>
								<input id="coupon" class="form-control" type="text">
							</div>	
						</div>
				      </div>
					  <div class="modal-footer">
		                    <button id="coupon_input" type="button" class="btn btn-primary">确认提交</button>
		               </div>
				    </div>
				  </div>
				</div>
				<div class="modal fade" id="order_modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true"> 
					<div class="modal-dialog modal-dialog-centered" role="document"> 
						<div class="modal-content shadow-lg"> 
							 <div class="modal-header"> 
							  <h4 class="modal-title kt-font-primary" id="exampleModalLongTitle"><strong>订单确认</strong></h4> 
							  <button type="button" class="close" data-dismiss="modal" aria-label="Close">
				        		<span aria-hidden="true">&times;</span>
				        	  </button>
							 </div> 
							 <div class="modal-body"> 
							  <p><font color="red">如您是更换套餐,那剩余流量和有效期将会重置。</font></p> 
							  <p id="name">商品名称：</p> 
							  <p id="credit">优惠额度：</p> 
							  <p id="total">总金额：</p> 
								<fieldset class="checkbox" id="disableo">
	                                <div class="vs-checkbox-con vs-checkbox-primary mb-1">
	                                    <input type="checkbox" checked="" id="disableothers">
	                                    <span class="vs-checkbox">
	                                        <span class="vs-checkbox--check">
	                                            <i class="vs-icon feather icon-check"></i>
	                                        </span>
	                                    </span>
	                                    <span>关闭旧套餐自动续费</span>
	                                </div>
	                                <div class="vs-checkbox-con vs-checkbox-primary">
	                                    <input type="checkbox" id="autorenew">
	                                    <span class="vs-checkbox">
	                                        <span class="vs-checkbox--check">
	                                            <i class="vs-icon feather icon-check"></i>
	                                        </span>
	                                    </span>
	                                    <span>到期时自动续费</span>
	                                </div>
	                            </fieldset>
							 </div> 
							 <div class="modal-footer"> 
							  <button type="button" class="btn btn-success" data-dismiss="modal" id="order_input">确定</button> 
							  <button type="button" class="btn btn-secondary" data-dismiss="modal">取消</button> 
							 </div> 
						</div> 
					</div> 
				</div> 
				
				{if $Cool_Config['quantit_show'] == true }
					<div class="modal fade" id="Byvolume-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true"> 
						<div class="modal-dialog modal-dialog-centered" role="document"> 
							<div class="modal-content shadow-lg">
								<div class="modal-header">
									<h4 class="modal-title"><strong>{if $user->quantitypay == '0'}启用{else}关闭{/if}按量付费</strong></h4> 
									<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						        		<span aria-hidden="true">&times;</span>
						        	</button>
								</div> 
								<div class="modal-body"> 
									{if $user->quantitypay == '0'}
										<p>启用按量付费后，您可获得<code>Level {$Cool_Config['quantit_class']}</code>等级权限，按量付费价格为<code>{$Cool_Config['quantit_money']}RMB/1G</code>，速度限制为<code>{$Cool_Config['quantit_speedlimit']}Mbps</code>，限制<code>{$Cool_Config['quantit_connector']}个</code>设备同时在线，系统自动按您使用的流量在余额中扣费，请确保您有足够的余额。</p>
										{if $Cool_Config['quantit_shop'] == true }
    										<p>
    											<div style="display:inline">为了保障稳定性，按量付费需您购买过正常套餐（不包括试用套餐）后才可启用。按量付费启用后</div>
    											<div style="color:red; display:inline">您的当前套餐将会失效且流量将会被重置，且启用期间您的账户签到将不能获得流量</div>
    											<div style="display:inline">，请您留意。</div>
    										</p>
    									{/if}
									{else}
										<p>关闭按量付费后，您的账号将被重置。</p>
									{/if}
								</div> 
								<div class="modal-footer"> 
									<button type="button" class="btn btn-info waves-effect buyTrafficPackage" onclick="payasyougo()">确认{if $user->quantitypay == '0'}启用{else}关闭{/if}</button> 
									<button type="button" class="btn btn-secondary" data-dismiss="modal">取消</button> 
								</div> 
							</div> 
						</div> 
					</div>
				{/if}
				
				{if $Cool_Config['shop_enable_traffic_package'] == true && $user->class > 0}
					<!--traffic_package modal-->
					<div class="modal fade" id="traffic_package_modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true"> 
						<div class="modal-dialog modal-dialog-centered" role="document"> 
							<div class="modal-content shadow-lg"> 
							<div class="modal-header"> 
								<h4 class="modal-title"><strong>购买流量叠加包</strong></h4> 
								<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					        		<span aria-hidden="true">&times;</span>
					        	</button>
							</div> 
							<div class="modal-body"> 
								<code>流量叠加包在您套餐流量重置时会一起清零，请酌情购买</code> 
								  <div class="mb-2"></div> 
									<p class="description">购买单位: GB （最小单位 <code>50</code> GB）</p>
									<div class="input-group input-group-lg bootstrap-touchspin mb-2">
                                        <span class="input-group-btn input-group-prepend bootstrap-touchspin-injected"></span>
                                        <input type="number" class="touchspin-step form-control" value="50">
                                        <span class="input-group-btn input-group-append bootstrap-touchspin-injected"></span>
                                    </div>
				                    <div class="form-group mt-1">
										<label class="form-control-label">购买价格:（元）</label>
				                        <input id="traffic_price_1" type="hidden" value="{$Cool_Config['shop_traffic_package']}">
										<input id="traffic_price_2" class="form-control" type="num" disabled required>
									</div>
									<div class="custom-control custom-radio mb-2">
										<input type="hidden" id="user_money1" value="{$user->money}">
										<input type="radio" id="pay_code1" name="customRadio" class="custom-control-input" checked>
										<label id="pay_text1" class="custom-control-label" for="pay_code1">余额支付: {$user->money}</label>
									</div>
								 <div class="modal-footer"> 
								  <button type="button" class="btn btn-info waves-effect buyTrafficPackage" onclick="buyTrafficPackage()">购买</button> 
								  <button type="button" class="btn btn-secondary" data-dismiss="modal">取消</button> 
								 </div> 
							</div> 
						</div> 
					</div>
				{/if}
			    </div> 
			</div> 
		</div>	
				
    <!-- END: Content-->

    <!-- BEGIN: Footer-->
		{include file='user/footer.tpl'}
    <!-- END: Footer-->
	<script src="/theme/cool/assets/js/scripts/jquery.bootstrap-touchspin.js"></script>
	<script src="/theme/cool/assets/js/scripts/number-input.js"></script>
	<script>
		var pid = 0;
		function buy(id, auto) {
		    shop = id;
		    $("#coupon_modal").modal();
		}
	</script>
	
	<script>
        function nobuy() {
           Swal.fire({ type: "error",title: '请注意',html: '按量付费不允许购买套餐' });
    	}
    	
    	{if $Cool_Config['shop_enable_traffic_package'] == true && $user->class > 0}
	    	$(function () {
		    	$(".count_price").click(function () {
		    		var a_1 = $('#traffic_price_1').val();
		    		var b_1 = $('.touchspin-step').val();
		    		document.getElementById('traffic_price_2').value = b_1 * a_1;
		    	});
			});
			window.onload=function(){
				var a_1 = $('#traffic_price_1').val();
				var b_1 = $('.touchspin-step').val();
				document.getElementById('traffic_price_2').value = b_1 * a_1;
			}
		{/if}
    </script>
</body>
<!-- END: Body-->
</html>