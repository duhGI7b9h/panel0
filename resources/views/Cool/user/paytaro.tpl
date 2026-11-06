    <div class="form-group row mb-2">
    	<label class="col-form-label text-md-right col-12 col-md-3 col-lg-3">金额</label>
    	<div class="col-sm-12 col-md-7">
    		<div class="form-label-group position-relative has-icon-left">
                <input type="text" class="form-control" id="amount" type="num" placeholder="输入充值金额，付款后刷新页面">
                <div class="form-control-position">
                    <i class="fa fa-jpy"></i>
                </div>
            </div>
       </div>
    </div>
    <div class="form-group row mb-4">
      <label class="col-form-label text-md-right col-12 col-md-3 col-lg-3"></label>
      <div class="col-sm-12 col-md-7">
        <button id="pay" onclick="ptpay();" class="btn btn-primary">立即充值</button>
      </div>
    </div>
    <script>
        var pid = 0;
        function ptpay() {
            $.ajax({
                type: "POST",
                url: "/user/payment/purchase",
                dataType: "json",
                data: {
                    amount: parseFloat($("#amount").val())
                },
                success: (data) => {
                	console.log(data)
                	if (data.code === 0) {
                		window.location.href = data.url
                	} else {
                        Swal.fire(data.msg);
                	}
                },
                error: (jqXHR) => {
                    //console.log(jqXHR);
                    Swal.fire(data.msg + "  发生了错误。");
                }
            })
        }
        function f() {
            $.ajax({
                type: "POST",
                url: "/payment/status",
                dataType: "json",
                data: {
                    pid: pid
                },
    			success: (data) => {
    				if (data.result) {
    					Swal({
    						title: "成功充值" + $("#amount").val() + "元",
    						icon: "success",
    						button: "确定",
    					})
    					window.setTimeout("location.href='/user/code'", 1000);
    				}
    			},
    			error: (jqXHR) => {
    				Swal(data.msg + "  发生了错误。");
    			}
            });
            tid = setTimeout(f, 1000); //循环调用触发setTimeout
        }
    </script>