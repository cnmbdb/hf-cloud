<?php /*a:5:{s:64:"/www/wwwroot/cloud.hf.pw2/public/themes/cart/ogmiao/viewcart.tpl";i:1745972482;s:75:"/www/wwwroot/cloud.hf.pw2/public/themes/clientarea/ogmiao/includes/head.tpl";i:1742354372;s:75:"/www/wwwroot/cloud.hf.pw2/public/themes/clientarea/ogmiao/includes/menu.tpl";i:1720065013;s:81:"/www/wwwroot/cloud.hf.pw2/public/themes/clientarea/ogmiao/includes/pageheader.tpl";i:1719999923;s:81:"/www/wwwroot/cloud.hf.pw2/public/themes/clientarea/ogmiao/includes/breadcrumb.tpl";i:1719999923;}*/ ?>

<!DOCTYPE html>
<html lang="zh-CN">

<head>
	<meta charset="utf-8" />
	<title><?php echo $Title; ?> - <?php echo $Setting['company_name']; ?></title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta content="<?php echo $Setting['web_seo_desc']; ?>" name="description" />
	<meta content="<?php echo $Setting['web_seo_keywords']; ?>" name="keywords" />
	<meta content="<?php echo $Setting['company_name']; ?>" name="author" />

	<!-- <link rel="shortcut icon" href="/themes/clientarea/ogmiao/assets/images/favicon.ico"> -->
<link href="/themes/clientarea/ogmiao/assets/css/bootstrap.min.css?v=<?php echo $Ver; ?>" rel="stylesheet" type="text/css" />
<link href="/themes/clientarea/ogmiao/assets/css/icons.min.css?v=<?php echo $Ver; ?>" rel="stylesheet" type="text/css" />
<link href="/themes/clientarea/ogmiao/assets/css/app.min.css?v=<?php echo $Ver; ?>" rel="stylesheet" type="text/css" />
<?php if(($load_css=load_css('custom.css'))): ?>
    <link href="<?php echo $load_css; ?>?v=<?php echo $Ver; ?>" rel="stylesheet" type="text/css" />
<?php endif; ?>
<!-- 自定义全局样式 -->
<link href="/themes/clientarea/ogmiao/assets_custom/css/global.css?v=<?php echo $Ver; ?>" rel="stylesheet" >
<link href="/themes/clientarea/ogmiao/assets_custom/css/responsive.css?v=<?php echo $Ver; ?>" rel="stylesheet">
<!-- 字体图标 -->



 <link href="/themes/clientarea/ogmiao/assets_custom/fonts/iconfont.css?v=<?php echo $Ver; ?>" rel="stylesheet"> 

<!-- JAVASCRIPT -->
<script src="/themes/clientarea/ogmiao/assets/libs/jquery/jquery.min.js?v=<?php echo $Ver; ?>"></script>
<script src="/themes/clientarea/ogmiao/assets/libs/bootstrap/js/bootstrap.bundle.min.js?v=<?php echo $Ver; ?>"></script>
<script src="/themes/clientarea/ogmiao/assets/libs/metismenu/metisMenu.min.js?v=<?php echo $Ver; ?>"></script>
<script src="/themes/clientarea/ogmiao/assets/libs/simplebar/simplebar.min.js?v=<?php echo $Ver; ?>"></script>
<script src="/themes/clientarea/ogmiao/assets/libs/node-waves/waves.min.js?v=<?php echo $Ver; ?>"></script>

<!-- <script src="/themes/clientarea/ogmiao/assets/libs/error-all/solve-error.js" type="text/javascript"></script> -->
<!-- 自定义js -->
<script src="/themes/clientarea/ogmiao/assets_custom/js/throttle.js?v=<?php echo $Ver; ?>"></script>

<link type="text/css" href="/themes/clientarea/ogmiao/assets/libs/toastr/build/toastr.min.css?v=<?php echo $Ver; ?>" rel="stylesheet" />
<script src="/themes/clientarea/ogmiao/assets/libs/toastr/build/toastr.min.js?v=<?php echo $Ver; ?>"></script>


  <script>
	var setting_web_url = ''
  var language=<?php echo json_encode($_LANG); ?>;
  </script>
	<?php $hooks=hook('client_area_head_output'); if($hooks): foreach($hooks as $item): ?>
			<?php echo $item; ?>
		<?php endforeach; ?>
	<?php endif; ?>
<style>
    .logo-lg img{
      width:150px;
      height:auto;
    }
