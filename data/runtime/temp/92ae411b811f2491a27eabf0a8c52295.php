<?php /*a:7:{s:69:"/www/wwwroot/cloud.hf.pw2/public/themes/clientarea/ogmiao/details.tpl";i:1743845787;s:75:"/www/wwwroot/cloud.hf.pw2/public/themes/clientarea/ogmiao/includes/head.tpl";i:1742354372;s:75:"/www/wwwroot/cloud.hf.pw2/public/themes/clientarea/ogmiao/includes/menu.tpl";i:1720065013;s:81:"/www/wwwroot/cloud.hf.pw2/public/themes/clientarea/ogmiao/includes/pageheader.tpl";i:1719999923;s:81:"/www/wwwroot/cloud.hf.pw2/public/themes/clientarea/ogmiao/includes/breadcrumb.tpl";i:1719999923;s:73:"/www/wwwroot/cloud.hf.pw2/public/themes/clientarea/ogmiao/error/alert.tpl";i:1719999922;s:81:"/www/wwwroot/cloud.hf.pw2/public/themes/clientarea/ogmiao/error/notifications.tpl";i:1719999922;}*/ ?>

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
<style>
/* 基础变量定义 */
:root {
 --primary: #f08a5d;
 --primary-dark: #e67e22;
 --primary-light: #fad7a0;
 --secondary: #f9b384;
 --accent: #ffbe76;
 --dark: #2d3436;
 --light: #ffffff;
 --gray: #636e72;
 --gray-light: #f8f8f8;
 --card-shadow: 0 10px 25px rgba(0, 0, 0, 0.05);
 --card-hover-shadow: 0 15px 35px rgba(0, 0, 0, 0.1);
}

/* 卡片样式 */
.card {
 border: none;
 border-radius: 15px;
 box-shadow: var(--card-shadow);
 transition: all 0.3s ease;
 overflow: hidden;
 margin-bottom: 20px;
 animation: fadeIn 0.5s ease-out;
}

.card:hover {
 box-shadow: var(--card-hover-shadow);
 transform: translateY(-5px);
}

@keyframes fadeIn {
 from { opacity: 0; transform: translateY(10px); }
 to { opacity: 1; transform: translateY(0); }
}

.card-body {
 padding: 25px;
 position: relative;
 overflow: hidden;
}

.card-body::before {
 content: "";
 position: absolute;
 top: 0;
 left: 0;
 width: 100%;
 height: 3px;
 background: linear-gradient(90deg, var(--primary), var(--primary-light), var(--primary));
 opacity: 0.7;
}

.card-title {
 font-size: 1.25rem;
 font-weight: 700;
 color: var(--dark);
 margin-bottom: 1.5rem;
 position: relative;
 display: inline-block;
}

.card-title::after {
 content: "";
 position: absolute;
 bottom: -8px;
 left: 0;
 width: 40px;
 height: 3px;
 background: var(--primary);
 border-radius: 3px;
}

/* 表单控件样式 */
.form-group {
 margin-bottom: 1.5rem;
 position: relative;
}

.form-control {
 border-radius: 8px;
 border: 1px solid rgba(240, 138, 93, 0.2);
 transition: all 0.3s ease;
 box-shadow: 0 2px 10px rgba(240, 138, 93, 0.05);
 padding: 0.6rem 1rem;
 height: calc(1.5em + 1.2rem + 2px);
}

.form-control:focus {
 box-shadow: 0 0 0 4px rgba(240, 138, 93, 0.15);
 border-color: var(--primary);
}

.form-control:hover {
 border-color: var(--primary);
 box-shadow: 0 2px 8px rgba(240, 138, 93, 0.15);
 transform: translateY(-1px);
}

.form-control[readonly] {
 background-color: rgba(240, 138, 93, 0.05);
 cursor: not-allowed;
}

select.form-control {
 background-image: url("data:image/svg+xml,%3csvg xmlns='http://www.w3.org/2000/svg' width='4' height='5' viewBox='0 0 4 5'%3e%3cpath fill='%23f08a5d' d='M2 0L0 2h4zm0 5L0 3h4z'/%3e%3c/svg%3e");
 background-repeat: no-repeat;
 background-position: right 1rem center;
 background-size: 8px 10px;
 padding-right: 2.5rem;
 -webkit-appearance: none;
 -moz-appearance: none;
 appearance: none;
}

