<?php /*a:6:{s:70:"/www/wwwroot/cloud.hf.pw2/public/themes/clientarea/ogmiao/addfunds.tpl";i:1743842236;s:75:"/www/wwwroot/cloud.hf.pw2/public/themes/clientarea/ogmiao/includes/head.tpl";i:1742354372;s:75:"/www/wwwroot/cloud.hf.pw2/public/themes/clientarea/ogmiao/includes/menu.tpl";i:1720065013;s:81:"/www/wwwroot/cloud.hf.pw2/public/themes/clientarea/ogmiao/includes/pageheader.tpl";i:1719999923;s:81:"/www/wwwroot/cloud.hf.pw2/public/themes/clientarea/ogmiao/includes/breadcrumb.tpl";i:1719999923;s:79:"/www/wwwroot/cloud.hf.pw2/public/themes/clientarea/ogmiao/includes/paymodal.tpl";i:1719999923;}*/ ?>

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
    /* 基础变量定义 - 与header.tpl保持一致 */
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
    }
    
    /* Base Styles */
    .addfunds-page {
        position: relative;
        padding: 2rem 0;
        overflow: hidden;
    }
    
    .addfunds-decoration {
        position: absolute;
        border-radius: 50%;
        background: linear-gradient(135deg, var(--primary), var(--secondary));
        z-index: 0;
        opacity: 0.1;
    }
    
    .addfunds-decoration-1 {
        width: 200px;
        height: 200px;
        top: 10%;
        right: 5%;
        animation: float 8s ease-in-out infinite;
    }
    
    .addfunds-decoration-2 {
        width: 150px;
        height: 150px;
        bottom: 15%;
        left: 5%;
        animation: float 7s ease-in-out infinite 1s;
    }
    
    @keyframes float {
        0% { transform: translateY(0px); }
        50% { transform: translateY(-15px); }
        100% { transform: translateY(0px); }
    }
    
    /* Card Styling */
    .addfunds-card {
        background-color: white;
        border-radius: 20px;
        box-shadow: 0 10px 25px rgba(0, 0, 0, 0.05);
        margin-bottom: 2rem;
        position: relative;
        z-index: 1;
        overflow: hidden;
        transition: all 0.3s ease;
        border: none;
    }
    
    .addfunds-card:hover {
        transform: translateY(-5px);
        box-shadow: 0 15px 35px rgba(0, 0, 0, 0.1);
    }
    
    .addfunds-card-header {
        position: relative;
        padding: 1.5rem;
        border-bottom: 1px solid rgba(0, 0, 0, 0.05);
    }
    
    .addfunds-card-header h5 {
        font-size: 1.5rem;
        font-weight: 600;
        color: var(--dark);
        margin-bottom: 0;
        position: relative;
        display: inline-block;
    }
    
    .addfunds-card-header h5:after {
        content: "";
        position: absolute;
        bottom: -5px;
        left: 0;
        width: 50px;
        height: 3px;
        background: var(--primary);
        border-radius: 3px;
    }
    
    .addfunds-card-body {
        padding: 1.5rem;
    }
    
    /* Balance Display */
    .balance-display {
        text-align: center;
        margin-bottom: 1.5rem;
        padding: 1.5rem;
        background: linear-gradient(135deg, rgba(240, 138, 93, 0.05), rgba(249, 179, 132, 0.05));
        border-radius: 15px;
        border: 1px solid rgba(240, 138, 93, 0.1);
    }
    
    .balance-label {
        font-size: 1.1rem;
        color: var(--gray);
        margin-bottom: 0.5rem;
    }
    
    .balance-amount {
        font-size: 3rem;
        font-weight: 700;
        color: var(--primary);
        line-height: 1.2;
        margin-bottom: 0;
    }
    
    .balance-currency {
        font-size: 1.5rem;
        color: var(--gray);
    }
    
    /* Info Text */
    .info-text {
        color: var(--gray);
        margin-bottom: 1rem;
        position: relative;
        padding-left: 1.5rem;
    }
    
    .info-text:before {
        content: "•";
        position: absolute;
        left: 0;
        color: var(--primary);
        font-size: 1.5rem;
        line-height: 1;
    }
    
    /* Form Elements */
    .form-group {
        margin-bottom: 1.5rem;
    }
    
    .form-label {
        font-weight: 500;
        color: var(--dark);
        margin-bottom: 0.5rem;
    }
    
    .form-control {
        height: calc(1.5em + 1rem + 2px);
        padding: 0.5rem 1rem;
        font-size: 1rem;
        border: 1px solid rgba(240, 138, 93, 0.2);
        border-radius: 10px;
        transition: all 0.3s;
        box-shadow: 0 2px 10px rgba(240, 138, 93, 0.05);
    }
    
    .form-control:focus {
        border-color: var(--primary);
        box-shadow: 0 0 0 0.2rem rgba(240, 138, 93, 0.25);
    }
    
    /* 货币单位样式 */
    .input-group-text {
        background-color: rgba(240, 138, 93, 0.1);
        color: var(--primary);
        font-weight: 600;
        border: 1px solid rgba(240, 138, 93, 0.2);
        border-left: none;
        border-radius: 0 10px 10px 0;
        padding: 0.5rem 1rem;
        transition: all 0.3s ease;
    }
    
    .input-group .form-control {
        border-right: none;
        border-radius: 10px 0 0 10px;
    }
    
    .input-group:focus-within .input-group-text {
        border-color: var(--primary);
        background-color: rgba(240, 138, 93, 0.15);
    }
    
    /* Payment Methods */
    .payment-methods {
        display: flex;
        flex-wrap: wrap;
        gap: 1rem;
        margin-top: 0.5rem;
    }
    
    .payment-method {
        flex: 0 0 calc(25% - 1rem);
        min-width: 120px;
        background-color: white;
        border: 2px solid rgba(240, 138, 93, 0.1);
        border-radius: 10px;
        padding: 1rem;
        text-align: center;
        cursor: pointer;
        transition: all 0.3s;
        position: relative;
        overflow: hidden;
    }
    
    .payment-method:hover {
        transform: translateY(-3px);
        box-shadow: 0 5px 15px rgba(240, 138, 93, 0.1);
        border-color: rgba(240, 138, 93, 0.3);
    }
    
    .payment-method.active {
        border-color: var(--primary);
        background-color: rgba(240, 138, 93, 0.05);
        box-shadow: 0 5px 15px rgba(240, 138, 93, 0.15);
    }
    
    .payment-method.active:before {
        content: "✓";
        position: absolute;
        top: 5px;
        right: 10px;
        color: var(--primary);
        font-size: 1rem;
        font-weight: bold;
    }
    
    .payment-method img {
        max-height: 30px;
        max-width: 100%;
        transition: all 0.3s;
    }
    
    .payment-method:hover img {
        transform: scale(1.05);
    }
    
    /* Button */
    .btn-addfunds {
        background-color: var(--primary);
        border: none;
        color: white;
        padding: 0.75rem 2rem;
        font-size: 1rem;
        font-weight: 600;
        border-radius: 50px;
        transition: all 0.3s;
        position: relative;
        overflow: hidden;
        z-index: 1;
        box-shadow: 0 4px 15px rgba(240, 138, 93, 0.3);
    }

    .btn-addfunds:hover {
        background-color: var(--primary-dark);
        transform: translateY(-3px);
        box-shadow: 0 6px 20px rgba(240, 138, 93, 0.4);
        color: white; /* 确保悬停时文字保持白色 */
    }

    .btn-addfunds:focus,
    .btn-addfunds:active {
        color: white; /* 确保点击和聚焦时文字保持白色 */
        background-color: var(--primary-dark);
        box-shadow: 0 2px 8px rgba(240, 138, 93, 0.3);
    }
    
    /* Alert */
    .alert-custom {
        background-color: #fff3cd;
        color: #856404;
        border: none;
        border-radius: 10px;
        padding: 1rem;
        margin-bottom: 1.5rem;
        position: relative;
        animation: fadeIn 0.5s ease-in-out;
    }
    
    .alert-custom.alert-danger {
        background-color: #f8d7da;
        color: #721c24;
    }
    
    @keyframes fadeIn {
        from { opacity: 0; transform: translateY(-10px); }
        to { opacity: 1; transform: translateY(0); }
    }
    
    /* Responsive */
    @media (max-width: 768px) {
        .payment-method {
            flex: 0 0 calc(50% - 1rem);
        }
        
        .addfunds-decoration {
            display: none;
        }
        
        .balance-amount {
            font-size: 2.5rem;
        }
    }
    
    @media (max-width: 576px) {
        .payment-method {
            flex: 0 0 100%;
        }
        
        .balance-amount {
            font-size: 2rem;
        }
        
        .addfunds-card-header h5 {
            font-size: 1.3rem;
        }
    }
    
    @media (min-width: 560px) and (max-width: 930px) {
        .payment-method img {
            height: 20px;
        }
    }
