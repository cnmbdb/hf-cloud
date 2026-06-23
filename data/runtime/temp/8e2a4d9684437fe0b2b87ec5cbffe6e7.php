<?php /*a:5:{s:71:"/www/wwwroot/cloud.hf.pw2/public/themes/clientarea/ogmiao/downloads.tpl";i:1743846641;s:75:"/www/wwwroot/cloud.hf.pw2/public/themes/clientarea/ogmiao/includes/head.tpl";i:1742354372;s:75:"/www/wwwroot/cloud.hf.pw2/public/themes/clientarea/ogmiao/includes/menu.tpl";i:1720065013;s:81:"/www/wwwroot/cloud.hf.pw2/public/themes/clientarea/ogmiao/includes/pageheader.tpl";i:1719999923;s:81:"/www/wwwroot/cloud.hf.pw2/public/themes/clientarea/ogmiao/includes/breadcrumb.tpl";i:1719999923;}*/ ?>

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
				<?php endif; if($Downloads['location_url']): ?>
<script>
  window.open("<?php echo $Downloads['location_url']; ?>");
</script>
<?php endif; ?>

<style>
  /* Downloads page styling to match clientarea theme */
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

  /* Card styling */
  .downloads-container {
    display: flex;
    gap: 20px;
  }

  .card {
    border: none !important;
    border-radius: 15px !important;
    box-shadow: var(--card-shadow) !important;
    transition: all 0.3s ease !important;
    overflow: hidden !important;
    margin-bottom: 1.5rem !important;
    background-color: var(--light) !important;
  }

  .card:hover {
    box-shadow: var(--card-hover-shadow) !important;
    transform: translateY(-5px) !important;
  }

  .card-body {
    padding: 1.5rem !important;
    position: relative !important;
  }

  /* Sidebar styling */
  .filemanager-sidebar {
    width: 280px;
    flex-shrink: 0;
    position: relative;
  }

  .filemanager-sidebar::before {
    content: "";
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 3px;
    background: linear-gradient(90deg, var(--primary), var(--primary-light), var(--primary));
    opacity: 0.7;
  }

  .categories-list li {
    margin-bottom: 10px;
  }

  .categories-list a {
    display: flex;
    align-items: center;
    padding: 10px 15px;
    border-radius: 10px;
    transition: all 0.3s ease;
    color: var(--dark) !important;
    text-decoration: none;
    font-weight: 500;
  }

  .categories-list a:hover {
    background-color: rgba(240, 138, 93, 0.08);
    transform: translateX(5px);
  }

  .categories-list a i {
    color: var(--primary) !important;
    font-size: 1.2rem;
    margin-right: 10px;
  }

  /* Badge styling */
  .badge {
    padding: 0.4rem 0.8rem;
    font-size: 0.75rem;
    font-weight: 600;
    border-radius: 50px;
    margin-left: 0.5rem;
  }

  .badge-success {
    background-color: rgba(38, 222, 129, 0.15) !important;
    color: #26de81 !important;
  }

  .badge-pill {
    border-radius: 50px;
  }

  /* Table styling */
  .table {
    min-width: 600px;
    width: 100%;
    margin-bottom: 1rem;
    color: #333;
    border-collapse: separate;
    border-spacing: 0;
    border-radius: 10px;
    overflow: hidden;
    box-shadow: 0 2px 15px rgba(0, 0, 0, 0.05);
    transition: all 0.3s ease;
  }

  .table th {
    padding: 1rem !important;
    vertical-align: middle !important;
    border-top: none !important;
    font-weight: 600 !important;
    color: #333 !important;
    background-color: rgba(240, 138, 93, 0.05) !important;
    border-bottom: 2px solid rgba(240, 138, 93, 0.2) !important;
    transition: all 0.3s ease;
  }

  .table td {
    padding: 1rem !important;
    vertical-align: middle !important;
    border-top: none !important;
    border-bottom: 1px solid rgba(0, 0, 0, 0.05) !important;
    transition: all 0.3s ease;
  }

  .table tr:hover td {
    background-color: rgba(240, 138, 93, 0.03) !important;
  }

  .table a {
    color: var(--primary);
    transition: all 0.3s ease;
    text-decoration: none;
  }

  .table a:hover {
    color: var(--primary-dark);
    text-decoration: none;
  }

  /* File icons */
  .file-icon {
    display: inline-flex;
    align-items: center;
    justify-content: center;
    width: 36px;
    height: 36px;
    border-radius: 8px;
    margin-right: 10px;
    flex-shrink: 0;
    background-color: rgba(240, 138, 93, 0.1);
    color: var(--primary);
    font-size: 18px;
  }

  .file-icon.zip {
    background-color: rgba(254, 211, 48, 0.1);
    color: #fed330;
  }

  .file-icon.image {
    background-color: rgba(38, 222, 129, 0.1);
    color: #26de81;
  }

  .file-icon.text {
    background-color: rgba(69, 170, 242, 0.1);
    color: #45aaf2;
  }

  /* Download button */
  .download-btn {
    display: inline-flex;
    align-items: center;
    justify-content: center;
    width: 36px;
    height: 36px;
    border-radius: 50%;
    background-color: rgba(240, 138, 93, 0.1);
    color: var(--primary);
    transition: all 0.3s ease;
  }

  .download-btn:hover {
    background-color: var(--primary);
    color: white;
    transform: translateY(-3px);
    box-shadow: 0 5px 15px rgba(240, 138, 93, 0.3);
  }

  /* Section title */
  .section-title {
    font-size: 1.25rem;
    font-weight: 700;
    color: var(--dark);
    margin-bottom: 1.25rem;
    position: relative;
    display: inline-block;
  }

  .section-title::after {
    content: "";
    position: absolute;
    bottom: -8px;
    left: 0;
    width: 40px;
    height: 3px;
    background: var(--primary);
    border-radius: 3px;
  }

  /* Responsive adjustments */
  @media (max-width: 992px) {
    .downloads-container {
      flex-direction: column;
    }
    
    .filemanager-sidebar {
      width: 100%;
    }
    
    .categories-list {
      display: flex;
      flex-wrap: wrap;
      gap: 10px;
    }
    
    .categories-list li {
      margin-bottom: 0;
    }
  }

  @media (max-width: 768px) {
    .card-body {
      padding: 1.2rem !important;
    }
    
    .table th,
    .table td {
      padding: 0.8rem !important;
    }
    
    .file-icon,
    .download-btn {
      width: 32px;
      height: 32px;
      font-size: 16px;
    }
  }

  @media (max-width: 576px) {
    .card-body {
      padding: 1rem !important;
    }
    
    .table th,
    .table td {
      padding: 0.7rem !important;
      font-size: 0.9rem;
    }
    
    .file-icon,
    .download-btn {
      width: 28px;
      height: 28px;
      font-size: 14px;
    }
    
    .section-title {
      font-size: 1.1rem;
    }
  }