textarea.form-control {
 min-height: 100px;
 resize: vertical;
}

/* 标签样式 */
label {
 font-weight: 500;
 color: var(--dark);
 margin-bottom: 0.5rem;
 font-size: 0.9rem;
}

/* 复选框样式 */
.custom-control-input:checked ~ .custom-control-label::before {
 background-color: var(--primary);
 border-color: var(--primary);
 box-shadow: 0 0 0 0.2rem rgba(240, 138, 93, 0.25);
}

.custom-control-label::before {
 transition: all 0.3s ease;
}

.custom-control-input:focus ~ .custom-control-label::before {
 box-shadow: 0 0 0 0.2rem rgba(240, 138, 93, 0.25);
}

.custom-control-input:checked ~ .custom-control-label {
 font-weight: 600;
 color: var(--primary-dark);
}

/* 提交按钮样式 */
.btn-primary {
 background-color: var(--primary);
 border-color: var(--primary);
 color: white;
 box-shadow: 0 4px 15px rgba(240, 138, 93, 0.3);
 padding: 0.6rem 1.5rem;
 border-radius: 50px;
 font-weight: 600;
 transition: all 0.3s ease;
 position: relative;
 overflow: hidden;
 z-index: 1;
}

.btn-primary:hover {
 background-color: var(--primary-dark);
 border-color: var(--primary-dark);
 transform: translateY(-3px);
 box-shadow: 0 6px 20px rgba(240, 138, 93, 0.4);
}

.btn-primary:active {
 transform: translateY(-1px);
 box-shadow: 0 3px 10px rgba(240, 138, 93, 0.3);
}

.btn-primary::after {
 content: '';
 position: absolute;
 top: 0;
 left: -100%;
 width: 100%;
 height: 100%;
 background: linear-gradient(90deg, rgba(255, 255, 255, 0.2), rgba(255, 255, 255, 0));
 transition: all 0.4s ease;
 z-index: -1;
}

.btn-primary:hover::after {
 left: 100%;
}

/* 装饰元素 */
.decoration {
 position: absolute;
 border-radius: 50%;
 background: linear-gradient(135deg, var(--primary), var(--secondary));
 opacity: 0.1;
 z-index: 0;
}

.decoration-1 {
 width: 100px;
 height: 100px;
 top: -30px;
 right: -30px;
 animation: float 8s ease-in-out infinite;
}

.decoration-2 {
 width: 70px;
 height: 70px;
 bottom: -20px;
 left: -20px;
 animation: float 6s ease-in-out infinite 1s;
}

@keyframes float {
 0% { transform: translateY(0px); }
 50% { transform: translateY(-10px); }
 100% { transform: translateY(0px); }
}

/* 响应式调整 */
@media (max-width: 992px) {
 .card-body {
   padding: 20px;
 }
}

@media (max-width: 768px) {
 .card-body {
   padding: 15px;
 }
 
 .form-control {
   font-size: 0.9rem;
   padding: 0.5rem 0.8rem;
 }
 
 .btn-primary {
   padding: 0.5rem 1.2rem;
 }
}

@media (max-width: 576px) {
 .card-body {
   padding: 15px 10px;
 }
 
 .form-group {
   margin-bottom: 1rem;
 }
 
 .form-control {
   font-size: 0.85rem;
   padding: 0.4rem 0.7rem;
 }
 
 .btn-primary {
   padding: 0.4rem 1rem;
   font-size: 0.9rem;
 }
 
 .card-title {
   font-size: 1.1rem;
 }
 
 label {
   font-size: 0.85rem;
 }
}

/* 错误提示样式 */
.invalid-feedback {
 color: #fc5c65;
 font-size: 0.8rem;
 margin-top: 0.25rem;
}

