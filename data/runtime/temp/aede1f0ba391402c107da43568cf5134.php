<?php /*a:5:{s:70:"/www/wwwroot/cloud.hf.pw2/public/themes/clientarea/ogmiao/newsview.tpl";i:1743848854;s:75:"/www/wwwroot/cloud.hf.pw2/public/themes/clientarea/ogmiao/includes/head.tpl";i:1742354372;s:75:"/www/wwwroot/cloud.hf.pw2/public/themes/clientarea/ogmiao/includes/menu.tpl";i:1720065013;s:81:"/www/wwwroot/cloud.hf.pw2/public/themes/clientarea/ogmiao/includes/pageheader.tpl";i:1719999923;s:81:"/www/wwwroot/cloud.hf.pw2/public/themes/clientarea/ogmiao/includes/breadcrumb.tpl";i:1719999923;}*/ ?>

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
/* 基础变量定义 - 与news.tpl保持一致 */
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

/* 修改新闻标题样式，使其更突出 */
.news-title {
  font-size: 2rem;
  font-weight: 700;
  color: var(--dark);
  margin-bottom: 1.2rem;
  line-height: 1.4;
  position: relative;
  display: inline-block;
  text-align: center;
  width: 100%;
}

.news-title::after {
  content: "";
  position: absolute;
  bottom: -12px;
  left: 50%;
  transform: translateX(-50%);
  width: 80px;
  height: 3px;
  background: var(--primary);
  border-radius: 3px;
}

/* 修改新闻分类标签样式 */
.news-category {
  display: inline-block;
  background-color: rgba(240, 138, 93, 0.15);
  color: var(--primary);
  font-size: 0.9rem;
  font-weight: 600;
  padding: 0.5rem 1.2rem;
  border-radius: 50px;
  margin-bottom: 1.2rem;
  transition: all 0.3s ease;
  box-shadow: 0 3px 10px rgba(240, 138, 93, 0.1);
}

/* 修改新闻日期样式 */
.news-date {
  color: var(--gray);
  font-size: 0.95rem;
  margin-bottom: 2rem;
}

/* 修改分隔线样式 */
hr {
  height: 1px;
  background: linear-gradient(90deg, rgba(240, 138, 93, 0.2), rgba(240, 138, 93, 0.05), rgba(240, 138, 93, 0.2));
  border: none;
  margin: 2.5rem 0;
  position: relative;
}

/* 修改内容区域样式，提高可读性 */
#viewcontent {
  border: none;
  width: 100%;
  transition: all 0.3s ease;
  border-radius: 12px;
  overflow: hidden;
  background-color: #fff;
  padding: 0;
  box-shadow: 0 5px 20px rgba(0, 0, 0, 0.05);
  margin: 2rem 0;
}

/* 修改标签样式 */
.tags-title {
  font-size: 1.2rem;
  font-weight: 600;
  color: var(--dark);
  margin-bottom: 1.2rem;
  position: relative;
  display: inline-block;
}

.tags-title::after {
  content: "";
  position: absolute;
  bottom: -5px;
  left: 0;
  width: 30px;
  height: 2px;
  background: var(--primary);
  border-radius: 2px;
}

.tags-list {
  list-style: none;
  padding: 0;
  margin: 0;
  display: flex;
  flex-wrap: wrap;
}

.tag-item {
  margin-right: 0.8rem;
  margin-bottom: 0.8rem;
  padding: 0.6rem 1.2rem;
  background-color: rgba(240, 138, 93, 0.1);
  color: var(--primary);
  border-radius: 50px;
  font-size: 0.9rem;
  font-weight: 500;
  transition: all 0.3s ease;
  box-shadow: 0 2px 8px rgba(240, 138, 93, 0.05);
}

/* 导航按钮样式 */
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

/* 添加内容容器样式 */
.content-container {
  background-color: #fff;
  border-radius: 15px;
  padding: 0;
  box-shadow: 0 5px 20px rgba(0, 0, 0, 0.05);
  margin: 2rem 0;
  overflow: hidden;
}