</style>

<div class="addfunds-page">
    <!-- 装饰元素 -->
    <div class="addfunds-decoration addfunds-decoration-1"></div>
    <div class="addfunds-decoration addfunds-decoration-2"></div>
    
    <!-- 余额卡片 -->
    <div class="addfunds-card">
        <div class="addfunds-card-header">
            <h5>账户资产</h5>
        </div>
        <div class="addfunds-card-body">
            <div class="balance-display">
                <div class="balance-label">当前余额</div>
                <div class="balance-amount"><?php echo $Addfunds['addfunds']['credit']; ?><span class="balance-currency"><?php echo $Addfunds['addfunds']['currency']['suffix']; ?></span></div>
            </div>
            
            <div class="info-text">您可以向账户中进行余额充值，一旦充值完成，账户将增加等额的余额。</div>
            <div class="info-text">购置新实例时，当账户余额充足，无需额外发起付款，直接使用账户余额完成订单。</div>
            <div class="info-text">账户余额还可用于自动续费实例，帮助您节约维护时间成本。</div>
        </div>
    </div>
    
    <!-- 充值卡片 -->
    <div class="addfunds-card">
        <div class="addfunds-card-header">
            <h5>发起新充值</h5>
        </div>
        <div class="addfunds-card-body">
            <!-- 提示信息 -->
            <div class="beforecheck-box">
                <div class="alert alert-custom alert-danger alert-dismissible fade hidden beforecheck" role="alert">
                    <i class="mdi mdi-block-helper mr-2"></i>
                    <span class="msg-box"><?php echo $Lang['the_maximum_allowed_balance_exceeded']; ?>:<?php echo $Addfunds['addfunds']['addfunds_maximum_balance']; ?></span>
                    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
            </div>
            
            <div method="post">
                <!-- 金额输入 -->
                <div class="form-group">
                    <label class="form-label"><?php echo $Lang['recharge_amount']; ?></label>
                    <div class="input-group">
                        <input type="text" name="amount" class="form-control text-center" id="addfundsInp"
                               value="<?php echo $Addfunds['addfunds']['addfunds_minimum']; ?>" onblur="addfundsMaxMin()" />
                        <div class="input-group-append">
                            <span class="input-group-text"><?php echo $Addfunds['addfunds']['currency']['suffix']; ?></span>
                        </div>
                    </div>
                </div>
                
                <!-- 支付方式 -->
                <div class="form-group">
                    <label class="form-label"><?php echo $Lang['payment_method']; ?></label>
                    <div class="payment-methods">
                        <?php foreach($Addfunds['addfunds']['gateways'] as $index=>$gateways): ?>
                            <div class="payment-method <?php if($index==0): ?>active<?php endif; ?>" onclick="addfundsBtn(this)" data-payment="<?php echo $gateways['name']; ?>" title="<?php echo $gateways['title']; ?>" data-toggle="tooltip" data-placement="bottom">
                                <input type="radio" name="payment" class="hidden" value="<?php echo $gateways['name']; ?>" <?php if($index==0): ?>checked<?php endif; ?> />
                                <?php if($gateways['author_url']): ?>
                                    <img src="<?php echo $gateways['author_url']; ?>" alt="<?php echo $gateways['title']; ?>" />
                                <?php else: ?>
                                    <span><?php echo $gateways['title']; ?></span>
                                <?php endif; ?>
                            </div>
                        <?php endforeach; ?>
                    </div>
                </div>
                
                <!-- 提交按钮 -->
                <div class="form-group text-center">
                    <button type="button" class="btn btn-addfunds pay-now-btn" onclick="formSubmitBtn();return false;">
                        <?php echo $Lang['confirm_recharge']; ?>
                    </button>
                </div>
            </div>
        </div>
    </div>