.was-validated .form-control:invalid, 
.form-control.is-invalid {
 border-color: #fc5c65;
 background-image: url("data:image/svg+xml,%3csvg xmlns='http://www.w3.org/2000/svg' width='12' height='12' fill='none' stroke='%23fc5c65' viewBox='0 0 12 12'%3e%3ccircle cx='6' cy='6' r='4.5'/%3e%3cpath stroke-linejoin='round' d='M5.8 3.6h.4L6 6.5z'/%3e%3ccircle cx='6' cy='8.2' r='.6' fill='%23fc5c65' stroke='none'/%3e%3c/svg%3e");
 background-repeat: no-repeat;
 background-position: right calc(0.375em + 0.1875rem) center;
 background-size: calc(0.75em + 0.375rem) calc(0.75em + 0.375rem);
}

.was-validated .form-control:invalid:focus, 
.form-control.is-invalid:focus {
 border-color: #fc5c65;
 box-shadow: 0 0 0 0.2rem rgba(252, 92, 101, 0.25);
}

/* 成功提示样式 */
.was-validated .form-control:valid, 
.form-control.is-valid {
 border-color: #28c76f;
 background-image: url("data:image/svg+xml,%3csvg xmlns='http://www.w3.org/2000/svg' width='8' height='8' viewBox='0 0 8 8'%3e%3cpath fill='%2328c76f' d='M2.3 6.73L.6 4.53c-.4-1.04.46-1.4 1.1-.8l1.1 1.4 3.4-3.8c.6-.63 1.6-.27 1.2.7l-4 4.6c-.43.5-.8.4-1.1.1z'/%3e%3c/svg%3e");
 background-repeat: no-repeat;
 background-position: right calc(0.375em + 0.1875rem) center;
 background-size: calc(0.75em + 0.375rem) calc(0.75em + 0.375rem);
}

.was-validated .form-control:valid:focus, 
.form-control.is-valid:focus {
 border-color: #28c76f;
 box-shadow: 0 0 0 0.2rem rgba(40, 199, 111, 0.25);
}

/* 表单分组样式 */
.form-section {
 position: relative;
 padding: 20px;
 margin-bottom: 20px;
 border-radius: 10px;
 background-color: rgba(240, 138, 93, 0.03);
 border: 1px solid rgba(240, 138, 93, 0.1);
}

.form-section-title {
 position: absolute;
 top: -12px;
 left: 20px;
 background-color: white;
 padding: 0 10px;
 font-size: 0.9rem;
 font-weight: 600;
 color: var(--primary);
}

/* 分隔线样式 */
.section-divider {
 height: 1px;
 background: linear-gradient(90deg, rgba(240, 138, 93, 0.2), rgba(240, 138, 93, 0.05), rgba(240, 138, 93, 0.2));
 margin: 30px 0;
 position: relative;
}

.section-divider::before {
 content: "";
 position: absolute;
 width: 40px;
 height: 3px;
 background: var(--primary);
 top: -1px;
 left: 50%;
 transform: translateX(-50%);
 border-radius: 3px;
}
</style>

<?php if($ErrorMsg): ?>
<!-- <div class="alert alert-danger mb-4">
	<div class="alert-body"></div>
</div> -->
<script type="text/javascript">
	$(function () {
		toastr.error('');
	});
</script>
<?php endif; if($SuccessMsg): ?>
<script type="text/javascript">
	$(function () {
		toastr.success('');
		setTimeout(function () {
			var url = ''
			if (url) {
				location.href = url
			}
		}, 500);
	});
</script>
<?php endif; ?>

