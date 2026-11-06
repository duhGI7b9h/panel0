<!DOCTYPE html>
<html lang="zh-CN">
 <head> 
  <title>账号已被禁用 — {$config['appName']}</title>
 </head>
 <body>
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
        <h2 class="content-header-title float-left mb-0">账号已禁用</h2> 
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
            <h4>您由于某些原因而被管理员禁用了账户，请联系管理员。</h4>
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
  <!-- BEGIN: Footer-->
  {include file='user/footer.tpl'} 
  <!-- END: Footer-->  
  <!-- END: Body--> 
 </body>
</html>