</div>


<style>
  .paySelect {
    float: right;
    width: 25%;
    height: 1.5rem;
    border-color: #ddd;
    margin-left: 42%;
  }

  @media screen and (max-width: 440px) {
    .paySelect {
      width: 33%;
    }

  }

  @media screen and (max-width: 375px) {
    .paySelect {
      margin-left: 21%;
    }
  }

  @media screen and (max-width: 320px) {
    .paySelect {
      margin-left: 7%;
      width: 36%;
    }
  }
</style>
<script>
  var _url = '';

  function payTypeChange(invoiceid) {
    let paymt = 1;
    var url = _url + '/change_paymt';
    if ($('.paySelect option:selected').val() == 0) {
      paymt = 0
    }
    let invoiceidNew = $("#myLargeModalLabel").html().split(' - ')[1]

    $.ajax({
      type: "POST",
      data: {
        invoiceid: invoiceidNew,
        paymt: paymt
      },
      url: url,
      success: function (data) {
        if ($('.paySelect option:selected').val() == 0) {
          payamount(invoiceidNew, 0)
        } else {
          payamount(invoiceidNew)
        }
      }
    })
  }

  $(function () {
    $(".close").click(function () {
      $(".modal-header .paySelect").remove();
    })
  })
</script>
<div id="pay">
  <div class="modal fade pay" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel"
    aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered ">
      <div class="modal-content">
        <div class="modal-header">
          <h6 class="modal-title mt-0" id="myLargeModalLabel"></h6>
          <!--<?php if($Action != 'recharge'): ?>
                <select class="paySelect" onchange="payTypeChange(<?php echo $Pay['invoiceid']; ?>)">
                  <option value="0">现金支付</option>
                    <?php if((!empty($paymt['is_open_credit_limit']) && $paymt['credit_limit_balance'] >= $paymt['subtotal'])): ?>
                        <option value="1">信用额支付</option>
                    <?php endif; ?>
                </select>
                <?php endif; ?>-->
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
        <div class="modal-body">

        </div>
      </div>
    </div>
  </div>

