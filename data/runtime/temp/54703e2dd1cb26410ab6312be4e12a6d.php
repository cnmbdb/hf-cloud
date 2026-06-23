<?php /*a:7:{s:69:"/www/wwwroot/cloud.hf.pw2/public/themes/clientarea/ogmiao/service.tpl";i:1743857002;s:75:"/www/wwwroot/cloud.hf.pw2/public/themes/clientarea/ogmiao/includes/head.tpl";i:1742354372;s:75:"/www/wwwroot/cloud.hf.pw2/public/themes/clientarea/ogmiao/includes/menu.tpl";i:1720065013;s:81:"/www/wwwroot/cloud.hf.pw2/public/themes/clientarea/ogmiao/includes/pageheader.tpl";i:1719999923;s:81:"/www/wwwroot/cloud.hf.pw2/public/themes/clientarea/ogmiao/includes/breadcrumb.tpl";i:1719999923;s:81:"/www/wwwroot/cloud.hf.pw2/public/themes/clientarea/ogmiao/includes/tablestyle.tpl";i:1719999923;s:74:"/www/wwwroot/cloud.hf.pw2/public/themes/clientarea/ogmiao/includes/pop.tpl";i:1719999923;}*/ ?>

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
<div class="modal fade" id="popModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="popTitle"></h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body" id="popContent">
        
      </div>
			<div class="modal-footer">
				<button type="button" class="btn btn-outline-light" data-dismiss="modal">取消</button>
				<button type="button" class="btn btn-primary" data-dismiss="modal">确定</button>
			</div>
    </div>
  </div>
</div>

<style>
/* 主题颜色变量 */
:root {
  --primary: #f08a5d;
  --primary-hover: #f9b384;
  --primary-light: rgba(240, 138, 93, 0.1);
  --primary-lighter: rgba(240, 138, 93, 0.05);
  --primary-shadow: rgba(240, 138, 93, 0.25);
  --primary-border: rgba(240, 138, 93, 0.2);
}

/* 按钮样式 */
.btn-primary {
  background-color: var(--primary) !important;
  border-color: var(--primary) !important;
  box-shadow: 0 2px 6px var(--primary-shadow) !important;
  transition: all 0.3s ease;
}

.btn-primary:hover, .btn-primary:focus, .btn-primary:active {
  background-color: var(--primary-hover) !important;
  border-color: var(--primary-hover) !important;
  box-shadow: 0 4px 10px var(--primary-shadow) !important;
  transform: translateY(-1px);
}

.btn-outline-primary {
  color: var(--primary) !important;
  border-color: var(--primary) !important;
  background-color: transparent !important;
  box-shadow: none !important;
  transition: all 0.3s ease;
}

.btn-outline-primary:hover, .btn-outline-primary:focus, .btn-outline-primary:active {
  color: #fff !important;
  background-color: var(--primary) !important;
  border-color: var(--primary) !important;
  box-shadow: 0 4px 10px var(--primary-shadow) !important;
  transform: translateY(-1px);
}

.btn-secondary {
  background-color: #6c757d !important;
  border-color: #6c757d !important;
}

.btn-secondary:hover, .btn-secondary:focus, .btn-secondary:active {
  background-color: #5a6268 !important;
  border-color: #5a6268 !important;
}

/* 表格样式 */
.table {
  border-collapse: separate;
  border-spacing: 0;
}

.table thead th {
  border-bottom: 2px solid var(--primary-lighter) !important;
  border-top: none !important;
  font-weight: 600;
  color: #495057;
}

.table tbody tr:hover {
  background-color: var(--primary-lighter);
}

.table-responsive {
  border-radius: 8px;
  overflow: hidden;
}

/* 状态徽章样式 */
.badge-pill {
  padding: 0.4em 0.8em;
  font-weight: 500;
  border-radius: 50px;
}

.status-active {
  background-color: var(--primary-light) !important;
  color: var(--primary) !important;
  border: 1px solid var(--primary-border);
}

.status-pending {
  background-color: rgba(254, 211, 48, 0.1);
  color: #e5a800;
  border: 1px solid rgba(254, 211, 48, 0.2);
}

.status-suspended {
  background-color: rgba(255, 107, 107, 0.1);
  color: #ff6b6b;
  border: 1px solid rgba(255, 107, 107, 0.2);
}

.status-terminated {
  background-color: rgba(90, 98, 104, 0.1);
  color: #5a6268;
  border: 1px solid rgba(90, 98, 104, 0.2);
}

.status-cancelled {
  background-color: rgba(90, 98, 104, 0.1);
  color: #5a6268;
  border: 1px solid rgba(90, 98, 104, 0.2);
}