</style>
</head>
<body>
	<?php if($TplName != 'login' && $TplName != 'register' && $TplName != 'pwreset' && $TplName != 'bind' && $TplName != 'loginaccesstoken'): ?>
	<header id="page-topbar">
		<div class="navbar-header">
			<div class="d-flex">
				<!-- LOGO -->
				<div class="navbar-brand-box">
				    <?php if($Setting['web_logo_home']||$Setting['logo_url_home_mini']): ?>
					<a href="<?php echo $Setting['web_jump_url']; ?>" class="logo logo-dark">
						<?php if($Setting['logo_url_home_mini'] !=''): ?>
						<span class="logo-sm">
							<img src="<?php echo $Setting['logo_url_home_mini']; ?>" alt="" height="32">
						</span>
						<?php endif; ?>
						<span class="logo-lg">
							<img src="<?php echo $Setting['web_logo_home']; ?>" alt="" height="17">
						</span>
					</a>

					<a href="<?php echo $Setting['web_jump_url']; ?>" class="logo logo-light">
						<?php if($Setting['logo_url_home_mini'] !=''): ?>
						<span class="logo-sm" style="overflow: hidden;">
							<img src="<?php echo $Setting['logo_url_home_mini']; ?>" alt="" height="32">
						</span>
						<?php endif; ?>
						<span class="logo-lg">
							<img src="<?php echo $Setting['web_logo_home']; ?>" alt="">
						</span>
					</a>
					<?php else: ?>
					<h1 class="logo-lg"><?php echo $Setting['company_name']; ?></h1>
					<?php endif; ?>
				</div>

				<button type="button" class="btn btn-sm px-3 font-size-16 header-item waves-effect" id="vertical-menu-btn">
					<i class="fa fa-fw fa-bars"></i>
				</button>


			</div>

			<div class="d-flex">


				<div class="dropdown d-inline-block d-lg-none ml-2 phonehide">
					<button type="button" class="btn header-item noti-icon waves-effect" id="page-header-search-dropdown"
						data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
						<i class="mdi mdi-magnify"></i>
					</button>
					<div class="dropdown-menu dropdown-menu-lg dropdown-menu-right p-0"
						aria-labelledby="page-header-search-dropdown">

						<form class="p-3">
							<div class="form-group m-0">
								<div class="input-group">
									<input type="text" class="form-control" placeholder="Search ..." aria-label="Recipient's username">
									<div class="input-group-append">
										<button class="btn btn-primary" type="submit">
											<i class="mdi mdi-magnify"></i>
										</button>
									</div>
								</div>
							</div>
						</form>
					</div>
				</div>

				<!-- 多语言 -->
				<?php if($Setting['allow_user_language']): ?>
				<div class="dropdown d-inline-block">
					<button type="button" class="btn header-item waves-effect" data-toggle="dropdown" aria-haspopup="true"
						aria-expanded="false">
						<img id="header-lang-img" src="/upload/common/country/<?php echo $LanguageCheck['display_flag']; ?>.png" alt="Header Language" height="16">
					</button>
					<div class="dropdown-menu dropdown-menu-right">
						<!-- wyh 20210329 插件使用 -->
						<?php 
							$parse = parse_url(request()->url());
							$path=$parse['path'];
							$query=$parse['query'];
							$query = preg_replace('/&language=[a-zA-Z0-9_-]+/','',$query);
						 ?>
						<!-- item-->
						<?php if($path=="/addons"): foreach($Language as $key=>$list): ?>
								<a href="?<?php if($query): ?><?php echo $query; ?>&<?php endif; ?>language=<?php echo $key; ?>" class="dropdown-item notify-item language" data-lang="zh-cn">
									<img src="/upload/common/country/<?php echo $list['display_flag']; ?>.png" alt="user-image"
										 class="mr-1" height="12"> <span class="align-middle"><?php echo $list['display_name']; ?></span>
								</a>
							<?php endforeach; else: foreach($Language as $key=>$list): ?>
								<a href="?<?php if($query): ?><?php echo $query; ?>&<?php endif; ?>language=<?php echo $key; ?>" class="dropdown-item notify-item language" data-lang="zh-cn">
									<img src="/upload/common/country/<?php echo $list['display_flag']; ?>.png" alt="user-image"
										 class="mr-1" height="12"> <span class="align-middle"><?php echo $list['display_name']; ?></span>
								</a>
							<?php endforeach; ?>
						<?php endif; ?>

					</div>
				</div>
				<?php endif; ?>
        
				<!-- 购物车 -->
				<div class="dropdown d-none d-lg-inline-block ml-1">
					<button type="button" class="btn header-item noti-icon waves-effect">
						<a href="cart?action=viewcart"><i class="bx bx-cart-alt" style="margin-top: 8px;"></i></a>
							<!-- <?php if(count($CartShopData) != '0'): ?>
							<span class="badge badge-danger badge-pill"><?php echo count($CartShopData); ?></span>
							<?php endif; ?> -->
					</button>
				</div> 

				<!-- 消息 -->
				<div class="dropdown d-none d-lg-inline-block ml-1">
					<a href="message">
						<button type="button" class="btn header-item noti-icon waves-effect">
							<i class="bx bx-bell <?php if($Setting['unread_num']): ?>bx-tada<?php endif; ?>" style="margin-top: 8px;"></i>
							<?php if($Setting['unread_num'] != '0'): ?>
							<span class="badge badge-danger badge-pill"><?php echo $Setting['unread_num']; ?></span>
							<?php endif; ?>
						</button>
					</a>
				</div>

				<!-- 个人中心 -->
				<?php if($Userinfo): ?>
				<div class="dropdown d-inline-block">
					<button type="button" class="btn header-item waves-effect d-inline-flex align-items-center"
						id="page-header-user-dropdown" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
						<?php if($Userinfo['user']['qq']): ?>
						<img src="https://q1.qlogo.cn/g?b=qq&nk=<?php echo $Userinfo['user']['qq']; ?>&s=640" class="user-center_header d-inline-flex" style="display: inline-block;width: 30px;height: 30px;font-size: 16px;" alt="user qq avatar">
						<?php else: ?>
						<div class="user-center_header d-inline-flex align-items-center justify-content-center"
							style="display: inline-block;width: 30px;height: 30px;font-size: 16px;">
							<?php if(preg_match("/^[0-9]*[A-Za-z]+$/is", substr($Userinfo['user']['username'],0,1))): ?> 
							  <?php echo strtoupper(substr($Userinfo['user']['username'],0,1)); elseif(preg_match("/^[\x7f-\xff]*$/", substr($Userinfo['user']['username'],0,3))): ?> 
							  <?php echo substr($Userinfo['user']['username'],0,3); else: ?>
							  <?php echo strtoupper(substr($Userinfo['user']['username'],0,1)); ?> 
							<?php endif; ?>
						</div>
						<?php endif; ?>
						<span class="d-none d-xl-inline-block ml-1" key="t-henry"><?php echo $Userinfo['user']['username']; ?></span>
						<i class="mdi mdi-chevron-down d-none d-xl-inline-block"></i>
					</button>
					<div class="dropdown-menu dropdown-menu-right">
						<!-- item-->
						<a class="dropdown-item" href="details">
							<i class="bx bxs-user-detail font-size-16 align-middle mr-1"></i>
							<span key="t-profile"><?php echo $Lang['personal_information']; ?></span>
						</a>
						<a class="dropdown-item" href="security">
							<i class="bx bx-cog font-size-16 align-middle mr-1"></i>
							<span key="t-profile"><?php echo $Lang['security_center']; ?></span>
						</a>
						<a class="dropdown-item" href="message">
							<i class="bx bxl-messenger font-size-16 align-middle mr-1"></i>
							<span key="t-profile"><?php echo $Lang['message_center']; ?></span>
						</a>
						<?php if($Setting['certifi_open']==1): ?>
						<a class="dropdown-item" href="verified"> 
							<i class="bx bxs-id-card font-size-16 align-middle mr-1"></i>
							<span key="t-profile"><?php echo $Lang['real_name_authentications']; ?></span>
						</a>
						<?php endif; ?>
						<a class="dropdown-item text-danger" href="logout"><i
								class="bx bx-power-off font-size-16 align-middle mr-1 text-danger"></i> <span
								key="t-logout"><?php echo $Lang['log_out']; ?></span></a>
					</div>
				</div>
				<?php else: ?>
				<div class="pointer d-flex align-items-center">
					<a href="/login" class="text-dark"><?php echo $Lang['please_login']; ?></a>
				</div>
				<?php endif; ?>

			</div>
		</div>
	</header>

	<!-- ========== Left Sidebar Start ========== -->