</style>

<div class="downloads-container">
  <div class="card filemanager-sidebar">
    <div class="card-body">
      <h5 class="section-title"><?php echo $Lang['categories']; ?></h5>
      <div class="d-flex flex-column h-100">
        <div class="mb-4">
          <ul class="list-unstyled categories-list">
            <?php foreach($Downloads['downloads']['cate_data'] as $cate_data): ?>
            <li>
              <a href="./downloads?cate_id=<?php echo $cate_data['id']; ?>" class="d-flex align-items-center">
                <i class="bx bx-folder text-warning"></i>
                <?php echo $cate_data['name']; ?>
                <span class="badge badge-success badge-pill ml-2"><?php echo $cate_data['file_count']; ?></span>
              </a>
            </li>
            <?php endforeach; ?>
          </ul>
        </div>
      </div>
    </div>
  </div>

  <div class="w-100">
    <div class="card">
      <div class="card-body">
        <?php if($ErrorMsg): ?>
        <div class="alert alert-danger alert-dismissible fade show" role="alert">
          <i class="bx bx-error-circle mr-2"></i>
          <?php echo $ErrorMsg; ?>
          <button type="button" class="close" data-dismiss="alert" aria-label="Close">
            <span aria-hidden="true">×</span>
          </button>
        </div>
        <?php endif; ?>

        <div class="mt-2">
          <h5 class="section-title"><?php echo $Lang['downloads_directory']; ?></h5>
          <hr class="mt-3 mb-4" style="background: linear-gradient(90deg, rgba(240, 138, 93, 0.2), rgba(240, 138, 93, 0.05), rgba(240, 138, 93, 0.2));">

          <div class="table-responsive">
            <table class="table table-hover mb-0">
              <thead>
                <tr>
                  <th scope="col"><?php echo $Lang['file_name']; ?></th>
                  <th scope="col"><?php echo $Lang['upload_time']; ?></th>
                  <th scope="col"><?php echo $Lang['amount_downloads']; ?></th>
                  <th scope="col" width="80px"></th>
                </tr>
              </thead>
              <tbody>
                <?php if($Downloads['downloads']['downloads']): foreach($Downloads['downloads']['downloads'] as $downloads): ?>
                <tr>
                  <td>
                    <a href="<?php echo $downloads['down_link']; ?>" class="d-flex align-items-center">
                      <div class="file-icon <?php if($downloads['type'] == '1'): ?>zip<?php elseif($downloads['type'] == '2'): ?>image<?php elseif($downloads['type'] == '3'): ?>text<?php endif; ?>">
                        <i class="bx <?php if($downloads['type'] == '1'): ?>bx-archive<?php elseif($downloads['type'] == '2'): ?>bx-image<?php elseif($downloads['type'] == '3'): ?>bx-file<?php endif; ?>"></i>
                      </div>
                      <span class="font-weight-medium"><?php echo $downloads['title']; ?></span>
                    </a>
                  </td>
                  <td><?php echo date('Y-m-d H:i',!is_numeric($downloads['update_time'])? strtotime($downloads['update_time']) : $downloads['update_time']); ?></td>
                  <td>
                    <span class="badge badge-light-secondary">
                      <i class="bx bx-download mr-1"></i><?php echo $downloads['downloads']; ?>
                    </span>
                  </td>
                  <td class="text-center">
                    <a href="<?php echo $downloads['down_link']; ?>" class="download-btn">
                      <i class="bx bx-cloud-download"></i>
                    </a>
                  </td>
                </tr>
                <?php endforeach; else: ?>
                <tr>
                  <td colspan="4" class="text-center py-4">
                    <div class="empty-state">
                      <i class="bx bx-file text-muted" style="font-size: 2.5rem;"></i>
                      <p class="mt-2 text-muted"><?php echo $Lang['nothing']; ?></p>
                    </div>
                  </td>
                </tr>
                <?php endif; ?>
              </tbody>
            </table>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>

