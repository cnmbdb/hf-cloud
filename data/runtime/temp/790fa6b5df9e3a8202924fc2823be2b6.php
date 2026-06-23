<?php /*a:8:{s:69:"/www/wwwroot/cloud.hf.pw2/public/themes/clientarea/ogmiao/message.tpl";i:1743847577;s:75:"/www/wwwroot/cloud.hf.pw2/public/themes/clientarea/ogmiao/includes/head.tpl";i:1742354372;s:75:"/www/wwwroot/cloud.hf.pw2/public/themes/clientarea/ogmiao/includes/menu.tpl";i:1720065013;s:81:"/www/wwwroot/cloud.hf.pw2/public/themes/clientarea/ogmiao/includes/pageheader.tpl";i:1719999923;s:81:"/www/wwwroot/cloud.hf.pw2/public/themes/clientarea/ogmiao/includes/breadcrumb.tpl";i:1719999923;s:81:"/www/wwwroot/cloud.hf.pw2/public/themes/clientarea/ogmiao/includes/tablestyle.tpl";i:1719999923;s:86:"/www/wwwroot/cloud.hf.pw2/public/themes/clientarea/ogmiao/message/messagetabledata.tpl";i:1719999923;s:82:"/www/wwwroot/cloud.hf.pw2/public/themes/clientarea/ogmiao/includes/tablefooter.tpl";i:1719999923;}*/ ?>

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
<link rel="stylesheet" href="/themes/clientarea/default/assets/libs/bootstrap-select/css/bootstrap-select.min.css?v=<?php echo $Ver; ?>">
<script src="/themes/clientarea/default/assets/libs/bootstrap-select/js/bootstrap-select.min.js?v=<?php echo $Ver; ?>"></script>
<script type="text/javascript">
	$(function(){
		
	});
</script>

<style>
/* 消息中心页面样式 */
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
 --danger: #fc5c65;
 --success: #26de81;
}

.card {
 border: none;
 border-radius: 15px;
 box-shadow: 0 10px 25px rgba(0, 0, 0, 0.05);
 transition: all 0.3s ease;
 overflow: hidden;
 margin-bottom: 20px;
 animation: fadeIn 0.5s ease-out;
}

.card:hover {
 box-shadow: 0 15px 35px rgba(0, 0, 0, 0.1);
 transform: translateY(-5px);
}

.card-body {
 padding: 20px;
}

/* 导航标签样式 */
.nav-tabs {
 border-bottom: 1px solid rgba(240, 138, 93, 0.2);
 margin-bottom: 20px;
}

.nav-tabs .nav-item {
 margin-bottom: -1px;
}

.nav-tabs .nav-link {
 border: none;
 border-bottom: 2px solid transparent;
 border-radius: 0;
 padding: 10px 20px;
 font-weight: 500;
 color: var(--gray);
 transition: all 0.3s ease;
 position: relative;
}

.nav-tabs .nav-link:hover {
 color: var(--primary);
 border-color: transparent;
}

.nav-tabs .nav-link.active {
 color: var(--primary);
 background-color: transparent;
 border-color: var(--primary);
 font-weight: 600;
}

.nav-tabs .nav-link.active::after {
 content: '';
 position: absolute;
 bottom: -2px;
 left: 0;
 width: 100%;
 height: 2px;
 background-color: var(--primary);
 border-radius: 2px;
}

/* 搜索区域样式 */
.search-area {
 margin-bottom: 20px;
 position: relative;
}

/* 全新搜索框样式 */
.custom-search-container {
 position: relative;
 max-width: 400px;
 margin-bottom: 15px;
}

.custom-search-input {
 width: 100%;
 height: 42px;
 padding: 10px 15px 10px 45px;
 border-radius: 50px;
 border: 1px solid rgba(240, 138, 93, 0.2);
 background-color: #fff;
 box-shadow: 0 3px 10px rgba(240, 138, 93, 0.05);
 transition: all 0.3s ease;
 font-size: 14px;
 color: var(--dark);
}