<?php if($Userinfo): ?>
<div class="vertical-menu">
	<div data-simplebar class="h-100">
		<!--- Sidemenu -->
		<div id="sidebar-menu" class="menu-js">
			<!-- Left Menu Start -->
			<ul class="metismenu list-unstyled" id="side-menu">
			
				<!-- 临时菜单 -->
				<!-- <li>
					<a href="/credit" class="waves-effect">
						<i class="bx bx-home-circle"></i>
						<span>信用额度</span>
					</a>
				</li> -->
				<!-- 临时菜单 -->
				<?php foreach($Nav as $nv): ?>
				<li>
					<a href="<?php if($nv['child']): ?>javascript: ;<?php else: ?><?php echo $nv['url']; ?><?php endif; ?>" class="<?php if($nv['child']): ?>has-arrow<?php endif; ?> waves-effect">
						<?php if($nv['fa_icon']): ?><i class="<?php echo $nv['fa_icon']; ?>"></i><?php endif; if((isset($nv['tag']))): ?>
							<?php echo $nv['tag']; ?>
						<?php endif; ?>
						<span><?php echo $nv['name']; ?></span>
					</a>
					<?php if($nv['child']): ?>
					<ul class="sub-menu mm-collapse" aria-expanded="false">
						<?php foreach($nv['child'] as $subnav): ?>
						<li>
							<a href="<?php if($subnav['child']): ?>javascript: ;<?php else: ?><?php echo $subnav['url']; ?><?php endif; ?>"
								class="<?php if($subnav['child']): ?>has-arrow<?php endif; ?> waves-effect">
								<?php if($subnav['fa_icon']): ?><i class="<?php echo $subnav['fa_icon']; ?>"></i><?php endif; if((isset($subnav['tag']))): ?>
									<?php echo $subnav['tag']; ?>
								<?php endif; ?>
								<span><?php echo $subnav['name']; ?></span>
							</a>
							<?php if($subnav['child']): ?>
							<ul class="sub-menu" aria-expanded="false">
								<?php foreach($subnav['child'] as $submenu): ?>
								<li>
									<a href="<?php if($submenu['child']): ?>javascript: ;<?php else: ?><?php echo $submenu['url']; ?><?php endif; ?>"
										class="<?php if($submenu['child']): ?>has-arrow<?php endif; ?> waves-effect">
										<?php if($submenu['fa_icon']): ?><i class="<?php echo $submenu['fa_icon']; ?>"></i><?php endif; if((isset($submenu['tag']))): ?>
											<?php echo $submenu['tag']; ?>
										<?php endif; ?>
										<span><?php echo $submenu['name']; ?></span>
									</a>
								</li>
								<!-- Nav Level 3 -->
								<?php endforeach; ?>
							</ul>
							<?php endif; ?>
						</li>
						<!-- Nav Level 2 -->
						<?php endforeach; ?>
					</ul>
					<?php endif; ?>
				</li>
				<!-- Nav Level 1 -->
				<?php endforeach; ?>
			</ul>
		</div>
		<!-- Sidebar -->
	</div>
</div>
<?php else: ?>
<div class="vertical-menu menu-js">
	<div data-simplebar class="h-100">
		<!--- Sidemenu -->
		<div id="sidebar-menu" class="menu-js">
			<!-- Left Menu Start -->
			<ul class="metismenu list-unstyled" id="side-menu">
				<li>
					<a href="/login" class="waves-effect">
						<i class="bx bx-user-check"></i>
						<span>登录</span>
					</a>
				</li>
				<li>
					<a href="/register" class="waves-effect">
						<i class="bx bx-user-plus"></i> 
						<span>注册</span>
					</a>
				</li>
			</ul>
		</div>
		<!-- Sidebar -->
	</div>
</div>
<?php endif; ?>


	<div class="main-content">
		<div class="page-content">
			<?php if($TplName != 'clientarea'): ?>
			
<div class="container-fluid">
    <!-- start page title -->
    <div class="row">
        <div class="col-12">
            <div class="page-title-box d-flex align-items-center justify-content-between">
                <?php if($TplName == 'viewbilling'): ?>
                <h4 class="mb-0 font-size-18"><?php echo $Title; ?> - <?php echo $Get['id']; ?></h4>
                <?php else: ?>
                <div style="display:flex;">
                    
                    <a href="javascript:history.go(-1)" class="backBtn" style="display: none;"><i class="bx bx-chevron-left" style="font-size: 32px;margin-top: 1px;color: #555b6d;"></i></a>
                    <h4 class="mb-0 font-size-18"><?php echo $Title; ?></h4>
                </div>
                <?php endif; ?>
                <div class="page-title-right">
	                <?php if(!$ShowBreadcrumb): ?>
                    <ol class="breadcrumb m-0">
    <li class="breadcrumb-item"><a href="javascript: void(0);"><?php echo $Lang['title_clientarea']; ?></a></li>
    <li class="breadcrumb-item active"><?php echo $Title; ?></li>
</ol>
                    <?php endif; ?>
                </div>

            </div>
        </div>
    </div>
    <!-- end page title -->    
</div>
<script>
    $(function(){
        $('.backBtn').hide()
    })
</script>
			<?php endif; ?>
			<div class="container-fluid">
				<?php endif; ?>
<script>
	var _url = '';
	$(function(){
		// 购物车返回按钮
		// $('.backBtn').show();
		$(".checkbox").on('change','.payment-checkbox',function(){
			if($(this).parent().siblings(".checkboxDiv").length!=0){
				if($(this).parent().siblings(".checkboxDiv").hasClass('checkboxSelect')==true) $(this).parent().siblings(".checkboxDiv").removeClass("checkboxSelect")
			}
			if($(this).prop('checked')){
				$(this).parent().addClass("checkboxSelect");
				if($(this).parent().siblings(".checkboxDiv").length!=0){
					$(this).parent().siblings(".checkboxDiv").find('input').prop("checked",false)
				}
				// 移除支付方式选中
				$(".addfunds-payment").removeClass("active").find(".hidden").removeAttr("checked")
			}else{
				$(this).parent().removeClass("checkboxSelect");
			}
		})
		$(".addfunds-payment").click(function(){
			$(this).find(".hidden").attr("checked","checked");
			$(this).addClass('active').parent().siblings('.addfunds').find(".addfunds-payment").removeClass("active").find(".hidden").removeAttr("checked");
			$('input[name="paymt"]').prop('checked', false).parent().removeClass("checkboxSelect");
		})
		// 配置详情展开折叠
		$('.card-body').on('click','.goods_info .title',function(){
			$(this).find('font').toggleClass('zk');
			$(this).siblings('.info').slideToggle();
		})
		$('.card-body').on('click','.all_checkbox',function(_this){

			let arr=$('.son_check')   //所有商品
			//总价
			let price = '0.00'
				,len = 0;
			if(arr.length!=0)
			{
				if(_this.target.checked) {
					for (var i = 0; i < arr.length; i++) {
						arr[i].checked = _this.target.checked
						price = (parseFloat($(arr[i]).data('price').trim()) + parseFloat(price)).toFixed(2);
						len++;
					}
				}else{
					for (var i = 0; i < arr.length; i++) {
						arr[i].checked = _this.target.checked
					}
				}
			}
			$('.len-num').text(len);
			$('.price-num').text(price);
		})
		$('.card-body').on('click','.son_check',function(_this){

			if(!_this.target.checked) $('.all_checkbox')[0].checked=false
			let arr=$('.son_check')   //所有商品
			//			总价
			let price = '0.00'
					,len = 0;
			for (var i = 0; i < arr.length; i++) {
				if(arr[i].checked)
				{
					price = (parseFloat($(arr[i]).data('price').trim()) + parseFloat(price)).toFixed(2);
					len++;
				}
			}

			if((arr.filter((index,item)=> item.checked==true).length) == arr.length) $('.all_checkbox')[0].checked=true

			$('.len-num').text(len);
			$('.price-num').text(price);
		})
		$('.administrationBtn').click(function(){
			$('.administrationBtn').hide()
			$('.completeBtn').show()
			$('.payDiv').hide()
			$('.deleteBtn').show()
		})
		$('.completeBtn').click(function(){
			$('.administrationBtn').show()
			$('.completeBtn').hide()
			$('.payDiv').show()
			$('.deleteBtn').hide()
		})
	//	删除按钮点击时
		$('.deleteBtn > button').click(function() {
			let arr = $('.son_check')   //所有商品
			if(arr.length == 0)
			{
				return;
			}
			var is = [];
			for(var i=0;i<arr.length;i++){
				if(arr[i].checked)
				{
					is.push($(arr[i]).data('val'));
				}
			}
			if(is.length <= 0)
			{
				//提示框
				toastr.error('请选择要删除的商品！')
				return false;
			}
			removeItem('cart?action=viewcart&statuscart=remove', '<?php echo $Lang['delete_item']; ?>', '您确定要删除这'+ is.length +'种商品吗？', {i: is});
		})
	//	立即结账按钮
	// 	$('.submit-btn').click(function(){
	// 		let arr=$('.son_check:checked');
	// 		if(arr.length <= 0)
	// 		{
	// 			//提示框
	// 			toastr.error('请至少选择一个商品！')
	// 			return false;
	// 		}
	// 	})
	})
