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
	  <label class="col-form-label text-md-right col-12 col-md-3 col-lg-3">支付方式</label>
	  <div class="col-sm-12 col-md-3">
	    <div class="selectgroup w-100">
          <label class="selectgroup-item">
            <input type="radio" name="payment" value="alipay" data-pay="ALIPAY" class="selectgroup-input alipay" checked="">
            <span class="selectgroup-button selectgroup-button-icon"><i class="fab fa-alipay mr-1"></i>支付宝</span>
          </label>
          <label class="selectgroup-item">
        	<input type="radio" name="payment" value="wechat" data-pay="WXPAY" class="selectgroup-input wechat-pay">
        	<span class="selectgroup-button selectgroup-button-icon"><i class="malio-wechat-pay mr-1" style="vertical-align: -1px"></i>微信</span>
          </label>
	    </div>
	  </div>
	</div>
	<div class="form-group row mb-4">
	  <label class="col-form-label text-md-right col-12 col-md-3 col-lg-3"></label>
	  <div class="col-sm-12 col-md-7">
	    <button onclick="mtpay();" class="btn btn-primary">立即充值</button>
	  </div>
	</div>
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/gh/davidshimjs/qrcodejs@gh-pages/qrcode.min.js"></script>
    <script>
        var pid = 0;
		var type = "WXPAY";
		var type = "ALIPAY";
		
        $(".selectgroup-input").click(function(){
            type = $(this).data("pay");
        });
        
        function mtpay() {
            if (type === 'ALIPAY') {
                if (/Android|webOS|iPhone|iPod|BlackBerry/i.test(navigator.userAgent)) {
                    type = 'ALIPAY_WAP';
                } else {
                    type = 'ALIPAY_WEB';
                }
            }
            var price = parseFloat($("#amount").val());
            
            console.log("将要使用 " + type + " 充值" + price + "元");
            
            $.ajax({
                url: "/user/payment/purchase",
                data: {
                    price: price,
                    type: type,
                },
                dataType: 'json',
                type: "POST",
                success: (data) => {
                    console.log(data);
                    if (data.code == 200) {
                        if(type == 'ALIPAY_WAP' || type == 'ALIPAY_WEB'){
                            window.location.href = data.result.url;
                        }else{
                            pid = data.pid;
                            $('#f2fpay-modal').modal('show');
						    $("#qrarea").html('<div><p>请使用手机扫描二维码支付</p><a id="qrcode" style="padding-top:10px;display:inline-block"></a><br /><br /></div><br />');
                            var qrcode = new QRCode("qrcode", {
                                render: "canvas",
                                width: 200,
                                height: 200,
                                text: data.result.url,
                                correctLevel: QRCode.CorrectLevel.Q
                            });
                            tid = setTimeout(f, 1000); //循环调用触发setTimeout
                        }
                    }else{
                        Swal.fire(data.msg + "  发生了错误。");
                    }
                }
            });
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