<script>
  $(document).ready(function() {
    // Add hover effects to table rows
    $('.table tbody tr').hover(
      function() {
        $(this).css({
          'transform': 'translateY(-2px)',
          'box-shadow': '0 5px 15px rgba(0, 0, 0, 0.05)',
          'z-index': '1',
          'position': 'relative',
          'transition': 'all 0.3s ease'
        });
      },
      function() {
        $(this).css({
          'transform': '',
          'box-shadow': '',
          'z-index': '',
          'position': '',
          'transition': 'all 0.3s ease'
        });
      }
    );
    
    // Add ripple effect to download buttons
    $('.download-btn').on('mousedown', function(e) {
      const $this = $(this);
      $this.find('.ripple').remove();
      
      const $ripple = $('<span class="ripple"></span>');
      $this.append($ripple);
      
      const x = e.pageX - $this.offset().left;
      const y = e.pageY - $this.offset().top;
      
      $ripple.css({
        top: y + 'px',
        left: x + 'px'
      });
      
      setTimeout(function() {
        $ripple.remove();
      }, 600);
    });
    
    // Add animation to cards
    $('.card').css({
      'opacity': '0',
      'transform': 'translateY(20px)'
    }).each(function(index) {
      const $this = $(this);
      setTimeout(function() {
        $this.css({
          'transition': 'all 0.6s cubic-bezier(0.4, 0, 0.2, 1)',
          'opacity': '1',
          'transform': 'translateY(0)'
        });
      }, 100 * index);
    });
    
    // Highlight active category
    const urlParams = new URLSearchParams(window.location.search);
    const cateId = urlParams.get('cate_id');
    
    if (cateId) {
      $(`.categories-list a[href$="cate_id=${cateId}"]`).css({
        'background-color': 'rgba(240, 138, 93, 0.15)',
        'color': 'var(--primary)',
        'font-weight': '600',
        'transform': 'translateX(5px)'
      });
    }
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