<?php /*a:6:{s:63:"/www/wwwroot/cloud.hf.pw2/public/themes/cart/ogmiao/product.tpl";i:1746426992;s:75:"/www/wwwroot/cloud.hf.pw2/public/themes/clientarea/ogmiao/includes/head.tpl";i:1742354372;s:75:"/www/wwwroot/cloud.hf.pw2/public/themes/clientarea/ogmiao/includes/menu.tpl";i:1720065013;s:81:"/www/wwwroot/cloud.hf.pw2/public/themes/clientarea/ogmiao/includes/pageheader.tpl";i:1719999923;s:81:"/www/wwwroot/cloud.hf.pw2/public/themes/clientarea/ogmiao/includes/breadcrumb.tpl";i:1719999923;s:73:"/www/wwwroot/cloud.hf.pw2/public/themes/cart/ogmiao/topbar-categories.tpl";i:1746426987;}*/ ?>

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
html, body {
  overflow-x: hidden !important;
  width: 100%;
  max-width: 100vw;
  padding: 0 !important;
  margin: 0 !important;
}
* {
  box-sizing: border-box;
  max-width: 100vw;
}
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
body {
  overflow-x: hidden; !important;
}
.firstgroup_box,
.secondgroup_box,
.notice-box {
min-height: auto;
height: auto;
padding: 12px 15px;
background-color: #fff;
box-shadow: 0 4px 15px 1px rgba(240, 138, 93, 0.1);
display: flex;
align-items: flex-start;
border-radius: 10px;
margin-bottom: 15px;
transition: all 0.3s ease;
position: relative;
overflow: visible !important;
width: 100%;
}
.firstgroup_box.collapsed,
.secondgroup_box.collapsed {
max-height: none;
overflow: hidden;
}
.firstgroup_box .toggle-btn,
.secondgroup_box .toggle-btn {
position: absolute;
right: 15px;
top: 12px;
cursor: pointer;
color: var(--primary);
font-size: 18px;
z-index: 10;
transition: all 0.4s cubic-bezier(0.4, 0, 0.2, 1);
}
.toggle-btn:hover {
transform: scale(1.1);
color: var(--primary-dark);
}
.firstgroup_box .firstgroup_box_prov,
.secondgroup_box .secondgroup_box_area {
color: var(--primary);
display: inline-block;
min-width: 80px;
flex-shrink: 0;
font-weight: 600;
font-size: 14px;
}
.firstgroup_box .firstgroup_box_group,
.secondgroup_box .secondgroup_box_group {
width: 100%;
display: flex;
flex-wrap: wrap;
gap: 5px;
align-items: center;
overflow: visible !important;
  position: relative;
  z-index: 1;
}
.firstgroup_box .firstgroup_item,
.secondgroup_box .secondgroup_item,
.pro_item {
height: 32px;
box-shadow: 0 4px 15px 1px rgba(240, 138, 93, 0.06);
border-radius: 6px;
border: solid 1px #ced1e2;
margin-right: 5px;
float: left;
margin-bottom: 5px;
transition: all 0.3s ease;
position: relative;
overflow: visible !important;
flex-shrink: 0;
margin-top: 12px;
}
.firstgroup_box .firstgroup_item.active,
.firstgroup_box .firstgroup_item:hover,
.secondgroup_box .secondgroup_item.active,
.secondgroup_box .secondgroup_item:hover,
.pro_item.active,
.pro_item:hover {
background-color: var(--primary);
border-color: var(--primary);
box-shadow: 0 4px 15px 1px rgba(240, 138, 93, 0.2);
border-radius: 6px;
color: #fff;
transform: translateY(-2px);
}
.firstgroup_box a,
.secondgroup_box a,
.pro_item a,
.firstgroup_box .firstgroup_item,
.secondgroup_box .secondgroup_item,
.pro_item {
color: var(--dark); /* 强制使用深色文字 */
min-width: auto;
width: auto;
padding: 0 12px;
display: flex;
align-items: center;
justify-content: center;
overflow: hidden;
white-space: nowrap;
text-overflow: ellipsis;
font-size: 13px;
text-decoration: none;
}
.firstgroup_box a:hover,
.secondgroup_box a:hover,
.pro_item a:hover,
.firstgroup_box .firstgroup_item:hover a,
.secondgroup_box .secondgroup_item:hover a,
.pro_item:hover a {
color: #fff;
text-decoration: none;
}
.country-flag {
width: 18px;
height: 12px;
margin-right: 6px;
border-radius: 1px;
box-shadow: 0 1px 3px rgba(0, 0, 0, 0.1);
transition: all 0.3s ease;
object-fit: cover;
}
.firstgroup_item:hover .country-flag,
.secondgroup_item:hover .country-flag,
.firstgroup_item.active .country-flag,
.secondgroup_item.active .country-flag {
box-shadow: 0 2px 5px rgba(255, 255, 255, 0.2);
transform: scale(1.1);
}
@media (max-width: 768px) {
.firstgroup_box,
.secondgroup_box,
.notice-box {
 padding: 12px 15px;
}
.firstgroup_box .firstgroup_box_prov,
.secondgroup_box .secondgroup_box_area {
 min-width: 60px;
 font-size: 13px;
}
}
@media (max-width: 576px) {
.firstgroup_box,
.secondgroup_box,
.notice-box {
 flex-direction: column;
 align-items: flex-start;
 padding: 10px;
 margin-bottom: 10px;
 height: auto;
 min-height: auto;
 overflow: visible;
}
.firstgroup_box .firstgroup_box_prov,
.secondgroup_box .secondgroup_box_area {
 margin-bottom: 8px;
 font-size: 12px;
 min-width: auto;
 width: 100%;
}
.firstgroup_box_group p,
.secondgroup_box_group p {
 grid-column: 1 / -1;
 width: 100%;
}
.firstgroup_item,
.secondgroup_item {
 min-width: auto !important;
 width: calc(50% - 5px);
 padding: 0;
 height: 28px;
 margin-bottom: 4px;
 margin-right: 4px;
 margin-top: 10px; /* 移动端调整顶部边距 */
}
.firstgroup_box .firstgroup_box_group,
.secondgroup_box .secondgroup_box_group {
 justify-content: space-between;
 display: grid;
 grid-template-columns: repeat(2, 1fr);
 gap: 5px;
 width: 100%;
}
.firstgroup_box a,
.secondgroup_box a {
 font-size: 12px;
 min-width: auto;
 padding: 0 8px;
 width: 100%;
}
.firstgroup_box .toggle-btn,
.secondgroup_box .toggle-btn {
 right: 10px;
 top: 10px;
 font-size: 16px;
}
}
/* 修改：完全重新设计标签定位方式，确保标签显示在按钮上方且不被裁剪 */
.category-tag {
  position: absolute;
  top: -12px;
  left: -5px;
  padding: 2px 6px;
  font-size: 10px;
  font-weight: 600;
  border-radius: 4px;
  color: white;
  box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
  z-index: 100; /* 大幅提高z-index确保在所有元素上层 */
  transform: scale(0.9);
  transition: all 0.3s ease;
  white-space: nowrap; /* 确保标签文本不换行 */
  pointer-events: none; /* 防止标签干扰按钮点击 */
  text-shadow: 0 1px 2px rgba(0, 0, 0, 0.2); /* 添加文字阴影提升可读性 */
  font-weight: 700; /* 加粗文字 */
  letter-spacing: 0.5px; /* 增加字距 */
}

/* 修改按钮容器相关样式 */
.firstgroup_box .firstgroup_item,
.secondgroup_box .secondgroup_item,
.pro_item {
  height: 32px;
  box-shadow: 0px 4px 15px 1px rgba(240, 138, 93, 0.06);
  border-radius: 6px;
  border: solid 1px #ced1e2;
  margin-right: 5px;
  float: left;
  margin-bottom: 5px;
  transition: all 0.3s ease;
  position: relative;
  overflow: visible !important; /* 强制确保overflow为visible */
  flex-shrink: 0;
  margin-top: 12px; /* 增加顶部边距，为标签留出更多空间 */
}

/* 确保父容器也不会裁剪标签 */
.firstgroup_box,
.secondgroup_box {
  overflow: visible !重要;
}

.firstgroup_box_group,
.secondgroup_box_group {
  overflow: visible !重要;
  position: relative;
  z-index: 1;
}

/* 增强标签在悬停和激活状态的视觉效果 */
.secondgroup_item:hover .category-tag {
  transform: scale(1.1);
  top: -14px; /* 悬停时标签上移 */
  box-shadow: 0 3px 8px rgba(0, 0, 0, 0.15);
}

.secondgroup_item.active .category-tag {
  transform: scale(1.1);
  top: -14px;
  box-shadow: 0 3px 8px rgba(0, 0, 0, 0.15);
}

/* 移动端适配 */
@media (max-width: 576px) {
  .category-tag {
    top: -10px;
    left: -3px;
    padding: 1px 4px;
    font-size: 9px;
  }
  
  .secondgroup_item:hover .category-tag,
  .secondgroup_item.active .category-tag {
    top: -12px;
  }
  
  .firstgroup_item,
  .secondgroup_item {
    margin-top: 10px; /* 移动端减小顶部边距 */
  }
}
.tag-hot {
  background-color: #ff6b6b;
}

.tag-unlimited {
  background-color: #4e73df;
}

.tag-traffic {
  background-color: #2ecc71;
}

.tag-new {
  background-color: #f08a5d;
}

.tag-light {
  background-color: #00b894; /* 轻量 - 薄荷绿 */
}

.tag-performance {
  background-color: #6c5ce7; /* 性能 - 深紫色 */
}

.tag-bandwidth {
  background-color: #0984e3; /* 大宽带 - 深蓝色 */
}

.tag-nat {
  background-color: #636e72; /* NAT - 深灰色 */
}

.tag-ddos {
  background-color: #e17055; /* 高防 - 橙红色 */
}

.tag-highfreq {
  background-color: #a537fd; /* 高频 - 紫色 */
}

.tag-cheap {
  background-color: #00cec9; /* 廉价 - 青色 */
}

.tag-manual {
  background-color: #d63031; /* 需手动域名过白 - 红色 */
}

.tag-activity {
  background-color: #fdcb6e; /* 活动 - 金黄色 */
}

.tag-custom {
  background-color: #222f3e; /* 自选 - 深蓝灰 */
}

.secondgroup_item:hover .category-tag {
  transform: scale(1);
  top: -12px;
}

secondgroup_item.active .category-tag {
  transform: scale(1);
  top: -12px;
}

