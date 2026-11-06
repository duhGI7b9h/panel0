	<footer class="footer footer-static footer-light">
        <p class="clearfix blue-grey lighten-2 mb-0">
        	<span class="float-md-left d-block d-md-inline-block mt-25">Copyright &copy; {date("Y")} {$config["appName"]} • Powered by <a class="text-bold-800 grey darken-2" href="/staff" target="_blank">SSPANEL</a></span>
        	<span class="float-md-right d-none d-md-block">Theme for<a class="text-bold-800 grey darken-2" href="https://t.me/Cool_WuKong" target="_blank">Wukong</a><i class="feather icon-heart pink"></i></span>
            <button class="btn btn-primary btn-icon scroll-top waves-effect waves-light" type="button"><i class="feather icon-arrow-up"></i></button>
        </p>
    </footer>

    <!-- BEGIN: Vendor JS-->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="/theme/cool/assets/vendors/js/vendors.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.1/jquery.validate.min.js"></script>
    <!-- BEGIN Vendor JS-->
    
    <!-- BEGIN: Theme JS-->
	<script src="/theme/cool/assets/js/notify.js"></script>
	<script src="/theme/cool/assets/js/clipboard.min.js"></script>
	<script src="/theme/cool/assets/js/sweetalert2.min.js"></script>
	<script src="/theme/cool/assets/js/cool.js?{$Cool_Config['Cool_js_version']}"></script>
    <!-- END: Theme JS-->
	  
	<!-- BEGIN: Page JS-->
    <script src="/theme/cool/assets/js/core/app.js"></script>
    <script src="/theme/cool/assets/js/core/app-menu.js"></script>
	<!-- BEGIN: Page JS-->
	
	<!-- Chat -->
	{if $Cool_Config['enable_crisp'] == true}{include file='crisp.tpl'}{/if}
	{if $Cool_Config['enable_chatra'] == true}{include file='chatra.tpl'}{/if}

    <script>
        function importSublink(client) {
			if (client == 'ssr') {
			  oneclickImport('ssr', '{$subUrl}{$ssr_sub_token}?sub=1');
			};
			if (client == 'clash') {
			  oneclickImport('clashx','{$subUrl}{$ssr_sub_token}?clash=1')
			};
			if (client == 'clashr') {
			  oneclickImport('clashr','{$subUrl}{$ssr_sub_token}?clash=2')
			};
			if (client == 'shadowrocket') {
			  oneclickImport('shadowrocket','{$subUrl}{$ssr_sub_token}?list=shadowrocket')
			};
			if (client == 'quantumult') {
			  oneclickImport('quantumult','{$subUrl}{$ssr_sub_token}?sub=1')
			};
			if (client == 'quantumult_v2') {
			  oneclickImport('quantumult_v2','{$subUrl}{$ssr_sub_token}?list=quantumult')
			};
        }
    </script>