.status-fraud {
  background-color: rgba(214, 48, 49, 0.1);
  color: #d63031;
  border: 1px solid rgba(214, 48, 49, 0.2);
}

/* 分页样式 */
.pagination .page-item.active .page-link {
  background-color: var(--primary) !important;
  border-color: var(--primary) !important;
  box-shadow: 0 2px 5px var(--primary-shadow);
  color: white !important;
}

.pagination .page-link {
  color: var(--primary);
  border-color: #dee2e6;
  margin: 0 2px;
  border-radius: 4px;
  transition: all 0.3s ease;
}

.pagination .page-link:hover {
  background-color: var(--primary-lighter);
  border-color: var(--primary-border);
  color: var(--primary);
  transform: translateY(-1px);
  box-shadow: 0 2px 5px var(--primary-shadow);
}

/* 表单元素样式 */
.form-control:focus {
  border-color: var(--primary) !important;
  box-shadow: 0 0 0 0.2rem var(--primary-shadow) !important;
}

.custom-control-input:checked ~ .custom-control-label::before {
  background-color: var(--primary) !important;
  border-color: var(--primary) !important;
}

.custom-control-input:focus ~ .custom-control-label::before {
  box-shadow: 0 0 0 0.2rem var(--primary-shadow) !important;
}

/* 下拉菜单样式 */
.dropdown-item:hover, .dropdown-item:focus {
  background-color: var(--primary-lighter);
  color: var(--primary);
}

.dropdown-item.active, .dropdown-item:active {
  background-color: var(--primary);
  color: white;
}

/* 模态框样式 */
.modal-header {
  background-color: var(--primary);
  color: white;
  border-radius: 8px 8px 0 0;
}

.modal-header .close {
  color: white;
  opacity: 0.8;
}

.modal-header .close:hover {
  opacity: 1;
}

.modal-content {
  border: none;
  border-radius: 8px;
  box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
}

.modal-footer {
  border-top: 1px solid var(--primary-lighter);
}

/* 搜索框样式 */
.search-box .form-control {
  border-radius: 50px;
  padding-left: 40px;
  transition: all 0.3s ease;
}

.search-box .form-control:focus {
  box-shadow: 0 0 0 0.2rem var(--primary-shadow) !important;
}

.search-box .search-icon {
  left: 15px;
  color: var(--primary);
}

/* 卡片样式 */
.card {
  border: none;
  border-radius: 12px;
  box-shadow: 0 2px 10px rgba(0, 0, 0, 0.05);
  transition: all 0.3s ease;
}

.card:hover {
  box-shadow: 0 5px 15px rgba(0, 0, 0, 0.08);
  transform: translateY(-2px);
}

.card-body {
  padding: 1.5rem;
}

/* 表格工具栏样式 */
.table-header {
  padding: 0 0 1rem 0;
}

.table-footer {
  padding: 1rem 0 0 0;
  display: flex;
  justify-content: space-between;
  align-items: center;
}

/* 选择器样式 */
select {
  border-radius: 4px;
  border: 1px solid #ced4da;
  padding: 0.375rem 1.75rem 0.375rem 0.75rem;
  transition: all 0.3s ease;
}

select:focus {
  border-color: var(--primary);
  box-shadow: 0 0 0 0.2rem var(--primary-shadow);
}

/* 状态点样式 */
.dots {
  cursor: pointer;
  width: 15px;
  height: 15px;
  border-radius: 50%;
  border: 1px solid #fff;
  position: absolute;
  top: 6px;
  left: 6px;
  transition: all 0.3s ease;
}

.on_color {
  background-color: #3fbf70;
  box-shadow: 0 0 5px rgba(63, 191, 112, 0.5);
}

.ing_color {
  background-color: #f5f5f5;
  box-shadow: 0 0 5px rgba(245, 245, 245, 0.5);
}

.off_color {
  background-color: #e31519;
  box-shadow: 0 0 5px rgba(227, 21, 25, 0.5);
}

.unknown_color {
  background-color: #c0c0c0;
  box-shadow: 0 0 5px rgba(192, 192, 192, 0.5);
}

.error_color {
  background-color: #959799;
  box-shadow: 0 0 5px rgba(149, 151, 153, 0.5);
}

.not_support_color {
  background-color: #2d2d2d;
  box-shadow: 0 0 5px rgba(45, 45, 45, 0.5);
}

/* 文本颜色 */
.text-primary {
  color: var(--primary) !important;
}

/* 无数据样式 */
.no-data {
  padding: 2rem;
  text-align: center;
  color: #6c757d;
  font-size: 1rem;
}