</script>
<link type="text/css" href="/themes/cart/default/assets/js/toastr/build/toastr.min.css?v=<?php echo $Ver; ?>"
	rel="stylesheet" />
<script src="/themes/cart/default/assets/js/toastr/build/toastr.min.js?v=<?php echo $Ver; ?>"></script>
<script src="/themes/cart/default/assets/js/viewcart.js?v=<?php echo $Ver; ?>"></script>
<style>
@media (min-width: 560px) and (max-width: 1355px) {
	.addfunds-payment img{
		height: 16px;
	}
}
.modal-body{
  -moz-box-sizing: border-box;  
     -webkit-box-sizing: border-box; 
     -o-box-sizing: border-box; 
     -ms-box-sizing: border-box; 
}
.goods_info{
	width:100%;
	padding: 10px 0px;
}
.goods_info span {
	display: block;
}
.goods_info .title{
	text-indent: 10px;
	color: #409eff;
	cursor: pointer;
}
.goods_info .title font {
	float: left;
	color: #666;
	font-family: cursive;
	font-size: 12px;
	margin-top: 1px;
}
.goods_info .title .zk {
	transform: rotate(90deg);
	margin-top: -4px;
}
.goods_info .info{
	width: 100%;
	color: #333;
	text-indent: 27px;
	line-height: 24px;
}
.custom-controlTwo{
    position: relative;
    z-index: 1;
    display: block;
    min-height: 1.21875rem;
    padding-left: 1.5rem;
    -webkit-print-color-adjust: exact;
}
.completeBtn{
	display:none;
}
.deleteBtn{
	display:none;
}
.mobile-bottom-total{
		display: none;
		position: fixed;
		width: 100%;
    padding-right: 1.25rem;
		background: #FFFFFF;
		box-shadow: 0px 0px 10px 0px rgba(0, 0, 0, 0.1);
		z-index: 99999;
		bottom: 0;
		left: 0;
	}
	.mobile-flex{
		display: flex;
    align-items: center;
    justify-content: space-between;
    padding-left: 1rem;
	}
</style>