<form method="post" class="needs-validation" novalidate><input type="hidden" name="token" value="<?php echo $Token; ?>">
  <div class="card">
    <div class="card-body">
      <div class="decoration decoration-1"></div>
      <div class="decoration decoration-2"></div>
      <h4 class="card-title mb-4"><?php echo $Lang['contact_information']; ?></h4>
      <div class="row">
        <div class="col-sm-6 col-12">
          <div class="form-group">
            <label for="email-input"><?php echo $Lang['email_address']; ?></label>
            <input type="text" class="form-control" id="email-input" value="<?php echo $Userinfo['user']['email']; ?>" placeholder="" readonly>
          </div>
        </div>
        <div class="col-sm-6 col-12">
          <div class="form-group">
            <label for="phone-input"><?php echo $Lang['phone_number']; ?></label>
            <input type="text" class="form-control" id="phone-input" value="<?php echo $Userinfo['user']['phonenumber']; ?>" placeholder="" readonly>
          </div>
        </div>
        <div class="col-sm-6 col-12">
          <div class="form-group">
            <label for="qq-input"><?php echo $Lang['qq_number']; ?></label>
            <input type="text" data-parsley-type="number" class="form-control" id="qq-input" name="qq" value="<?php echo $Userinfo['user']['qq']; ?>"
              placeholder="<?php echo $Lang['please_enter_qq_number']; ?>" oninput="value=value.replace(/[^\d]/g,'')">
          </div>
        </div>
      </div>
      
      <div class="section-divider"></div>
      
      <h4 class="card-title mb-4"><?php echo $Lang['details']; ?></h4>
      <div class="row">
        <div class="col-sm-6 col-12">
          <div class="form-group">
            <label for="username-input"><?php echo $Lang['real_name']; ?></label>
            <input type="text" class="form-control" id="username-input" name="username" value="<?php echo $Userinfo['user']['username']; ?>" required />
            <div class="invalid-feedback">
              <?php echo $Lang['real_name']; ?> <?php echo $Lang['is_required']; ?>
            </div>
          </div>
        </div>
        <div class="col-sm-6 col-12">
          <div class="form-group">
            <label for="company-input"><?php echo $Lang['corporate_name']; ?></label>
            <input type="text" class="form-control" id="company-input" name="companyname" value="<?php echo $Userinfo['user']['companyname']; ?>"
              placeholder="<?php echo $Lang['please_enter_company_name']; ?>">
          </div>
        </div>
        <div class="col-sm-6 col-12">
          <div class="form-group">
            <label for="country-select"><?php echo $Lang['country']; ?></label>
            <select class="form-control" id="country-select" name="country">
              <?php foreach($Details['areas']['country'] as $country): ?>
              <option <?php if($country['name']==$Userinfo['user']['country']): ?>selected<?php endif; ?> value="<?php echo $country['name']; ?>"><?php echo $country['name']; ?></option>
              <?php endforeach; ?>
            </select>
          </div>
        </div>
        <div class="col-sm-6 col-12">
          <div class="form-group">
            <label for="province-input"><?php echo $Lang['province']; ?></label>
            <input type="text" class="form-control" id="province-input" name="province" value="<?php echo $Userinfo['user']['province']; ?>">
          </div>
        </div>
        <div class="col-sm-6 col-12">
          <div class="form-group">
            <label for="city-input"><?php echo $Lang['city']; ?></label>
            <input type="text" class="form-control" id="city-input" name="city" value="<?php echo $Userinfo['user']['city']; ?>">
          </div>
        </div>
        <div class="col-sm-6 col-12">
          <div class="form-group">
            <label for="region-input"><?php echo $Lang['region']; ?></label>
            <input type="text" class="form-control" id="region-input" name="region" value="<?php echo $Userinfo['user']['region']; ?>">
          </div>
        </div>
        <div class="col-sm-6 col-12">
          <div class="form-group">
            <label for="address-input"><?php echo $Lang['address']; ?></label>
            <input type="text" class="form-control" id="address-input" name="address1" value="<?php echo $Userinfo['user']['address1']; ?>">
          </div>
        </div>
      </div>
      
      <div class="section-divider"></div>
      
      <h4 class="card-title mb-4"><?php echo $Lang['other_information']; ?></h4>
      <div class="row">
        <div class="col-sm-12 col-12">
          <div class="form-group">
            <label for="payment-select"><?php echo $Lang['default_payment']; ?></label>
            <?php if($Userinfo['gateways']): ?>
            <select class="form-control" id="payment-select" name="defaultgateway">
              <?php foreach($Userinfo['gateways'] as $gateway): ?>
              <option value="<?php echo $gateway['name']; ?>" <?php if($Userinfo['user']['defaultgateway']==$gateway['name']): ?>selected<?php endif; ?>>
                <?php echo $gateway['title']; ?></option>
              <?php endforeach; ?>
            </select>
            <?php endif; ?>
          </div>
        </div>
        <div class="col-sm-6 col-12">
          <div class="form-group">
            <label for="group-input"><?php echo $Lang['user_group']; ?></label>
            <input type="text" class="form-control" id="group-input" value="<?php echo (isset($Userinfo['client_group']['group_name']) && ($Userinfo['client_group']['group_name'] !== '')?$Userinfo['client_group']['group_name']:"默认分组"); ?>"
              readonly="">
          </div>
        </div>
        <div class="col-sm-6 col-12">
          <div class="form-group">
            <label><?php echo $Lang['marketing_information']; ?></label>
            <div class="custom-control custom-checkbox">
              <input type="checkbox" class="custom-control-input" id="marketing_emails_opt_in"
                name="marketing_emails_opt_in" value="1" <?php if($Userinfo['user']['marketing_emails_opt_in']==1): ?>
                checked="checked" <?php endif; ?>>
              <label class="custom-control-label" for="marketing_emails_opt_in"><?php echo $Lang['accept_marketing_information']; ?></label>
            </div>
          </div>
        </div>
        <div class="col-sm-6 col-12">
          <div class="form-group">
            <label><?php echo $Lang['send_close_title']; ?></label>
            <div class="custom-control custom-checkbox">
              <input type="checkbox" class="custom-control-input" id="send_close_in"
                     name="send_close" value="1" <?php if($Userinfo['user']['send_close']==1): ?>
                checked="checked" <?php endif; ?>>
              <label class="custom-control-label" for="send_close_in"><?php echo $Lang['send_close']; ?></label>
            </div>
          </div>
        </div>
        
        <?php if($Userinfo['customs']): ?>
        <div class="col-12">
          <div class="form-section mt-4">
            <span class="form-section-title"><?php echo $Lang['custom_fields']; ?></span>
            <div class="row">
              <?php foreach($Userinfo['customs'] as $custom): ?>
              <div class="col-sm-6 col-12">
                <div class="form-group" data-order="<?php echo $custom['sortorder']; ?>">
                  <label for="custom-<?php echo $custom['id']; ?>"><?php echo $custom['fieldname']; ?></label>
                  <?php if($custom['fieldtype'] == 'dropdown'): ?>
                  <select class="form-control" id="custom-<?php echo $custom['id']; ?>" name="custom[<?php echo $custom['id']; ?>]">
                    <?php foreach(explode(",",$custom['fieldoptions']) as $field): ?>
                    <option <?php if($field==$custom['value']): ?>selected<?php endif; ?>><?php echo $field; ?></option>
                    <?php endforeach; ?>
                  </select>
                  <?php elseif($custom['fieldtype'] == 'text'): ?>
                  <input type="text" class="form-control" id="custom-<?php echo $custom['id']; ?>" name="custom[<?php echo $custom['id']; ?>]" value="<?php echo $custom['value']; ?>"
                    placeholder="<?php echo $custom['description']; ?>" <?php if($custom['required']): ?>required<?php endif; ?> />
                  <?php elseif($custom['fieldtype'] == 'password'): ?>
                  <input type="password" class="form-control" id="custom-<?php echo $custom['id']; ?>" name="custom[<?php echo $custom['id']; ?>]" value="<?php echo $custom['value']; ?>"
                    placeholder="<?php echo $custom['description']; ?>" <?php if($custom['required']): ?>required<?php endif; ?> />
                  <?php elseif($custom['fieldtype'] == 'link'): ?>
                  <input type="text" class="form-control" id="custom-<?php echo $custom['id']; ?>" name="custom[<?php echo $custom['id']; ?>]" value="<?php echo $custom['value']; ?>"
                    placeholder="<?php echo $custom['description']; ?>" <?php if($custom['required']): ?>required<?php endif; ?> />
                  <?php elseif($custom['fieldtype'] == 'tickbox'): ?>
                  <div class="custom-control custom-checkbox">
                    <input type="checkbox" class="custom-control-input" id="custom-<?php echo $custom['id']; ?>" name="custom[<?php echo $custom['id']; ?>]" 
                      <?php if($custom['value']): ?>checked<?php endif; ?> value="1">
                    <label class="custom-control-label" for="custom-<?php echo $custom['id']; ?>"><?php echo $custom['description']; ?></label>
                  </div>
                  <?php elseif($custom['fieldtype'] == 'textarea'): ?>
                  <textarea class="form-control" id="custom-<?php echo $custom['id']; ?>" name="custom[<?php echo $custom['id']; ?>]" rows="5"
                    placeholder="<?php echo $custom['description']; ?>"><?php echo $custom['value']; ?></textarea>
                  <?php endif; if($custom['required']): ?>
                  <div class="invalid-feedback">
                    <?php echo $custom['fieldname']; ?> <?php echo $Lang['is_required']; ?>
                  </div>
                  <?php endif; ?>
                </div>
              </div>
              <?php endforeach; ?>
            </div>
          </div>
        </div>
        <?php endif; ?>
        
        <div class="col-sm-12 mt-4">
          <div class="form-group mb-0 text-center">
            <button type="submit" class="btn btn-primary px-5 submitBtn">
              <i class="bx bx-save mr-2"></i><?php echo $Lang['submit']; ?>
            </button>
          </div>
        </div>
      </div>
    </div>
  </div>