/* 响应式调整 */
@media (max-width: 767px) {
  .card-body {
    padding: 1rem;
  }
  
  .table-responsive {
    border-radius: 6px;
  }
  
  .table td, .table th {
    padding: 0.5rem;
  }
  
  .btn-sm {
    padding: 0.25rem 0.5rem;
    font-size: 0.75rem;
  }
  
  .pagination .page-link {
    padding: 0.25rem 0.5rem;
    font-size: 0.75rem;
  }
}
</style>

<script>
	$(function () {
		// 状态筛选
		var parmas = []
		var urlParams = '<?php echo implode(',', app('request')->get('domain_status')); ?>';
		var statusSelected = urlParams.split(',')
    if(!statusSelected[0]){
      statusSelected=['Pending','Active','Suspended']
    }

		$('#statusSel').selectpicker('val', statusSelected)
		$('#statusSel').on('change', function () {

			statusSelected = $('#statusSel').val()
			statusSelected.forEach(item => {
				parmas += '&domain_status[]=' + item
			})

			location.href = 'service?groupid=<?php echo app('request')->get('groupid'); ?>' + parmas
		});
		// 关键字搜索
		$('#searchInp').val('<?php echo app('request')->get('keywords'); ?>')

		$('#searchInp').on('keydown', function (e) {
			if (e.keyCode == 13) {
				location.href = 'service?groupid=<?php echo app('request')->get('groupid'); ?>&keywords=' + $('#searchInp').val() +
					'&sort=<?php echo app('request')->get('sort'); ?>&orderby=<?php echo app('request')->get('orderby'); ?>&page=<?php echo app('request')->get('page'); ?>&limit=<?php echo app('request')->get('limit'); ?>'
			}
		})
		$('#searchIcon').on('click', function () {
			location.href = 'service?groupid=<?php echo app('request')->get('groupid'); ?>&keywords=' + $('#searchInp').val() +
				'&sort=<?php echo app('request')->get('sort'); ?>&orderby=<?php echo app('request')->get('orderby'); ?>&page=<?php echo app('request')->get('page'); ?>&limit=<?php echo app('request')->get('limit'); ?>'
		});
		// 设置样式

		// 排序
		$('.bg-light th:not(.checkbox)').on('click', function () {
			var sort = '<?php echo app('request')->get('sort'); ?>'
			location.href = 'service?groupid=<?php echo app('request')->get('groupid'); ?>&keywords=<?php echo app('request')->get('keywords'); ?>&sort=' + (sort ==
				'desc' ? 'asc' : 'desc') + '&orderby=' + $(this).attr('prop') +
				'&page=<?php echo app('request')->get('page'); ?>&limit=<?php echo app('request')->get('limit'); ?>'
		})
		changeStyle()
		function changeStyle() {
			$('.text-black-50.d-inline-flex.flex-column.justify-content-center.ml-1.offset-3').children().css('color','rgba(0, 0, 0, 0.1)')
					var sort = '<?php echo app('request')->get('sort'); ?>'
					var orderby = '<?php echo app('request')->get('orderby'); ?>'
					let index
					if(orderby === 'domainstatus') {
						if (sort === 'desc') {
						index = 1
						} else if(sort === 'asc') {
						index = 0
						}
					} else if(orderby === 'nextduedate') {
							if (sort === 'desc') {
							index = 3
							} else if(sort === 'asc') {
							index = 2
							}
					}
			$('.text-black-50.d-inline-flex.flex-column.justify-content-center.ml-1.offset-3').children().eq(index).css('color','rgba(0, 0, 0, 0.8)')
		}
		
		// 美化下拉选择框
		$('.selectpicker').selectpicker({
			style: 'btn-default',
			size: 8
		});
		
		// 美化表格样式
		$('.table').addClass('table-hover');
		$('.badge-pill').each(function() {
			var status = $(this).parent().find('.badge-pill').text().trim();
			if (status === '已激活' || status === 'Active') {
				$(this).addClass('status-active');
			} else if (status === '待审核' || status === 'Pending') {
				$(this).addClass('status-pending');
			} else if (status === '已暂停' || status === 'Suspended') {
				$(this).addClass('status-suspended');
			} else if (status === '已终止' || status === 'Terminated') {
				$(this).addClass('status-terminated');
			} else if (status === '已取消' || status === 'Cancelled') {
				$(this).addClass('status-cancelled');
			} else if (status === '欺诈' || status === 'Fraud') {
				$(this).addClass('status-fraud');
			}
		});
	})
