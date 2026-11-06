<!DOCTYPE html>
<html lang="zh-CN">
 <head> 
  <title>购买记录 — {$config['appName']}</title> 
  <meta charset="UTF-8" /> 
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no, user-scalable=no" />
 </head>
 <body>
   {include file='user/header_info.tpl'} 
  <!-- 开始:3:页中 --> 
  <div class="kt-body kt-grid__item kt-grid__item--fluid kt-grid kt-grid--hor kt-grid--stretch" id="kt_body"> 
   <div class="kt-content kt-content--fit-top  kt-grid__item kt-grid__item--fluid kt-grid kt-grid--hor" id="kt_content"> 
    <!-- 开始:4:副标题 --> 
    <div class="kt-subheader kt-grid__item" id="kt_subheader"> 
     <div class="kt-container "> 
      <!-- 开始:5:副标题名称 --> 
      <div class="kt-subheader__main"> 
       <h3 class="kt-subheader__title" id="subtitle">套餐记录</h3> 
      </div> 
      <!-- 结束:5:副标题名称 --> 
     </div> 
    </div> 
    <!-- 结束:4:副标题 --> 
    <!-- 开始:4:内容 --> 
    <div class="kt-container kt-grid__item kt-grid__item--fluid" id="user_code"> 
     <div class="row"> 
      <div class="col-12"> 
       <div class="kt-portlet kt-portlet--mobile  kt-portlet--border-bottom-brand shadow"> 
        <div class="kt-portlet__head kt-portlet__head--lg"> 
         <div class="kt-portlet__head-label"> 
          <h3 class="kt-portlet__head-title kt-font-primary"><i class="fa fa-shopping-bag"></i><strong> 套餐记录</strong></h3> 
         </div> 
        </div> 
        <div class="kt-portlet__body" id="pjax-shops" pjax-shops=""> 
         <div class="table-responsive"> 
          <table id="example23" class="display nowrap table text-nowrap table-striped table-bordered" cellspacing="0" width="100%"> 
           <thead>
             {$shops->render()} 
            <tr> 
             <th><strong>商品名称</strong></th> 
             <th><strong>价格</strong></th> 
             <th><strong>购买时间</strong></th> 
             <th><strong>续费时间</strong></th> 
             <th><strong>续费时重置流量</strong></th> 
             <th><strong>按套餐重置</strong></th> 
             <th><strong>操作</strong></th> 
            </tr> 
           </thead> 
           <tbody>
           {if count($shops) == 0} 
            <tr> 
             <td colspan="7"><strong>无购买记录</strong></td> 
            </tr> 
             
           {else} 
             
              {foreach $shops as $shop} 
                  <tr class="shadow-sm"> 
                     <td>{$shop->shop()->name}</td> 
                     <td>{$shop->price}</td> 
                     <td>{$shop->datetime("Y/m/d",$date_unix)}</td> 
                     {if $shop->renew==0}
                        <td>不自动续费</td> 
                     {else} 
                        <td>{$shop->renew_date()}</td> 
                     {/if} 

                     {if $shop->shop()->auto_reset_bandwidth==0} 
                        <td>不自动重置</td> 
                     {else} 
                        <td>自动重置</td> 
                     {/if} 
                     <td><span class="btn btn-bold btn-sm btn-font-sm  btn-label-success">是</span></td> 

                     {if $shop->renew==0} 
                        <td>无操作</td> 
                     {else} 
                        <td><a href="#" onclick="delete_id('{$shop->id}')" class="btn btn-primary">关闭自动续费</a></td> 
                     {/if} 
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
     <!-- 结束:4:内容 --> 
     <!-- 结束:3:页中 --> 
    </div>
   </div>
  </div>
     {include file='user/footer.tpl'}   
 </body>
</html>