@media (max-width: 576px) {
  .category-tag {
    top: -10px;
    left: -3px;
    padding: 1px 4px;
    font-size: 9px;
  }
  
  .secondgroup_item:hover .category-tag,
  .secondgroup_item.active .category-tag {
    top: -10px;
  }
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
.notice-box .notice-icon {
  color: #ff6b6b;
  display: inline-block;
  min-width: 30px;
  flex-shrink: 0;
  font-size: 18px;
  margin-right: 10px;
}

.notice-box .notice-content {
  width: 100%;
  display: flex;
  flex-direction: column;
  gap: 5px;
}

.notice-box .notice-title {
  font-weight: 600;
  color: #ff6b6b;
  margin-bottom: 5px;
  font-size: 14px;
}

.notice-box .notice-text {
  color: var(--dark);
  font-size: 13px;
  line-height: 1.5;
  margin-bottom: 5px;
}

.notice-box .terms-btn {
  display: inline-flex;
  align-items: center;
  justify-content: center;
  background-color: #ff6b6b;
  color: white;
  border: none;
  border-radius: 6px;
  padding: 6px 12px;
  font-size: 12px;
  font-weight: 600;
  cursor: pointer;
  transition: all 0.3s ease;
  text-decoration: none;
  margin-top: 5px;
  align-self: flex-start;
}

.notice-box .terms-btn:hover {
  background-color: #e74c3c;
  transform: translateY(-2px);
  box-shadow: 0 4px 8px rgba(231, 76, 60, 0.2);
}

.notice-box .terms-btn i {
  margin-left: 5px;
  font-size: 10px;
}

.notice-item {
  display: flex;
  align-items: flex-start;
  margin-bottom: 8px;
}

.notice-item:last-child {
  margin-bottom: 0;
}

.notice-item-icon {
  color: #ff6b6b;
  margin-right: 8px;
  font-size: 14px;
  margin-top: 2px;
}

.notice-item-text {
  flex: 1;
  font-size: 13px;
  line-height: 1.5;
  color: var(--dark); /* 强制使用深色文字 */
}

.notice-item-title {
  font-weight: 600;
  margin-right: 5px;
}

@media (max-width: 768px) {
  .notice-box {
    padding: 12px 15px;
  }
  
  .notice-box .notice-title {
    font-size: 13px;
  }
  
  .notice-item-text {
    font-size: 12px;
  }
}

@media (max-width: 576px) {
  .notice-box {
    padding: 10px;
    margin-bottom: 10px;
  }
  
  .notice-box .notice-icon {
    margin-bottom: 8px;
    font-size: 16px;
  }
  
  .notice-box .notice-title {
    font-size: 12px;
  }
  
  .notice-item-text {
    font-size: 11px;
  }
  
  .notice-box .terms-btn {
    width: 100%;
    margin-top: 8px;
  }
}
.secondgroup_box {
 padding-top: 15px; /* 增加顶部内边距，为标签留出更多空间 */
 overflow: visible !important; /* 确保标签不被裁剪 */
}
/* 修改：完全重新设计标签定位方式，确保标签显示在按钮上方且不被裁剪 */
.category-tag {
  position: absolute;
  top: -12px;
  left: -5px;
  padding: 2px 6px;
  font-size: 10px;
  font-weight: 600;
  border-radius: 4px;
  color: white;
  box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
  z-index: 100; /* 大幅提高z-index确保在所有元素上层 */
  transform: scale(0.9);
  transition: all 0.3s ease;
  white-space: nowrap; /* 确保标签文本不换行 */
  pointer-events: none; /* 防止标签干扰按钮点击 */
  text-shadow: 0 1px 2px rgba(0, 0, 0, 0.2); /* 添加文字阴影提升可读性 */
  font-weight: 700; /* 加粗文字 */
  letter-spacing: 0.5px; /* 增加字距 */
}

/* 修改按钮容器相关样式 */
.firstgroup_box .firstgroup_item,
.secondgroup_box .secondgroup_item,
.pro_item {
  height: 32px;
  box-shadow: 0px 4px 15px 1px rgba(240, 138, 93, 0.06);
  border-radius: 6px;
  border: solid 1px #ced1e2;
  margin-right: 5px;
  float: left;
  margin-bottom: 5px;
  transition: all 0.3s ease;
  position: relative;
  overflow: visible !important; /* 强制确保overflow为visible */
  flex-shrink: 0;
  margin-top: 12px; /* 增加顶部边距，为标签留出更多空间 */
}

/* 确保父容器也不会裁剪标签 */
.firstgroup_box,
.secondgroup_box {
  overflow: visible !important;
}

.firstgroup_box_group,
.secondgroup_box_group {
  overflow: visible !important;
  position: relative;
  z-index: 1;
}

/* 增强标签在悬停和激活状态的视觉效果 */
.secondgroup_item:hover .category-tag {
  transform: scale(1.1);
  top: -14px; /* 悬停时标签上移 */
  box-shadow: 0 3px 8px rgba(0, 0, 0, 0.15);
}

.secondgroup_item.active .category-tag {
  transform: scale(1.1);
  top: -14px;
  box-shadow: 0 3px 8px rgba(0, 0, 0, 0.15);
}

/* 移动端适配 */
@media (max-width: 576px) {
  .category-tag {
    top: -10px;
    left: -3px;
    padding: 1px 4px;
    font-size: 9px;
  }
  
  .secondgroup_item:hover .category-tag,
  .secondgroup_item.active .category-tag {
    top: -12px;
  }
  
  .firstgroup_item,
  .secondgroup_item {
    margin-top: 10px; /* 移动端减小顶部边距 */
  }
}
.tag-hot {
  background-color: #ff6b6b;
}

.tag-unlimited {
  background-color: #4e73df;
}

.tag-traffic {
  background-color: #2ecc71;
}

.tag-new {
  background-color: #f08a5d;
}

.tag-light {
  background-color: #00b894; /* 轻量 - 薄荷绿 */
}

.tag-performance {
  background-color: #6c5ce7; /* 性能 - 深紫色 */
}

.tag-bandwidth {
  background-color: #0984e3; /* 大宽带 - 深蓝色 */
}

.tag-nat {
  background-color: #636e72; /* NAT - 深灰色 */
}

.tag-ddos {
  background-color: #e17055; /* 高防 - 橙红色 */
}

.tag-highfreq {
  background-color: #a537fd; /* 高频 - 紫色 */
}

.tag-cheap {
  background-color: #00cec9; /* 廉价 - 青色 */
}

.tag-manual {
  background-color: #d63031; /* 需手动域名过白 - 红色 */
}

.tag-activity {
  background-color: #fdcb6e; /* 活动 - 金黄色 */
}

.tag-custom {
  background-color: #222f3e; /* 自选 - 深蓝灰 */
}

.secondgroup_item:hover .category-tag {
  transform: scale(1);
  top: -12px;
}

secondgroup_item.active .category-tag {
  transform: scale(1);
  top: -12px;
}

@media (max-width: 576px) {
  .category-tag {
    top: -10px;
    left: -3px;
    padding: 1px 4px;
    font-size: 9px;
  }
  
  .secondgroup_item:hover .category-tag,
  .secondgroup_item.active .category-tag {
    top: -10px;
  }
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
.notice-box .notice-icon {
  color: #ff6b6b;
  display: inline-block;
  min-width: 30px;
  flex-shrink: 0;
  font-size: 18px;
  margin-right: 10px;
}

.notice-box .notice-content {
  width: 100%;
  display: flex;
  flex-direction: column;
  gap: 5px;
}

.notice-box .notice-title {
  font-weight: 600;
  color: #ff6b6b;
  margin-bottom: 5px;
  font-size: 14px;
}

.notice-box .notice-text {
  color: var(--dark);
  font-size: 13px;
  line-height: 1.5;
  margin-bottom: 5px;
}

.notice-box .terms-btn {
  display: inline-flex;
  align-items: center;
  justify-content: center;
  background-color: #ff6b6b;
  color: white;
  border: none;
  border-radius: 6px;
  padding: 6px 12px;
  font-size: 12px;
  font-weight: 600;
  cursor: pointer;
  transition: all 0.3s ease;
  text-decoration: none;
  margin-top: 5px;
  align-self: flex-start;
}

.notice-box .terms-btn:hover {
  background-color: #e74c3c;
  transform: translateY(-2px);
  box-shadow: 0 4px 8px rgba(231, 76, 60, 0.2);
}

.notice-box .terms-btn i {
  margin-left: 5px;
  font-size: 10px;
}

.notice-item {
  display: flex;
  align-items: flex-start;
  margin-bottom: 8px;
}

.notice-item:last-child {
  margin-bottom: 0;
}

.notice-item-icon {
  color: #ff6b6b;
  margin-right: 8px;
  font-size: 14px;
  margin-top: 2px;
}

.notice-item-text {
  flex: 1;
  font-size: 13px;
  line-height: 1.5;
  color: var(--dark); /* 强制使用深色文字 */
}

.notice-item-title {
  font-weight: 600;
  margin-right: 5px;
}

@media (max-width: 768px) {
  .notice-box {
    padding: 12px 15px;
  }
  
  .notice-box .notice-title {
    font-size: 13px;
  }
  
  .notice-item-text {
    font-size: 12px;
  }
}

@media (max-width: 576px) {
  .notice-box {
    padding: 10px;
    margin-bottom: 10px;
  }
  
  .notice-box .notice-icon {
    margin-bottom: 8px;
    font-size: 16px;
  }
  
  .notice-box .notice-title {
    font-size: 12px;
  }
  
  .notice-item-text {
    font-size: 11px;
  }
  
  .notice-box .terms-btn {
    width: 100%;
    margin-top: 8px;
  }
}
.secondgroup_box {
 padding-top: 15px; /* 增加顶部内边距，为标签留出更多空间 */
 overflow: visible !important; /* 确保标签不被裁剪 */
}
/* ...existing code... */
.category-tag-multi {
  display: flex;
  align-items: center;
  position: absolute;
  top: -12px;
  left: -5px;
  z-index: 100;
}
.category-tag-multi .category-tag {
  position: static;
  margin: 0;
  border-radius: 4px 0 0 4px;
  font-size: 10px;
  font-weight: 700;
  padding: 2px 8px 2px 8px;
  letter-spacing: 0.5px;
  box-shadow: 0 2px 5px rgba(0,0,0,0.1);
  color: #fff;
  white-space: nowrap;
  pointer-events: none;
  text-shadow: 0 1px 2px rgba(0,0,0,0.2);
  min-width: 22px;
  text-align: center;
}
.category-tag-multi .category-tag:last-child:not(.category-tag-divider) {
  border-radius: 0 4px 4px 0;
}
.category-tag-divider {
  background: transparent !important;
  color: #fff !important;
  box-shadow: none !important;
  font-weight: bold;
  padding: 0 3px;
  border-radius: 0 !important;
  font-size: 12px;
  color: #fff;
  min-width: 0;
}
@media (max-width: 576px) {
  .category-tag-multi {
    top: -10px;
    left: -3px;
  }
  .category-tag-multi .category-tag {
    font-size: 9px;
    padding: 1px 6px 1px 6px;
    min-width: 18px;
  }
  .category-tag-divider {
    font-size: 10px;
    padding: 0 2px;
  }
}
/* ...existing code... */
.category-tag-half {
  display: flex;
  align-items: center;
  justify-content: center;
  position: absolute;
  top: -12px;
  left: -5px;
  min-width: 44px;
  height: 20px;
  border-radius: 4px;
  color: #fff;
  font-size: 10px;
  font-weight: 700;
  letter-spacing: 0.5px;
  box-shadow: 0 2px 5px rgba(0,0,0,0.1);
  pointer-events: none;
  white-space: nowrap;
  text-shadow: 0 1px 2px rgba(0,0,0,0.2);
  z-index: 100;
  overflow: hidden;
}
.category-tag-half-text {
  display: inline-block;
  height: 100%;
  line-height: 20px;
  text-align: center;
  color: #fff;
  font-size: 10px;
  font-weight: 700;
  width: 50%;
  overflow: hidden;
}
.category-tag-half-divider {
  display: inline-block;
  width: 8px;
  text-align: center;
  color: #fff;
  font-size: 12px;
  font-weight: bold;
  pointer-events: none;
  line-height: 20px;
}
@media (max-width: 576px) {
  .category-tag-half {
    top: -10px;
    left: -3px;
    min-width: 36px;
    height: 16px;
    font-size: 9px;
  }
  .category-tag-half-text {
    font-size: 9px;
    line-height: 16px;
  }
  .category-tag-half-divider {
    font-size: 10px;
    width: 6px;
    line-height: 16px;
  }
}
/* ...existing code... */
.category-tag-multicolor {
  display: flex;
  align-items: center;
  position: absolute;
  top: -12px;
  left: -5px;
  min-width: 44px;
  height: 20px;
  border-radius: 4px;
  color: #fff;
  font-size: 10px;
  font-weight: 700;
  letter-spacing: 0.5px;
  box-shadow: 0 2px 5px rgba(0,0,0,0.1);
  pointer-events: none;
  white-space: nowrap;
  text-shadow: 0 1px 2px rgba(0,0,0,0.2);
  z-index: 100;
  overflow: hidden;
}
.category-tag-multicolor-text {
  display: inline-block;
  height: 100%;
  line-height: 20px;
  text-align: center;
  color: #fff;
  font-size: 10px;
  font-weight: 700;
  overflow: hidden;
}
.category-tag-multicolor-divider {
  display: inline-block;
  width: 8px;
  text-align: center;
  color: #fff;
  font-size: 12px;
  font-weight: bold;
  pointer-events: none;
  line-height: 20px;
}
@media (max-width: 576px) {
  .category-tag-multicolor {
    top: -10px;
    left: -3px;
    min-width: 36px;
    height: 16px;
    font-size: 9px;
  }
  .category-tag-multicolor-text {
    font-size: 9px;
    line-height: 16px;
  }
  .category-tag-multicolor-divider {
    font-size: 10px;
    width: 6px;
    line-height: 16px;
  }
}
@media (max-width: 576px) {
  /* ...existing code... */
  .tag-filter_box {
    flex-direction: row !important;
    align-items: center !important;
    gap: 6px !important;
  }
  .tag-filter-title {
    margin-bottom: 0 !important;
    margin-right: 8px !important;
    font-size: 13px !important;
    white-space: nowrap !important;
  }
}
/* ...existing code... */
.tag-filter_box {
  background: none !important;
  box-shadow: none !important;
  border: none !important;
  padding: 0 !important;
  margin-bottom: 15px;
  width: 100%;
}
.tag-filter-title {
  font-weight: 600;
  color: var(--primary);
  font-size: 14px;
  margin-right: 10px;
  white-space: nowrap;
  flex-shrink: 0;
}
.tag-filter-group {
  display: flex;
  flex-wrap: wrap;
  gap: 8px;
  align-items: center;
  width: 100%;
}
.tag-filter-btn {
  display: flex;
  align-items: center;
  cursor: pointer;
  padding: 2px 10px;
  border-radius: 6px;
  background: var(--gray-light);
  color: var(--dark);
  font-size: 12px;
  font-weight: 600;
  transition: all 0.2s;
  border: none;
  outline: none;
  box-shadow: none;
}
.tag-filter-btn.active {
  background: var(--primary);
  color: #fff;
}
.tag-filter-btn .category-tag {
  position: static !important;
  margin-right: 4px;
  margin-left: 0;
  top: auto;
  left: auto;
  transform: none;
  box-shadow: none;
  font-size: 10px;
  padding: 2px 6px;
  border-radius: 4px;
  z-index: 1;
}
@media (max-width: 576px) {
  .tag-filter_box {
    flex-direction: row !important;
    align-items: center !重要;
    gap: 6px !important;
    margin-bottom: 10px !important;
  }
  .tag-filter-title {
    margin-bottom: 0 !重要;
    margin-right: 8px !important;
    font-size: 13px !important;
    white-space: nowrap !重要;
  }
  .tag-filter-group {
    gap: 5px !important;
  }
  .tag-filter-btn {
    font-size: 11px !important;
    padding: 2px 7px !important;
  }
  .tag-filter-btn .category-tag {
    font-size: 9px !important;
    padding: 1px 4px !important;
  }
}
/* ...existing code... */
.tag-filter_box {
  background: #fff !important;
  box-shadow: 0 4px 15px 1px rgba(240,138,93,0.1) !important;
  border-radius: 10px !important;
  border: 1px solid #ececec !important;
  padding: 12px 15px !important;
  margin-bottom: 15px;
  width: 100%;
  display: flex;
  align-items: flex-start;
}
@media (max-width: 576px) {
  .tag-filter_box {
    flex-direction: row !important;
    align-items: flex-start !重要; 
    gap: 6px !important;
    margin-bottom: 10px !important;
    padding: 10px !important;
  }
  .tag-filter-title {
    margin-bottom: 0 !重要;
    margin-right: 8px !important;
    font-size: 13px !important;
    white-space: nowrap !重要;
    min-width: 60px !重要;
    display: inline-block !重要;
  }
}

/* 新增:搜索框和分类区域样式优化 */
.search-bar {
  width: 100%;
  position: relative;
  margin-bottom: 15px;
  flex: 0 0 100%;
}

.search-bar .form-control {
  width: 100%;
  height: 36px;
  padding: 8px 35px 8px 12px;
  border-radius: 6px;
  border: 1px solid #ced1e2;
  transition: all 0.3s ease;
}

.search-bar .form-control:focus {
  border-color: var(--primary);
  box-shadow: 0 0 0 2px rgba(240, 138, 93, 0.2);
}

.search-bar .fa-search {
  position: absolute;
  right: 12px;
  top: 50%;
  transform: translateY(-50%);
  color: var(--gray);
  pointer-events: none;
}

/* 修改:调整分类区域布局 */
.secondgroup_box {
  display: flex;
  flex-direction: column;
  width: 100%;
}

.secondgroup_box_area {
  margin-bottom: 15px;
  width: 100%;
}

.secondgroup_box_group {
  display: flex;
  flex-wrap: wrap;
  gap: 8px;
  width: 100%;
}

.secondgroup_item {
  flex: 0 1 auto;
  min-width: auto;
  margin: 0;
}

@media (max-width: 576px) {
  .search-bar {
    margin-bottom: 12px;
  }
  
  .search-bar .form-control {
    height: 34px;
    font-size: 12px;
  }
  
  .secondgroup_box_area {
    margin-bottom: 12px;
  }
  
  .secondgroup_box_group {
    gap: 6px;
  }
}
</style>
<div class="notice-box mb-3">
  <div class="notice-icon">
    <i class="fas fa-exclamation-triangle"></i>
  </div>
  <div class="notice-content">
    <div class="notice-title">重要服务使用须知</div>
    <div class="notice-item">
      <div class="notice-item-icon">
        <i class="fas fa-ban"></i>
      </div>
      <div class="notice-item-text">
        <span class="notice-item-title">禁止用途：</span>
        本服务严禁用于任何非法活动，包括但不限于：垃圾邮件发送、未经授权的扫描、分布式拒绝服务攻击、挖矿等。违规使用将导致账户立即终止且不予退款。
      </div>
    </div>
    <div class="notice-item">
      <div class="notice-item-icon">
        <i class="fas fa-clock"></i>
      </div>
      <div class="notice-item-text">
        <span class="notice-item-title">退款政策：</span>
       具体退款政策根据不同产品有不同退款要求和计算，建议打开商品标题中链接或发工单咨询。
      </div>
    </div>
    <a href="<?php echo $Setting['web_tos_url']; ?>" target="_blank" class="terms-btn">
      查看完整用户条款 <i class="fas fa-arrow-right"></i>
    </a>
  </div>
</div>

<div class="firstgroup_box mb-3">
<div class="firstgroup_box_prov mr-2"><?php echo $Lang['select_ogmiao']; ?></div>
<div class="firstgroup_box_group">
  <?php foreach($Cart['product_groups'] as $index=>$first): if($first['id']==app('request')->get('fid') || (!app('request')->get('fid') && $index==0)): ?>
    <div class="firstgroup_item pointer active"><a class="text-white" href="/cart?fid=<?php echo $first['id']; if($Get['site']): ?>&site=<?php echo $Get['site']; ?><?php endif; ?>"><?php echo $first['name']; ?></a></div>
    <?php $cart_first_id = $first['id']; $cart_second = $first['second']; else: ?>
    <div class="firstgroup_item pointer"><a href="/cart?fid=<?php echo $first['id']; if($Get['site']): ?>&site=<?php echo $Get['site']; ?><?php endif; ?>"><?php echo $first['name']; ?></a></div>
  <?php endif; ?>
  <?php endforeach; ?>
</div>
</div>

<!-- 新设计标签筛选板块 -->
<div class="tag-filter_box mb-3" style="width:100%;display:flex;align-items:flex-start;gap:10px;position:relative;overflow:visible;z-index:2;background:#fff;box-shadow:0 4px 15px 1px rgba(240,138,93,0.1);border-radius:10px;padding:12px 15px;border:1px solid #ececec;">
  <span class="tag-filter-title" style="font-weight:600;color:var(--primary);font-size:14px;white-space:nowrap;flex-shrink:0;min-width:80px;display:inline-block;margin-right:10px;">标签筛选</span>
  <div class="tag-filter-group" style="display:flex;flex-wrap:wrap;gap:8px;align-items:center;width:100%;"></div>
</div>

<div class="secondgroup_box mb-3">
<div class="secondgroup_box_area mr-2"><?php echo $Lang['select_area']; ?></div>

<!-- 添加搜索框 -->
<div class="search-bar mb-2" style="width:100%;position:relative;">
  <input type="text" class="form-control" id="area-search" 
         placeholder="搜索地区..." 
         style="padding-right:30px;border-radius:6px;border:1px solid #ced1e2;">
  <i class="fas fa-search" style="position:absolute;right:10px;top:50%;transform:translateY(-50%);color:var(--gray);"></i>
</div>

<div class="secondgroup_box_group">
<?php foreach($cart_second as $index=>$secondItem): if($secondItem['id'] == app('request')->get('gid') || (!app('request')->get('gid') && $index==0)): ?>
  <div class="secondgroup_item pointer active" 
    data-tags="<?php if(isset($secondItem['tagline'])): ?><?php echo $secondItem['tagline']; ?><?php endif; ?>">
    <?php if(isset($secondItem['tagline'])): 
      // 标签缩写映射
      $tag_map = [
        '热门' => ['热', 'tag-hot', '#ff6b6b'],
        '无限流量' => ['无限', 'tag-unlimited', '#4e73df'],
        '流量型' => ['流', 'tag-traffic', '#2ecc71'],
        '新品' => ['新', 'tag-new', '#f08a5d'],
        '轻量' => ['轻', 'tag-light', '#00b894'],
        '性能' => ['性', 'tag-performance', '#6c5ce7'],
        '大宽带' => ['大', 'tag-bandwidth', '#0984e3'],
        'NAT' => ['NAT', 'tag-nat', '#636e72'],
        '高防' => ['防', 'tag-ddos', '#e17055'],
        '高频' => ['频', 'tag-highfreq', '#a537fd'],
        '廉价' => ['廉', 'tag-cheap', '#00cec9'],
        '需手动域名过白' => ['手', 'tag-manual', '#d63031'],
        '活动' => ['活', 'tag-activity', '#fdcb6e'],
        '自选' => ['选', 'tag-custom', '#222f3e'],
      ];
      $tags = array_filter(array_map('trim', explode('|', $secondItem['tagline'])));
      $tagCount = count($tags);
      if ($tagCount > 1) {
        // 渲染多色渐变卡片
        $abbrs = [];
        $colors = [];
        foreach($tags as $tag){
          if(isset($tag_map[$tag])){
            $abbrs[] = $tag_map[$tag][0];
            $colors[] = $tag_map[$tag][2];
          }
        }
        $abbrCount = count($abbrs);
        if ($abbrCount > 1) {
          // 构造渐变色
          $colorStops = [];
          $step = 100 / $abbrCount;
          for($i=0;$i<$abbrCount;$i++){
            $start = $i * $step;
            $end = ($i+1) * $step;
            $colorStops[] = $colors[$i].' '.$start.'%';
            $colorStops[] = $colors[$i].' '.$end.'%';
          }
          $gradient = 'linear-gradient(90deg, '.implode(',', $colorStops).')';
          // 渲染内容
          echo '<span class="category-tag category-tag-multicolor" style="background:'.$gradient.';">';
          for($i=0;$i<$abbrCount;$i++){
            echo '<span class="category-tag-multicolor-text" style="width:'.(100/$abbrCount).'%;text-align:center;display:inline-block;">'.$abbrs[$i].'</span>';
            if($i < $abbrCount-1){
              echo '<span class="category-tag-multicolor-divider">|</span>';
            }
          }
          echo '</span>';
        }
      } else if ($tagCount == 1) {
        $tag = $tags[0];
        if(isset($tag_map[$tag])){
          $class = $tag_map[$tag][1];
          echo '<span class="category-tag '.$class.'">'.$tag.'</span>';
        }
      }
       ?>
    <?php endif; ?>
    <a class="text-white" href="/cart?fid=<?php echo $cart_first_id; ?>&gid=<?php echo $secondItem['id']; if($Get['site']): ?>&site=<?php echo $Get['site']; ?><?php endif; ?>"><?php echo $secondItem['name']; ?></a>
  </div>
  <?php $cart_gid = $secondItem['id']; else: ?>
  <div class="secondgroup_item pointer" 
    data-tags="<?php if(isset($secondItem['tagline'])): ?><?php echo $secondItem['tagline']; ?><?php endif; ?>">
    <?php if(isset($secondItem['tagline'])): 
      $tag_map = [
        '热门' => ['热', 'tag-hot', '#ff6b6b'],
        '无限流量' => ['无限', 'tag-unlimited', '#4e73df'],
        '流量型' => ['流', 'tag-traffic', '#2ecc71'],
        '新品' => ['新', 'tag-new', '#f08a5d'],
        '轻量' => ['轻', 'tag-light', '#00b894'],
        '性能' => ['性', 'tag-performance', '#6c5ce7'],
        '大宽带' => ['大', 'tag-bandwidth', '#0984e3'],
        'NAT' => ['NAT', 'tag-nat', '#636e72'],
        '高防' => ['防', 'tag-ddos', '#e17055'],
        '高频' => ['频', 'tag-highfreq', '#a537fd'],
        '廉价' => ['廉', 'tag-cheap', '#00cec9'],
        '需手动域名过白' => ['手', 'tag-manual', '#d63031'],
        '活动' => ['活', 'tag-activity', '#fdcb6e'],
        '自选' => ['选', 'tag-custom', '#222f3e'],
      ];
      $tags = array_filter(array_map('trim', explode('|', $secondItem['tagline'])));
      $tagCount = count($tags);
      if ($tagCount > 1) {
        $abbrs = [];
        $colors = [];
        foreach($tags as $tag){
          if(isset($tag_map[$tag])){
            $abbrs[] = $tag_map[$tag][0];
            $colors[] = $tag_map[$tag][2];
          }
        }
        $abbrCount = count($abbrs);
        if ($abbrCount > 1) {
          $colorStops = [];
          $step = 100 / $abbrCount;
          for($i=0;$i<$abbrCount;$i++){
            $start = $i * $step;
            $end = ($i+1) * $step;
            $colorStops[] = $colors[$i].' '.$start.'%';
            $colorStops[] = $colors[$i].' '.$end.'%';
          }
          $gradient = 'linear-gradient(90deg, '.implode(',', $colorStops).')';
          echo '<span class="category-tag category-tag-multicolor" style="background:'.$gradient.';">';
          for($i=0;$i<$abbrCount;$i++){
            echo '<span class="category-tag-multicolor-text" style="width:'.(100/$abbrCount).'%;text-align:center;display:inline-block;">'.$abbrs[$i].'</span>';
            if($i < $abbrCount-1){
              echo '<span class="category-tag-multicolor-divider">|</span>';
            }
          }
          echo '</span>';
        }
      } else if ($tagCount == 1) {
        $tag = $tags[0];
        if(isset($tag_map[$tag])){
          $class = $tag_map[$tag][1];
          echo '<span class="category-tag '.$class.'">'.$tag.'</span>';
        }
      }
       ?>
    <?php endif; ?>
    <a href="/cart?fid=<?php echo $cart_first_id; ?>&gid=<?php echo $secondItem['id']; if($Get['site']): ?>&site=<?php echo $Get['site']; ?><?php endif; ?>"><?php echo $secondItem['name']; ?></a>
  </div>
<?php endif; ?>
<?php endforeach; ?>
</div>
</div>

<script>
$(function() {
var webViewUrl = "/themes/cart/ogmiao";
$('.firstgroup_box').append('<div class="toggle-btn"><i class="iconfont icon-arrow-down"></i></div>');
$('.secondgroup_box').append('<div class="toggle-btn"><i class="iconfont icon-arrow-down"></i></div>');
function optimizeCategoryItems() {
  if ($(window).width() <= 576) {
        if (!window.mobileLayoutApplied) {
      $('.firstgroup_item, .secondgroup_item').css({
        'width': '100%',
        'min-width': 'auto'
      });
      window.mobileLayoutApplied = true;
    }
    return;
  }
  window.mobileLayoutApplied = false;
    requestAnimationFrame(() => {
    $('.firstgroup_box, .secondgroup_box').each(function() {
      const $container = $(this);
      const $label = $container.find('.firstgroup_box_prov, .secondgroup_box_area');
      const $group = $container.find('.firstgroup_box_group, .secondgroup_box_group');
      const $items = $group.find('.firstgroup_item, .secondgroup_item');
            if ($items.length < 5) {
        $items.css('width', 'auto');
        return;
      }
            const containerWidth = $container.width();
      const labelWidth = $label.outerWidth(true);
      const availableWidth = containerWidth - labelWidth - 40;       
            let itemsPerRow = Math.floor(availableWidth / 120);       if (itemsPerRow < 3) itemsPerRow = 3;       
      const idealWidth = Math.floor(availableWidth / itemsPerRow) - 10;       
            $items.css('min-width', idealWidth + 'px');
    });
  });
}
setTimeout(optimizeCategoryItems, 100);
$(window).on('resize', optimizeCategoryItems);
$('.toggle-btn').on('click', function() {
  const parent = $(this).parent();
  parent.toggleClass('collapsed');
  const icon = $(this).find('i');
  if (parent.hasClass('collapsed')) {
    icon.removeClass('icon-arrow-down').addClass('icon-arrow-right');
  } else {
    icon.removeClass('icon-arrow-right').addClass('icon-arrow-down');
  }
});
$('.firstgroup_item, .secondgroup_item').on('mousedown', function(e) {
    const $this = $(this);
    $this.find('.ripple').remove();
    requestAnimationFrame(() => {
    const $ripple = $('<span class="ripple"></span>');
    $this.append($ripple);
    const x = e.pageX - $this.offset().left;
    const y = e.pageY - $this.offset().top;
    $ripple.css({
      top: y + 'px',
      left: x + 'px'
    });
        $ripple.on('animationend', function() {
      $(this).remove();
    });
  });
});
$('.firstgroup_box, .secondgroup_box').css({
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
if ($(window).width() <= 575) {
  $('.secondgroup_box').addClass('collapsed');
  $('.secondgroup_box .toggle-btn i').removeClass('icon-arrow-down').addClass('icon-arrow-right');
  $('.firstgroup_box_group, .secondgroup_box_group').css({
    'display': 'grid',
    'grid-template-columns': 'repeat(2, 1fr)',
    'gap': '5px'
  });
  $('.firstgroup_item, .secondgroup_item').css({
    'width': '100%',
    'margin-right': '0'
  });
}
$('.firstgroup_item a, .secondgroup_item a').each(function() {
  const $this = $(this);
  const text = $this.text();
  $this.attr('data-original-title', text);
  
  // 检查是否包含"*yes"标记，单独处理
  if (text.indexOf('*yes') !== -1) {
    $this.attr('data-has-yes', 'true');
  } else {
    $this.attr('data-has-yes', 'false');
  }
  
  // 处理国旗显示，与展开功能分开处理
  if (text.indexOf('*') !== -1) {
    const parts = text.split('*');
    if (parts.length >= 2) {
      const countryCode = parts[0].trim();
      let title = parts[1].trim();
      
      // 移除"yes"或"no"标记，但保留原始标记信息
      if (title.endsWith('yes') || title.endsWith('no')) {
        title = title.replace(/yes$|no$/, '').trim();
      }
      
      if (title === '') {
        title = countryCode;
      }
      
      const $flag = $('<img>', {
        'src': '/upload/common/country/' + countryCode + '.png',
        'class': 'country-flag',
        'alt': countryCode,
        'onerror': 'this.style.display="none"'
      });
      
      $this.empty().append($flag).append(document.createTextNode(title));
    }
  }
});
});
// 在JavaScript部分添加以下代码，确保标签正确显示
$(document).ready(function() {
  // 确保所有标签都能正确显示
  function adjustTagsPosition() {
    $('.category-tag').each(function() {
      const $tag = $(this);
      const $item = $tag.closest('.secondgroup_item');
      
      // 确保标签位置正确
      $tag.css({
        'position': 'absolute',
        'z-index': '100',
        'overflow': 'visible'
      });
      
      // 确保父容器不会裁剪标签
      $item.css('overflow', 'visible');
      $item.parents().css('overflow', 'visible');
    });
  }
  
  // 页面加载后调整标签位置
  setTimeout(adjustTagsPosition, 100);
  
  // 窗口大小改变时重新调整
  $(window).on('resize', adjustTagsPosition);
});

// 标签筛选功能
$(function() {
  // 只允许这些标签，顺序固定
  var tagList = [
    { key: '流量型', abbr: '流', cls: 'tag-traffic' },
    { key: '热门', abbr: '热', cls: 'tag-hot' },
    { key: '无限流量', abbr: '无限', cls: 'tag-unlimited' },
    { key: '新品', abbr: '新', cls: 'tag-new' },
    { key: '轻量', abbr: '轻', cls: 'tag-light' },
    { key: '性能', abbr: '性', cls: 'tag-performance' },
    { key: '大宽带', abbr: '大', cls: 'tag-bandwidth' },
    { key: 'NAT', abbr: 'NAT', cls: 'tag-nat' },
    { key: '高防', abbr: '防', cls: 'tag-ddos' },
    { key: '高频', abbr: '频', cls: 'tag-highfreq' },
    { key: '廉价', abbr: '廉', cls: 'tag-cheap' },
    { key: '需手动域名过白', abbr: '手', cls: 'tag-manual' },
    { key: '活动', abbr: '活', cls: 'tag-activity' },
    { key: '自选', abbr: '选', cls: 'tag-custom' }
  ];
  // 统计
  var tagCountMap = {};
  tagList.forEach(function(t){ tagCountMap[t.key] = 0; });
  var noTagCount = 0;
  $('.secondgroup_item').each(function() {
    var tags = $(this).attr('data-tags');
    if (tags && tags.trim()) {
      var tagArr = tags.split('|').map(function(t){return t.trim();});
      var hasKnown = false;
      tagArr.forEach(function(tag) {
        if (tagCountMap.hasOwnProperty(tag)) {
          tagCountMap[tag]++;
          hasKnown = true;
        }
      });
      if (!hasKnown) noTagCount++;
    } else {
      noTagCount++;
    }
  });
  // 渲染
  var $group = $('.tag-filter-group');
  $group.empty();
  // 渲染按钮（无多余标签卡片样式）
  $group.append('<div class="tag-filter-btn active" data-tag="__all"><span>全部</span></div>');
  tagList.forEach(function(t) {
    var count = tagCountMap[t.key];
    $group.append('<div class="tag-filter-btn" data-tag="'+t.key+'">'
      +'<span class="category-tag '+t.cls+'">'+t.abbr+'</span>'
      +'<span>'+t.key+'</span>'
      +'<span style="margin-left:4px;color:var(--gray);font-size:11px;">('+count+')</span>'
      +'</div>');
  });
  $group.append('<div class="tag-filter-btn" data-tag="__none"><span>未设定</span><span style="margin-left:4px;color:var(--gray);font-size:11px;">('+noTagCount+')</span></div>');
  // 交互
  $group.on('click', '.tag-filter-btn', function() {
    $('.tag-filter-btn').removeClass('active').css({'background':'var(--gray-light)','color':'var(--dark)'});
    $(this).addClass('active').css({'background':'var(--primary)','color':'#fff'});
    var tag = $(this).attr('data-tag');
    $('.secondgroup_item').show();
    if (tag === '__all') {
      $('.secondgroup_item').show();
    } else if (tag === '__none') {
      $('.secondgroup_item').each(function() {
        var tags = $(this).attr('data-tags');
        var matched = false;
        if (tags && tags.trim()) {
          var tagArr = tags.split('|').map(function(t){return t.trim();});
          for (var i=0;i<tagArr.length;i++) {
            if (tagCountMap.hasOwnProperty(tagArr[i]) && tagCountMap[tagArr[i]] > 0) {
              matched = true;
              break;
            }
          }
          if (matched) {
            $(this).hide();
          } else {
            $(this).show();
          }
        } else {
          $(this).show();
        }
      });
    } else {
      $('.secondgroup_item').each(function() {
        var tags = $(this).attr('data-tags');
        var matched = false;
        if (tags && tags.trim()) {
          var tagArr = tags.split('|').map(function(t){return t.trim();});
          for (var i=0;i<tagArr.length;i++) {
            if (tagArr[i] === tag) {
              matched = true;
              break;
            }
          }
        }
        if (matched) {
          $(this).show();
        } else {
          $(this).hide();
        }
      });
    }
  });
});

// 标签筛选功能（多选&数量为0的标签隐藏&全部按钮逻辑）
$(function() {
  // 只允许这些标签，顺序固定
  var tagList = [
    { key: '流量型', abbr: '流', cls: 'tag-traffic' },
    { key: '热门', abbr: '热', cls: 'tag-hot' },
    { key: '无限流量', abbr: '无限', cls: 'tag-unlimited' },
    { key: '新品', abbr: '新', cls: 'tag-new' },
    { key: '轻量', abbr: '轻', cls: 'tag-light' },
    { key: '性能', abbr: '性', cls: 'tag-performance' },
    { key: '大宽带', abbr: '大', cls: 'tag-bandwidth' },
    { key: 'NAT', abbr: 'NAT', cls: 'tag-nat' },
    { key: '高防', abbr: '防', cls: 'tag-ddos' },
    { key: '高频', abbr: '频', cls: 'tag-highfreq' },
    { key: '廉价', abbr: '廉', cls: 'tag-cheap' },
    { key: '需手动域名过白', abbr: '手', cls: 'tag-manual' },
    { key: '活动', abbr: '活', cls: 'tag-activity' },
    { key: '自选', abbr: '选', cls: 'tag-custom' }
  ];
  // 统计
  var tagCountMap = {};
  tagList.forEach(function(t){ tagCountMap[t.key] = 0; });
  var noTagCount = 0;
  $('.secondgroup_item').each(function() {
    var tags = $(this).attr('data-tags');
    if (tags && tags.trim()) {
      var tagArr = tags.split('|').map(function(t){return t.trim();});
      var hasKnown = false;
      tagArr.forEach(function(tag) {
        if (tagCountMap.hasOwnProperty(tag)) {
          tagCountMap[tag]++;
          hasKnown = true;
        }
      });
      if (!hasKnown) noTagCount++;
    } else {
      noTagCount++;
    }
  });
  // 判断是否有标签
  var totalTagCount = 0;
  tagList.forEach(function(t){ totalTagCount += tagCountMap[t.key]; });
  if (totalTagCount === 0) {
    $('.tag-filter_box').hide();
    return;
  } else {
    $('.tag-filter_box').show();
  }
  // 渲染
  var $group = $('.tag-filter-group');
  $group.empty();
  $group.append('<div class="tag-filter-btn active" data-tag="__all"><span>全部</span></div>');
  tagList.forEach(function(t) {
    var count = tagCountMap[t.key];
    if (count > 0) {
      $group.append('<div class="tag-filter-btn" data-tag="'+t.key+'">'
        +'<span class="category-tag '+t.cls+'">'+t.abbr+'</span>'
        +'<span>'+t.key+'</span>'
        +'<span style="margin-left:4px;color:var(--gray);font-size:11px;">('+count+')</span>'
        +'</div>');
    }
  });
  if (noTagCount > 0) {
    $group.append('<div class="tag-filter-btn" data-tag="__none"><span>未设定</span><span style="margin-left:4px;color:var(--gray);font-size:11px;">('+noTagCount+')</span></div>');
  }
  // 多选交互
  var selectedTags = [];
  $group.off('click').on('click', '.tag-filter-btn', function() {
    var $btn = $(this);
    var tag = $btn.attr('data-tag');
    if (tag === '__all') {
      // 全部
      $('.tag-filter-btn').removeClass('active');
      $btn.addClass('active');
      selectedTags = [];
      $('.secondgroup_item').show();
      return;
    }
    if (tag === '__none') {
      // 未设定
      $('.tag-filter-btn').removeClass('active');
      $btn.addClass('active');
      $('.secondgroup_item').each(function() {
        var tags = $(this).attr('data-tags');
        var matched = false;
        if (tags && tags.trim()) {
          var tagArr = tags.split('|').map(function(t){return t.trim();});
          for (var i=0;i<tagArr.length;i++) {
            if (tagCountMap.hasOwnProperty(tagArr[i]) && tagCountMap[tagArr[i]] > 0) {
              matched = true;
              break;
            }
          }
          if (matched) {
            $(this).hide();
          } else {
            $(this).show();
          }
        } else {
          $(this).show();
        }
      });
      selectedTags = [];
      return;
    }
    // 多选标签
    $('.tag-filter-btn[data-tag="__all"],.tag-filter-btn[data-tag="__none"]').removeClass('active');
    $btn.toggleClass('active');
    // 统计已选
    selectedTags = [];
    $group.find('.tag-filter-btn.active').each(function() {
      var t = $(this).attr('data-tag');
      if (t && t !== '__all' && t !== '__none') selectedTags.push(t);
    });
    if (selectedTags.length === 0) {
      $('.tag-filter-btn').removeClass('active');
      $('.tag-filter-btn[data-tag="__all"]').addClass('active');
      $('.secondgroup_item').show();
      return;
    }
    // 过滤
    $('.secondgroup_item').each(function() {
      var tags = $(this).attr('data-tags');
      var matched = false;
      if (tags && tags.trim()) {
        var tagArr = tags.split('|').map(function(t){return t.trim();});
        for (var i=0;i<tagArr.length;i++) {
          if (selectedTags.indexOf(tagArr[i]) !== -1) {
            matched = true;
            break;
          }
        }
      }
      if (matched) {
        $(this).show();
      } else {
        $(this).hide();
      }
    });
  });
});

// 添加搜索功能
$(function() {
  $('#area-search').on('input', function() {
    var searchText = $(this).val().toLowerCase().trim();
    
    $('.secondgroup_item').each(function() {
      var itemName = $(this).find('a').text().toLowerCase();
      var itemTags = ($(this).attr('data-tags') || '').toLowerCase();
      
      if(itemName.indexOf(searchText) > -1 || itemTags.indexOf(searchText) > -1) {
        $(this).show();
      } else {
        $(this).hide();
      }
    });
    
    // 如果搜索框为空,恢复标签筛选的状态
    if(!searchText) {
      $('.tag-filter-btn.active').trigger('click');
    }
  });

  // 按下ESC清空搜索
  $(document).on('keyup', function(e) {
    if(e.key === "Escape") {
      $('#area-search').val('').trigger('input');
    }
  });
});
</script>

<div class="firstgroup_box product-headline mb-3">
<div class="firstgroup_box_prov mr-2">商品标题</div>
<div class="firstgroup_box_group">
  <?php if($Get['keywords']): ?>
    <p class="card-text mb-0"><?php echo $Lang['product']; ?>：<?php echo count($Cart['products']); ?><?php echo $Lang['individual']; ?></p>
  <?php else: ?>
    <p class="card-text mb-0 headline-text"><?php echo $Cart['product_groups_checked']['headline']; ?></p>
  <?php endif; ?>
</div>
</div>
<style>
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

.product-headline {
border-radius: 10px;
background-color: #fff;
box-shadow: 0 4px 15px 1px rgba(240, 138, 93, 0.1);
min-height: auto;
height: auto;
overflow: visible;
width: 100%;
display: flex;
align-items: center;
transition: all 0.3s ease;
}
.product-headline .firstgroup_box_prov {
color: var(--primary);
font-weight: 600;
flex-shrink: 0;
}
.product-headline .firstgroup_box_group {
display: flex;
align-items: center;
flex-wrap: wrap;
}
.product-headline .headline-text {
color: var(--primary);
font-weight: 500;
margin: 0;
}
@media (max-width: 576px) {
.product-headline {
  padding: 12px;
  height: auto;
  min-height: auto;
}
.product-headline .firstgroup_box_group {
  width: 100%;
}
.product-headline .card-text {
  word-break: break-word;
  white-space: normal;
}
}
.card,
.cartitem {
border: none;
border-radius: 15px;
overflow: hidden;
transition: all 0.3s ease;
margin-bottom: 20px;
box-shadow: 0 5px 15px rgba(0, 0, 0, 0.05);
}
.cartitem .card-body {
padding: 15px;
flex: 1;
}
.cartitem h5 {
font-size: 1.1rem;
font-weight: 600;
margin-bottom: 0.75rem;
color: var(--dark);
}
.cartitem .card-text {
color: var(--gray);
font-size: 0.9rem;
margin-bottom: 0.75rem;
}
.cartitem:hover {
transform: translateY(-10px);
box-shadow: 0 15px 35px rgba(0, 0, 0, 0.1);
}
.cartitem.active {
background: #fff;
transform: translateY(-10px);
box-shadow: 0 15px 35px rgba(0, 0, 0, 0.1);
}
.cartitem .card-footer {
background-color: transparent;
border-top: none;
padding: 0;
transition: all 0.3s ease;
}
.cartitem .card-footer a {
color: var(--primary);
display: inline-block;
width: 100%;
line-height: 45px;
background: #fff;
text-decoration: none;
font-weight: 600;
transition: all 0.3s ease;
border-top: 1px solid rgba(0, 0, 0, 0.05);
}
.cartitem.active .card-footer {
background-color: var(--primary) !important;
}
.cartitem.active .card-footer a {
background-color: var(--primary) !important;
color: #fff;
z-index: 99;
}
.cartitem .card-footer a:hover {
background-color: var(--primary) !important;
color: #fff;
}
.discount-badge {
background-color: var(--primary);
color: white;
font-size: 0.75rem;
font-weight: 700;
padding: 2px 6px;
border-radius: 4px;
display: inline-block;
animation: pulse 2s infinite;
}
@keyframes pulse {
0% { box-shadow: 0 0 0 0 rgba(240, 138, 93, 0.4); }
70% { box-shadow: 0 0 0 6px rgba(240, 138, 93, 0); }
100% { box-shadow: 0 0 0 0 rgba(240, 138, 93, 0); }
}
.price-container {
margin-top: 1rem;
display: flex;
flex-direction: column;
}
.price-original {
text-decoration: line-through;
color: #999;
font-size: 0.9rem;
margin-top: 2px;
}
.price-current {
color: var(--primary);
font-size: 1.3rem;
font-weight: 700;
}
.price-trial {
color: #e64a19;
font-size: 0.9rem;
margin-top: 2px;
}
.sold-out-ribbon {
position: absolute;
top: 0;
right: 0;
width: 120px;
height: 120px;
overflow: hidden;
z-index: 10;
}
.sold-out-ribbon::before,
.sold-out-ribbon::after {
position: absolute;
z-index: -1;
content: '';
display: block;
border: 5px solid var(--primary-dark);
border-top-color: transparent;
border-right-color: transparent;
}
.sold-out-ribbon::before {
top: 0;
left: 0;
}
.sold-out-ribbon::after {
bottom: 0;
right: 0;
}
.sold-out-ribbon span {
position: absolute;
top: 30px;
right: -25px;
transform: rotate(45deg);
width: 150px;
padding: 8px 0;
background-color: var(--primary);
box-shadow: 0 5px 10px rgba(0, 0, 0, 0.1);
color: #fff;
text-align: center;
font-size: 14px;
font-weight: 600;
text-transform: uppercase;
letter-spacing: 0.5px;
transition: all 0.3s ease;
}
.cartitem:hover .sold-out-ribbon span {
box-shadow: 0 5px 15px rgba(0, 0, 0, 0.2);
background-color: var(--primary-dark);
}
.pagination {
display: flex;
justify-content: center;
margin-top: 2rem;
}
.pagination .page-item .page-link {
color: var(--primary);
border-radius: 5px;
margin: 0 3px;
border: none;
box-shadow: 0 2px 5px rgba(0, 0, 0, 0.05);
}
.pagination .page-item.active .page-link {
background-color: var(--primary);
border-color: var(--primary);
color: white;
}
.pagination .page-item .page-link:hover {
background-color: rgba(240, 138, 93, 0.1);
}
.search-box {
position: relative;
width: 100%;
margin-bottom: 15px;
transition: all 0.3s ease;
}
.search-box input {
border-radius: 30px;
padding: 10px 15px 10px 45px;
border: 1px solid rgba(240, 138, 93, 0.2);
transition: all 0.4s cubic-bezier(0.4, 0, 0.2, 1);
background-color: rgba(240, 138, 93, 0.03);
font-size: 0.9rem;
box-shadow: 0 2px 10px rgba(240, 138, 93, 0.05);
width: 100%;
}
.search-box::before {
content: '\e908';
font-family: 'iconfont';
position: absolute;
left: 18px;
top: 50%;
transform: translateY(-50%);
color: var(--primary);
font-size: 16px;
z-index: 1;
transition: all 0.3s ease;
}
.search-box input:focus {
box-shadow: 0 0 0 4px rgba(240, 138, 93, 0.15);
border-color: var(--primary);
background-color: #fff;
padding-left: 50px;
}
.search-box:hover::before {
transform: translateY(-50%) scale(1.1);
}
.product-description {
position: relative;
overflow: hidden;
transition: all 0.5s cubic-bezier(0.4, 0, 0.2, 1);
margin-bottom: 0;
max-height: 0;
width: 100%;
}
.product-description.collapsed {
opacity: 0;
margin: 0;
padding: 0;
max-height: 0;
}
.product-description.expanded {
opacity: 1;
margin-top: 10px;
margin-bottom: 10px;
max-height: none;
}
.toggle-description {
display: inline-flex;
align-items: center;
justify-content: center;
margin-top: 8px;
padding: 4px 12px;
background-color: #fff;
color: var(--primary);
border-radius: 20px;
font-size: 12px;
font-weight: 500;
cursor: pointer;
transition: all 0.3s ease;
text-align: center;
box-shadow: 0 2px 6px rgba(240, 138, 93, 0.15);
border: 1px solid rgba(240, 138, 93, 0.2);
}
.toggle-description:hover {
background-color: var(--primary);
color: #fff;
box-shadow: 0 3px 8px rgba(240, 138, 93, 0.25);
border-color: var(--primary);
transform: translateY(-1px);
}
.toggle-description i {
margin-left: 5px;
font-size: 10px;
transition: all 0.3s ease;
}
.toggle-description[data-action="collapse"] i {
transform: rotate(180deg);
}
.stock-indicator {
display: flex;
align-items: center;
margin-top: 10px;
font-size: 0.85rem;
}
.stock-indicator .stock-badge {
display: inline-flex;
align-items: center;
padding: 3px 10px;
border-radius: 20px;
margin-right: 8px;
font-size: 0.75rem;
font-weight: 600;
box-shadow: 0 2px 5px rgba(0, 0, 0, 0.05);
}
.stock-indicator .stock-badge:before {
content: "";
display: inline-block;
width: 8px;
height: 8px;
border-radius: 50%;
margin-right: 5px;
}
.stock-indicator .in-stock {
background-color: rgba(46, 204, 113, 0.1);
color: #2ecc71;
border: 1px solid rgba(46, 204, 113, 0.2);
}
.stock-indicator .in-stock:before {
background-color: #2ecc71;
}
.stock-indicator .low-stock {
background-color: rgba(243, 156, 18, 0.1);
color: #f39c12;
border: 1px solid rgba(243, 156, 18, 0.2);
}
.stock-indicator .low-stock:before {
background-color: #f39c12;
}
.stock-indicator .out-of-stock {
background-color: rgba(231, 76, 60, 0.1);
color: #e74c3c;
border: 1px solid rgba(231, 76, 60, 0.2);
}
.stock-indicator .out-of-stock:before {
background-color: #e74c3c;
}
.stock-indicator .stock-count {
font-size: 0.8rem;
color: var(--gray);
}
.products-container {
position: relative;
margin: 0 -8px;
min-height: 200px;
}
.product-item {
padding: 0 8px;
margin-bottom: 16px;
position: absolute;
width: 25%;
transition: all 0.5s cubic-bezier(0.4, 0, 0.2, 1);
opacity: 0;
transform: scale(0.9) translateY(20px);
}
.product-item.animated {
animation: productAppear 0.6s forwards;
}
@keyframes productAppear {
  0% {
    opacity: 0;
    transform: scale(0.9) translateY(20px);
  }
  100% {
    opacity: 1;
    transform: scale(1) translateY(0);
  }
}
.loading-container {
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  display: flex;
  justify-content: center;
  align-items: center;
  background-color: rgba(255, 255, 255, 0.8);
  z-index: 10;
  opacity: 1;
  transition: opacity 0.5s ease;
}
.loading-container.hidden {
  opacity: 0;
  pointer-events: none;
}
.loading-spinner {
  width: 50px;
  height: 50px;
  border: 3px solid rgba(240, 138, 93, 0.2);
  border-radius: 50%;
  border-top-color: var(--primary);
  animation: spin 1s ease-in-out infinite;
}
@keyframes spin {
  to { transform: rotate(360deg); }
}
@media (min-width: 1200px) {
.product-item { width: 25%; }
}
@media (min-width: 992px) and (max-width: 1199px) {
.product-item { width: 33.33%; }
}
@media (min-width: 768px) and (max-width: 991px) {
.product-item { width: 33.33%; }
.cartitem .card-body { padding: 12px; }
.cartitem h5 { font-size: 1rem; }
.price-current { font-size: 1.1rem; }
}
@media (min-width: 576px) and (max-width: 767px) {
.product-item { width: 50%; }
.cartitem .card-body { padding: 10px; }
.cartitem h5 { font-size: 0.95rem; margin-bottom: 0.5rem; }
.stock-indicator { margin-top: 6px; }
.stock-indicator .stock-badge { padding: 2px 8px; font-size: 0.7rem; }
.price-current { font-size: 1rem; }
.cartitem .card-footer a { line-height: 40px; font-size: 0.9rem; }
}
@media (max-width: 575px) {
.product-item {
  width: 100%;
  position: relative !important;
  top: auto !important;
  left: auto !important;
  margin-bottom: 12px;
}
.cartitem {
  flex-direction: column;
  border-radius: 10px;
}
.cartitem .card-body {
  padding: 10px;
  display: block;
}
.cartitem h5 {
  width: 100%;
  font-size: 0.95rem;
  margin-bottom: 8px;
}
.product-description-container {
  width: 100%;
  padding-right: 0;
  margin-bottom: 8px;
}
.price-container {
  width: 100%;
  margin-top: 8px;
  text-align: left;
  display: flex;
  align-items: center;
  justify-content: space-between;
}
.price-current {
  font-size: 1rem;
}
.stock-indicator {
  margin-top: 5px;
  width: 100%;
}
.cartitem .card-footer {
  width: 100%;
  min-width: auto;
  display: block;
  border-left: none;
  border-top: 1px solid rgba(0, 0, 0, 0.05);
}
.cartitem .card-footer a {
  line-height: 40px;
  height: auto;
  display: block;
  font-size: 0.9rem;
  padding: 0;
  text-align: center;
}
.sold-out-ribbon {
  width: 80px;
  height: 80px;
}
.sold-out-ribbon span {
  top: 15px;
  right: -20px;
  width: 100px;
  padding: 5px 0;
  font-size: 10px;
}
.toggle-description {
  padding: 2px 8px;
  font-size: 10px;
  margin-top: 5px;
}
.toggle-description i {
  font-size: 8px;
}
.search-box {
  margin-bottom: 10px;
}
.search-box input {
  padding: 8px 15px 8px 40px;
  font-size: 0.85rem;
}
.search-box::before {
  left: 15px;
  font-size: 14px;
}
.product-description.expanded {
  max-height: none;
}
.product-description {
  font-size: 0.85rem;
  line-height: 1.4;
}
}
@media (max-width: 375px) {
.cartitem .card-body { padding: 8px; }
.cartitem h5 { font-size: 0.9rem; }
.price-current { font-size: 0.95rem; }
}
.discount-percent {
 display: inline-block;
 background-color: #ff6b6b;
 color: white;
 font-size: 10px;
 font-weight: bold;
 padding: 1px 5px;
 border-radius: 10px;
 margin-right: 5px;
 position: relative;
 top: -1px;
 box-shadow: 0 2px 5px rgba(255, 107, 107, 0.3);
}
.discount-percent {
 background-color: #ff6b6b;
 box-shadow: 0 2px 5px rgba(255, 107, 107, 0.3);
}
.no-products-message {
  position: relative;
  z-index: 1000;
  background: rgba(255, 255, 255, 0.98);
  border-radius: 10px;
  padding: 30px 20px;
  text-align: center;
  max-width: 300px;
  margin: 20px auto;
  box-shadow: 0 2px 10px rgba(0, 0, 0, 0.05);
}

@media (max-width: 576px) {
  .no-products-message {
    margin: 10px auto;
    padding: 20px 15px;
  }
}

/* 修改: 统一搜索框样式 */
.search-box {
  position: relative;
  width: 100%;
  margin-bottom: 15px;
  transition: all 0.3s ease;
}

.search-box input {
  width: 100%;
  height: 38px;
  padding: 8px 40px 8px 15px;
  border-radius: 30px;
  border: 1px solid rgba(240, 138, 93, 0.2);
  background-color: rgba(240, 138, 93, 0.03);
  font-size: 0.9rem;
  transition: all 0.3s ease;
  box-shadow: 0 2px 10px rgba(240, 138, 93, 0.05);
}

.search-box input:focus {
  border-color: var(--primary);
  box-shadow: 0 0 0 3px rgba(240, 138, 93, 0.15);
  padding-left: 20px;
}

.search-box::before {
  content: '\e908';
  font-family: 'iconfont';
  position: absolute;
  right: 15px;
  top: 50%;
  transform: translateY(-50%);
  color: var(--primary);
  font-size: 14px;
  pointer-events: none;
  transition: all 0.3s ease;
}

.search-box:hover::before {
  transform: translateY(-50%) scale(1.1);
}

@media (max-width: 576px) {
  .search-box {
    margin-bottom: 12px;
  }
  
  .search-box input {
    height: 34px;
    font-size: 12px;
  }
}
</style>
<link rel="stylesheet" href="/themes/cart/ogmiao/assets/fonts/iconfont.css?v=<?php echo $Ver; ?>">
<div class="search-box">
<input type="text" id="product-search" class="form-control" placeholder="搜索产品..." />
</div>
<div class="card">
<div class="card-body p-3">
  <div class="products-container">
    <div class="loading-container hidden">
      <div class="loading-spinner"></div>
    </div>
    <?php if(empty($Cart['products'])): ?>
    <div class="no-products-message text-center py-5">
      <i class="fas fa-box-open mb-3" style="font-size: 3rem; color: var(--primary-light);"></i>
      <p class="mb-0">当前分类暂无可用商品</p>
    </div>
    <?php else: foreach($Cart['products'] as $list): ?>
    <div class="product-item" data-id="<?php echo $list['id']; ?>">
      <div class="card cartitem h-100">
        <div class="card-body">
          <h5 class="product-name"><?php echo $list['name']; ?></h5>
          <div class="product-description-container">
            <div class="product-description collapsed">
              <?php echo $list['description']; ?>
            </div>
            <button class="toggle-description" data-action="expand">
              查看详情 <i class="iconfont icon-arrow-down"></i>
            </button>
          </div>
<div class="stock-indicator">
 <?php if(isset($list['stock_control']) && $list['stock_control']==1): if(isset($list['qty']) && $list['qty'] <= 0): ?>
     <span class="stock-badge out-of-stock">已售完</span>
   <?php elseif(isset($list['qty']) && $list['qty'] > 0 && $list['qty'] <= 10): ?>
     <span class="stock-badge low-stock">库存紧张</span> <span class="stock-count">仅剩<?php echo $list['qty']; ?>件</span>
   <?php elseif(isset($list['qty']) && $list['qty'] > 10): ?>
     <span class="stock-badge in-stock">库存充足</span> <span class="stock-count"><?php echo $list['qty']; ?>件</span>
   <?php else: ?>
     <span class="stock-badge in-stock">库存充足</span>
   <?php endif; else: ?>
   <span class="stock-badge in-stock">库存充足</span>
 <?php endif; ?>
</div>
<div class="price-container mt-auto">
  <?php if($list['sale_price']>0): ?>
    <div class="d-flex align-items-center justify-content-end">
      <div class="text-right price-current"><?php echo $Cart['currency']['prefix']; ?> <?php echo $list['sale_price']; ?> <?php echo $Cart['currency']['suffix']; ?></div>
      <?php if($list['cycle_discount']): ?>
        <div class="discount-badge ml-2">
          <?php echo $list['cycle_discount']; ?><?php echo $Lang['fracture']; ?>
        </div>
      <?php endif; ?>
    </div>
    <?php if($list['ontrial']==1): ?>
      <div class="text-right price-trial">
        <small><?php echo $Cart['currency']['prefix']; ?> <?php echo $list['ontrial_setup_fee']+$list['ontrial_price']; ?> / <?php echo $Lang['on_trial']; ?> <?php echo $list['ontrial_cycle']; ?> <?php echo $list['ontrial_cycle_type']=='day' ? $Lang['day'] : $Lang['hour']; ?></small>
      </div>
    <?php endif; ?>                  
    <div class="text-right price-original">
      <small>
        <?php if($list['sale_price'] < $list['product_price']): ?>
          <span class="discount-percent"><?php echo round(($list['sale_price'] / $list['product_price']) * 10, 1); ?>折</span>
        <?php endif; ?>
        (<?php echo $Lang['original_price']; ?>：<?php echo $Cart['currency']['prefix']; ?> <?php echo $list['product_price']; ?> / <?php echo $list['billingcycle_zh']; ?>)
      </small>
    </div>
  <?php else: ?>
    <div class="text-right price-current"><?php echo $Cart['currency']['prefix']; ?> <?php echo $list['product_price']; ?> <?php echo $Cart['currency']['suffix']; ?> / <?php echo $list['billingcycle_zh']; ?></div>
    <?php if($list['ontrial']==1): ?>
      <div class="text-right price-trial">
        <small><?php echo $Cart['currency']['prefix']; ?> <?php echo $list['ontrial_setup_fee']+$list['ontrial_price']; ?> / <?php echo $Lang['on_trial']; ?> <?php echo $list['ontrial_cycle']; ?> <?php echo $list['ontrial_cycle_type']=='day' ? $Lang['day'] : $Lang['hour']; ?></small>
      </div>
    <?php endif; ?>
  <?php endif; ?>
</div>
          <?php if($list['stock_control']==1 && $list['qty']<1): ?> 
          <div class="sold-out-ribbon">
            <span>已售空</span>
          </div>
        <?php endif; ?>
        </div>
        <div class="card-footer text-center p-0" style="box-shadow: 0px 4px 20px 2px rgba(240, 138, 93, 0.08);">
          <?php if($list['stock_control']==1 && $list['qty']<1): ?> 
          <a href="javascript:void(0)" style="cursor: not-allowed"><?php echo $Lang['buy_now']; ?></a>
          <?php else: ?>
          <a href="/cart?action=configureproduct&pid=<?php echo $list['id']; if($Get['site']): ?>&site=<?php echo $Get['site']; ?><?php endif; ?>"><?php echo $Lang['buy_now']; ?></a>
          <?php endif; ?>
        </div>
      </div>
    </div>
    <?php endforeach; ?>
    <?php endif; ?>
  </div>
  <?php if(!empty($Cart['products'])): ?>
  <div class="table-footer mt-4 d-flex justify-content-center">
    <ul class="pagination pagination-sm">
      <?php echo $Pages; ?>
    </ul>
  </div>
  <?php endif; ?>
</div>
</div>

<script>
$(function () {
// 添加一个函数来检查当前选中的商品组是否包含"*yes"标记

// 在document ready函数中添加以下代码
function checkSelectedGroupHasYes() {
  // 检查当前选中的商品组是否有"*yes"标记
  const activeFirstItem = $('.firstgroup_item.active a');
  const activeSecondItem = $('.secondgroup_item.active a');
  
  // 如果任一选中项有"*yes"标记，则默认展开所有商品描述
  if ((activeFirstItem.length > 0 && activeFirstItem.attr('data-has-yes') === 'true') || 
      (activeSecondItem.length > 0 && activeSecondItem.attr('data-has-yes') === 'true')) {
    $('.product-description').each(function() {
      const description = $(this);
      const container = description.parent();
      
      description.removeClass('collapsed').addClass('expanded');
      if (container.find('.toggle-description').length > 0) {
        container.find('.toggle-description').data('action', 'collapse').html('收起详情 <i class="iconfont icon-arrow-up"></i>');
      }
    });
    
    // 重新计算布局
    setTimeout(function() {
      initMasonry(false);
    }, 300);
  }
}

// 修改initMasonry函数，移除自动刷新逻辑
function initMasonry(animate = true) {
  const container = $('.products-container');
  const items = container.find('.product-item:visible');
  container.find('.no-products-message').remove();
  $('.loading-container').addClass('hidden');

  if (items.length === 0) {
    container.append(`
      <div class="no-products-message text-center py-5">
        <i class="fas fa-box-open mb-3" style="font-size: 3rem; color: var(--primary-light);"></i>
        <p class="mb-0">当前分类暂无可用商品</p>
      </div>
    `);
    container.css('height', 'auto');
    return;
  }

  // 移动端静态布局
  if ($(window).width() <= 576) {
    items.css({
      'position': 'relative',
      'top': 'auto',
      'left': 'auto',
      'width': '100%',
      'opacity': 1,
      'transform': 'none'
    }).addClass('animated');
    container.css('height', 'auto');
    return;
  }

  // --- 修正版：仅第一行顺序，后续根据高度差决定是否瀑布流 ---
  const containerWidth = container.width();
  let columns;
  if ($(window).width() > 1200) {
    columns = 4;
  } else if ($(window).width() > 992) {
    columns = 3;
  } else if ($(window).width() > 768) {
    columns = 3;
  } else {
    columns = 2;
  }
  const columnWidth = containerWidth / columns;
  const columnHeights = Array(columns).fill(0);
  const threshold = 40; // px

  items.css({
    'width': columnWidth + 'px',
    'position': 'absolute',
    'opacity': 0,
    'transform': 'scale(0.9) translateY(20px)'
  });

  // 第一行顺序排列
  let i = 0;
  for (; i < columns && i < items.length; i++) {
    const item = $(items[i]);
    item.css({
      'top': '0px',
      'left': (i * columnWidth) + 'px'
    });
    columnHeights[i] = item.outerHeight(true);
  }

  // 计算第一行最大最小高度
  let firstRowHeights = columnHeights.slice(0, columns);
  let minFirst = Math.min(...firstRowHeights);
  let maxFirst = Math.max(...firstRowHeights);

  // 后续商品
  for (; i < items.length; i++) {
    const item = $(items[i]);
    // 判断是否需要瀑布流
    if (maxFirst - minFirst > threshold) {
      // 瀑布流：放到最短列
      const col = columnHeights.indexOf(Math.min(...columnHeights));
      item.css({
        'top': columnHeights[col] + 'px',
        'left': (col * columnWidth) + 'px'
      });
      columnHeights[col] += item.outerHeight(true);
    } else {
      // 顺序排列
      const col = i % columns;
      item.css({
        'top': columnHeights[col] + 'px',
        'left': (col * columnWidth) + 'px'
      });
      columnHeights[col] += item.outerHeight(true);
    }
  }

  container.css('height', Math.max(...columnHeights) + 'px');
  setTimeout(function() {
    $('.loading-container').addClass('hidden');
    if (animate) {
      items.each(function(index) {
        const item = $(this);
        setTimeout(function() {
          item.addClass('animated');
        }, 50 * index);
      });
    } else {
      items.css({
        'opacity': 1,
        'transform': 'none'
      });
    }
  }, 500);
}

$('.cartitem').on('mouseover', function () {
  $(this).addClass('active');
});
$('.cartitem').on('mouseleave', function () {
  $(this).removeClass('active');
});
$(document).on('click', '.toggle-description', function() {
  const btn = $(this);
  const description = btn.siblings('.product-description');
  const action = btn.data('action');
  if (action === 'expand') {
    description.removeClass('collapsed').addClass('expanded');
    btn.data('action', 'collapse');
    btn.html('收起详情 <i class="iconfont icon-arrow-up"></i>');
  } else {
    description.removeClass('expanded').addClass('collapsed');
    btn.data('action', 'expand');
    btn.html('查看详情 <i class="iconfont icon-arrow-down"></i>');
  }
    setTimeout(function() {
    initMasonry(false);
  }, 500);
});
$('.product-description').each(function() {
  const description = $(this);
  description.addClass('collapsed');
});

// 修改处理商品名称的逻辑，将国旗显示和展开功能分开处理
// 在$(document).ready函数中找到以下代码块并替换：

$(document).ready(function() {
  // 处理商品名称，分别检查是否包含国旗代码和"*yes"标记
  $('.product-name').each(function() {
    const $this = $(this);
    const originalText = $this.text();
    
    // 保存原始文本作为数据属性
    $this.attr('data-original-text', originalText);
    
    // 检查是否包含"*yes"标记，单独处理展开功能
    if (originalText.indexOf('*yes') !== -1) {
      $this.attr('data-has-yes', 'true');
      
      // 找到对应的描述容器并展开
      const productItem = $this.closest('.product-item');
      const description = productItem.find('.product-description');
      const container = description.parent();
      
      description.removeClass('collapsed').addClass('expanded');
      if (container.find('.toggle-description').length > 0) {
        container.find('.toggle-description').data('action', 'collapse').html('收起详情 <i class="iconfont icon-arrow-up"></i>');
      }
    } else {
      $this.attr('data-has-yes', 'false');
    }
    
    // 处理国旗显示，与展开功能分开处理
    const parts = originalText.split('*');
    if (parts.length >= 2) {
      const countryCode = parts[0].trim();
      let title = parts[1].trim();
      
      // 移除"yes"或"no"标记，但不影响展开功能的判断
      if (title.endsWith('yes') || title.endsWith('no')) {
        title = title.replace(/yes$|no$/, '').trim();
      }
      
      if (title === '') {
        title = countryCode;
      }
      
      // 添加国旗图片
      const $flag = $('<img>', {
        'src': '/upload/common/country/' + countryCode + '.png',
        'class': 'country-flag',
        'alt': countryCode,
        'onerror': 'this.style.display="none"'
      });
      
      // 清空并重新添加内容
      $this.empty().append($flag).append(document.createTextNode(title));
    }
  });
  
  // 重新计算布局
  setTimeout(function() {
    initMasonry(false);
  }, 400);
});

// 修改checkSelectedGroupHasYes函数，确保它正确检查"*yes"标记
function checkSelectedGroupHasYes() {
  // 检查当前选中的商品组是否有"*yes"标记
  const activeFirstItem = $('.firstgroup_item.active a');
  const activeSecondItem = $('.secondgroup_item.active a');
  
  // 如果任一选中项有"*yes"标记，则默认展开所有商品描述
  if ((activeFirstItem.length > 0 && activeFirstItem.attr('data-has-yes') === 'true') || 
      (activeSecondItem.length > 0 && activeSecondItem.attr('data-has-yes') === 'true')) {
    $('.product-description').each(function() {
      const description = $(this);
      const container = description.parent();
      
      description.removeClass('collapsed').addClass('expanded');
      if (container.find('.toggle-description').length > 0) {
        container.find('.toggle-description').data('action', 'collapse').html('收起详情 <i class="iconfont icon-arrow-up"></i>');
      }
    });
    
    // 重新计算布局
    setTimeout(function() {
      initMasonry(false);
    }, 300);
  }
}

// 修改商品描述初始化逻辑，确保它正确处理展开状态
$('.product-description').each(function() {
  const description = $(this);
  const container = description.parent();
  const productItem = description.closest('.product-item');
  const productName = productItem.find('.product-name').text();
  const hasYes = productItem.find('.product-name').attr('data-has-yes') === 'true';
  
  // 检查商品名称是否标记为自动展开
  if (hasYes) {
    description.removeClass('collapsed').addClass('expanded');
    if (container.find('.toggle-description').length === 0 && (description.height() > 60 || description.text().length > 120)) {
      container.append('<button class="toggle-description" data-action="collapse">收起详情 <i class="iconfont icon-arrow-up"></i></button>');
    } else if (container.find('.toggle-description').length > 0) {
      container.find('.toggle-description').data('action', 'collapse').html('收起详情 <i class="iconfont icon-arrow-up"></i>');
    }
  } else {
    if (description.height() > 60 || description.text().length > 120) {
      description.addClass('collapsed');
      if (container.find('.toggle-description').length === 0) {
        container.append('<button class="toggle-description" data-action="expand">查看详情 <i class="iconfont icon-arrow-down"></i></button>');
      }
    }
  }
});

let searchTimeout;
$('#product-search').on('input', function() {
  const searchTerm = $(this).val().toLowerCase().trim();
  if (searchTimeout) {
    clearTimeout(searchTimeout);
  }
  
  searchTimeout = setTimeout(function() {
    const $container = $('.products-container');
    let hasVisibleItems = false;
    
    // 清除现有的提示
    $container.find('.no-products-message').remove();
    
    // 如果搜索词为空，显示所有商品
    if (!searchTerm) {
      $('.product-item').show();
      initMasonry(false);
      return;
    }
    
    $('.product-item').each(function() {
      const $item = $(this);
      const productName = $item.find('.product-name').text().toLowerCase();
      const productDesc = $item.find('.product-description').text().toLowerCase();
      
      if (productName.includes(searchTerm) || productDesc.includes(searchTerm)) {
        $item.show();
        hasVisibleItems = true;
      } else {
        $item.hide();
      }
    });
    
    // 处理无搜索结果
    if (!hasVisibleItems) {
      $container.append(`
        <div class="no-products-message text-center py-5">
          <i class="fas fa-search mb-3" style="font-size: 3rem; color: var(--primary-light);"></i>
          <p class="mb-0">未找到匹配的商品</p>
        </div>
      `);
      $container.css('height', 'auto');
    } else {
      initMasonry(false);
    }
  }, 300);
});

// 移除原有的window resize事件处理器
$(window).off('resize.masonry');

// 添加防抖的resize事件处理
let resizeTimeout;
$(window).on('resize.masonry', function() {
  if (resizeTimeout) {
    clearTimeout(resizeTimeout);
  }
  resizeTimeout = setTimeout(function() {
    if ($(window).width() > 576) {
      initMasonry(false);
    }
  }, 250);
});

// 页面加载完成后只初始化一次
$(window).on('load', function() {
  initMasonry(true);
  // 执行一次检查
  setTimeout(checkSelectedGroupHasYes, 300);
});

// 添加移动端触摸事件处理
if ('ontouchstart' in window) {
  $(document).on('touchmove', function(e) {
    // 防止页面在滑动时触发不必要的重新计算
    if (resizeTimeout) {
      clearTimeout(resizeTimeout);
    }
  });
}

// Add ripple effect to buttons
$('.toggle-description, .cartitem .card-footer a').on('mousedown', function(e) {
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
 }, 300);
});
$('<style>')
 .prop('type', 'text/css')
 .html(`
   .toggle-description, .cartitem .card-footer a {
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

// Add focus effect to search box
$('#product-search').on('focus', function() {
 $(this).parent().addClass('focused');
}).on('blur', function() {
 $(this).parent().removeClass('focused');
});
$('<style>')
 .prop('type', 'text/css')
 .html(`
   .search-box.focused {
     transform: scale(1.02);
   }
   .search-box.focused::before {
     color: var(--primary-dark);
   }
 `)
 .appendTo('head');
 
// 在初始化masonry布局后，确保布局正确
setTimeout(function() {
 initMasonry(false);
}, 600);

// 在页面加载完成后执行检查
$(window).on('load', function() {
  setTimeout(checkSelectedGroupHasYes, 300);
});

// 在初始化masonry布局后也执行检查
setTimeout(function() {
  checkSelectedGroupHasYes();
}, 800);
});

// 修改商品名称处理逻辑，确保正确显示名称并保留"*yes"标记信息

$(document).ready(function() {
  // 处理商品名称，检查是否包含"*yes"标记
  $('.product-name').each(function() {
    const $this = $(this);
    const originalText = $this.text();
    
    if (originalText.indexOf('*yes') !== -1) {
      // 保存原始文本作为数据属性
      $this.attr('data-original-text', originalText);
      $this.attr('data-has-yes', 'true');
      
      // 显示不包含"*yes"的文本
      const cleanText = originalText.replace('*yes', '');
      $this.text(cleanText);
      
      // 默认展开此商品的描述
      const productItem = $this.closest('.product-item');
      const description = productItem.find('.product-description');
      const container = description.parent();
      
      description.removeClass('collapsed').addClass('expanded');
      if (container.find('.toggle-description').length > 0) {
        container.find('.toggle-description').data('action', 'collapse').html('收起详情 <i class="iconfont icon-arrow-up"></i>');
      }
    }
  });
  
  // 重新计算布局
  setTimeout(function() {
    initMasonry(false);
  }, 400);
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