</div>


<div id="loading-icon" style="display:none">
  <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink"
    style="margin:auto;background:#fff;display:block;" width="200px" height="200px" viewBox="0 0 100 100"
    preserveAspectRatio="xMidYMid">
    <g>
      <circle cx="73.801" cy="68.263" fill="#93dbe9" r="3">
        <animateTransform attributeName="transform" type="rotate" calcMode="spline" values="0 50 50;360 50 50"
          times="0;1" keySplines="0.5 0 0.5 1" repeatCount="indefinite" dur="1.4925373134328357s" begin="0s">
        </animateTransform>
      </circle>
      <circle cx="68.263" cy="73.801" fill="#689cc5" r="3">
        <animateTransform attributeName="transform" type="rotate" calcMode="spline" values="0 50 50;360 50 50"
          times="0;1" keySplines="0.5 0 0.5 1" repeatCount="indefinite" dur="1.4925373134328357s" begin="-0.062s">
        </animateTransform>
      </circle>
      <circle cx="61.481" cy="77.716" fill="#5e6fa3" r="3">
        <animateTransform attributeName="transform" type="rotate" calcMode="spline" values="0 50 50;360 50 50"
          times="0;1" keySplines="0.5 0 0.5 1" repeatCount="indefinite" dur="1.4925373134328357s" begin="-0.125s">
        </animateTransform>
      </circle>
      <circle cx="53.916" cy="79.743" fill="#3b4368" r="3">
        <animateTransform attributeName="transform" type="rotate" calcMode="spline" values="0 50 50;360 50 50"
          times="0;1" keySplines="0.5 0 0.5 1" repeatCount="indefinite" dur="1.4925373134328357s" begin="-0.187s">
        </animateTransform>
      </circle>
      <circle cx="46.084" cy="79.743" fill="#191d3a" r="3">
        <animateTransform attributeName="transform" type="rotate" calcMode="spline" values="0 50 50;360 50 50"
          times="0;1" keySplines="0.5 0 0.5 1" repeatCount="indefinite" dur="1.4925373134328357s" begin="-0.25s">
        </animateTransform>
      </circle>
      <circle cx="38.519" cy="77.716" fill="#d9dbee" r="3">
        <animateTransform attributeName="transform" type="rotate" calcMode="spline" values="0 50 50;360 50 50"
          times="0;1" keySplines="0.5 0 0.5 1" repeatCount="indefinite" dur="1.4925373134328357s" begin="-0.312s">
        </animateTransform>
      </circle>
      <circle cx="31.737" cy="73.801" fill="#b3b7e2" r="3">
        <animateTransform attributeName="transform" type="rotate" calcMode="spline" values="0 50 50;360 50 50"
          times="0;1" keySplines="0.5 0 0.5 1" repeatCount="indefinite" dur="1.4925373134328357s" begin="-0.375s">
        </animateTransform>
      </circle>
      <circle cx="26.199" cy="68.263" fill="#93dbe9" r="3">
        <animateTransform attributeName="transform" type="rotate" calcMode="spline" values="0 50 50;360 50 50"
          times="0;1" keySplines="0.5 0 0.5 1" repeatCount="indefinite" dur="1.4925373134328357s" begin="-0.437s">
        </animateTransform>
      </circle>
      <animateTransform attributeName="transform" type="rotate" calcMode="spline" values="0 50 50;0 50 50" times="0;1"
        keySplines="0.5 0 0.5 1" repeatCount="indefinite" dur="1.4925373134328357s">
      </animateTransform>
    </g>
  </svg>