</form>

<script>
// Form validation
(function() {
  'use strict';
  window.addEventListener('load', function() {
    // Fetch all the forms we want to apply custom Bootstrap validation styles to
    var forms = document.getElementsByClassName('needs-validation');
    // Loop over them and prevent submission
    var validation = Array.prototype.filter.call(forms, function(form) {
      form.addEventListener('submit', function(event) {
        if (form.checkValidity() === false) {
          event.preventDefault();
          event.stopPropagation();
          
          // Find the first invalid element and focus it
          const invalidElement = form.querySelector(':invalid');
          if (invalidElement) {
            invalidElement.focus();
            
            // Scroll to the invalid element with smooth animation
            invalidElement.scrollIntoView({
              behavior: 'smooth',
              block: 'center'
            });
          }
        }
        form.classList.add('was-validated');
      }, false);
    });
  }, false);
})();

// Add animation to form elements
document.addEventListener('DOMContentLoaded', function() {
  // Animate form groups on page load
  const formGroups = document.querySelectorAll('.form-group');
  formGroups.forEach((group, index) => {
    group.style.opacity = '0';
    group.style.transform = 'translateY(20px)';
    
    setTimeout(() => {
      group.style.transition = 'all 0.5s ease';
      group.style.opacity = '1';
      group.style.transform = 'translateY(0)';
    }, 100 + (index * 50));
  });
  
  // Add ripple effect to submit button
  const submitBtn = document.querySelector('.submitBtn');
  if (submitBtn) {
    submitBtn.addEventListener('mousedown', function(e) {
      const x = e.clientX - e.target.getBoundingClientRect().left;
      const y = e.clientY - e.target.getBoundingClientRect().top;
      
      const ripple = document.createElement('span');
      ripple.style.position = 'absolute';
      ripple.style.width = '1px';
      ripple.style.height = '1px';
      ripple.style.borderRadius = '50%';
      ripple.style.backgroundColor = 'rgba(255, 255, 255, 0.7)';
      ripple.style.transform = 'scale(0)';
      ripple.style.left = x + 'px';
      ripple.style.top = y + 'px';
      ripple.style.animation = 'ripple 0.6s linear';
      
      this.appendChild(ripple);
      
      setTimeout(() => {
        ripple.remove();
      }, 600);
    });
    
    // Add keyframe animation for ripple effect
    const style = document.createElement('style');
    style.textContent = `
      @keyframes ripple {
        to {
          transform: scale(100);
          opacity: 0;
        }
      }
    `;
    document.head.appendChild(style);
  }
  
  // Add hover effect to form controls
  const formControls = document.querySelectorAll('.form-control:not([readonly])');
  formControls.forEach(control => {
    control.addEventListener('mouseenter', function() {
      this.style.transform = 'translateY(-2px)';
      this.style.boxShadow = '0 5px 15px rgba(240, 138, 93, 0.15)';
    });
    
    control.addEventListener('mouseleave', function() {
      this.style.transform = '';
      this.style.boxShadow = '';
    });
  });
});
</script>

<?php if($TplName != 'login' && $TplName != 'register' && $TplName != 'pwreset' && $TplName != 'bind' && $TplName != 'loginaccesstoken'): ?>
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