<form id="submit-form" method="post" action="cart?action=viewcart&statuscart=checkout"><input type="hidden" name="token" value="<?php echo $Token; ?>">
	<input type="hidden" name="register_or_login" value="register">
	<div class="row">
		<div class="col-md-8">
			<?php if($ErrorMsg): ?>
			<div class="alert alert-danger">
				<a href="#" class="close" data-dismiss="alert">
					&times;
				</a>
				<strong><?php echo $ErrorMsg; ?></strong>
			</div>
			<?php endif; ?>
			<div class="card">
				<div class="card-body">
					<h5 class="mb-0"><?php echo $Lang['payment_order']; ?></h5>
				</div>
				<hr class="mb-0 mt-0" />
				<div class="card-body">
					<?php if($Userinfo): ?>
					<div class="col-sm-12 mb-3 mt-4">
						<span style="color:#979699;"><?php echo $Lang['dear_customers']; ?>：</span>
							<?php if($Userinfo['user']['username']): ?>
								<?php echo $Userinfo['user']['username']; else: ?>
								<?php echo $Userinfo['user']['email']; ?>
							<?php endif; ?>
							,<?php echo $Lang['hello']; ?>!
					</div>
					<div class="col-sm-12 mb-3 mt-4">
						<span style="color:#979699;">手机： </span>
						<?php if($Userinfo['user']['phonenumber']): ?> <?php echo $Userinfo['user']['phonenumber']; else: ?> - <?php endif; ?>
					</div>
					<div class="col-sm-12 mb-3 mt-4">
						<span style="color:#979699;">邮箱： </span>
						<?php if($Userinfo['user']['email']): ?> <?php echo $Userinfo['user']['email']; else: ?> - <?php endif; ?>
					</div>
					<div class="col-sm-12 mb-3 mt-4">
						<span style="color:#979699;">地址： </span>
						<?php if($Userinfo['user']['address1']): ?> <?php echo $Userinfo['user']['address1']; else: ?> - <?php endif; ?>
					</div>
					<div class="col-sm-12 mb-3 mt-4">
						<span style="color:#979699;">销售： </span>
						<?php if($Userinfo['sale_name']): ?> <?php echo $Userinfo['sale_name']; else: ?> - <?php endif; ?>
					</div>
					<?php else: ?>
					<div class="d-flex justify-content-between align-items-center">
						<p class="mb-0"><?php echo $Lang['registration_login']; ?></p>
						<span class="btn btn-sm btn-primary old-user" onClick="changeType('old')"><?php echo $Lang['please_click_here']; ?></span>
						<span class="btn btn-sm btn-warning new-user" onClick="changeType('new')"><?php echo $Lang['new_account']; ?></span>
					</div>
					<div class="old-user">
						<div class="row mt-4">
							<?php if($Register['allow_register_phone']==1 && $Register['allow_register_email']==1): ?>
							<div class="col-sm-12 mb-3">
								<div class="btn-group btn-group-toggle mt-2 mt-xl-0 cart-register" data-toggle="buttons" id="register">
									<label class="btn btn-primary btn-sm active"><input type="radio" class="input_active" checked=""
											value="phone"><?php echo $Lang['mobile_registration']; ?></label>
									<label class="btn btn-primary btn-sm"><input type="radio" value="email"><?php echo $Lang['email_registration']; ?></label>

								</div>
							</div>
							<?php endif; if($Register['allow_register_phone']==1): ?>
							<div class="col-sm-6 mb-3 registerphone">
								<div style="float:left;padding:0px;" class="col-sm-3" id="register_phone_code">
									<select class="form-control" name="phone_code" id="phoneCodeSel">
										<?php foreach($SmsCountry as $list): ?>
										<option value="<?php echo $list['phone_code']; ?>" <?php if($list['phone_code']=="+86"): ?> selected<?php endif; ?>>
											<?php echo $list['link']; ?>
										</option>
										<?php endforeach; ?>
									</select>
								</div>
								<input class="form-control col-sm-9" name="phone" id="register_phone" placeholder="<?php echo $Lang['phone_number']; ?>" />
							</div>
							<?php if($Register['is_captcha']==1 && $Register['allow_register_phone_captcha']==1): ?>
							<div class="col-sm-6 mb-3 registerphone">
								<div class="input-group">
									<div class="custom-file">
										<input class="form-control" name="captcha" placeholder="<?php echo $Lang['graphic_verification_code']; ?>" />
									</div>
									<div class="input-group-append ml-2">
										<img onclick="reloadcode(this,'allow_register_phone_captcha')"
											src="/verify?name=allow_register_phone_captcha" alt="" height="36px">

									</div>
								</div>
							</div>
							<?php endif; ?>
							<div class="col-sm-6 mb-3 registerphone">
								<div class="input-group">
									<div class="custom-file">
										<input class="form-control" id="phone_code" name="code" placeholder="<?php echo $Lang['phone_verification_code']; ?>" />
									</div>
									<div class="input-group-append">
										<button id="register_phone_get_code" class="btn btn-primary" type="button"
											onclick="getCode('phone',this)"><?php echo $Lang['get_mobile_phone_verification_code']; ?></button>
									</div>
								</div>
							</div>
							<?php endif; if($Register['allow_register_email']==1): ?>
							<div class="col-sm-6 mb-3 registeremail" <?php if($Register['allow_register_phone']==1 &&
								$Register['allow_register_email']==1): ?> style="display:none;" <?php endif; ?>>
								<div class="input-group">
									<div class="custom-file">
										<input class="form-control" name="email" id="register_email" placeholder="<?php echo $Lang['email_address']; ?>" />
									</div>
								</div>
							</div>
							<?php if($Register['is_captcha']==1 && $Register['allow_register_email_captcha']==1): ?>
							<div class="col-sm-6 mb-3 registeremail" <?php if($Register['allow_register_phone']==1 &&
								$Register['allow_register_email']==1): ?> style="display:none;" <?php endif; ?>>
								<div class="input-group">
									<div class="custom-file">
										<input class="form-control" name="captcha" placeholder="<?php echo $Lang['graphic_verification_code']; ?>" />
									</div>
									<div class="input-group-append ml-2">
										<img onclick="reloadcode(this,'allow_register_email_captcha')"
											src="/verify?name=allow_register_email_captcha" alt="" height="36px">

									</div>
								</div>
							</div>
							<?php endif; if($Register['allow_email_register_code']==1): ?>
							<div class="col-sm-6 mb-3 registeremail" <?php if($Register['allow_register_phone']==1 &&
								$Register['allow_register_email']==1): ?> style="display:none;" <?php endif; ?>>
								<div class="input-group">
									<div class="custom-file">
										<input class="form-control" id="email_code" name="code" placeholder="邮箱验证码" />
									</div>
									<div class="input-group-append">
										<button id="register_email_get_code" class="btn btn-primary" type="button"
											onclick="getCode('email',this)"><?php echo $Lang['get_email_verification_code']; ?></button>
									</div>
								</div>
							</div>
							<?php endif; ?>
							<?php endif; ?>
							<div class="col-sm-6 mb-3">
								<input name="password" type="password" class="form-control" placeholder="<?php echo $Lang['password']; ?>" />
							</div>
							<div class="col-sm-6 mb-3">
								<input name="repassword" type="password" class="form-control" placeholder="<?php echo $Lang['confirm_password']; ?>" />
							</div>
							<?php foreach($Register['login_register_custom_require'] as $list): ?>
							<div class="col-sm-6 mb-3">
								<input name="<?php echo $list['name']; ?>" class="form-control"
									placeholder="<?php echo $Register['login_register_custom_require_list'][$list['name']]; ?>" />
							</div>
							<?php endforeach; foreach($Register['fields'] as $k => $list): ?>
							<div class="col-sm-6 mb-3">
								<?php if($list['fieldtype'] == 'dropdown'): ?>
								<!-- 下拉 -->
								<select name="fields[<?php echo $list['id']; ?>]" class="form-control ">
									<?php foreach($list['dropdown_option'] as $key => $val): ?>
									<option value="<?php echo $key; ?>"><?php echo $val; ?></option>
									<?php endforeach; ?>
								</select>
								<?php elseif($list['fieldtype'] == 'password'): ?>
								<!-- 密码 -->
								<input name="fields[<?php echo $list['id']; ?>]" type="password" class="form-control" placeholder="<?php echo $list['fieldname']; ?>" />
								<?php elseif($list['fieldtype'] == 'text'): ?>
								<!-- 文本框 -->
								<input name="fields[<?php echo $list['id']; ?>]" type="text" class="form-control" placeholder="<?php echo $list['fieldname']; ?>" />
								<?php elseif($list['fieldtype'] == 'link'): ?>
								<!-- 链接输入框 -->
								<input name="fields[<?php echo $list['id']; ?>]" type="text" class="form-control" placeholder="<?php echo $list['fieldname']; ?>" />
								<?php elseif($list['fieldtype'] == 'tickbox'): ?>
								<!-- 选项框 -->
								<input type="checkbox" name="fields[<?php echo $list['id']; ?>]"><?php echo $list['fieldname']; elseif($list['fieldtype'] == 'textarea'): ?>
								<!-- 文本域 -->
								<textarea name="fields[<?php echo $list['id']; ?>]" cols="30" rows="10" class="form-control"></textarea>
								<?php endif; ?>
							</div>
							<?php endforeach; ?>


							<!--销售-->
							<?php if($setsaler == '2'): ?>
							<div class="col-sm-12 mb-3" style="color:#979699;"><?php echo $Lang['sales_representative']; ?></div>
							<div class="col-sm-6">
								<select name="sale_id" class="form-control ">
									<option value="0"><?php echo $Lang['nothing']; ?></option>
									<?php foreach($saler as $saler): ?>
									<option value="<?php echo $saler['id']; ?>" <?php if(($sale && $sale == $saler['id'])): ?> selected <?php endif; ?>><?php echo $saler['user_nickname']; ?></option>
									<?php endforeach; ?>
								</select>
							</div>
							<?php endif; ?>
						</div>
					</div>

					<div class="new-user">
						<div class="row mt-4">
							<?php if($Login['allow_login_phone']==1 && $Login['allow_login_email']==1): ?>
							<div class="col-sm-12 mb-3">
								<div class="btn-group btn-group-toggle mt-2 mt-xl-0 cart-login" data-toggle="buttons" id="login">
									<label class="btn btn-primary btn-sm active"><input type="radio" class="input_active" checked=""
											value="phone"><?php echo $Lang['mobile_login']; ?></label>
									<label class="btn btn-primary btn-sm"><input type="radio" value="email"><?php echo $Lang['email_login']; ?></label>

								</div>
							</div>
							<?php endif; if($Login['allow_login_phone']==1): ?>
							<div class="col-sm-6 mb-3 loginphone">
								<div style="float:left;padding:0px;" class="col-sm-3" id="register_phone_code">
									<select class="form-control" name="phone_code" id="phoneCodeSel">
										<?php foreach($SmsCountry as $list): ?>
										<option value="<?php echo $list['phone_code']; ?>" <?php if($list['phone_code']=="+86"): ?> selected<?php endif; ?>>
											<?php echo $list['link']; ?>
										</option>
										<?php endforeach; ?>
									</select>
								</div>
								<input class="form-control col-sm-9" name="phone" id="register_phone" placeholder="<?php echo $Lang['phone_number']; ?>" />
							</div>
							<?php if($Login['is_captcha']==1 && $Login['allow_login_phone_captcha']==1): ?>
							<div class="col-sm-6 mb-3 loginphone">
								<div class="input-group">
									<div class="custom-file">
										<input class="form-control" name="captcha" placeholder="<?php echo $Lang['graphic_verification_code']; ?>" />
									</div>
									<div class="input-group-append ml-2">
										<img onclick="reloadcode(this,'allow_login_phone_captcha')"
											src="/verify?name=allow_login_phone_captcha" alt="" height="36px">

									</div>
								</div>
							</div>
							<?php endif; ?>
							<!--<div class="col-sm-6 mb-3 loginphone">
							<div class="input-group">
								<div class="custom-file">
									<input class="form-control" id="phone_code" name="code" placeholder="手机验证码" />
								</div>
								<div class="input-group-append">
									<button id="register_phone_get_code" class="btn btn-primary" type="button" >获取手机验证码</button>
								</div>
							</div>
						</div>-->
							<?php endif; if($Login['allow_login_email']==1 || $Login['allow_id']): ?>
							<div class="col-sm-6 mb-3 loginemail" <?php if($Login['allow_login_phone']==1 && $Login['allow_login_email']==1): ?>
								style="display:none;" <?php endif; ?>>
								<div class="input-group">
									<div class="custom-file">
										<input class="form-control" name="email"
											placeholder="<?php if($Login['allow_login_email'] && $Login['allow_id']): ?><?php echo $Lang['input_email_id']; elseif($Login['allow_login_email'] && !$Login['allow_id']): ?><?php echo $Lang['input_email']; elseif(!$Login['allow_login_email'] && $Login['allow_id']): ?><?php echo $Lang['input_id']; ?><?php endif; ?>" />
									</div>
								</div>
							</div>
							<?php if($Login['is_captcha']==1 && $Login['allow_login_email_captcha']==1): ?>
							<div class="col-sm-6 mb-3 loginemail" <?php if($Login['allow_login_phone']==1 && $Login['allow_login_email']==1): ?>
								style="display:none;" <?php endif; ?>>
								<div class="input-group">
									<div class="custom-file">
										<input class="form-control" name="captcha" placeholder="<?php echo $Lang['graphic_verification_code']; ?>" />
									</div>
									<div class="input-group-append ml-2">
										<img onclick="reloadcode(this,'allow_login_email_captcha')"
											src="/verify?name=allow_login_email_captcha" alt="" height="36px">

									</div>
								</div>
							</div>
							<?php endif; ?>
							<?php endif; if($Login['allow_login_email'] || $Login['allow_login_phone'] || $Login['allow_id']): ?>
							<div class="col-sm-6 mb-3">
								<input class="form-control" name="password" type="password" placeholder="<?php echo $Lang['password']; ?>" />
							</div>
							<?php else: ?>
							<?php echo $Lang['login_not_open']; ?>
							<?php endif; ?>
						</div>

					</div>
					<?php endif; if($Setting['cart_product_description']): ?>
					<div class="alert alert-success alert-dismissable mt-5"><?php echo $Setting['cart_product_description']; ?></div>
					<?php endif; ?>
					<!--销售-->
					<?php if($Userinfo && $Userinfo['user']['sale_id'] == '0' && $sale_setting == '2'): ?>
					<div class="col-sm-12 mb-3" style="color:#979699;"><?php echo $Lang['sales_representative']; ?></div>
					<div class="col-sm-6">
						<select name="sale_id" class="form-control ">
							<option value="0"><?php echo $Lang['nothing_two']; ?></option>
							<?php foreach($saler as $saler): ?>
							<option value="<?php echo $saler['id']; ?>" <?php if(($sale && $sale == $saler['id'])): ?> selected <?php endif; ?>><?php echo $saler['user_nickname']; ?></option>
							<?php endforeach; ?>
						</select>
					</div>
					<?php endif; ?>

					<div class="col-sm-12 mb-3" style="color:#979699;margin-top:16px;">客户备注</div>
					<div class="col-sm-6">
						<input type="text" class="form-control remarksInput" placeholder="选填，请先和商家协商一致" value="" maxLength="200" name="notes">
					</div>

					<p class="mt-5"><?php echo $Lang['payment_method']; ?></p>

					<div class="col-sm-12 mb-3 checkbox checkDiv" style="display: flex;align-items: center;">
						<!-- 其他方式：
						<input type="radio" name="paymt" data-name="switch" value="" id="paymt"> -->
						<?php if($Userinfo['user']['credit'] > 0): ?>
							<div class="checkboxDiv">	
								<input class="payment-checkbox" type="checkbox" name="paymt" data-name="switch" value="credit" id="paymt" style="margin-right:5px"
										<?php if((isset($ShopData['total_price']) && $ShopData['total_price'] <= $Userinfo['user']['credit'])): ?> checked <?php endif; ?> > 使用余额支付
								<span class="mr-1" style="margin-left: 35px;">
									<img width="20" src="/themes/clientarea/default/assets/images/gold.svg" alt="">
								</span>
							<?php echo $ShopData['currency']['prefix']; ?><?php echo $Userinfo['user']['credit']; ?>
							</div>
							
						<?php endif; if(!empty($client['is_open_credit_limit']) && $client['credit_limit_balance'] >= $ShopData['total_price'] && $is_open_shd_credit_limit): ?>
							<div class="checkboxDiv">
								<input class="payment-checkbox" type="checkbox" name="paymt" data-name="switch" value="credit_limit" id="paymt" style="margin-right:5px;"> 使用信用额支付
								<span class="mr-1" style="margin-left: 35px;padding-bottom:5px;">
									<img width="20" src="/themes/clientarea/default/assets/images/CreditCard.png" alt="">
								</span>
								<?php echo $ShopData['currency']['prefix']; ?><?php echo $client['credit_limit_balance']; ?>
							</div>
						<?php endif; ?>
					</div>

					<div class="row">
						<?php foreach($ShopData['gateway_list'] as $list): ?>
						<div class="col-sm-3 addfunds">

							<div class="addfunds-payment <?php if($list['name']==$ShopData['default_gateway']): ?>active<?php endif; ?>"
								data-payment="<?php echo $list['name']; ?>" title="" data-toggle="tooltip" data-placement="bottom"
								data-original-title="<?php echo $list['title']; ?>">
								<input type="radio" name="payment" class="hidden" value="<?php echo $list['name']; ?>" <?php if($list['name']==$ShopData['default_gateway']): ?>checked="checked" <?php endif; ?>>
								<?php if($list['author_url']): ?>
								<img src="<?php echo $list['author_url']; ?>" />
								<?php else: ?>
								<?php echo $list['title']; ?>
								<?php endif; ?>
							</div>
						</div>
						<?php endforeach; ?>
					</div>

					<p class="mt-5"><?php echo $Lang['discount_code']; ?></p>

					<?php if($ShopData['promo']): ?>
					<div class="input-group">
						<?php echo $ShopData['promo']['promo_desc_str']; ?>
						<a href="javascript:;" style="margin-left:20px;" id="removepromo"><?php echo $Lang['remove']; ?></a>
					</div>
					<?php else: ?>
					<div class="input-group" id="promo">
						<div class="custom-file">
							<input type="text" class="form-control" name="promo" value="<?php echo $promocode; ?>" placeholder="<?php echo $Lang['discount_code']; ?>">
						</div>
						<div class="input-group-append">
							<button class="btn btn-primary" type="button"><?php echo $Lang['application']; ?></button>
						</div>

					</div>
					<?php endif; ?>

				</div>
			</div>
		</div>


		<div class="col-md-4">
			<div class="card">
				<div class="card-body">
					<div style="display:flex;align-items: center;justify-content: space-between;">
						<div class="invoice-title" style="display:flex;">
							<!-- <div class="custom-controlTwo custom-checkbox" style="margin-bottom: 8px;">
								<input type="checkbox" class="custom-control-input all_checkbox" id="select_all_check">
								<label class="custom-control-label" for="select_all_check"></label>
							</div> -->
							<h4 class=" font-size-16"><?php echo $Lang['products_purchased']; ?></h4>
						</div>
						<!-- <div>
							<button class="btn btn-sm btn-primary administrationBtn" type="button">管理</button>
							<button class="btn btn-sm btn-primary completeBtn" type="button">完成</button>
						</div> -->
					</div>
					<hr>
					<div style="max-height: 50vh; overflow: auto; padding:0px 20px">
						<?php foreach($ShopData['cart_products'] as $cart_val=>$cart): ?>
						<address>
							<div class="d-flex justify-content-between">
								<div style="display:flex;">

									<strong><?php echo $cart['productsname']; ?>:</strong>
								</div>
								<?php if($cart['allow_qty']==1): ?>
								<div class="cart_qty">
									<input type="hidden" name="i" value="<?php echo $cart_val; ?>">
									<input type="number" name="qty" class="number" value="<?php echo $cart['qty']; ?>" style="width: 70px;">
									<button type="button" class="btn btn-sm" style="background: #efefef;" onclick="cartQtyBtn(this)"><?php echo $Lang['to_update']; ?></button>
								</div>
								<?php endif; ?>
								<div>
									<a href="cart?action=configureproduct&pid=<?php echo $cart['productid']; ?>&i=<?php echo $cart_val; ?>"><i
											class="fas fa-pen mr-1"></i></a>
									<a href="javascript:;" onclick="removeItem('cart?action=viewcart&statuscart=remove', '<?php echo $Lang['delete_item']; ?>', '<?php echo $Lang['sure_delete']; ?>', {i: <?php echo $cart_val; ?>})">
										<i class="fas fa-times-circle"></i>
									</a>
								</div>
							</div>
							<div class="goods_info">
								<span class="title"><font class="zk"> &gt; </font><?php echo $cart['conf']['host']; ?></span>
								<?php foreach($cart['conf_child'] as $son_v): ?>
									<div class="info"><?php echo $son_v['name']; ?>：<font><?php echo $son_v['sub_name']; ?></font></div>
								<?php endforeach; ?>

							</div>
							<?php foreach($cart['configoptions'] as $configoptions_key=>$configoptions_val): ?>
							<p class="mb-0"><?php echo $configoptions_key; ?> : <span class="font-weight-medium"><?php echo $configoptions_val['value']; ?></span>
							</p>
							<?php endforeach; ?>

						</address>
							<?php if($cart['type']): ?>
								<div class="font-size-16 mt-2 d-flex justify-content-between" style=""><span style="font-size: 12px;"><?php echo $Lang['price']; ?>:</span>
									<?php if($ShopData['cart_products']): ?>
										<span style="color:#666"><?php echo $ShopData['currency']['prefix']; ?><?php echo $cart['product_pricing']; ?></span>
									<?php else: ?>
										0.00
									<?php endif; ?>
								</div>


								<div class="font-size-16 mt-2 d-flex justify-content-between" style="">
									<?php if($cart['type']['type']  == '1'): ?>
										<span style="font-size: 12px;"><?php echo $Lang['customer_discount_price']; ?>
											(<span class="discount-num"><?php echo $cart['type']['bates']; ?></span><?php echo $Lang['fracture']; ?>):
										</span>
									<?php elseif($cart['type']['type']  == '2'): ?>
										<span style="font-size: 12px;"><?php echo $Lang['customer_discount_province']; ?>
											<span class="discount-num"><?php echo $ShopData['currency']['prefix']; ?><?php echo $cart['type']['bates']; ?>):</span>
										</span>
									<?php endif; ?>

									<span style="color:#666">-<?php echo $ShopData['currency']['prefix']; ?><?php echo $cart['saleproducts']; ?></span>
								</div>
							<?php endif; ?>
							<div class="font-size-16 mt-2 d-flex justify-content-between"><span style="font-size: 12px;"><?php echo $Lang['subtotal']; ?>:</span>
								<?php if($ShopData['cart_products']): if($cart['type']): ?>
										<span style="font-size: 12px;"><?php echo $ShopData['currency']['prefix']; ?><strong
													class="font-size-18"><?php echo bcmul($cart['_sale_price'],$cart['qty'],2); ?></strong></span>
									<?php else: ?>
										<span style="font-size: 12px;"><?php echo $ShopData['currency']['prefix']; ?><strong
													class="font-size-18"><?php echo bcmul($cart['product_pricing'],$cart['qty'],2); ?></strong></span>
									<?php endif; else: ?>
									0.00
								<?php endif; ?>
							</div>
							<!-- 优惠码 -->
							<!-- <div class="font-size-16 mt-2 d-flex justify-content-between" style="padding-bottom: 10px;margin-bottom: 20px;border-bottom: #ddd 1px solid;">
										<span style="font-size: 12px;">优惠：</span>

									<span class="font-size-18">-$120</span>
								</div> -->
						<?php endforeach; ?>

					</div>
					<hr style="border-top: 13px solid #F8F8FB;" />
					<div class="font-size-16 mt-2 d-flex justify-content-between mobile-hide" style="padding:0px 20px">
						<span><?php echo $Lang['total']; ?>:</span>
						<?php if($ShopData['cart_products']): ?>
						<span style="color:#999999; font-size:12px">共<span class="len-num"><?php echo count($ShopData['cart_products']); ?></span>件<strong
								class="font-size-18 text-primary" style="margin-left: 10px;"><?php echo $ShopData['currency']['prefix']; ?><span class="price-num"><?php echo $ShopData['total_price']; ?></span></strong></span>
						<?php else: ?>
						0.00
						<?php endif; ?>
					</div>
					<div class="d-print-none mobile-hide">
						<div class="payDiv">
							<div class="custom-control custom-checkbox  align-items-end mr-2">
								<input type="checkbox" class="custom-control-input"  id="terms" name="terms" value="1" required>
								<label class="custom-control-label" for="terms">	<?php echo $Lang['agree']; ?><a href="<?php echo $Setting['web_tos_url']; ?>" target="blank"><?php echo $Lang['terms_service']; ?></a></label>
								<!-- <div class="invalid-feedback">你在提交之前必须同意。</div> -->

								<!-- <input type="checkbox" class="custom-control-input" id="terms" name="terms" value="1">
								<label class="custom-control-label" for="terms">
									<?php echo $Lang['agree']; ?><a href="<?php echo $Setting['web_tos_url']; ?>" target="blank"><?php echo $Lang['terms_service']; ?></a>
								</label>  -->
							</div>
							<div class="text-sm-right mt-2">
								<button class="btn btn-primary w-100 submit-btn" type="submit" <?php if(!$ShopData['cart_products']): ?>disabled<?php endif; ?>><i
										class="mdi mdi-truck-fast mr-1"></i><?php echo $Lang['check_out_now']; ?></button>
							</div>
						</div>
						<!-- <div class="text-sm-right mt-2 deleteBtn">
							<button class="btn btn-danger w-100" type="button"><?php echo $Lang['delete']; ?></button>
						</div> -->

					</div>

				</div>

			</div>
		</div>
		<!-- 移动端底部价格展示 -->
		<div class="mobile-bottom-total">
			<div class="font-size-16 mt-2 d-flex justify-content-between" style="padding:0px 20px">
				<span><?php echo $Lang['total']; ?>:</span>
				<?php if($ShopData['cart_products']): ?>
				<span style="color:#999999; font-size:12px">共<span class="len-num"><?php echo count($ShopData['cart_products']); ?></span>件<strong
						class="font-size-18 text-primary" style="margin-left: 10px;"><?php echo $ShopData['currency']['prefix']; ?><span class="price-num"><?php echo $ShopData['total_price']; ?></span></strong></span>
				<?php else: ?>
				0.00
				<?php endif; ?>
			</div>
			<div class="d-print-none">
				<div class="payDiv mobile-flex">
					<div class="custom-control custom-checkbox  align-items-end mr-2">
						<input type="checkbox" class="custom-control-input"  id="terms" name="terms" value="1" required>
						<label class="custom-control-label" for="terms">	<?php echo $Lang['agree']; ?><a href="<?php echo $Setting['web_tos_url']; ?>" target="blank"><?php echo $Lang['terms_service']; ?></a></label>
						<!-- <div class="invalid-feedback">你在提交之前必须同意。</div> -->

						<!-- <input type="checkbox" class="custom-control-input" id="terms" name="terms" value="1">
						<label class="custom-control-label" for="terms">
							<?php echo $Lang['agree']; ?><a href="<?php echo $Setting['web_tos_url']; ?>" target="blank"><?php echo $Lang['terms_service']; ?></a>
						</label>  -->
					</div>
					<div class="text-sm-right mt-2">
					<button class="btn btn-primary w-100" type="submit" <?php if(!$ShopData['cart_products']): ?>disabled<?php endif; ?>><i
								class="mdi mdi-truck-fast mr-1"></i><?php echo $Lang['check_out_now']; ?></button>
					</div>
				</div>
				<!-- <div class="text-sm-right mt-2 deleteBtn">
					<button class="btn btn-danger w-100" type="button"><?php echo $Lang['delete']; ?></button>
				</div> -->
			</div>
		</div>
	</div>