.custom-search-input:focus {
 outline: none;
 border-color: var(--primary);
 box-shadow: 0 5px 15px rgba(240, 138, 93, 0.1);
 padding-left: 50px;
}

.custom-search-input::placeholder {
 color: #aaa;
 transition: all 0.3s ease;
}

.custom-search-input:focus::placeholder {
 opacity: 0.7;
}

.custom-search-icon {
 position: absolute;
 left: 15px;
 top: 50%;
 transform: translateY(-50%);
 color: var(--primary);
 font-size: 18px;
 pointer-events: none;
 transition: all 0.3s ease;
}

.custom-search-input:focus + .custom-search-icon {
 color: var(--primary-dark);
 left: 18px;
}

.custom-search-clear {
 position: absolute;
 right: 15px;
 top: 50%;
 transform: translateY(-50%);
 color: #ccc;
 font-size: 16px;
 cursor: pointer;
 opacity: 0;
 transition: all 0.3s ease;
 background: none;
 border: none;
 padding: 0;
 display: flex;
 align-items: center;
 justify-content: center;
 width: 20px;
 height: 20px;
}

.custom-search-input:valid ~ .custom-search-clear,
.custom-search-input:focus ~ .custom-search-clear {
 opacity: 1;
}

.custom-search-clear:hover {
 color: var(--primary);
 transform: translateY(-50%) scale(1.1);
}

/* 表格样式 */
.table.tablelist {
 width: 100%;
 border-collapse: separate;
 border-spacing: 0;
 margin-bottom: 0;
}

.table.tablelist thead {
 background-color: rgba(240, 138, 93, 0.05);
}

.table.tablelist th {
 padding: 15px !important;
 vertical-align: middle !important;
 font-weight: 600 !important;
 color: var(--dark) !important;
 border-bottom: 2px solid rgba(240, 138, 93, 0.2) !important;
 transition: all 0.3s ease;
}

.table.tablelist td {
 padding: 15px !important;
 vertical-align: middle !important;
 border-top: none !important;
 border-bottom: 1px solid rgba(0, 0, 0, 0.05) !important;
 transition: all 0.3s ease;
 color: var(--gray);
}

.table.tablelist tr:hover td {
 background-color: rgba(240, 138, 93, 0.03) !important;
}

/* 排序图标样式 */
.pointer {
 cursor: pointer;
}

.pointer .bx-caret-up,
.pointer .bx-caret-down {
 font-size: 10px;
 color: rgba(0, 0, 0, 0.2);
 transition: all 0.3s ease;
}

.pointer:hover .bx-caret-up,
.pointer:hover .bx-caret-down {
 color: var(--primary);
}

/* 按钮样式 */
.btn {
 padding: 0.6rem 1.5rem;
 border-radius: 50px;
 font-weight: 600;
 transition: all 0.3s ease;
 position: relative;
 overflow: hidden;
 z-index: 1;
 margin-right: 10px;
}

.btn::before {
 content: "";
 position: absolute;
 top: 0;
 left: -100%;
 width: 100%;
 height: 100%;
 background: linear-gradient(90deg, rgba(255, 255, 255, 0.2), rgba(255, 255, 255, 0));
 transition: all 0.4s ease;
 z-index: -1;
}

.btn:hover::before {
 left: 100%;
}

.btn-primary {
 background-color: var(--primary);
 border-color: var(--primary);
 color: white;
 box-shadow: 0 4px 15px rgba(240, 138, 93, 0.3);
}

.btn-primary:hover {
 background-color: var(--primary-dark);
 border-color: var(--primary-dark);
 transform: translateY(-3px);
 box-shadow: 0 6px 20px rgba(240, 138, 93, 0.4);
}

.btn-primary:active {
 transform: scale(0.97);
 box-shadow: 0 2px 8px rgba(240, 138, 93, 0.3) !important;
}