</script>
<div class="card">
	<div class="card-body">
		<div class="table-container">
			<div class="table-header">
				<div class="table-filter">
					<div class="row">
						<div class="col">
							<select class="selectpicker" id="statusSel" data-style="btn-default" title="<?php echo $Lang['please_select_status']; ?>" multiple>
								<?php foreach($Service['domainstatus'] as $key => $list): ?>
								<option value="<?php echo $key; ?>"><?php echo $Lang['domainstatus_select_'.strtolower($key)]; ?></option>
								<?php endforeach; ?>
							</select>
							<?php if((isset($nav_info['orderFuc']) && $nav_info['orderFuc'])): ?>
								<a href="<?php echo $nav_info['orderFucUrl']; ?>" class="btn btn-sm btn-primary w-xs"><?php echo $Lang['ordering_products']; ?></a>
							<?php endif; ?>
						</div>
					</div>
				</div>
				<!-- wyh 20210331 增加产品转移hook模板template_after_service_domainstatus_selected-->
				<?php $hooks=hook('template_after_service_domainstatus_selected'); if($hooks): foreach($hooks as $item): ?>
						<?php echo $item; ?>
					<?php endforeach; ?>
				<?php endif; ?>
				<!-- 结束 -->
				<div class="table-search">
					<div class="row justify-content-end">
						<div class="col-sm-6">
							<div class="search-box">
								<div class="position-relative">
									<input type="text" class="form-control" id="searchInp" placeholder="<?php echo $Lang['search_by_keyword']; ?>">
									<i class="bx bx-search-alt search-icon" id="searchIcon"></i>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="table-responsive">
				<table class="table tablelist">
					<colgroup>
						<col width="50px">
						<col>
						<col>
						<col>
						<col>
						<col>
						<col>
						<col width="8%">
					</colgroup>
					<thead class="bg-light">
						<tr>
							<th class="checkbox">
								<div class="custom-control custom-checkbox mb-3">
									<input type="checkbox" name="headCheckbox" class="custom-control-input" id="customCheck">
									<label class="custom-control-label" for="customCheck"></label>
								</div>
							</th>
							<th class="pointer" prop="domainstatus">
								<span><?php echo $Lang['state']; ?></span>
								<span class="text-black-50 d-inline-flex flex-column justify-content-center ml-1 offset-3">
									<i class="bx bx-caret-up"></i>
									<i class="bx bx-caret-down"></i>
								</span>
							</th>
							<th><?php echo $Lang['product']; ?></th>
							<!--<th class="pointer" prop="dedicatedip">
								<span>IP</span>
								<span class="text-black-50 d-inline-flex flex-column justify-content-center ml-1 offset-3">
									<i class="bx bx-caret-up"></i>
									<i class="bx bx-caret-down"></i>
								</span>
							</th>-->
							<th>IP</th>
							<th class="pointer" prop="nextduedate">
								<span><?php echo $Lang['due_date']; ?></span>
								<span class="text-black-50 d-inline-flex flex-column justify-content-center ml-1 offset-3">
									<i class="bx bx-caret-up"></i>
									<i class="bx bx-caret-down"></i>
								</span>
							</th>
							<!--<th class="pointer" prop="amount">
								<span><?php echo $Lang['cost']; ?></span>
								<span class="text-black-50 d-inline-flex flex-column justify-content-center ml-1 offset-3">
									<i class="bx bx-caret-up"></i>
									<i class="bx bx-caret-down"></i>
								</span>
							</th>-->
							<th><?php echo $Lang['cost']; ?></th>
							<th><?php echo $Lang['system']; ?></th>
							<th><?php echo $Lang['remarks']; ?></th>
							<th><?php echo $Lang['operating']; ?></th>
						</tr>
					</thead>
					<tbody id="serviceTbody">
						<?php if($Service['list']): foreach($Service['list'] as $list): ?>
						<tr>
							<td>
								<div class="custom-control custom-checkbox mb-3">
									<input type="checkbox" class="custom-control-input row-checkbox" id="customCheck<?php echo $list['id']; ?>"
										data-status="<?php echo $list['domainstatus']; ?>">
									<label class="custom-control-label" for="customCheck<?php echo $list['id']; ?>"></label>
								</div>
							</td>
							<td style="position:relative">

								<div class="dots" id="service<?php echo $list['id']; ?>" style="display:none" data-toggle="tooltip" data-placement="top"
									title="<?php echo $Lang['please_wait_a_moment']; ?>..." onclick="getSingleStatus('<?php echo $list['id']; ?>')">

								</div>

								<span class="badge badge-pill font-size-12
									status-<?php echo strtolower($list['domainstatus']); ?>"><?php echo $Lang['domainstatus_select_'.strtolower($list['domainstatus'])]; ?></span>
							</td>
							<td>
								<a href=" servicedetail?id=<?php echo $list['id']; ?>" class="text-dark">
									<strong><?php echo $list['productname']; ?></strong>
									</a><br />
									<small class="text-muted"><?php echo $list['domain']; ?></small>
							</td>
							<!-- <td><?php if($list['dedicatedip']): ?><?php echo $list['dedicatedip']; else: ?>-<?php endif; ?></td> -->
							
							<td>
								<?php if($list['dedicatedip']): if(($list['assignedips'] && count($list['assignedips']) > 1)): ?>
										<span data-toggle="popover" data-trigger="hover" title="" data-html="true" data-content="
											<button type='button' class='btn btn-primary'><?php echo $Lang['copy']; ?></button>
											<?php foreach($list['assignedips'] as $item): ?>
											<div><?php echo $item; ?></div>
											<?php endforeach; ?>
										">
											<span class="iptd" id="ips<?php echo $list['id']; ?>"><?php echo $list['dedicatedip']; ?> (<?php echo count($list['assignedips']); ?>) </span>
										</span>
									<?php else: ?>
										<span><?php echo $list['dedicatedip']; ?></span>
									<?php endif; else: ?>
									-
								<?php endif; ?>
								
							</td>
							<td>
								<?php if($list['cycle_desc'] != '一次性' && $list['cycle_desc'] != '免费'): ?>
								<span><?php echo date("Y-m-d",!is_numeric($list['nextduedate'])? strtotime($list['nextduedate']) : $list['nextduedate']); ?></span>
								<?php if($list['host_cancel'] != ''): ?>
								<span class="bx bxs-error-circle text-danger" data-toggle="popover" data-trigger="hover"
									title="<?php echo $Lang['disable_and_remove_the_product']; ?>" data-html="true"
									data-content="<?php echo $Lang['cancellation_time']; ?>：<?php echo $list['host_cancel']['type']; ?><br><?php echo $Lang['cancelreason']; ?>：<?php echo $list['host_cancel']['reason']; ?>"></span>
								<?php endif; else: ?>-
								<?php endif; ?>
							</td>
							<td>
								<div>
									<?php if($list['billingcycle'] != 'free' && $list['billingcycle'] != 'ontrial'): ?>
										<?php echo $list['price_desc']; ?>/<?php if(is_null($Lang[$list['billingcycle']])): ?><?php echo $list['billingcycle']; else: ?><?php echo $Lang[$list['billingcycle']]; ?><?php endif; else: ?>
										<?php echo $Lang[$list['billingcycle']]; ?>
									<?php endif; ?>
								</div>
								<div class="text-black-50">
									<?php if($list['initiative_renew'] && $list['billingcycle'] != 'free' && $list['billingcycle'] != 'onetime'): ?><?php echo $Lang['automatic_renewal_of_balance']; ?><?php endif; ?>
								</div>
							</td>
							<!-- 系统 -->
							<td>
								<?php if($list['os_url']): if($list['svg']): ?>
								<img width="14" height="14" src="/upload/common/system/<?php echo $list['svg']; ?>.svg" alt="">
								<?php else: ?>
								<img width="14" height="14" src="/upload/common/system/<?php echo getOsSvg($list['os_url']); ?>.svg"
									alt="">
								<?php endif; ?>
								<?php echo $list['os_url']; else: ?>
								-
								<?php endif; ?>
							</td>
							<td><?php if($list['notes']): ?><?php echo $list['notes']; else: ?>-<?php endif; ?>
								<i class="bx bx-edit-alt pointer text-primary"
									onclick="editNotesHandleClick('<?php echo $list['id']; ?>', '<?php echo $list['notes']; ?>')"></i>
								<!--  data-toggle="modal" data-target="#modifyNotesModal" -->
							</td>
							<td>
								<a href="servicedetail?id=<?php echo $list['id']; ?>" class="btn btn-sm btn-primary w-xs"><?php echo $Lang['operating']; ?></a>
							</td>
						</tr>
						<?php endforeach; else: ?>
						<tr>
							<td colspan="12">
								<div class="no-data"><?php echo $Lang['nothing']; ?></div>
							</td>
						</tr>
						<?php endif; ?>
					</tbody>
				</table>
			</div>
			<!-- 表单底部调用开始 -->
			<div class="table-footer">
				<div class="table-tools">
					<button disabled class="btn btn-outline-primary btn-sm w-xs" id="readBtn"><?php echo $Lang['renew']; ?></button>
					<div class="btn-group">
						<button class="btn btn-secondary btn-sm dropdown-toggle not-allowed" id="bulkOperation" type="button"
							data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" disabled>
							<?php echo $Lang['products_launched']; ?> <i class="mdi mdi-chevron-down"></i>
						</button>
						<div class="dropdown-menu">
							<a class="dropdown-item" href="#" onclick="handleOperating('on')"><?php echo $Lang['batch_operation']; ?></a>
							<a class="dropdown-item" href="#" onclick="handleOperating('off')"><?php echo $Lang['shut_down']; ?></a>
							<a class="dropdown-item" href="#" onclick="handleOperating('reboot')"><?php echo $Lang['restart']; ?></a>
							<a class="dropdown-item" href="#" onclick="handleOperating('hard_off')"><?php echo $Lang['hard_shutdown']; ?></a>
							<a class="dropdown-item" href="#" onclick="handleOperating('hard_reboot')"><?php echo $Lang['hard_restart']; ?></a>
						</div>
					</div>
				</div>
				<div class="table-pagination">
					<div class="table-pageinfo mr-2">
						<span><?php echo $Lang['common']; ?> <?php echo $Total; ?> <?php echo $Lang['strips']; ?></span> 
						<span class="mx-2">
							<?php echo $Lang['each_page']; ?>
							<select name="" id="limitSel" class="custom-select custom-select-sm form-control form-control-sm">
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
		</div>
	</div>
