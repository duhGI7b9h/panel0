<!DOCTYPE html>
<html lang="zh-CN">
 <head> 
  <title>公告详情 — {$config['appName']}</title>
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
        <h2 class="content-header-title float-left mb-0">公告详情</h2> 
       </div> 
      </div> 
     </div> 
    </div> 
    <div class="content-body"> 
     <div class="row"> 
      <div class="col-12"> 
       <div class="card"> 
        <div class="card-content"> 
         <div class="card-body"> 
          <div class="table-responsive"> 
           <table class="table table-hover-animation mb-0"> 
            <thead> 
             <tr> 
              <th>ID</th> 
              <th>日期</th> 
              <th>内容</th> 
             </tr> 
            </thead> 
            <tbody>
				{foreach $anns as $ann} 
					 <tr> 
					  <td>#{$ann->id}</td> 
					  <td>{$ann->date}</td> 
					  <td>{$ann->content}</td> 
					 </tr> 
				{/foreach} 
            </tbody> 
           </table>
          </div> 
         </div> 
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
  
  <!-- END: Body--> 
 </body>
</html>