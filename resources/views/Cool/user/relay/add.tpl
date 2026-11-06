<!DOCTYPE html>
  <html lang="zh-CN">
   <head> 
    <title>中转规则 — {$config["appName"]}</title> 

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
                            <h2 class="content-header-title float-left mb-0">添加中转规则</h2>
                            <div class="breadcrumb-wrapper col-12">
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item"><a href="/user">Home</a>
                                    </li>
                                    <li class="breadcrumb-item"><a href="/user/relay">My Relay</a>
                                    </li>
                                </ol>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="card-body">
				<p class="description">起源节点&nbsp;:&nbsp;</p>
				<select id="source_node" class="form-control">
					
					<option value="-1">请选择节点</option>
					
				{foreach $source_nodes as $source_node}
					<option value="{$source_node->id}">{$source_node->name}</option>
				{/foreach}	
				</select>
				<p class="description mt-3">目标节点&nbsp;:&nbsp;</p>
				<select id="dist_node" class="form-control">
					<option value="-1">不进行中转</option>
				{foreach $dist_nodes as $dist_node}
					<option value="{$dist_node->id}">{$dist_node->name}</option>
				{/foreach}	
				</select>
				<p class="description mt-3">端口选择&nbsp;:&nbsp;</p>
				<select id="port" class="form-control">
				{foreach $ports as $port}
					<option value="{$port}">{$port}</option>
				{/foreach}	
				</select>
				<div class="form-group mt-3">
					<label class="form-control-label">优先级&nbsp;:&nbsp;</label>
					<input id="priority" class="form-control form-control-sm" type="text" value="0">
				</div>
			</div>
			<div class="modal-footer">
				<button id="create_button" type="button" class="btn btn-primary">确认添加</button>
			</div>
			</div>
		</div>

    <!-- END: Content-->

    <!-- BEGIN: Footer-->
		{include file='user/footer.tpl'}
    <!-- END: Footer-->
	
</body>
<!-- END: Body-->
<script>

   function validateNumber(value){
    var pattern = /^[0-9]\d*$/;
	if (pattern.test(value)) {
      return true; 
    }else{
      return false;
    }
  }  
 $(document).ready(() => {
     function create_button() {
		if (!validateNumber($("#priority").val())) {
            Swal.fire({
                type: "error",
                title: '优先级输入不合法.'
            });
			return;
		}
        if ($("#source_node").val() == "-1" || $("#dist_node").val() == "-1") {
            Swal.fire({
                type: "error",
                title: '起源节点或者目标节点设置错误'
            });
			return;
        }
            $.ajax({
                type: "POST",
                url: "/user/relay",
                dataType: "json",
                data: {
                    source_node: $('#source_node').val(),
                    dist_node: $('#dist_node').val(),
                    port: $('#port').val(),
                    priority: $('#priority').val()

                },
                success: function(data) {
                    if (data.ret) {
                        Swal.fire({
                            type: 'success',
                            title: data.msg,
                            timer: 1500,
                            showConfirmButton: false
                        });
                        setTimeout(function () {
                            window.location.reload();
                        }, 1000);
                    } else {
                        Swal.fire({
                            type: 'error',
                            title: data.msg,
                            timer: 1500,
                            showConfirmButton: false
                        });
                    }
                },
                error: function(jqXHR) {
                    Swal.fire({
                        type: 'error',
                        title: jqXHR,
                        timer: 1500,
                        showConfirmButton: false
                    });
                }
            });
        }
		$("#create_button").click(() => {
            create_button();
        });
    });
</script>
</html>