/* 修改响应式样式 */
@media (max-width: 992px) {
  .card-body {
    padding: 20px;
  }
  
  .news-title {
    font-size: 1.6rem;
  }
}

@media (max-width: 768px) {
  .news-title {
    font-size: 1.6rem;
  }
  
  .card-body {
    padding: 15px;
  }
  
  #viewcontent {
    margin: 1.5rem 0;
  }
  
  .btn-primary {
    padding: 0.5rem 1.2rem;
    font-size: 0.9rem;
  }
}

@media (max-width: 576px) {
  .news-title {
    font-size: 1.4rem;
  }
  
  .news-category {
    font-size: 0.8rem;
    padding: 0.4rem 1rem;
  }
  
  .tag-item {
    font-size: 0.8rem;
    padding: 0.4rem 0.8rem;
  }
  
  #viewcontent {
    margin: 1rem 0;
  }
  
  .btn-primary {
    padding: 0.45rem 1rem;
    font-size: 0.85rem;
    margin-bottom: 10px;
    width: 100%;
    text-align: center;
  }
  
  .mt-4.d-flex {
    flex-direction: column;
  }
}

/* 内容样式 */
.newscontent pre,
.newscontent .newscontent {
  max-width: 100%;
  word-break: break-all;
  white-space: pre-wrap;
}

.newscontent img {
  max-width: 100%;
  height: auto;
  border-radius: 10px;
  margin: 1.5rem 0;
  box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
  transition: all 0.3s ease;
}

.newscontent img:hover {
  transform: scale(1.02);
  box-shadow: 0 8px 25px rgba(0, 0, 0, 0.15);
}

.newscontent p {
  display: block !important;
  white-space: normal;
  margin-bottom: 1.2rem;
  line-height: 1.8;
  color: var(--gray);
}
</style>

<div class="row">
  <div class="col-lg-12">
    <div class="card">
      <div class="card-body">
        <!-- 装饰元素 -->
        <div class="decoration decoration-1"></div>
        <div class="decoration decoration-2"></div>
        
<!-- 修改HTML结构，优化内容展示 -->
<div class="pt-3">
  <div class="row justify-content-center">
    <div class="col-xl-10">
      <div>
        <div class="text-center">
          <div class="mb-4">
            <span class="news-category">
              <i class="bx bx-purchase-tag-alt"></i><?php echo $ViewAnnouncement['cate_name']; ?>
            </span>
          </div>
          <h1 class="news-title"><?php echo $ViewAnnouncement['title']; ?></h1>
          <p class="news-date">
            <i class="bx bx-calendar"></i><?php echo date('Y-m-d H:i',!is_numeric($ViewAnnouncement['push_time'])? strtotime($ViewAnnouncement['push_time']) : $ViewAnnouncement['push_time']); ?>
          </p>
        </div>
        
        <div class="content-container">
          <iframe id="viewcontent" scrolling="no" style="border: none; width: 100%"></iframe>
        </div>
        
        <?php if($ViewAnnouncement['label']): ?>
        <div class="mt-4">
          <h5 class="tags-title">标签:</h5>

          <div>
            <ul class="tags-list row w-100">
              <?php foreach($ViewAnnouncement['label'] as $label): ?>
              <li class="tag-item col-sm-auto"><?php echo $label; ?></li>
              <?php endforeach; ?>
            </ul>
          </div>
        </div>
        <?php endif; ?>

        <hr />

        <div class="mt-4 d-flex <?php if(!$ViewAnnouncement['prev'] && $ViewAnnouncement['next']): ?>justify-content-end<?php else: ?>justify-content-between<?php endif; ?>">
          <?php if($ViewAnnouncement['prev']): ?>
          <a href="newsview?id=<?php echo $ViewAnnouncement['prev']['id']; ?>" class="btn btn-primary">
            <i class="bx bx-left-arrow-alt font-size-16 align-middle mr-2"></i> <?php echo $ViewAnnouncement['prev']['title']; ?>
          </a>
          <?php endif; if($ViewAnnouncement['next']): ?>
          <a href="newsview?id=<?php echo $ViewAnnouncement['next']['id']; ?>" class="btn btn-primary">
            <?php echo $ViewAnnouncement['next']['title']; ?> <i class="bx bx-right-arrow-alt font-size-16 align-middle ml-2"></i>
          </a>
          <?php endif; ?>
        </div>
      </div>
    </div>
  </div>