.btn-danger {
 background-color: var(--danger);
 border-color: var(--danger);
 color: white;
 box-shadow: 0 4px 15px rgba(252, 92, 101, 0.3);
}

.btn-danger:hover {
 background-color: #eb3b5a;
 border-color: #eb3b5a;
 transform: translateY(-3px);
 box-shadow: 0 6px 20px rgba(252, 92, 101, 0.4);
}

.btn-danger:active {
 transform: scale(0.97);
 box-shadow: 0 2px 8px rgba(252, 92, 101, 0.3) !important;
}

.not-allowed {
 opacity: 0.7;
 cursor: not-allowed;
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

/* 消息状态标签 */
.badge {
 padding: 0.4rem 0.8rem;
 font-size: 0.75rem;
 font-weight: 600;
 border-radius: 50px;
 margin-left: 0.5rem;
}

.badge-info {
 background-color: rgba(240, 138, 93, 0.15) !important;
 color: #f08a5d !important;
}

.badge-success {
 background-color: rgba(38, 222, 129, 0.15);
 color: #26de81;
}

.badge-warning {
 background-color: rgba(254, 211, 48, 0.15);
 color: #fed330;
}

/* 调整表格头部的响应式布局 */
@media (max-width: 768px) {
 .custom-search-container {
   max-width: 100%;
 }
 
 .btn {
   padding: 0.5rem 1.2rem;
   font-size: 0.9rem;
 }
}

@media (max-width: 576px) {
 .nav-tabs {
   display: flex;
   overflow-x: auto;
   white-space: nowrap;
   padding-bottom: 5px;
 }
 
 .nav-tabs .nav-item {
   flex: 0 0 auto;
 }
 
 .nav-tabs .nav-link {
   padding: 8px 10px;
   font-size: 0.85rem;
 }
 
 .table.tablelist th,
 .table.tablelist td {
   padding: 10px 8px !important;
   font-size: 0.85rem;
 }
 
 .custom-search-input {
   height: 38px;
   font-size: 13px;
   padding: 8px 15px 8px 40px;
 }
 
 .custom-search-icon {
   font-size: 16px;
   left: 12px;
 }
 
 .btn {
   padding: 0.4rem 1rem;
   font-size: 0.85rem;
   margin-bottom: 10px;
 }
}

/* 动画效果 */
@keyframes fadeIn {
 from { opacity: 0; transform: translateY(10px); }
 to { opacity: 1; transform: translateY(0); }
}

.table-container {
 animation: fadeIn 0.5s ease-out;
}

/* 美化分页样式 */
.pagination {
 display: flex;
 padding-left: 0;
 list-style: none;
 border-radius: 0.25rem;
 margin-top: 0;
 margin-bottom: 0;
}

.pagination .page-item {
 margin: 0 3px;
}

.pagination .page-item .page-link {
 position: relative;
 display: block;
 padding: 0.5rem 0.75rem;
 margin-left: -1px;
 line-height: 1.25;
 color: var(--primary);
 background-color: #fff;
 border: 1px solid rgba(240, 138, 93, 0.2);
 border-radius: 50px;
 transition: all 0.3s ease;
 min-width: 38px;
 text-align: center;
 font-weight: 500;
 box-shadow: 0 2px 5px rgba(240, 138, 93, 0.05);
}

.pagination .page-item .page-link:hover {
 z-index: 2;
 color: var(--primary-dark);
 text-decoration: none;
 background-color: rgba(240, 138, 93, 0.1);
 border-color: var(--primary);
 transform: translateY(-2px);
 box-shadow: 0 5px 15px rgba(240, 138, 93, 0.1);
}

.pagination .page-item.active .page-link {
 z-index: 3;
 color: #fff;
 background-color: var(--primary);
 border-color: var(--primary);
 box-shadow: 0 5px 15px rgba(240, 138, 93, 0.2);
}

.pagination .page-item.disabled .page-link {
 color: rgba(0, 0, 0, 0.3);
 pointer-events: none;
 cursor: not-allowed;
 background-color: #f8f9fa;
 border-color: #dee2e6;
 box-shadow: none;
}

/* 搜索结果高亮 */
.highlight-match {
 background-color: rgba(240, 138, 93, 0.2);
 padding: 0 2px;
 border-radius: 2px;
 font-weight: 600;
}

/* 搜索无结果提示 */
.no-results {
 text-align: center;
 padding: 20px;
 color: var(--gray);
 background-color: rgba(240, 138, 93, 0.03);
 border-radius: 10px;
 margin: 20px 0;
}

.no-results i {
 font-size: 24px;
 color: var(--primary);
 margin-bottom: 10px;
 display: block;
}

/* 消息标题样式 */
.message-title {
 color: var(--dark);
 font-weight: 500;
 transition: all 0.3s ease;
}

.message-title:hover {
 color: var(--primary);
}

/* 未读消息样式 */
.unread-message {
 position: relative;
}

.unread-message td:first-child {
 position: relative;
}

.unread-message td:first-child::before {
 content: "";
 position: absolute;
 left: 0;
 top: 50%;
 transform: translateY(-50%);
 width: 4px;
 height: 50%;
 background-color: var(--primary);
 border-radius: 0 2px 2px 0;
}

.unread-message .message-title {
 font-weight: 600;
}

/* 按钮容器样式 */
.action-buttons {
 margin-top: 15px;
 display: flex;
 flex-wrap: wrap;
}
</style>

<div class="card">
	<div class="card-body">
		<div class="table-container">
			<div class="table-header">
				<ul class="nav nav-tabs" role="tablist">
					<li class="nav-item">
						<a href="message?type=0" class="nav-link <?php if(app('request')->get('type')=='0' or !app('request')->get('type')): ?>active<?php endif; ?>">
							<?php echo $Lang['full_detail']; ?>
						</a>
					</li>
					<?php foreach($Setting['unread_nav'] as $navList): ?>
					<li class="nav-item">
						<a href="message?type=<?php echo $navList['id']; ?>" class="nav-link <?php if(app('request')->get('type')==$navList['id']): ?>active<?php endif; ?>"
							data-id="<?php echo $navList['id']; ?>">
							<?php echo $Lang[$navList['name']]; if($navList['unread_num'] != '0'): ?>
							<span class="badge badge-info"><?php echo $navList['unread_num']; ?></span>
							<?php endif; ?>
						</a>
					</li>
					<?php endforeach; ?>
				</ul>
			</div>
			
			<!-- 自定义搜索区域 -->
			<div class="search-area">
				<div class="custom-search-container">
					<input type="text" class="custom-search-input" id="messageSearch" placeholder="搜索消息..." required>
					<i class="bx bx-search custom-search-icon"></i>
					<button type="button" class="custom-search-clear" id="clearSearch">
						<i class="bx bx-x"></i>
					</button>
				</div>
			</div>
			
			<div class="table-responsive">
				
<table class="table tablelist">
  <colgroup>
    <col>
    <col>
    <col>
  </colgroup>
  <thead class="thead-light">
    <tr>
      <th style="width: 20px;">
        <div class="custom-control custom-checkbox">
          <input type="checkbox" class="custom-control-input" id="customCheckHead" name="headCheckbox">
          <label class="custom-control-label" for="customCheckHead">&nbsp;</label>
        </div>
      </th>
      <th><?php echo $Lang['title_content']; ?></th>
      <th><?php echo $Lang['submission_time']; ?></th>
      <th><?php echo $Lang['type']; ?></th>
    </tr>
  </thead>
  <tbody>
    <?php if($Message): foreach($Message as $key=>$list): ?>
    <tr>
      <td>
        <div class="custom-control custom-checkbox">
          <input type="checkbox" class="custom-control-input row-checkbox" id="customCheck<?php echo $list['id']; ?>">
          <label class="custom-control-label" for="customCheck<?php echo $list['id']; ?>">&nbsp;</label>
        </div>
      </td>
      <td onclick="openContent(<?php echo $key; ?>,[<?php echo $list['id']; ?>])" style="cursor: pointer;" data-toggle="modal" data-target=".bs-example-modal-lg">
        <?php if($list['read_time'] == '0'): ?>
        <span class="bg-danger d-inline-block rounded-circle mr-1"
          style="width: 6px;height: 6px;margin-bottom: 2px;"></span>
        <?php endif; ?>
        <?php echo $list['title']; ?>
      </td>
      <td><?php if($list['create_time']): ?><?php echo date("Y-m-d H:i",!is_numeric($list['create_time'])? strtotime($list['create_time']) : $list['create_time']); else: ?>-<?php endif; ?></td>
      <td><?php echo $Lang[$list['type_text']]; ?></td>
    </tr>
    <?php endforeach; else: ?>
    <tr>
      <td colspan="8">
        <div class="no-data"><?php echo $Lang['nothing']; ?></div>
      </td>
    </tr>
    <?php endif; ?>
  </tbody>
</table>


<div class="modal fade bs-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myExtraLargeModalLabel"
  aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered modal-lg">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title mt-0" id="myExtraLargeModalLabel"><?php echo $Lang['news_details']; ?></h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <div id="msgContent">

        </div>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog modal-dialog-centered -->
</div>

<script>
  // 打开详情
var message=<?php echo json_encode($Message); ?>;
function openContent(key,ids) {
  $('#msgContent').html(message[key].content);
  if (message[key].attachment?.length) {
    const str = `
      <hr />
      <p class="mb-2"><?php echo $Lang['enclosure']; ?>:</p>
    `
    $("#msgContent").append(str);
  }
	$.each(message[key].attachment,function(k,v){
    down=`
    <div class="mb-1">
      <a href="${v.path}" target="_blank">${v.name}</a>
    </div>
    `;
		$("#msgContent").append(down);
  });
  
  $.get('' + '/read_messgage', {ids},
    function (data, textStatus, jqXHR) {},
    "dataType"
  );
}

</script>
			</div>
			<!-- 表单底部调用开始 -->
			<div class="table-footer">
	<div class="table-tools">

	</div>
	<div class="table-pagination">
		<div class="table-pageinfo mr-2">
			<span><?php echo $Lang['common']; ?> <?php echo $Total; ?> <?php echo $Lang['strips']; ?></span>
			<span class="mx-2">
				<?php echo $Lang['each_page']; ?>
				<select name="" id="limitSel">
					<option value="10" <?php if($Limit==10): ?>selected<?php endif; ?>>10</option>
					<option value="15" <?php if($Limit==15): ?>selected<?php endif; ?>>15</option>
					<option value="20" <?php if($Limit==20): ?>selected<?php endif; ?>>20</option>
					<option value="50" <?php if($Limit==50): ?>selected<?php endif; ?>>50</option>
					<option value="100" <?php if($Limit==100): ?>selected<?php endif; ?>>100</option>
				</select>
				<?php echo $Lang['strips']; ?>
			</span>
		</div>
		<ul class="pagination pagination-sm">
			<?php echo $Pages; ?>
		</ul>
	</div>
</div>

<script>
	$(function () {

		// 每页数量选择改变
		$('#limitSel').on('change', function () {
			if ('<?php echo app('request')->get('action'); ?>') {
				location.href = 'message?action=<?php echo app('request')->get('action'); ?>&keywords=<?php echo app('request')->get('keywords'); ?>&sort=<?php echo app('request')->get('sort'); ?>&orderby=<?php echo app('request')->get('orderby'); ?>&page=1&limit=' + $('#limitSel').val()
			} else {
				location.href = 'message?keywords=<?php echo app('request')->get('keywords'); ?>&sort=<?php echo app('request')->get('sort'); ?>&orderby=<?php echo app('request')->get('orderby'); ?>&page=1&limit=' + $('#limitSel').val()
			}

		})


	})
</script>
			<div class="action-buttons">
				<button type="button" class="btn btn-danger waves-effect waves-light not-allowed" onclick="delMsg()"
					id="delBtn" disabled><?php echo $Lang['delete']; ?></button>
				<button type="button" class="btn btn-primary waves-effect waves-light not-allowed" onclick="readMsg()"
					id="readBtn" disabled><?php echo $Lang['mark_read']; ?></button>
				<button id="allReadBtn" type="button" class="btn btn-primary waves-effect waves-light" onclick="allRead()" disabled><?php echo $Lang['all_read']; ?></button>
				<button id="allDelBtn" type="button" class="btn btn-danger waves-effect waves-light" onclick="allDel()" disabled><?php echo $Lang['delete_all']; ?></button>
			</div>
		</div>
	</div>
</div>

<script>
	// 表格多选
	$(function () {
		$("#customCheckHead").on('change',function(){
			if($(this).is(':checked') && $('.row-checkbox').length){
				$('#delBtn,#readBtn,#allReadBtn,#allDelBtn').removeAttr('disabled').removeClass('not-allowed');
			} else{
				$('#delBtn,#readBtn,#allReadBtn,#allDelBtn').attr('disabled', 'disabled').addClass('not-allowed');
			}
		})
		$('input[name="headCheckbox"]').on('change', function () {
			$('.row-checkbox').prop("checked", $(this).is(':checked'))
		});
		$('.row-checkbox').on('change', function () {
			$('input[name="headCheckbox"]').prop('checked', $('.row-checkbox').length === $('.row-checkbox:checked')
				.length)
			// 下面这个判断处理底部按钮的disabled
			if ($('.row-checkbox:checked').length) {
				$('#delBtn,#readBtn,#allReadBtn,#allDelBtn').removeAttr('disabled').removeClass('not-allowed');
			} else {
				$('#delBtn,#readBtn,#allReadBtn,#allDelBtn').attr('disabled', 'disabled').addClass('not-allowed');
			}
		});
		
		// 添加表格行悬停效果
		$('.tablelist tbody tr').hover(
			function() {
				$(this).css({
					'background-color': 'rgba(240, 138, 93, 0.03)',
					'transform': 'translateY(-2px)',
					'box-shadow': '0 5px 15px rgba(0, 0, 0, 0.05)',
					'transition': 'all 0.3s ease'
				});
			},
			function() {
				$(this).css({
					'background-color': '',
					'transform': '',
					'box-shadow': '',
					'transition': 'all 0.3s ease'
				});
			}
		);
		
		// 为分页添加动画效果
		$('.pagination .page-item').not('.active, .disabled').hover(
			function() {
				$(this).find('.page-link').css({
					'transform': 'translateY(-2px)',
					'box-shadow': '0 5px 15px rgba(240, 138, 93, 0.1)'
				});
			},
			function() {
				$(this).find('.page-link').css({
					'transform': 'translateY(0)',
					'box-shadow': '0 2px 5px rgba(240, 138, 93, 0.05)'
				});
			}
		);
		
		// 为按钮添加动画效果
		$('.btn').not('.not-allowed').hover(
			function() {
				$(this).css({
					'transform': 'translateY(-3px)',
					'box-shadow': $(this).hasClass('btn-danger') ? 
						'0 6px 20px rgba(252, 92, 101, 0.4)' : 
						'0 6px 20px rgba(240, 138, 93, 0.4)'
				});
			},
			function() {
				$(this).css({
					'transform': '',
					'box-shadow': $(this).hasClass('btn-danger') ? 
						'0 4px 15px rgba(252, 92, 101, 0.3)' : 
						'0 4px 15px rgba(240, 138, 93, 0.3)'
				});
			}
		);
		
		// 自定义搜索功能
		$('#messageSearch').on('input', function() {
			const searchTerm = $(this).val().toLowerCase().trim();
			let hasResults = false;
			
			$('.tablelist tbody tr').each(function() {
				const title = $(this).find('td:nth-child(2)').text().toLowerCase();
				const time = $(this).find('td:nth-child(3)').text().toLowerCase();
				
				if (title.includes(searchTerm) || time.includes(searchTerm)) {
					$(this).show();
					hasResults = true;
					
					// 高亮匹配文本
					$(this).find('td').each(function() {
						const text = $(this).text();
						if (text.toLowerCase().includes(searchTerm)) {
							const regex = new RegExp('(' + searchTerm.replace(/[.*+?^${}()|[\]\\]/g, '\\$&') + ')', 'gi');
							$(this).html(text.replace(regex, '<span class="highlight-match">$1</span>'));
						}
					});
				} else {
					$(this).hide();
				}
			});
			
			// 显示无结果提示
			if (!hasResults && searchTerm !== '') {
				if ($('.no-results').length === 0) {
					$('.table-responsive').append('<div class="no-results"><i class="bx bx-message-x"></i>没有找到匹配的消息</div>');
				}
				$('.tablelist').hide();
			} else {
				$('.no-results').remove();
				$('.tablelist').show();
			}
		});
		
		// 清除搜索
		$('#clearSearch').on('click', function() {
			$('#messageSearch').val('').trigger('input');
			$(this).css('opacity', '0');
		});
		
		// 添加搜索框动画效果
		$('#messageSearch').on('focus', function() {
			$(this).parent().css('transform', 'scale(1.02)');
			$('.custom-search-icon').css('color', '#f08a5d');
		}).on('blur', function() {
			$(this).parent().css('transform', 'scale(1)');
			if (!$(this).val()) {
				$('.custom-search-icon').css('color', '');
			}
		});
		
		// 标记未读消息
		$('.tablelist tbody tr').each(function() {
			const isUnread = $(this).find('td:nth-child(4)').text().trim() === '未读';
			if (isUnread) {
				$(this).addClass('unread-message');
				$(this).find('td:nth-child(2) a').addClass('message-title');
			} else {
				$(this).find('td:nth-child(2) a').addClass('message-title');
			}
		});
	});
	
	// 获取所有勾选项的id
	const getCheckbox = function () {
		// 勾选的id
		const ids = []
		// 所有表格内的checkbox
		const allCheck = [...$('.row-checkbox:checked')]
		for (const key in allCheck) {
			if (Object.hasOwnProperty.call(allCheck, key)) {
				const item = allCheck[key];
				ids.push(item.id.substring(11))
			}
		}
		return ids
	}

	// 多选删除消息
	function delMsg() {
		const ids = getCheckbox()
		$.ajax({
			type: "get",
			url: '' + '/delete_messgage',
			data: {
				ids
			},
			success: function (data) {
				if (data.status == 200) {
					toastr.success(data.msg)
					location.reload()
				} else {
					toastr.error(data.msg)
				}
			}
		});
	}

	// 多选阅读消息
	function readMsg() {
		const ids = getCheckbox()
		$.ajax({
			type: "get",
			url: '' + '/read_messgage',
			data: {
				ids
			},
			success: function (data) {
				if (data.status == 200) {
					toastr.success(data.msg)
					location.reload()
				} else {
					toastr.error(data.msg)
				}
			}
		});
	}

	// 全部已读
	function allRead() {
		$.ajax({
			type: "get",
			url: '' + '/read_messgage',
			data: {
				type: 0
			},
			success: function (data) {
				if (data.status == 200) {
					toastr.success(data.msg)
					location.reload()
				} else {
					toastr.error(data.msg)
				}
			}
		});
	}

	// 全部删除
	function allDel() {
		$.ajax({
			type: "get",
			url: '' + '/delete_messgage',
			data: {
				type: 0
			},
			success: function (data) {
				if (data.status == 200) {
					toastr.success(data.msg)
					location.reload()
				} else {
					toastr.error(data.msg)
				}
			}
		});
	}
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