</form>


<script>
	$(function() {
		if(navigator.userAgent.match(/mobile/i)) {
			$('.mobile-bottom-total').show()
			$('.mobile-hide').remove()
		}else{
			$('.mobile-bottom-total').remove()
		}
	})
</script>
<!-- 删除确认 -->
<div class="modal fade" id="customModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle"
	aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="customTitle"><?php echo $Lang['prompt']; ?></h5>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body" id="customBody">

			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-outline-light" data-dismiss="modal"><?php echo $Lang['cancel']; ?></button>
				<button type="button" class="btn btn-primary" id="customSureBtn"><?php echo $Lang['determine']; ?></button>
			</div>
		</div>
	</div>
</div>

<style>
	.list-inline-item .icon {
		width: 2rem;
		height: 2rem;
	}

	.social-list-item {
		border: none;
	}
</style>



<style>
	.checkboxDiv{
    	width: 50%;
		border-radius: 0.25rem;
		height: 40px;
		display: flex;
		align-items: center;
		padding-left:10px;
		border: 1px solid #fff;
	}
	.checkboxSelect{
		border-color:  #007bfc;
	}
	@media screen and (max-width: 755px) {
		.checkboxDiv {
			width: 100% !important;
		}
		.checkDiv{
			display:block !important;
		}
	}
	.payType {
		cursor: pointer;
	}

	.payType.active,
	.payType:hover {
		border-color: #2948df !important;
	}

	.new-user {
		display: none;
	}

	.fas {
		cursor: pointer;
	}

	.number {
		width: 50px;
	}

	.remarksInput::-webkit-input-placeholder{
		color: #CACACA;
	}