</div>
      </div>
      <!-- end card body -->
    </div>
    <!-- end card -->
  </div>
  <!-- end col -->
</div>
<!-- end row -->

<script>
// 修改脚本部分，增强内容处理和交互体验
$(function () {
  $('.newscontent').find('*').css({ margin: '0px', display: 'inline-block' })
  $('.newscontent')
    .find('p')
    .each(function () {
      if ($(this).html() == '&nbsp;') {
        $(this).remove()
      }
    })
  $('.newscontent')
    .find('span')
    .each(function () {
      if ($(this).html() == '&nbsp;') {
        $(this).remove()
      }
    })

  // 内容显示到 iframe 中
  const viewstyle = `<style>
      html, body { 
        margin: 0; 
        word-break: break-all; 
        height: 100%;
        font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, "Helvetica Neue", Arial, sans-serif;
        color: #4a4a4a;
        line-height: 1.8;
        padding: 25px;
        background-color: #fff;
        font-size: 16px;
      }
      table { 
        width: 100%;
        border-collapse: collapse;
        margin: 2rem 0;
        border-radius: 8px;
        overflow: hidden;
        box-shadow: 0 2px 10px rgba(0, 0, 0, 0.05);
      }
      table td, table th {
        padding: 12px 15px;
        border: 1px solid rgba(240, 138, 93, 0.15);
      }
      table th {
        background-color: rgba(240, 138, 93, 0.08);
        color: #2d3436;
        font-weight: 600;
      }
      table tr:nth-child(even) {
        background-color: rgba(240, 138, 93, 0.02);
      }
      img { 
        max-width: 100%; 
        height: auto;
        border-radius: 12px;
        margin: 2rem auto;
        box-shadow: 0 5px 20px rgba(0, 0, 0, 0.1);
        transition: all 0.3s ease;
        display: block;
      }
      img:hover {
        transform: scale(1.02);
        box-shadow: 0 8px 30px rgba(0, 0, 0, 0.15);
      }
      p { 
        display: block !important; 
        white-space: normal;
        margin-bottom: 1.5rem;
        line-height: 1.8;
        font-size: 16px;
      }
      a {
        color: #f08a5d;
        text-decoration: none;
        transition: all 0.3s ease;
        border-bottom: 1px dashed #fad7a0;
        padding-bottom: 2px;
        font-weight: 500;
      }
      a:hover {
        color: #e67e22;
        border-bottom: 1px solid #f08a5d;
      }
      h1, h2, h3, h4, h5, h6 {
        color: #2d3436;
        margin-top: 2.5rem;
        margin-bottom: 1.2rem;
        font-weight: 600;
        line-height: 1.4;
      }
      h1 { font-size: 2rem; border-bottom: 2px solid rgba(240, 138, 93, 0.1); padding-bottom: 0.5rem; }
      h2 { font-size: 1.75rem; }
      h3 { font-size: 1.5rem; }
      h4 { font-size: 1.25rem; }
      h5 { font-size: 1.1rem; }
      h6 { font-size: 1rem; }
      
      ul, ol {
        padding-left: 1.8rem;
        margin-bottom: 1.8rem;
      }
      li {
        margin-bottom: 0.8rem;
      }
      blockquote {
        border-left: 4px solid #f08a5d;
        padding: 1.2rem 1.8rem;
        margin: 2rem 0;
        background-color: rgba(240, 138, 93, 0.05);
        border-radius: 0 12px 12px 0;
        font-style: italic;
        color: #555;
      }
      blockquote p:last-child {
        margin-bottom: 0;
      }
      pre {
        background-color: #f8f9fa;
        padding: 1.2rem;
        border-radius: 12px;
        overflow-x: auto;
        margin: 2rem 0;
        border: 1px solid rgba(0, 0, 0, 0.05);
        font-family: 'SFMono-Regular', Consolas, 'Liberation Mono', Menlo, monospace;
        font-size: 0.9rem;
      }
      code {
        background-color: rgba(240, 138, 93, 0.1);
        color: #e67e22;
        padding: 0.2rem 0.5rem;
        border-radius: 4px;
        font-size: 0.9em;
        font-family: 'SFMono-Regular', Consolas, 'Liberation Mono', Menlo, monospace;
      }
      
      /* 添加内容区域的阅读引导线 */
      @media (min-width: 768px) {
        body {
          max-width: 800px;
          margin: 0 auto;
        }
      }
      
      /* 优化引用和代码块 */
      blockquote {
        position: relative;
      }
      blockquote::before {
        content: """;
        position: absolute;
        top: 10px;
        left: 10px;
        font-size: 3rem;
        color: rgba(240, 138, 93, 0.2);
        font-family: Georgia, serif;
        line-height: 1;
      }
      
      /* 添加图片说明样式 */
      .image-caption {
        text-align: center;
        color: #777;
        font-size: 0.9rem;
        margin-top: -1rem;
        margin-bottom: 2rem;
        font-style: italic;
      }
      
      /* 添加内容强调样式 */
      .highlight {
        background-color: rgba(240, 138, 93, 0.15);
        padding: 2px 5px;
        border-radius: 4px;
      }
      
      /* 添加分隔线样式 */
      hr {
        height: 1px;
        background: linear-gradient(90deg, rgba(240, 138, 93, 0.2), rgba(240, 138, 93, 0.05), rgba(240, 138, 93, 0.2));
        border: none;
        margin: 2.5rem 0;
      }
      
      /* 添加响应式调整 */
      @media (max-width: 768px) {
        html, body {
          padding: 20px;
          font-size: 15px;
        }
        h1 { font-size: 1.8rem; }
        h2 { font-size: 1.6rem; }
        h3 { font-size: 1.4rem; }
        h4 { font-size: 1.2rem; }
        h5 { font-size: 1.1rem; }
        h6 { font-size: 1rem; }
      }
      
      @media (max-width: 576px) {
        html, body {
          padding: 15px;
          font-size: 14px;
        }
        h1 { font-size: 1.6rem; }
        h2 { font-size: 1.4rem; }
        h3 { font-size: 1.3rem; }
        h4 { font-size: 1.1rem; }
        h5 { font-size: 1rem; }
        h6 { font-size: 0.9rem; }
        
        img {
          margin: 1.5rem auto;
        }
        
        blockquote {
          padding: 1rem 1.5rem;
          margin: 1.5rem 0;
        }
        
        pre {
          padding: 1rem;
          margin: 1.5rem 0;
        }
      }
  </style>`
  
  let content = `<?php echo $ViewAnnouncement['content']; ?>`
  content = content.indexOf('</head>') > 0 ? content.replace('</head>', `${viewstyle}</head>`) : `${viewstyle}${content}`
  const iframe = document.querySelector('#viewcontent')
  const viewdoc = iframe.contentDocument
  viewdoc.open()
  viewdoc.write(content)
  viewdoc.close()
  
  // 处理iframe内容
  setTimeout(function() {
    // 处理图片
    const images = viewdoc.querySelectorAll('img');
    images.forEach((img, index) => {
      // 为图片添加加载动画
      img.style.opacity = '0';
      img.style.transition = 'opacity 0.5s ease';
      
      // 添加图片点击放大效果
      img.style.cursor = 'pointer';
      img.setAttribute('data-action', 'zoom');
      
      // 图片加载完成后显示
      if (img.complete) {
        img.style.opacity = '1';
      } else {
        img.onload = function() {
          img.style.opacity = '1';
        };
      }
      
      // 添加图片点击事件
      img.addEventListener('click', function() {
        if (this.classList.contains('zoomed')) {
          this.style.transform = 'scale(1)';
          this.style.maxWidth = '100%';
          this.style.zIndex = '1';
          this.classList.remove('zoomed');
        } else {
          this.style.transform = 'scale(1.5)';
          this.style.maxWidth = '150%';
          this.style.zIndex = '100';
          this.classList.add('zoomed');
        }
        
        // 重新调整iframe高度
        iframe.height = viewdoc.body.scrollHeight + 30;
      });
    });
    
    // 处理链接
    const links = viewdoc.querySelectorAll('a');
    links.forEach(link => {
      // 外部链接在新窗口打开
      if (link.hostname !== window.location.hostname) {
        link.setAttribute('target', '_blank');
        link.setAttribute('rel', 'noopener noreferrer');
      }
      
      // 添加链接悬停效果
      link.addEventListener('mouseenter', function() {
        this.style.color = '#e67e22';
        this.style.borderBottom = '1px solid #f08a5d';
      });
      
      link.addEventListener('mouseleave', function() {
        this.style.color = '#f08a5d';
        this.style.borderBottom = '1px dashed #fad7a0';
      });
    });
    
    // 处理标题
    const headings = viewdoc.querySelectorAll('h1, h2, h3, h4, h5, h6');
    headings.forEach(heading => {
      // 添加标题悬停效果
      heading.addEventListener('mouseenter', function() {
        this.style.color = '#f08a5d';
      });
      
      heading.addEventListener('mouseleave', function() {
        this.style.color = '#2d3436';
      });
    });
    
    // 自动调整iframe高度
    iframe.height = viewdoc.body.scrollHeight + 30;
  }, 300);
  
  // 添加动画效果
  $('.card').css({
    'opacity': '0',
    'transform': 'translateY(20px)'
  });
  
  setTimeout(() => {
    $('.card').css({
      'transition': 'all 0.6s cubic-bezier(0.4, 0, 0.2, 1)',
      'opacity': '1',
      'transform': 'translateY(0)'
    });
  }, 100);
  
  // 为标签添加动画效果
  $('.tag-item').each(function(index) {
    $(this).css({
      'opacity': '0',
      'transform': 'translateY(10px)'
    });
    
    setTimeout(() => {
      $(this).css({
        'transition': 'all 0.4s cubic-bezier(0.4, 0, 0.2, 1)',
        'opacity': '1',
        'transform': 'translateY(0)'
      });
    }, 500 + (index * 50));
  });
  
  // 为按钮添加动画效果
  $('.btn-primary').hover(
    function() {
      $(this).css({
        'transform': 'translateY(-3px)',
        'box-shadow': '0 6px 20px rgba(240, 138, 93, 0.4)'
      });
    },
    function() {
      $(this).css({
        'transform': '',
        'box-shadow': '0 4px 15px rgba(240, 138, 93, 0.3)'
      });
    }
  );
  
  // 添加按钮点击波纹效果
  $('.btn-primary').on('mousedown', function(e) {
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
  
  // 添加波纹效果样式
  $('<style>')
    .prop('type', 'text/css')
    .html(`
      .btn-primary {
        position: relative;
        overflow: hidden;
      }
      .ripple {
        position: absolute;
        background: rgba(255, 255, 255, 0.3);
        border-radius: 50%;
        transform: scale(0);
        animation: ripple-effect 0.6s linear;
        pointer-events: none;
      }
      @keyframes ripple-effect {
        to {
          transform: scale(2.5);
          opacity: 0;
        }
      }
    `)
    .appendTo('head');
    
  // 监听窗口大小变化，重新调整iframe高度
  $(window).on('resize', function() {
    setTimeout(function() {
      iframe.height = viewdoc.body.scrollHeight + 30;
    }, 300);
  });
})
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