</div>

<script type="text/javascript" src="/themes/clientarea/default/assets/libs/qrcode/jquery.qrcode.min.js?v=<?php echo $Ver; ?>"></script>
<script src="/themes/clientarea/default/assets/libs/dropzone/min/dropzone.min.js?v=<?php echo $Ver; ?>"></script>
<script type="text/javascript">
    // 页面加载时为卡片添加动画效果
    document.addEventListener("DOMContentLoaded", function() {
        const cards = document.querySelectorAll('.addfunds-card');
        
        cards.forEach((card, index) => {
            card.style.opacity = "0";
            card.style.transform = "translateY(20px)";
            card.style.transition = "opacity 0.5s ease, transform 0.5s ease";
            
            setTimeout(() => {
                card.style.opacity = "1";
                card.style.transform = "translateY(0)";
            }, 300 + (index * 200));
        });
        
        // 更新支付方式选择
        const paymentMethods = document.querySelectorAll('.payment-method');
        paymentMethods.forEach(method => {
            method.addEventListener('click', function() {
                paymentMethods.forEach(m => m.classList.remove('active'));
                this.classList.add('active');
                const radio = this.querySelector('input[type="radio"]');
                if (radio) radio.checked = true;
            });
        });
        
        // 添加输入框焦点效果
        const inputGroup = document.querySelector('.input-group');
        const inputField = document.getElementById('addfundsInp');
        
        if (inputField) {
            inputField.addEventListener('focus', function() {
                inputGroup.classList.add('focused');
            });
            
            inputField.addEventListener('blur', function() {
                inputGroup.classList.remove('focused');
            });
        }
    });

    var intervalBox;
    var max = '<?php echo $Addfunds['addfunds']['addfunds_maximum']; ?>',
        min = '<?php echo $Addfunds['addfunds']['addfunds_minimum']; ?>'
        ,_url = '';
</script>
<script src="/themes/clientarea/default/assets/js/addfunds.js?v=<?php echo $Ver; ?>"></script>

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