</div>

<!-- 修改备注弹窗 -->
<div class="modal fade" id="modifyNotesModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle"
	aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title">修改备注</h5>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<form id="modifyNotesForm" class="needs-validation" novalidate>
					<div class="form-group row">
						<label class="col-sm-3 col-form-label text-right">备注</label>
						<div class="col-sm-8">
							<input type="textarea" class="form-control" id="notesInp" placeholder="请输入备注" required />
						</div>
					</div>
				</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-outline-light" data-dismiss="modal">取消</button>
				<button type="button" class="btn btn-primary mr-2" id="modifyNotesSubmit">确定</button>
			</div>
		</div>
	</div>
</div>

<script>
	var serviceList = <?php echo json_encode($Service['list']); ?>; // 当前页列表数据
	$(function () {
		if($('.row-checkbox:checked').length){
			$('#readBtn').removeAttr('disabled').removeClass('not-allowed');
		}else {
			$('#readBtn').attr('disabled', 'disabled').addClass('not-allowed');
		}
		var url = 'service?groupid=<?php echo app('request')->get('groupid'); ?>'
		// 每页数量选择改变
		$('#limitSel').on('change', function () {
			location.href = url + '&keywords=<?php echo app('request')->get('keywords'); ?>&sort=<?php echo app('request')->get('sort'); ?>&orderby=<?php echo app('request')->get('orderby'); ?>&page=1&limit=' + $('#limitSel').val()

		})

		// 表格多选
		$('input[name="headCheckbox"]').on('change', function () {
			$('.row-checkbox').prop("checked", $(this).is(':checked'))
			if ($('.row-checkbox:checked').length) {
				$('#readBtn').removeAttr('disabled').removeClass('not-allowed');
			} else {
				$('#readBtn').attr('disabled', 'disabled').addClass('not-allowed');
			}
			// 以产品状态来判断批量操作按钮是否启用
			let xfStatus = true;
			let plStatus = true;
			const allCheck = [...$('.row-checkbox:checked')]
			allCheck.forEach(res=>{
				let thisStatus = $(res).parents('td').next().find('.badge-pill').html();
				if(thisStatus!="已激活"&&thisStatus!="已暂停"){
					xfStatus = false;
				}
			})
			allCheck.forEach(res=>{
				let thisStatus = $(res).parents('td').next().find('.badge-pill').html();
				if(thisStatus!="已激活"){
					plStatus = false;
				}
			})
			if(xfStatus&&allCheck.length>0) {
				$("#readBtn").removeAttr("disabled")
			} else {
				$("#readBtn").attr("disabled","disabled")
			}
			if(plStatus&&allCheck.length>0) {
				$("#bulkOperation").removeAttr("disabled")
			} else {
				$("#bulkOperation").attr("disabled","disabled")
			}
		});
		$('.row-checkbox').on('change', function () {
			$('input[name="headCheckbox"]').prop('checked', $('.row-checkbox').length === $('.row-checkbox:checked')
				.length)
			// 下面这个判断处理底部按钮的disabled
			if ($('.row-checkbox:checked').length) {
				$('#readBtn').removeAttr('disabled').removeClass('not-allowed');
			} else {
				$('#readBtn').attr('disabled', 'disabled').addClass('not-allowed');
			}

			let statusArr = getCheckStatus() // 获取所有勾选的状态
			if (statusArr.every(i => i == 'Pending')) {
				$('#bulkOperation').addClass('not-allowed').attr('disabled', 'disabled');
			} else {
				$('#bulkOperation').removeClass('not-allowed').removeAttr('disabled');
			}
			// 以产品状态来判断批量操作按钮是否启用
			let xfStatus = true;
			let plStatus = true;
			const allCheck = [...$('.row-checkbox:checked')]
			allCheck.forEach(res=>{
				let thisStatus = $(res).parents('td').next().find('.badge-pill').html();
				if(thisStatus!="已激活"&&thisStatus!="已暂停"){
					xfStatus = false;
				}
			})
			allCheck.forEach(res=>{
				let thisStatus = $(res).parents('td').next().find('.badge-pill').html();
				if(thisStatus!="已激活"){
					plStatus = false;
				}
			})
			if(xfStatus&&allCheck.length>0) {
				$("#readBtn").removeAttr("disabled")
			} else {
				$("#readBtn").attr("disabled","disabled")
			}
			if(plStatus&&allCheck.length>0) {
				$("#bulkOperation").removeAttr("disabled")
			} else {
				$("#bulkOperation").attr("disabled","disabled")
			}
		});

		$('#readBtn').on('click', function () {
			var idArr = getCheckbox()
			var str = idArr.reduce(function (total, item) {
				return total + '&host_ids[]=' + item
			}, '')
			location.href = '/mulitrenew?' + str
		})

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
		// 获取所有勾选项的Status
		const getCheckStatus = function () {
			// 勾选的id
			const statusArr = []
			// 所有表格内的checkbox
			const allCheck = [...$('.row-checkbox:checked')]
			for (const key in allCheck) {
				if (Object.hasOwnProperty.call(allCheck, key)) {
					const item = allCheck[key];
					statusArr.push($(item).attr('data-status'))
				}
			}
			return statusArr
		}

		// 给当前页数据加属性
		for (let i = 0; i < serviceList.length; i++) {
			const item = serviceList[i]
			item.loading = false
			item.status = {
				data: {
					des: '',
					status: ''
				},
				status: 0
			}
		}

		getStatus(serviceList) // 请求列表电源状态
	})
	// 获取所有勾选项的id
	var getCheckbox = function () {
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
	};

	let loopStatusTimer = null; // 循环定时器
	let batchObj = { // 发请求用的对象
		id: [],
		func: '',
		code: ''
	};
	let tableMul = getCheckbox()
	function handleOperating(command) { // 批量操作
		clearInterval(loopStatusTimer)
		batchObj.id.length = 0
		batchObj.func = command
		tableMul = getCheckbox()
		// vue那边的逻辑，直接赋值也行，因为那边的item是row，这边的item直接就是id，所以可以直接push
		for (let i = 0; i < tableMul.length; i++) {
			const item = tableMul[i]
			batchObj.id.push(item)
		}

		$.ajax({
			type: "post",
			url: '' + '/provision/default',
			data: batchObj,
			success: function (data) {
				if (data.status == 200) {
					toastr.success(data.msg)

					loopGetStatus(serviceList)
				}
			}
		});

		// if (this.tableData.length === 1) {
		// 	this.tableData[0].status.data.status = 'process'
		// }

	};

	function getStatus(items) { // 获取列表电源状态
		const obj = {
			id: [],
			func: 'status ',
			code: ''
		}
		items = items.filter(i => {
			if(i.status.data) return i.status.data.status!=='on';
			//return i.status?.data?.status !== 'on'
		})
		if (Array.isArray(items)) {
			for (let i = 0; i < items.length; i++) {
				const element = items[i]
				obj.id.push(element.id)
			}
		}
		if (!obj.id.length) {
			clearInterval(loopStatusTimer)
			loopStatusTimer = null
			return
		}

		$.ajax({
			type: "post",
			url: '' + '/provision/default',
			data: obj,
			success: function (data) {
				// 以下注释部分功能为：
				// 如果全是不能查状态的，或者，能查状态的全开机了，就不再发查询请求，
				// 但是现有问题是：在全开机的情况下，发起批量操作后，第一次查询依旧全是开机状态，则会导致停止查询，需要看后端能不能返回的及时一点
				// 也可以不改，就是查够5分钟或者切换页面就停

				// let allStatus = Object.values(data.data) || []
				// let sucArr = [] // 可以正常返回状态的服务器
				// let errArr = []	// 不支持查询状态的服务器
				// // 把列表服务器分成能查状态的和不能查状态的
				// for (let i = 0; i < allStatus.length; i++) {
				// 	const item = allStatus[i];
				// 	if (item.status === 200) {
				// 		sucArr.push(item)
				// 	} else {
				// 		errArr.push(item)
				// 	}
				// }

				// let allOpen = function () { // 返回是否所有能查状态的服务器全是开机状态
				// 	const statusArr = []
				// 	sucArr.forEach(i=>{
				// 		statusArr.push(i.data.status)
				// 	})
				// 	return statusArr.every(i => i === 'on')
				// }
				// if (!sucArr.length) { // 全都是不能查状态的，结束定时器不查了
				// 	console.log('全都不可以查询状态')
				// 	clearInterval(loopStatusTimer)
				// 	loopStatusTimer = null
				// } else if (allOpen()) {
				// 	console.log('能查状态的全是开机了')
				// 	clearInterval(loopStatusTimer)
				// 	loopStatusTimer = null
				// }
				for (const k in data.data) {
					const element = data.data[k]
					if (element.status === 200) {
						$(`#service${k}`)
							.show()
							.attr('data-original-title', element.data.des);
						setColor(element, k)

					}
				}
			}
		});

	};

	function getSingleStatus(id) { // 单个查状态
		const loadingIcon = `<i class="bx bx-loader bx-spin font-size-14 text-dark" style="position: relative; top: -1px;"></i>`
		$(`#service${id}`).removeClass().addClass('dots ing_color').html(loadingIcon);

		const obj = {
			id: [id],
			func: 'status ',
			code: ''
		}
		$.ajax({
			type: "post",
			url: '' + '/provision/default',
			data: obj,
			success: function (data) {

				const result = data.data[id]
				if (result.status === 200) {
					$(`#service${id}`)
						.show()
						.attr('data-original-title', result.data.des);
					$(`#service${id}`).removeClass().addClass('dots');
					setColor(result, id)
				}
			}
		});
	};

	function setColor(item, id) {
		//console.log('id: ', id);
		//console.log('item: ', item.data.status);
		if (item.data.status === 'on') {
			$(`#service${id}`).removeClass().addClass('dots on_color').html('');
		} else if (item.data.status === 'off') {
			$(`#service${id}`).removeClass().addClass('dots off_color').html('');
		} else if (item.data.status === 'unknown') {
			$(`#service${id}`).removeClass().addClass('dots unknown_color').html('');
		} else if (item.data.status === 'process') {
			const loadingIcon = `<i class="bx bx-loader bx-spin font-size-14 text-dark" style="position: relative; top: -1px;"></i>`
			$(`#service${id}`).removeClass().addClass('dots ing_color').html(loadingIcon);
		}
	};

	function loopGetStatus(items) { // 循环5分钟
		if (loopStatusTimer !== null) { // 如果不是初始值，则恢复成初始值
			clearInterval(loopStatusTimer)
		}
		let endTime = 0
		getStatus(items) // 先调用一次
		loopStatusTimer = setInterval(async () => {
			if (endTime >= 300) { // 超过300秒
				clearInterval(loopStatusTimer)
				loopStatusTimer = null
				return
			}
			getStatus(serviceList)
			endTime += 15
		}, 15 * 1000)
	};



	// 修改备注
	var rowId = 0
	function editNotesHandleClick(id, notes) {
		rowId = id
		$('#modifyNotesModal').modal('show')
		$('#notesInp').val(notes)
	}
	$('#modifyNotesSubmit').on('click', function () {
		$.ajax({
			type: "POST",
			url: '' + '/host/remark',
			data: {
				id: rowId,
				remark: $('#notesInp').val()
			},
			success: function (data) {
				toastr.success(data.msg)
				$('#modifyNotesModal').modal('hide')
				location.reload()
			}
		});
	});