</style>

<script>
	function init_tpl()
	{
		var checkbox = $('.payment-checkbox');
		checkbox.map(function (k, v) {
			if($(v).prop('checked'))
			{
				// 移除支付方式选中
				$(".addfunds-payment").removeClass("active").find(".hidden").removeAttr("checked")
			}
		})
	}
	init_tpl();
</script><?php if($TplName != 'login' && $TplName != 'register' && $TplName != 'pwreset' && $TplName != 'bind' && $TplName != 'loginaccesstoken'): ?>
</div>
</div>
</div>

<footer class="footer">
	<div class="container-fluid">
		<div class="row">
			<div class="col-sm-6">
			    <?php if($CustomDepot['yangcube_showhitokoto'] == "true"): ?>
			    <a href="#" id="hitokoto_text">获取一言中...</a><br>
			    <?php endif; ?>
				&copy; <?php echo $Setting['company_name']; ?>.
				<?php endif; ?>
			</div>
			<div class="col-sm-6">
				<div class="text-sm-right d-none d-sm-block">
					
				</div>
			</div>
		</div>
	</div>
</footer>

<script src="/themes/clientarea/default/assets/js/app.js?v=<?php echo $Ver; ?>"></script>
<?php $hooks=hook('client_area_footer_output'); if($hooks): foreach($hooks as $item): ?>
		<?php echo $item; ?>
	<?php endforeach; ?>
<?php endif; if($CustomDepot['yangcube_showhitokoto'] == "true"): ?>
<script>
fetch('<?php if($CustomDepot['yangcube_hitokotoapi']): ?><?php echo $CustomDepot['yangcube_hitokotoapi']; else: ?>https://v1.hitokoto.cn/<?php endif; ?>')
.then(response => response.json())
.then(data => {
  const hitokoto = document.getElementById('hitokoto_text')
  hitokoto.href = 'https://hitokoto.cn/?uuid=' + data.uuid
  hitokoto.innerText = "【Hitokoto 一言】" + data.hitokoto
})
.catch(console.error)
</script>
<?php endif; ?>
{/if}
</body>

</html>