</script>

<script src="/themes/clientarea/default/assets/libs/clipboard/clipboard.min.js?v=<?php echo $Ver; ?>"></script>
<script>
	// var clipboard = null
  // var ips = <?php echo json_encode($Service['list']); ?>;
  // // console.log('ips: ', ips);
  // $(document).on('mouseover', '.iptd', function () {
  //   $('#popModal').modal('show')
  //   $('#popTitle').text('IP地址')
  //   if (clipboard) {
  //     clipboard.destroy()
	// 	}
		
  //   ips.forEach(function(item, index)  {
	// 		if (item.dedicatedip && item.assignedips && $(this).attr('id') == ('ips'+item.id)) {
	// 			var ipbox = `
	// 				<div class="text-right text-primary mb-2 pointer" id="copyip${item.id}" data-clipboard-action="copy" data-clipboard-target="#ippopbox${item.id}">复制</div>
	// 				<div id="ippopbox${item.id}"></div>
	// 			`
				
	// 			$('#popContent').html(ipbox)
	// 			var iplist = ''
	// 			item.assignedips.forEach(ipitem => {
	// 				iplist += `
	// 					<div>${ipitem}</div>
	// 				`
	// 			})
	// 			$('#ippopbox'+item.id).html(iplist)

	// 			// 复制
	// 			clipboard = new ClipboardJS('#copyip'+item.id, {
  //         text: function (trigger) {
  //           return $('#ippopbox'+item.id).text()
  //         },
  //         container: document.getElementById('popModal')
  //       });
  //       clipboard.on('success', function (e) {
  //         toastr.success('<?php echo $Lang['copy_succeeded']; ?>');
  //       })
	// 		}
      
  //   })

    
  // });

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