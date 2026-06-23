<?php /*a:7:{s:70:"/www/wwwroot/cloud.hf.pw2/public/themes/clientarea/ogmiao/security.tpl";i:1743855767;s:75:"/www/wwwroot/cloud.hf.pw2/public/themes/clientarea/ogmiao/includes/head.tpl";i:1742354372;s:75:"/www/wwwroot/cloud.hf.pw2/public/themes/clientarea/ogmiao/includes/menu.tpl";i:1720065013;s:81:"/www/wwwroot/cloud.hf.pw2/public/themes/clientarea/ogmiao/includes/pageheader.tpl";i:1719999923;s:81:"/www/wwwroot/cloud.hf.pw2/public/themes/clientarea/ogmiao/includes/breadcrumb.tpl";i:1719999923;s:76:"/www/wwwroot/cloud.hf.pw2/public/themes/clientarea/ogmiao/includes/modal.tpl";i:1719999923;s:77:"/www/wwwroot/cloud.hf.pw2/public/themes/clientarea/ogmiao/includes/verify.tpl";i:1719999923;}*/ ?>

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
<!-- 二次验证 -->
<div class="modal fade" id="secondVerifyModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle"
	aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title">二次验证</h5>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<form>
					<input type="hidden" value="<?php echo $Token; ?>" />
					<input type="hidden" value="closed" name="action" />
					<div class="form-group row mb-4">
						<label class="col-sm-3 col-form-label text-right">验证方式</label>
						<div class="col-sm-8">
							<select class="form-control" class="second_type" name="type" id="secondVerifyType">
								<?php foreach($AllowType as $type): ?>
									<option value="<?php echo $type['name']; ?>"><?php echo $type['name_zh']; ?>：<?php echo $type['account']; ?></option>
								<?php endforeach; ?>
							</select>
						</div>
					</div>
					<div class="form-group row mb-0">
						<label class="col-sm-3 col-form-label text-right">验证码</label>
						<div class="col-sm-8">
							<div class="input-group">
								<input type="text" name="code" id="secondVerifyCode" class="form-control" placeholder="请输入验证码" />
								<div class="input-group-append" id="getCodeBox">
									<button class="btn btn-secondary" id="secondCode" onclick="getSecurityCode()" type="button">获取验证码</button>
								</div>
							</div>
						</div>
					</div>
				</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-outline-light" data-dismiss="modal">取消</button>
				<button type="button" class="btn btn-primary mr-2" id="secondVerifySubmit" onclick="secondVerifySubmitBtn(this)">确定</button>
			</div>
		</div>
	</div>
</div>


<!-- getModalConfirm 确认弹窗 -->
<div class="modal fade" id="confirmModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle"
	aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title">提示</h5>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body" id="confirmBody">

			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-outline-light" data-dismiss="modal">取消</button>
				<button type="button" class="btn btn-primary" id="confirmSureBtn">确定</button>
			</div>
		</div>
	</div>
</div>
<!-- getModal 自定义body弹窗 -->
<div class="modal fade" id="customModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle"
	aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="customTitle">提示</h5>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body" id="customBody">

			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-outline-light" data-dismiss="modal">取消</button>
				<button type="button" class="btn btn-primary" id="customSureBtn">确定</button>
			</div>
		</div>
	</div>
</div>

<script>
	var Userinfo_allow_second_verify = '<?php echo $Userinfo['allow_second_verify']; ?>'
		,Userinfo_user_second_verify = '<?php echo $Userinfo['user']['second_verify']; ?>'
		,Userinfo_second_verify_action_home = <?php echo json_encode($Userinfo['second_verify_action_home']); ?>
		,Login_allow_second_verify = '<?php echo $Login['allow_second_verify']; ?>'
		,Login_second_verify_action_home = <?php echo json_encode($Login['second_verify_action_home']); ?>;
</script>
<script src="/themes/clientarea/default/assets/js/modal.js?v=<?php echo $Ver; ?>"></script>



<script src="/themes/clientarea/default/assets/js/public.js?v=<?php echo $Ver; ?>"></script>

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

/* Update card body to position decorations properly */
.card-body {
 padding: 25px;
 position: relative;
 overflow: hidden;
}

.card-body .decoration {
 z-index: 1;
}

/* 安全项目样式 */
.security-header {
 position: relative;
 overflow: hidden;
 background: linear-gradient(135deg, var(--primary), var(--secondary));
 border: none;
}

.security-header::before {
 content: "";
 position: absolute;
 top: -50px;
 right: -50px;
 width: 150px;
 height: 150px;
 border-radius: 50%;
 background: linear-gradient(135deg, rgba(255, 255, 255, 0.2), rgba(255, 255, 255, 0.05));
 z-index: 0;
}

.security-header::after {
 content: "";
 position: absolute;
 bottom: -30px;
 left: -30px;
 width: 100px;
 height: 100px;
 border-radius: 50%;
 background: linear-gradient(135deg, rgba(255, 255, 255, 0.2), rgba(255, 255, 255, 0.05));
 z-index: 0;
}

.security-avatar {
 display: flex;
 justify-content: center;
 align-items: center;
}

/* Update security logo to match theme */
.security-logo {
 width: 60px;
 height: 60px;
 display: flex;
 justify-content: center;
 align-items: center;
 font-size: 24px;
 font-weight: bold;
 color: #fff;
 background: linear-gradient(135deg, var(--primary), var(--secondary));
 box-shadow: 0 5px 15px rgba(240, 138, 93, 0.3);
 transition: all 0.3s ease;
 border-radius: 50%;
}

.security-logo:hover {
 transform: scale(1.05);
 box-shadow: 0 8px 20px rgba(240, 138, 93, 0.4);
}

/* Add styles for security-info to remove blue background */
.security-info {
 background: transparent;
 padding: 10px;
 border-radius: 10px;
}

.security-username {
 font-size: 1.5rem;
 font-weight: 600;
 margin-bottom: 0.5rem;
 display: flex;
 align-items: center;
 gap: 10px;
}

.security-strength {
 display: flex;
 flex-direction: column;
 gap: 5px;
}

.security-label {
 font-size: 0.9rem;
 color: rgba(255, 255, 255, 0.8);
}

.security-text {
 font-weight: 500;
}

.security-meta {
 font-size: 0.9rem;
}

.security-meta ul {
 margin-bottom: 0;
}

.security-meta label {
 color: rgba(255, 255, 255, 0.8);
 margin-bottom: 0;
}

.progress {
 height: 6px;
 border-radius: 10px;
 background-color: rgba(255, 255, 255, 0.2);
 overflow: hidden;
}

/* Update progress bar to match theme */
.progress-bar {
 border-radius: 10px;
 background: linear-gradient(90deg, rgba(255, 255, 255, 0.9), rgba(255, 255, 255, 0.7));
}

/* 安全项目卡片 */
/* Update the security items layout to prevent overlapping */
.security-items {
 display: flex;
 flex-direction: column;
 gap: 25px;
 position: relative;
 z-index: 2;
}

/* Add container for security items to prevent decoration overlap */
.security-items-container {
 position: relative;
 z-index: 2;
}

.security-item {
 display: flex;
 align-items: flex-start;
 gap: 20px;
 padding: 20px;
 border-radius: 12px;
 background-color: #fff;
 box-shadow: 0 5px 15px rgba(0, 0, 0, 0.03);
 transition: all 0.3s ease;
 position: relative;
 overflow: hidden;
 z-index: 2;
}

.security-item:hover {
 transform: translateY(-5px);
 box-shadow: 0 10px 25px rgba(0, 0, 0, 0.08);
}

.security-item-icon {
 width: 50px;
 height: 50px;
 border-radius: 12px;
 display: flex;
 justify-content: center;
 align-items: center;
 font-size: 20px;
 color: #fff;
 background: linear-gradient(135deg, var(--primary), var(--secondary));
 box-shadow: 0 5px 15px rgba(240, 138, 93, 0.2);
 transition: all 0.3s ease;
 position: relative;
 z-index: 2;
 margin-right: 15px;
}

.security-item:hover .security-item-icon {
 transform: scale(1.1) rotate(5deg);
}

.security-item-info {
 display: flex;
 flex: 1;
 justify-content: space-between;
 align-items: center;
}

.security-item-text {
 flex: 1;
}

.security-item-title {
 font-size: 1.1rem;
 font-weight: 600;
 margin-bottom: 5px;
 display: flex;
 align-items: center;
 gap: 10px;
}

.security-item-title small {
 font-size: 0.8rem;
 color: var(--primary);
 display: flex;
 align-items: center;
 gap: 5px;
}

.security-item-desc {
 font-size: 0.85rem;
 color: var(--gray);
 max-width: 80%;
}

/* 按钮样式 */
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

.btn-outline-primary {
 color: var(--primary);
 border-color: var(--primary);
 background-color: transparent;
 box-shadow: 0 2px 10px rgba(240, 138, 93, 0.1);
 padding: 0.6rem 1.5rem;
 border-radius: 50px;
 font-weight: 600;
 transition: all 0.3s ease;
 position: relative;
 overflow: hidden;
 z-index: 1;
}

.btn-outline-primary:hover {
 color: #fff;
 background-color: var(--primary);
 border-color: var(--primary);
 transform: translateY(-3px);
 box-shadow: 0 6px 20px rgba(240, 138, 93, 0.3);
}

.btn-outline-primary:active {
 transform: translateY(-1px);
 box-shadow: 0 3px 10px rgba(240, 138, 93, 0.2);
}

.btn-outline-light {
 color: var(--dark);
 border-color: #e0e0e0;
 background-color: transparent;
 box-shadow: 0 2px 8px rgba(0, 0, 0, 0.05);
 padding: 0.6rem 1.5rem;
 border-radius: 50px;
 font-weight: 600;
 transition: all 0.3s ease;
}

.btn-outline-light:hover {
 color: var(--dark);
 background-color: #f8f9fa;
 border-color: #e0e0e0;
 transform: translateY(-3px);
 box-shadow: 0 5px 15px rgba(0, 0, 0, 0.08);
}

/* 表单控件样式 */
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

.input-group-append .btn {
 border-top-right-radius: 8px;
 border-bottom-right-radius: 8px;
}

/* 徽章样式 */
.badge {
 padding: 0.4em 0.8em;
 font-weight: 500;
 border-radius: 50px;
}

.badge-success {
 background-color: #28c76f;
 box-shadow: 0 3px 8px rgba(40, 199, 111, 0.3);
}

.badge-light {
 background-color: rgba(255, 255, 255, 0.9);
 color: var(--primary);
 box-shadow: 0 3px 8px rgba(0, 0, 0, 0.1);
}

/* 模态框样式 */
.modal-content {
 border: none;
 border-radius: 15px;
 box-shadow: 0 15px 35px rgba(0, 0, 0, 0.1);
 overflow: hidden;
}

.modal-header {
 border-bottom: 1px solid rgba(240, 138, 93, 0.1);
 padding: 1.5rem;
}

.modal-body {
 padding: 1.5rem;
}

.modal-footer {
 border-top: 1px solid rgba(240, 138, 93, 0.1);
 padding: 1.5rem;
}

/* 响应式调整 */
@media (max-width: 992px) {
 .security-item-info {
   flex-direction: column;
   align-items: flex-start;
   gap: 15px;
 }
 
 .security-item-desc {
   max-width: 100%;
 }
}

@media (max-width: 768px) {
 .security-meta ul li {
   display: block;
   margin-bottom: 5px;
 }
 
 .security-item {
   flex-direction: column;
   align-items: flex-start;
   padding: 15px;
   margin-bottom: 10px;
 }
 
 .security-item-icon {
   margin-bottom: 15px;
   margin-right: 0;
 }

 .security-items {
   gap: 15px;
 }
 
 .card .decoration-1,
 .card .decoration-2,
 .decoration-3 {
   width: 80px;
   height: 80px;
 }
}

@media (max-width: 576px) {
 .card-body {
   padding: 15px;
 }
 
 .security-username {
   font-size: 1.2rem;
 }
 
 .security-item-title {
   font-size: 1rem;
 }
 
 .security-item-desc {
   font-size: 0.8rem;
 }
}

/* 装饰元素 */
.decoration {
 position: absolute;
 border-radius: 50%;
 background: linear-gradient(135deg, rgba(255, 255, 255, 0.3), rgba(255, 255, 255, 0.1));
 opacity: 0.2;
 z-index: 0;
}

/* Update the card decoration positioning */
.card .decoration-1 {
 top: -50px;
 right: -50px;
 width: 150px;
 height: 150px;
}

.card .decoration-2 {
 bottom: -50px;
 left: -50px;
 width: 120px;
 height: 120px;
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

/* Add a third decoration for more visual interest */
.decoration-3 {
 width: 80px;
 height: 80px;
 top: 50%;
 right: -40px;
 animation: float 7s ease-in-out infinite 0.5s;
}

@keyframes float {
 0% { transform: translateY(0px); }
 50% { transform: translateY(-10px); }
 100% { transform: translateY(0px); }
}

.novalid {
 min-width: 80px;
 height: 26px;
 line-height: 20px;
 background-color: rgba(253, 254, 254, 0.32);
 box-shadow: 0px 6px 14px 2px rgba(6, 31, 179, 0.26);
 border-radius: 4px;
 color: #fff;
}

/* Update sidebar cards to have proper spacing */
.col-sm-4 .card .security-item {
 margin-bottom: 0;
}

/* Update sidebar cards to match main card styling */
.col-sm-4 .card .card-body {
 padding: 20px;
}

.col-sm-4 .security-item {
 box-shadow: none;
 padding: 0;
 margin-bottom: 0;
}

.col-sm-4 .security-item::before {
 display: none;
}

.col-sm-4 .security-item-info {
 flex-direction: column;
 align-items: flex-start;
 gap: 15px;
}

/* Add hover effect to all buttons */
.btn {
 transition: all 0.3s ease;
}

.btn:hover {
 transform: translateY(-3px);
 box-shadow: 0 6px 15px rgba(0, 0, 0, 0.1);
}

/* Update modal styling for consistency */
.modal-content {
 border-radius: 15px;
 overflow: hidden;
}

.modal-header {
 background: linear-gradient(to right, var(--primary-light), var(--primary));
 color: white;
 border-bottom: none;
}

.modal-header .close {
 color: white;
 opacity: 0.8;
 transition: opacity 0.3s ease;
}

.modal-header .close:hover {
 opacity: 1;
}

/* Update bg-info class to use theme colors instead of blue */
.bg-info {
 background-color: var(--secondary) !important;
}

/* Search for any box-shadow properties with blue colors (#4677fb, #527ef5) and replace them with the theme's primary colors */

/* If there are any box-shadow properties with blue colors like:
box-shadow: inset 0 0 0 10px #4677fb, inset 0 0 0 20px #527ef5;
*/

/* Replace them with the theme's primary colors: */
/* For example:
box-shadow: inset 0 0 0 10px var(--primary), inset 0 0 0 20px var(--secondary);
*/

/* Check for any other blue colors in the CSS and replace them */
/* For example, if there are any background colors or border colors with blue values */
/* Replace #4677fb with var(--primary) or #f08a5d */
/* Replace #527ef5 with var(--secondary) or #f9b384 */

/* If there are any specific instances of box-shadow with blue colors that aren't visible in the provided code snippet, 
   they should be replaced with the theme's primary colors */
</style>
<div class="card mb-4 security-header">
	<div class="card-body">
        <div class="decoration decoration-1"></div>
        <div class="decoration decoration-2"></div>
		<div class="row align-items-center text-white pl-md-4">
			<div class="col-sm-2 col-md-1 phonehide">
				<div class="security-avatar">
					<div class="security-logo p-4 rounded-circle">
						<?php if(preg_match("/^[0-9]*[A-Za-z]+$/is", substr($Userinfo['user']['username'],0,1))): ?>
						<?php echo strtoupper(substr($Userinfo['user']['username'],0,1)); elseif(preg_match("/^[\x7f-\xff]*$/", substr($Userinfo['user']['username'],0,3))): ?>
						<?php echo substr($Userinfo['user']['username'],0,3); else: ?>
						<?php echo strtoupper(substr($Userinfo['user']['username'],0,1)); ?>
						<?php endif; ?>
					</div>
				</div>
			</div>
			<div class="col-sm-3 ml-3">
				<div class="security-info">
					<div class="security-username">
						<?php echo $Userinfo['user']['username']; if($Setting['certifi_open']==1): if($Userinfo['user']['certifi']['status'] == '1'): ?>
						<span class="badge badge-success"><?php echo $Lang['real_name_authentication']; ?></span>
						<?php else: ?>
						<span class="badge badge-light novalid"><?php echo $Lang['no_real_name_authentication']; ?></span>
						<?php endif; ?>
						<?php endif; ?>
					</div>
					<div class="security-strength">
						<div class="security-label">
							<?php echo $Lang['account_security_strength']; ?>:
							<span class="security-text">
								<?php echo $percentage[0]; ?>
							</span>
						</div>
						<div class="security-text">
							<div class="progress">
								<div class="progress-bar" role="progressbar" style="width: <?php echo $percentage[1]; ?>%"
									aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="col-sm-5">
				<div class="security-meta">
					<ul class="list-inline mb-2">
						<li class="list-inline-item">
							<label class="mb-0"><?php echo $Lang['mailbox']; ?>：</label>
							<?php if($Userinfo['user']['email']): ?>
							<?php echo $Userinfo['user']['email']; else: ?>
							<?php echo $Lang['unbound']; ?>
							<?php endif; ?>
						</li>

						<li class="list-inline-item">
							<label class="mb-0"><?php echo $Lang['opening_time']; ?>：</label>
							<?php echo date("Y-m-d H:i:s",!is_numeric($Userinfo['user']['create_time'])? strtotime($Userinfo['user']['create_time']) : $Userinfo['user']['create_time']); ?>
						</li>
						<ul class="list-inline mb-0">
							<li class="list-inline-item">
								<label class="mb-0"><?php echo $Lang['mobile_phone']; ?>：</label>
								<?php if($Userinfo['user']['phonenumber']): ?>
								<?php echo $Userinfo['user']['phonenumber']; else: ?>
								<?php echo $Lang['unbound']; ?>
								<?php endif; ?>
							</li>
						</ul>
					</ul>
				</div>
			</div>
		</div>
	</div>
</div>

<div class="row">
	<div class="col-sm-8">
		<div class="card mb-3">
			<div class="card-body">
                <div class="decoration decoration-1"></div>
                <div class="decoration decoration-2"></div>
                <div class="decoration decoration-3"></div>
				<div class="security-items-container">
					<div class="security-items">

					<div class="security-item">
						<div class="security-item-icon bg-primary">
							<i class="far fa-key"></i>
						</div>
						<div class="security-item-info">
							<div class="security-item-text">
								<h4 class="security-item-title">
									<?php echo $Lang['login_password']; if($Userinfo['user']['is_password']): ?>
									<small style="white-space: nowrap;">
										<i class="far fa-check-circle"></i>
										<?php echo $Lang['set']; ?>
									</small>
									<?php endif; ?>
								</h4>
								<div class="security-item-desc">
									<?php echo $Lang['regularly_details']; ?>
								</div>
							</div>
							<?php if($Userinfo['user']['is_password']): ?>
							<a class="btn btn-outline-primary w-md waves-effect waves-light" data-toggle="modal"
								data-target="#modifyPasswordModal" onclick="showPassword()"><?php echo $Lang['modify']; ?></a>
							<?php else: ?>
							<a data-target="#modifyPasswordModal" onclick="showPassword()" data-toggle="modal"
								class="btn btn-outline-primary w-md waves-effect waves-light"><?php echo $Lang['set_password']; ?></a>
							<?php endif; ?>
						</div>
					</div>
					<!-- Security-item END -->
					<?php if($Userinfo['shd_allow_sms_send']): ?>
					<div class="security-item">
						<div class="security-item-icon bg-info">
							<i class="far fa-mobile-android"></i>
						</div>
						<div class="security-item-info">
							<div class="security-item-text">
								<h4 class="security-item-title">
									<?php echo $Lang['mobile_phone_binding']; if($Userinfo['user']['phonenumber']): ?>
									<small style="white-space: nowrap;">
										<span
											class="phonehide"><?php echo substr($Userinfo['user']['phonenumber'],0,3); ?>****<?php echo substr($Userinfo['user']['phonenumber'],7,11); ?></span>
										<i class="far fa-check-circle"></i>
										<?php echo $Lang['set']; ?>
									</small>
									<?php endif; ?>
								</h4>
								<div class="security-item-desc">
									<?php echo $Lang['regularly_details']; ?>
								</div>
							</div>
							<?php if($Userinfo['user']['phonenumber']&&$BindPhoneChange==0): ?>
							<a class="btn btn-outline-primary w-md waves-effect waves-light" data-toggle="modal"
								data-target="#bindPhoneChangeModal1" id="bindPhoneChangeBtn1"><?php echo $Lang['modify']; ?></a>
							<?php elseif($Userinfo['user']['phonenumber']&&$BindPhoneChange==1): ?>

							<a class="btn btn-outline-primary w-md waves-effect waves-light" data-toggle="modal"
								data-target="#bindPhoneChangeModal2" id="bindPhoneChangeBtn2"><?php echo $Lang['modify']; ?></a>
							<?php else: ?>

							<a class="btn btn-outline-primary w-md waves-effect waves-light" data-toggle="modal"
								data-target="#bindPhoneModal"><?php echo $Lang['bind_now']; ?></a>
							<?php endif; ?>
						</div>
					</div>
					<?php endif; ?>
					<!-- Security-item END -->

					<?php if($Userinfo['shd_allow_email_send']): ?>
					<div class="security-item">
						<div class="security-item-icon bg-primary">
							<i class="far fa-envelope-open"></i>
						</div>
						<div class="security-item-info">
							<div class="security-item-text">
								<h4 class="security-item-title">
									<?php echo $Lang['mailbox_binding']; if($Userinfo['user']['email']): ?>
									<small style="white-space: nowrap;">
										<span class="phonehide"><?php echo $Userinfo['user']['email']; ?></span>
										<i class="far fa-check-circle"></i>
										<?php echo $Lang['set']; ?>
									</small>
									<?php endif; ?>
								</h4>
								<div class="security-item-desc">
									<?php echo $Lang['reset_password_notice']; ?>
								</div>
							</div>
							<?php if($Userinfo['user']['email']&&$BindEmailChange==0): ?>

							<a class="btn btn-outline-primary w-md waves-effect waves-light" data-toggle="modal"
								data-target="#changeEmailHandleModal1"><?php echo $Lang['modify']; ?></a>
							<?php elseif($Userinfo['user']['email']&&$BindEmailChange==1): ?>

							<a class="btn btn-outline-primary w-md waves-effect waves-light" data-toggle="modal"
								data-target="#changeEmailHandleModal2"><?php echo $Lang['modify']; ?></a>
							<?php else: ?>

							<a class="btn btn-outline-primary w-md waves-effect waves-light" data-toggle="modal"
								data-target="#bindEmailHandleModal"><?php echo $Lang['mailbox_binding']; ?></a>
							<?php endif; ?>
						</div>
					</div>
					<?php endif; ?>
					<!-- Security-item END -->

					<?php if($Setting['certifi_open']==1): ?>
					<div class="security-item">
						<div class="security-item-icon bg-info">
							<i class="far fa-id-card"></i>
						</div>
						<div class="security-item-info">
							<div class="security-item-text">
								<h4 class="security-item-title">
									<?php echo $Lang['real_name_authentications']; if($Userinfo['user']['certifi']['status']==1): ?>
									<small style="white-space: nowrap;">
										<i class="far fa-check-circle"></i>
										<?php echo $Lang['set']; ?>
									</small>
									<?php endif; ?>
								</h4>
								<div class="security-item-desc">
									<?php echo $Lang['personal_security']; ?>
								</div>
							</div>
							<?php if($Userinfo['user']['certifi']['status'] == 1): if($Userinfo['user']['certifi']['type'] == 'certifi_person'): ?>
							<a href="verified?action=enterprises&step=info"
								class="btn btn-outline-primary w-md waves-effect waves-light">去企业认证</a>
							<?php else: ?>
							<a href="verified" class="btn btn-outline-primary w-md waves-effect waves-light"><?php echo $Lang['certified']; ?></a>
							<?php endif; else: ?>
							<a href="verified" class="btn btn-primary w-md waves-effect waves-light"><?php echo $Lang['not_certified']; ?></a>

							<?php endif; ?>
						</div>
					</div>
					<!-- Security-item END -->
					<?php endif; if($Userinfo['allow_second_verify']): ?>
					<div class="security-item">
						<div class="security-item-icon bg-info">
							<i class="far fa-shield-check"></i>
						</div>
						<div class="security-item-info">
							<div class="security-item-text">
								<h4 class="security-item-title">
									<?php echo $Lang['secondary_verification']; if($Userinfo['user']['second_verify']): ?>
									<small style="white-space: nowrap;">
										<i class="far fa-check-circle"></i>
										<?php echo $Lang['set']; ?>
									</small>
									<?php endif; ?>
								</h4>
								<div class="security-item-desc">
									<?php echo $Lang['secondary_verification_details']; ?>
								</div>
							</div>
							<?php if($Userinfo['user']['second_verify']): ?>

							<a class="btn btn-primary w-md waves-effect waves-light"
								onclick="closeSecondHandleClick()"><?php echo $Lang['close']; ?></a>
							<?php else: ?>

							<a class="btn btn-primary w-md waves-effect waves-light" data-toggle="modal"
								data-target="#toggleSecondVerifyModalOpen"><?php echo $Lang['opens_two']; ?></a>
							<?php endif; ?>
						</div>
					</div>
					<!-- Security-item END -->
					<?php endif; if($Userinfo['allow_resource_api']): ?>
					<!-- <div class="security-item">
						<div class="security-item-icon bg-primary">
							<i class="far fa-link"></i>
						</div>
						<div class="security-item-info">
							<div class="security-item-text">
								<h4 class="security-item-title">
									API
								</h4>
								<div class="security-item-desc">
									<?php echo $Lang['administration_details']; ?>
								</div>
							</div>

							<a class="btn btn-primary w-md waves-effect waves-light" onclick="showApiPwdHandleClick()"><?php echo $Lang['view_secret_key']; ?></a>
						</div>
					</div> -->
					<!-- Security-item END -->
					<?php endif; if($Bot==1): ?>
					<div class="security-item">
						<div class="security-item-icon bg-primary">
							<i class="far fa-link-horizontal"></i>
						</div>
						<div class="security-item-info">
							<div class="security-item-text">
								<h4 class="security-item-title">
									<?php echo $Lang['interflow_license']; ?>
								</h4>
								<div class="security-item-desc">
									<?php echo $Lang['interflow_license_details']; ?>
								</div>
							</div>

							<a class="btn btn-primary w-md waves-effect waves-light"
								onclick="showInterflowlicenseHandleClick()"><?php echo $Lang['license']; ?></a>
						</div>
					</div>
					<!-- Security-item END -->
					<?php endif; ?>
				</div>
				</div>
			</div>
		</div>
	</div>
	<div class="col-sm-4">

		<?php if($Userinfo['shd_allow_sms_send']): ?>
		<div class="card mb-3">
			<div class="card-body">
                <div class="decoration decoration-1"></div>
                <div class="decoration decoration-2"></div>
				<div class="security-item">
					<div class="security-item-info">
						<div class="security-item-text">
							<h4 class="security-item-title">
								<?php echo $Lang['sms_reminder']; ?>
							</h4>
							<div class="security-item-desc">
								<?php echo $Lang['sms_settings']; ?>
							</div>
						</div>
						<?php if(!$Userinfo['user']['phonenumber']): ?>
						<button data-v-2d646d70="" disabled="disabled" type="button"
							class="btn btn-outline-primary w-md waves-effect waves-light"><?php echo $Lang['need_bind_mobile_phone']; ?></button>
						<?php elseif($Userinfo['user']['is_login_sms_reminder']==1): ?>

						<a class="btn btn-outline-primary w-md waves-effect waves-light" data-toggle="modal"
							data-target="#loginSmsReminderModal"><?php echo $Lang['cancel']; ?></a>
						<?php else: ?>

						<a class="btn btn-outline-primary w-md waves-effect waves-light" data-toggle="modal"
							data-target="#loginSmsReminderModalOpen"><?php echo $Lang['opens_two']; ?></a>
						<?php endif; ?>
					</div>
				</div>
				<!-- Security-item END -->

			</div>
		</div>
		<?php endif; if($Userinfo['shd_allow_email_send']): ?>
		<div class="card mb-3">
			<div class="card-body">
                <div class="decoration decoration-1"></div>
                <div class="decoration decoration-2"></div>
				<div class="security-item">
					<div class="security-item-info">
						<div class="security-item-text">
							<h4 class="security-item-title">
								<?php echo $Lang['email_reminder']; ?>
							</h4>
							<div class="security-item-desc">
								<?php echo $Lang['mailbox_settings']; ?>
							</div>
						</div>
						<?php if(!$Userinfo['user']['email']): ?>
						<button data-v-2d646d70="" disabled="disabled" type="button"
							class="btn btn-outline-primary w-md waves-effect waves-light"><?php echo $Lang['need_bind_mailbox']; ?></button>
						<?php elseif($Userinfo['user']['email_remind']==1): ?>

						<a class="btn btn-outline-primary w-md waves-effect waves-light" data-toggle="modal"
							data-target="#loginEmailReminderModal"><?php echo $Lang['cancel']; ?></a>
						<?php else: ?>

						<a class="btn btn-outline-primary w-md waves-effect waves-light" data-toggle="modal"
							data-target="#loginEmailReminderModalOpen"><?php echo $Lang['set_up_now']; ?></a>
						<?php endif; ?>
					</div>
				</div>
				<!-- Security-item END -->

			</div>
		</div>
		<?php endif; if($Security['oauthBind']): ?>
		<div class="card">
			<div class="card-body">
                <div class="decoration decoration-1"></div>
                <div class="decoration decoration-2"></div>
				<h4 class="card-title mb-4"><?php echo $Lang['third_party_login']; ?></h4>
				<?php foreach($Security['oauthBind'] as $oauth): ?>
				<div class="security-item">
					<div class="security-item-icon">
						<?php echo $oauth['img']; ?>
					</div>
					<div class="security-item-info">
						<div class="security-item-text">
							<h4 class="security-item-title">
								<?php echo $oauth['name']; ?>

							</h4>
							<div class="security-item-desc">
								<?php if($oauth['oauth']=="bind"): ?>
								<?php echo $Lang['nickname']; ?>：<?php echo $oauth['username']; elseif($oauth['oauth'] == 'unbind'): ?>
								<?php echo $Lang['unbound']; ?>
								<?php endif; ?>
							</div>
						</div>
						<?php if($oauth['oauth'] == 'unbind'): ?>
						<a href="<?php echo $oauth['url']; ?>" class="btn btn-primary w-md waves-effect waves-light"><?php echo $Lang['binding']; ?></a>
						<?php elseif($oauth['oauth'] == 'bind'): ?>
						<a href="javascript: getModal('oauthBind/untie/<?php echo $oauth['dirName']; ?>', '<?php echo $Lang['prompt']; ?>', '<?php echo $Lang['make_sure_unbind']; ?><?php echo $oauth['name']; ?>?', {status: 1});"
							class="btn btn-outline-primary w-md waves-effect waves-light"><?php echo $Lang['solution']; ?></a>
						<?php endif; ?>
					</div>
				</div>
				<!-- Security-item END -->

				<?php endforeach; ?>

			</div>
		</div>
		<?php else: ?>
		<div class="security-item-image"></div>
		<?php endif; ?>
	</div>
</div>


<!-- start: 修改密码模态框 -->
<div class="modal fade" id="modifyPasswordModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle"
	aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalCenterTitle"><?php if($Userinfo['user']['is_password']): ?><?php echo $Lang['change_password']; else: ?><?php echo $Lang['set_password']; ?><?php endif; ?></h5>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<form id="modifyPwdForm" class="needs-validation" novalidate>
					<?php if($Userinfo['user']['is_password']): ?>
					<div class="form-group row">
						<label class="col-sm-3 col-form-label text-right"><?php echo $Lang['original_password']; ?></label>
						<div class="col-sm-8">
							<div class="input-group">
		
								<input type="password" name="old_password" class="form-control old_password" id="oldPwd"
									onblur="oldPwdBlur()" placeholder="<?php echo $Lang['security_please_enter_password']; ?>" required />
								<div class="input-group-append">
									<button type="button" class="btn btn-secondary  old_password_btn">
										<i class="far fa-eye"></i>
									</button>
								</div>
							</div>
							<input type="hidden" name="flag" vaule="1" />
						</div>
					</div>
					<?php else: ?>
					<input type="hidden" name="flag" vaule="2" />
					<?php endif; ?>
					<div class="form-group row">
						<label class="col-sm-3 col-form-label text-right"><?php if($Userinfo['user']['is_password']): ?><?php echo $Lang['new_password']; else: ?><?php echo $Lang['password']; ?><?php endif; ?></label>
						<div class="col-sm-8">
							<div class="input-group">
								<input type="password" name="password" class="form-control password" id="pwd" onblur="pwdBlur()"
									placeholder="<?php if($Userinfo['user']['is_password']): ?><?php echo $Lang['security_please_new_password']; else: ?><?php echo $Lang['security_please_password']; ?><?php endif; ?>"
									required />
								<div class="input-group-append">
									<button type="button" class="btn btn-secondary  password_btn">
										<i class="far fa-eye"></i>
									</button>
								</div>
							</div>
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-3 col-form-label text-right"><?php if($Userinfo['user']['is_password']): ?><?php echo $Lang['repeat_new_password']; else: ?><?php echo $Lang['repeat_then_password']; ?><?php endif; ?></label>
						<div class="col-sm-8">
							<div class="input-group">
								<input type="password" name="re_password" class="form-control re_password" id="rePwd"
									onblur="rePwdBlur()"
									placeholder="<?php if($Userinfo['user']['is_password']): ?><?php echo $Lang['repeat_new_password']; else: ?><?php echo $Lang['repeat_password']; ?><?php endif; ?>"
									required />
								<div class="input-group-append">
									<button type="button" class="btn btn-secondary  re_password_btn">
										<i class="far fa-eye"></i>
									</button>
								</div>
							</div>
						</div>
					</div>
					<?php if($Verify['allow_resetpwd_captcha']==1&&$Userinfo['user']['is_password']): if($Verify['is_captcha']==1): if([positon]=='top'): ?>
<div class="form-group allow_resetpwd_captcha">
    <label >图形验证码</label>
    <div class="input-group">
      <input  <?php if([id]=='[id]'): ?>id="captcha_allow_resetpwd_captcha[id]"<?php else: ?>id="captcha_allow_resetpwd_captcha"<?php endif; ?> type="text" name="captcha" class="form-control "  placeholder="请输入验证码" />
      <div class="input-group-append">
        <img  <?php if([id]=='[id]'): ?>id="allow_resetpwd_captcha[id]"<?php else: ?>id="allow_resetpwd_captcha"<?php endif; ?>   width="120px" class="border pointer" alt="验证码" onClick="getVerify('allow_resetpwd_captcha')">
      </div>
    </div>
</div>
<?php else: ?>

<div class="form-group row">
  <label class="col-sm-3 col-form-label text-right">图形验证码</label>
  <div class="col-sm-8">
    <div class="input-group">
      <input <?php if([id]=='[id]'): ?>id="captcha_allow_resetpwd_captcha[id]"<?php else: ?>id="captcha_allow_resetpwd_captcha"<?php endif; ?> type="text" name="captcha" class="form-control "  placeholder="请输入验证码" />
      <div class="input-group-append">
        <img <?php if([id]=='[id]'): ?>id="allow_resetpwd_captcha[id]"<?php else: ?> id="allow_resetpwd_captcha"<?php endif; ?>  width="120px" class="border pointer" alt="验证码" onClick="getVerify('allow_resetpwd_captcha','[id]')">
      </div>
    </div>
  </div>
</div>
<?php endif; ?>



<script>
  getVerify('allow_resetpwd_captcha','[id]')

</script>
<?php endif; elseif($Verify['allow_setpwd_captcha']==1&&!$Userinfo['user']['is_password']): if($Verify['is_captcha']==1): if([positon]=='top'): ?>
<div class="form-group allow_setpwd_captcha">
    <label >图形验证码</label>
    <div class="input-group">
      <input  <?php if([id]=='[id]'): ?>id="captcha_allow_setpwd_captcha[id]"<?php else: ?>id="captcha_allow_setpwd_captcha"<?php endif; ?> type="text" name="captcha" class="form-control "  placeholder="请输入验证码" />
      <div class="input-group-append">
        <img  <?php if([id]=='[id]'): ?>id="allow_setpwd_captcha[id]"<?php else: ?>id="allow_setpwd_captcha"<?php endif; ?>   width="120px" class="border pointer" alt="验证码" onClick="getVerify('allow_setpwd_captcha')">
      </div>
    </div>
</div>
<?php else: ?>

<div class="form-group row">
  <label class="col-sm-3 col-form-label text-right">图形验证码</label>
  <div class="col-sm-8">
    <div class="input-group">
      <input <?php if([id]=='[id]'): ?>id="captcha_allow_setpwd_captcha[id]"<?php else: ?>id="captcha_allow_setpwd_captcha"<?php endif; ?> type="text" name="captcha" class="form-control "  placeholder="请输入验证码" />
      <div class="input-group-append">
        <img <?php if([id]=='[id]'): ?>id="allow_setpwd_captcha[id]"<?php else: ?> id="allow_setpwd_captcha"<?php endif; ?>  width="120px" class="border pointer" alt="验证码" onClick="getVerify('allow_setpwd_captcha','[id]')">
      </div>
    </div>
  </div>
</div>
<?php endif; ?>



<script>
  getVerify('allow_setpwd_captcha','[id]')

</script>
<?php endif; ?>
					<?php endif; ?>
				</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-primary mr-2" id="modifyPwdSubmit"
					onclick="modifyPwdCheckForm()"><?php echo $Lang['determine']; ?></button>
				<button type="button" class="btn btn-outline-light" data-dismiss="modal"><?php echo $Lang['cancel']; ?></button>
			</div>
		</div>
	</div>
</div>
<script>
	var _url = '';
	var phoneType = '<?php echo $BindPhoneChange; ?>'
	var is_password = '<?php echo $Userinfo['user']['is_password']; ?>';
	var emailType = '<?php echo $BindEmailChange; ?>'
	var WebUrl = '/';
	//修改密码input事件
	function oldPwdBlur() {
		var oldPwd = document.getElementById('oldPwd')
		if (oldPwd && oldPwd.value == '') {
			oldPwd.classList.remove("is-valid"); //清除合法状态
			oldPwd.classList.add("is-invalid"); //添加非法状态
			return
		} else if (oldPwd) {
			oldPwd.classList.remove("is-invalid");
			oldPwd.classList.add("is-valid");
		}
	}

	function validateCode() {
		var valCode = document.getElementById('loginSmsReminderCode')
		if (valCode.value == '') {
			valCode.classList.remove("is-valid"); //清除合法状态
			valCode.classList.add("is-invalid"); //添加非法状态
			return
		} else if (valCode) {
			valCode.classList.remove("is-invalid");
			valCode.classList.add("is-valid");
		}
	}

	function emailReminderCode() {
		var emailReminderCode = document.getElementById('loginEmailReminderCode')
		if (emailReminderCode.value == '') {
			emailReminderCode.classList.remove("is-valid"); //清除合法状态
			emailReminderCode.classList.add("is-invalid"); //添加非法状态
			return
		} else if (emailReminderCode) {
			emailReminderCode.classList.remove("is-invalid");
			emailReminderCode.classList.add("is-valid");
		}
	}

	function pwdBlur() {
		var pwd = document.getElementById('pwd')
		if (pwd.value == '') {
			pwd.classList.remove("is-valid"); //清除合法状态
			pwd.classList.add("is-invalid"); //添加非法状态
			return
		} else {
			pwd.classList.remove("is-invalid");
			pwd.classList.add("is-valid");
		}
	}

	function rePwdBlur() {
		var rePwd = document.getElementById('rePwd')
		if (rePwd.value == '') {
			rePwd.classList.remove("is-valid"); //清除合法状态
			rePwd.classList.add("is-invalid"); //添加非法状态
			return
		} else {
			rePwd.classList.remove("is-invalid");
			rePwd.classList.add("is-valid");
		}
	}
	//修改手机绑定模态框 input事件
	function bindPhoneChangeCode1Blur() {
		var code1 = document.getElementById('bindPhoneChangeCode1')
		if (code1.value == '') {
			code1.classList.remove("is-valid"); //清除合法状态
			code1.classList.add("is-invalid"); //添加非法状态
			return
		} else {
			code1.classList.remove("is-invalid");
			code1.classList.add("is-valid");
		}
	}
	//修改手机绑定模态框 input事件
	function changeEmailHandleCodeBlur() {
		var code1 = document.getElementById('changeEmailHandleCode1')
		if (code1.value == '') {
			code1.classList.remove("is-valid"); //清除合法状态
			code1.classList.add("is-invalid"); //添加非法状态
			return
		} else {
			code1.classList.remove("is-invalid");
			code1.classList.add("is-valid");
		}
	}
</script>
<!-- end: 修改密码模态框 -->

<!-- start: 手机绑定模态框 -->
<div class="modal fade" id="bindPhoneModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle"
	aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalCenterTitle"><?php echo $Lang['mobile_phone_binding']; ?></h5>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<form>
					<input type="hidden" value="<?php echo $Token; ?>" />
					<input type="hidden" name="phone_code" value="+86" />
					<div class="form-group row">
						<label class="col-sm-3 col-form-label text-right"><?php echo $Lang['phone_number']; ?></label>
						<div class="col-sm-8">
							<input type="text" name="phone" class="form-control" id="phoneNum" placeholder="<?php echo $Lang['input_mobile']; ?>" />
						</div>
					</div>
					<?php if($Verify['allow_phone_bind_captcha']==1): if($Verify['is_captcha']==1): if([positon]=='top'): ?>
<div class="form-group allow_phone_bind_captcha">
    <label >图形验证码</label>
    <div class="input-group">
      <input  <?php if(captchaPhone1=='captchaPhone1'): ?>id="captcha_allow_phone_bind_captchacaptchaPhone1"<?php else: ?>id="captcha_allow_phone_bind_captcha"<?php endif; ?> type="text" name="captcha" class="form-control "  placeholder="请输入验证码" />
      <div class="input-group-append">
        <img  <?php if(captchaPhone1=='captchaPhone1'): ?>id="allow_phone_bind_captchacaptchaPhone1"<?php else: ?>id="allow_phone_bind_captcha"<?php endif; ?>   width="120px" class="border pointer" alt="验证码" onClick="getVerify('allow_phone_bind_captcha')">
      </div>
    </div>
</div>
<?php else: ?>

<div class="form-group row">
  <label class="col-sm-3 col-form-label text-right">图形验证码</label>
  <div class="col-sm-8">
    <div class="input-group">
      <input <?php if(captchaPhone1=='captchaPhone1'): ?>id="captcha_allow_phone_bind_captchacaptchaPhone1"<?php else: ?>id="captcha_allow_phone_bind_captcha"<?php endif; ?> type="text" name="captcha" class="form-control "  placeholder="请输入验证码" />
      <div class="input-group-append">
        <img <?php if(captchaPhone1=='captchaPhone1'): ?>id="allow_phone_bind_captchacaptchaPhone1"<?php else: ?> id="allow_phone_bind_captcha"<?php endif; ?>  width="120px" class="border pointer" alt="验证码" onClick="getVerify('allow_phone_bind_captcha','captchaPhone1')">
      </div>
    </div>
  </div>
</div>
<?php endif; ?>



<script>
  getVerify('allow_phone_bind_captcha','captchaPhone1')

</script>
<?php endif; ?>
					<?php endif; ?>
					<div class="form-group row">
						<label class="col-sm-3 col-form-label text-right"><?php echo $Lang['verification_code']; ?></label>
						<div class="col-sm-8">
							<div class="input-group">
								<input type="text" name="code" class="form-control " id="code"
									placeholder="<?php echo $Lang['please_enter_code']; ?>" />
								<div class="input-group-append">
									<button
										onclick="getCheckCode('bind_phone','phone','bind-phone-button','post', undefined, 'bindPhoneModal','captcha_allow_phone_bind_captchacaptchaPhone1')"
										class="btn btn-primary bind-phone-button" type="button"><?php echo $Lang['get_code']; ?></button>
								</div>
							</div>
						</div>
					</div>

				</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-primary mr-2" id="bindPhoneSubmit"
					onclick="bindPhoneCheckForm()"><?php echo $Lang['determine']; ?></button>
				<button type="button" class="btn btn-outline-light" data-dismiss="modal"><?php echo $Lang['cancel']; ?></button>
			</div>
		</div>
	</div>
</div>
<!-- start: 修改手机绑定 -->
<div class="modal fade" id="bindPhoneChangeModal1" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle"
	aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalCenterTitle"><?php echo $Lang['verify_original_phone']; ?></h5>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<form>
					<input type="hidden" value="<?php echo $Token; ?>" />
					<input type="hidden" name="type" value="<?php if($BindPhoneChange==0): ?>1<?php else: ?>2<?php endif; ?>" />
					<input type="hidden" name="phone_code" value="+86" />
					<div class="form-group row mb-4">
						<label class="col-sm-3 col-form-label text-right"><?php echo $Lang['phone_number']; ?></label>
						<div class="col-sm-8">
							<?php if($Userinfo['user']['phonenumber']): ?>
							<input type="text" name="tel" readonly id="oldTel"
								value="<?php echo substr($Userinfo['user']['phonenumber'],0,3); ?>****<?php echo substr($Userinfo['user']['phonenumber'],7,11); ?>"
								class="form-control" placeholder="<?php echo $Lang['input_mobile']; ?>" />
							<?php endif; ?>
						</div>
					</div>
					<?php if($Verify['allow_phone_bind_captcha']==1): if($Verify['is_captcha']==1): if([positon]=='top'): ?>
<div class="form-group allow_phone_bind_captcha">
    <label >图形验证码</label>
    <div class="input-group">
      <input  <?php if(captchaPhone2=='captchaPhone2'): ?>id="captcha_allow_phone_bind_captchacaptchaPhone2"<?php else: ?>id="captcha_allow_phone_bind_captcha"<?php endif; ?> type="text" name="captcha" class="form-control "  placeholder="请输入验证码" />
      <div class="input-group-append">
        <img  <?php if(captchaPhone2=='captchaPhone2'): ?>id="allow_phone_bind_captchacaptchaPhone2"<?php else: ?>id="allow_phone_bind_captcha"<?php endif; ?>   width="120px" class="border pointer" alt="验证码" onClick="getVerify('allow_phone_bind_captcha')">
      </div>
    </div>
</div>
<?php else: ?>

<div class="form-group row">
  <label class="col-sm-3 col-form-label text-right">图形验证码</label>
  <div class="col-sm-8">
    <div class="input-group">
      <input <?php if(captchaPhone2=='captchaPhone2'): ?>id="captcha_allow_phone_bind_captchacaptchaPhone2"<?php else: ?>id="captcha_allow_phone_bind_captcha"<?php endif; ?> type="text" name="captcha" class="form-control "  placeholder="请输入验证码" />
      <div class="input-group-append">
        <img <?php if(captchaPhone2=='captchaPhone2'): ?>id="allow_phone_bind_captchacaptchaPhone2"<?php else: ?> id="allow_phone_bind_captcha"<?php endif; ?>  width="120px" class="border pointer" alt="验证码" onClick="getVerify('allow_phone_bind_captcha','captchaPhone2')">
      </div>
    </div>
  </div>
</div>
<?php endif; ?>



<script>
  getVerify('allow_phone_bind_captcha','captchaPhone2')

</script>
<?php endif; ?>
					<?php endif; ?>
					<div class="form-group row mb-0">
						<label class="col-sm-3 col-form-label text-right"><?php echo $Lang['verification_code']; ?></label>
						<div class="col-sm-8">
							<div class="input-group">
								<input type="text" name="code" id="bindPhoneChangeCode1" class="form-control "
									onblur="bindPhoneChangeCode1Blur()" placeholder="<?php echo $Lang['please_enter_code']; ?>" />
								<div class="input-group-append">
									<button
										onclick="getCheckCode('bind_phone_code','tel','bind-phone-button1','get',1, 'bindPhoneChangeModal1','captcha_allow_phone_bind_captchacaptchaPhone2')"
										class="btn btn-primary bind-phone-button1" type="button"><?php echo $Lang['get_code']; ?></button>
								</div>
							</div>
						</div>
					</div>
				</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-primary mr-2" id="bindPhoneChangeSubmit1"
					onclick="phoneChangeBtn()"><?php echo $Lang['determine']; ?></button>
				<button type="button" class="btn btn-outline-light" data-dismiss="modal"><?php echo $Lang['cancel']; ?></button>
			</div>
		</div>
	</div>
</div>
<div class="modal fade" id="bindPhoneChangeModal2" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle"
	aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalCenterTitle"><?php echo $Lang['bind_mobile_phone']; ?></h5>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<form>
					<input type="hidden" value="<?php echo $Token; ?>" />
					<input type="hidden" name="type" value="<?php if($BindPhoneChange==0): ?>1<?php else: ?>2<?php endif; ?>" />
					<input type="hidden" name="phone_code" value="+86" />
					<div class="form-group row mb-4">
						<label class="col-sm-3 col-form-label text-right"><?php echo $Lang['phone_number']; ?></label>
						<div class="col-sm-8">
							<input type="text" name="tel" id="newTel" class="form-control" placeholder="<?php echo $Lang['input_mobile']; ?>" />
						</div>
					</div>
					<?php if($Verify['allow_phone_bind_captcha']==1): if($Verify['is_captcha']==1): if([positon]=='top'): ?>
<div class="form-group allow_phone_bind_captcha">
    <label >图形验证码</label>
    <div class="input-group">
      <input  <?php if(captchaPhone3=='captchaPhone3'): ?>id="captcha_allow_phone_bind_captchacaptchaPhone3"<?php else: ?>id="captcha_allow_phone_bind_captcha"<?php endif; ?> type="text" name="captcha" class="form-control "  placeholder="请输入验证码" />
      <div class="input-group-append">
        <img  <?php if(captchaPhone3=='captchaPhone3'): ?>id="allow_phone_bind_captchacaptchaPhone3"<?php else: ?>id="allow_phone_bind_captcha"<?php endif; ?>   width="120px" class="border pointer" alt="验证码" onClick="getVerify('allow_phone_bind_captcha')">
      </div>
    </div>
</div>
<?php else: ?>

<div class="form-group row">
  <label class="col-sm-3 col-form-label text-right">图形验证码</label>
  <div class="col-sm-8">
    <div class="input-group">
      <input <?php if(captchaPhone3=='captchaPhone3'): ?>id="captcha_allow_phone_bind_captchacaptchaPhone3"<?php else: ?>id="captcha_allow_phone_bind_captcha"<?php endif; ?> type="text" name="captcha" class="form-control "  placeholder="请输入验证码" />
      <div class="input-group-append">
        <img <?php if(captchaPhone3=='captchaPhone3'): ?>id="allow_phone_bind_captchacaptchaPhone3"<?php else: ?> id="allow_phone_bind_captcha"<?php endif; ?>  width="120px" class="border pointer" alt="验证码" onClick="getVerify('allow_phone_bind_captcha','captchaPhone3')">
      </div>
    </div>
  </div>
</div>
<?php endif; ?>



<script>
  getVerify('allow_phone_bind_captcha','captchaPhone3')

</script>
<?php endif; ?>
					<?php endif; ?>
					<div class="form-group row mb-0">
						<label class="col-sm-3 col-form-label text-right"><?php echo $Lang['verification_code']; ?></label>
						<div class="col-sm-8">
							<div class="input-group">
								<input type="text" name="code" id="bindPhoneChangeCode2" class="form-control "
									placeholder="<?php echo $Lang['please_enter_code']; ?>" />
								<div class="input-group-append">
									<button id="bindPhoneChangeCodeBtn2"
										onclick="getCheckCode('bind_phone_code','tel','bind-phone-button2','get',2, 'bindPhoneChangeModal2','captcha_allow_phone_bind_captchacaptchaPhone3')"
										class="btn btn-primary bind-phone-button2" type="button"><?php echo $Lang['get_code']; ?></button>
								</div>
							</div>
						</div>
					</div>
				</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-primary mr-2" id="bindPhoneChangeSubmit2"
					onclick="phoneChangeBtn2()"><?php echo $Lang['determine']; ?></button>
				<button type="button" class="btn btn-outline-light" data-dismiss="modal"><?php echo $Lang['cancel']; ?></button>
			</div>
		</div>
	</div>
</div>
<!-- start 短信提醒 关闭 -->
<div class="modal fade" id="loginSmsReminderModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle"
	aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalCenterTitle"><?php echo $Lang['turn_off_sms_alert']; ?></h5>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<form>
					<input type="hidden" value="<?php echo $Token; ?>" />
					<input type="hidden" name="phone_code" value="+86" />
					<div class="form-group row">
						<label class="col-sm-3 col-form-label text-right"><?php echo $Lang['phone_number']; ?></label>
						<div class="col-sm-8">
							<input type="text" name="name" readonly
								value="<?php echo substr($Userinfo['user']['phonenumber'],0,3); ?>****<?php echo substr($Userinfo['user']['phonenumber'],7,11); ?>"
								class="form-control" placeholder="<?php echo $Lang['input_mobile']; ?>" />
						</div>
					</div>
					<?php if($Verify['allow_cancel_sms_captcha']==1): if($Verify['is_captcha']==1): if([positon]=='top'): ?>
<div class="form-group allow_cancel_sms_captcha">
    <label >图形验证码</label>
    <div class="input-group">
      <input  <?php if(captchaSms1=='captchaSms1'): ?>id="captcha_allow_cancel_sms_captchacaptchaSms1"<?php else: ?>id="captcha_allow_cancel_sms_captcha"<?php endif; ?> type="text" name="captcha" class="form-control "  placeholder="请输入验证码" />
      <div class="input-group-append">
        <img  <?php if(captchaSms1=='captchaSms1'): ?>id="allow_cancel_sms_captchacaptchaSms1"<?php else: ?>id="allow_cancel_sms_captcha"<?php endif; ?>   width="120px" class="border pointer" alt="验证码" onClick="getVerify('allow_cancel_sms_captcha')">
      </div>
    </div>
</div>
<?php else: ?>

<div class="form-group row">
  <label class="col-sm-3 col-form-label text-right">图形验证码</label>
  <div class="col-sm-8">
    <div class="input-group">
      <input <?php if(captchaSms1=='captchaSms1'): ?>id="captcha_allow_cancel_sms_captchacaptchaSms1"<?php else: ?>id="captcha_allow_cancel_sms_captcha"<?php endif; ?> type="text" name="captcha" class="form-control "  placeholder="请输入验证码" />
      <div class="input-group-append">
        <img <?php if(captchaSms1=='captchaSms1'): ?>id="allow_cancel_sms_captchacaptchaSms1"<?php else: ?> id="allow_cancel_sms_captcha"<?php endif; ?>  width="120px" class="border pointer" alt="验证码" onClick="getVerify('allow_cancel_sms_captcha','captchaSms1')">
      </div>
    </div>
  </div>
</div>
<?php endif; ?>



<script>
  getVerify('allow_cancel_sms_captcha','captchaSms1')

</script>
<?php endif; ?>
					<?php endif; ?>
					<div class="form-group row">
						<label class="col-sm-3 col-form-label text-right"><?php echo $Lang['verification_code']; ?></label>
						<div class="col-sm-8">
							<div class="input-group">
								<input type="text" name="code" class="form-control " id="loginSmsReminderCode"
									placeholder="<?php echo $Lang['please_enter_code']; ?>" onblur="validateCode()" />
								<div class="input-group-append">
									<button
										onclick="getCheckCode('remind_send','phone','bind-phone-button','get', undefined, 'loginSmsReminderModal',id='captcha_allow_cancel_sms_captchacaptchaSms1')"
										class="btn btn-primary bind-phone-button" type="button"><?php echo $Lang['get_code']; ?></button>
								</div>

							</div>
						</div>
					</div>

				</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-primary mr-2" id="loginSmsReminderSubmit"
					onclick="loginSmsReminderCheckForm()"><?php echo $Lang['determine']; ?></button>
				<button type="button" class="btn btn-outline-light" data-dismiss="modal"><?php echo $Lang['cancel']; ?></button>
			</div>
		</div>
	</div>
</div>
<!-- start: 短信提醒 开启 -->
<div class="modal fade" id="loginSmsReminderModalOpen" tabindex="-1" role="dialog"
	aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title"><?php echo $Lang['prompt']; ?></h5>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<div class="d-flex align-items-center">
					<i class="far fa-exclamation-circle fs-20 text-warning mr-2"></i>
					<?php echo $Lang['on_reminder']; ?>
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-primary mr-2" id="loginSmsReminderSubmitOpen"
					onclick="smsSubmitOpenBtn()"><?php echo $Lang['determine']; ?></button>
				<button type="button" class="btn btn-outline-light" data-dismiss="modal"><?php echo $Lang['cancel']; ?></button>
			</div>
		</div>
	</div>
</div>

<!-- end -->


<!-- start: 邮箱绑定 -->
<div class="modal fade" id="bindEmailHandleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle"
	aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title"><?php echo $Lang['mailbox_binding']; ?></h5>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<form>
					<input type="hidden" value="<?php echo $Token; ?>" />
					<div class="form-group row mb-4">
						<label class="col-sm-3 col-form-label text-right"><?php echo $Lang['mailbox']; ?></label>
						<div class="col-sm-8">
							<input type="text" name="email" class="form-control" placeholder="<?php echo $Lang['please_input_email']; ?>"
								id="bindEmailHandleEmail" />
						</div>
					</div>
					<?php if($Verify['allow_email_bind_captcha']==1): if($Verify['is_captcha']==1): if([positon]=='top'): ?>
<div class="form-group allow_email_bind_captcha">
    <label >图形验证码</label>
    <div class="input-group">
      <input  <?php if(captchaEmail1=='captchaEmail1'): ?>id="captcha_allow_email_bind_captchacaptchaEmail1"<?php else: ?>id="captcha_allow_email_bind_captcha"<?php endif; ?> type="text" name="captcha" class="form-control "  placeholder="请输入验证码" />
      <div class="input-group-append">
        <img  <?php if(captchaEmail1=='captchaEmail1'): ?>id="allow_email_bind_captchacaptchaEmail1"<?php else: ?>id="allow_email_bind_captcha"<?php endif; ?>   width="120px" class="border pointer" alt="验证码" onClick="getVerify('allow_email_bind_captcha')">
      </div>
    </div>
</div>
<?php else: ?>

<div class="form-group row">
  <label class="col-sm-3 col-form-label text-right">图形验证码</label>
  <div class="col-sm-8">
    <div class="input-group">
      <input <?php if(captchaEmail1=='captchaEmail1'): ?>id="captcha_allow_email_bind_captchacaptchaEmail1"<?php else: ?>id="captcha_allow_email_bind_captcha"<?php endif; ?> type="text" name="captcha" class="form-control "  placeholder="请输入验证码" />
      <div class="input-group-append">
        <img <?php if(captchaEmail1=='captchaEmail1'): ?>id="allow_email_bind_captchacaptchaEmail1"<?php else: ?> id="allow_email_bind_captcha"<?php endif; ?>  width="120px" class="border pointer" alt="验证码" onClick="getVerify('allow_email_bind_captcha','captchaEmail1')">
      </div>
    </div>
  </div>
</div>
<?php endif; ?>



<script>
  getVerify('allow_email_bind_captcha','captchaEmail1')

</script>
<?php endif; ?>
					<?php endif; ?>
					<div class="form-group row mb-0">
						<label class="col-sm-3 col-form-label text-right"><?php echo $Lang['verification_code']; ?></label>
						<div class="col-sm-8">
							<div class="input-group">
								<input type="text" name="code" class="form-control" placeholder="<?php echo $Lang['please_enter_code']; ?>"
									id="bindEmailHandleCode" />
								<div class="input-group-append">
									<button class="btn btn-primary bind-email-button"
										onclick="getCheckCode('bind_email','email','bind-email-button','post', undefined, 'bindEmailHandleModal','captcha_allow_email_bind_captchacaptchaEmail1')"
										type="button" id="button-addon2"><?php echo $Lang['get_code']; ?></button>
								</div>
							</div>
						</div>
					</div>

				</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-primary mr-2" id="bindEmailHandleSubmit"
					onclick="bindEmailHandleCheckForm()"><?php echo $Lang['determine']; ?></button>
				<button type="button" class="btn btn-outline-light" data-dismiss="modal"><?php echo $Lang['cancel']; ?></button>
			</div>
		</div>
	</div>
</div>
<!-- start: 邮箱修改 -->
<div class="modal fade" id="changeEmailHandleModal1" tabindex="-1" role="dialog"
	aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title"><?php echo $Lang['verify_original_email']; ?></h5>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<form>
					<input type="hidden" value="<?php echo $Token; ?>" />
					<input type="hidden" name="type" value="<?php if($BindEmailChange==0): ?>1<?php else: ?>2<?php endif; ?>" />
					<div class="form-group row mb-4">
						<label class="col-sm-3 col-form-label text-right"><?php echo $Lang['mailbox']; ?></label>
						<div class="col-sm-8">
							<input type="text" name="email" id="changeEmailHandleEmail1" readonly value="<?php echo $Userinfo['user']['email']; ?>"
								class="form-control" placeholder="<?php echo $Lang['please_input_email']; ?>" />
						</div>
					</div>
					<?php if($Verify['allow_email_bind_captcha']==1): if($Verify['is_captcha']==1): if([positon]=='top'): ?>
<div class="form-group allow_email_bind_captcha">
    <label >图形验证码</label>
    <div class="input-group">
      <input  <?php if(captchaEmail2=='captchaEmail2'): ?>id="captcha_allow_email_bind_captchacaptchaEmail2"<?php else: ?>id="captcha_allow_email_bind_captcha"<?php endif; ?> type="text" name="captcha" class="form-control "  placeholder="请输入验证码" />
      <div class="input-group-append">
        <img  <?php if(captchaEmail2=='captchaEmail2'): ?>id="allow_email_bind_captchacaptchaEmail2"<?php else: ?>id="allow_email_bind_captcha"<?php endif; ?>   width="120px" class="border pointer" alt="验证码" onClick="getVerify('allow_email_bind_captcha')">
      </div>
    </div>
</div>
<?php else: ?>

<div class="form-group row">
  <label class="col-sm-3 col-form-label text-right">图形验证码</label>
  <div class="col-sm-8">
    <div class="input-group">
      <input <?php if(captchaEmail2=='captchaEmail2'): ?>id="captcha_allow_email_bind_captchacaptchaEmail2"<?php else: ?>id="captcha_allow_email_bind_captcha"<?php endif; ?> type="text" name="captcha" class="form-control "  placeholder="请输入验证码" />
      <div class="input-group-append">
        <img <?php if(captchaEmail2=='captchaEmail2'): ?>id="allow_email_bind_captchacaptchaEmail2"<?php else: ?> id="allow_email_bind_captcha"<?php endif; ?>  width="120px" class="border pointer" alt="验证码" onClick="getVerify('allow_email_bind_captcha','captchaEmail2')">
      </div>
    </div>
  </div>
</div>
<?php endif; ?>



<script>
  getVerify('allow_email_bind_captcha','captchaEmail2')

</script>
<?php endif; ?>
					<?php endif; ?>
					<div class="form-group row mb-0">
						<label class="col-sm-3 col-form-label text-right"><?php echo $Lang['verification_code']; ?></label>
						<div class="col-sm-8">
							<div class="input-group">
								<input type="text" name="code" id="changeEmailHandleCode1" onblur="changeEmailHandleCodeBlur()"
									class="form-control" placeholder="<?php echo $Lang['please_enter_code']; ?>" />
								<div class="input-group-append">
									<button class="btn btn-primary bind-email-button1"
										onclick="getCheckCode('change_email','email','bind-email-button1','post',1, 'changeEmailHandleModal1','captcha_allow_email_bind_captchacaptchaEmail2')"
										type="button" id="button-addon2"><?php echo $Lang['get_code']; ?></button>
								</div>
							</div>
						</div>
					</div>
				</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-primary mr-2" id="changeEmailHandleSubmit1"
					onclick="changeEmailBtn()"><?php echo $Lang['determine']; ?></button>
				<button type="button" class="btn btn-outline-light" data-dismiss="modal"><?php echo $Lang['cancel']; ?></button>
			</div>
		</div>
	</div>
</div>
<div class="modal fade" id="changeEmailHandleModal2" tabindex="-1" role="dialog"
	aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title"><?php echo $Lang['bind_new_mailbox']; ?></h5>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<form>
					<input type="hidden" value="<?php echo $Token; ?>" />
					<input type="hidden" name="type" value="<?php if($BindEmailChange==0): ?>1<?php else: ?>2<?php endif; ?>" id="captcha3" />
					<div class="form-group row mb-4">
						<label class="col-sm-3 col-form-label text-right"><?php echo $Lang['mailbox']; ?></label>
						<div class="col-sm-8">
							<input type="text" name="email" id="changeEmailHandleEmail2" class="form-control"
								placeholder="<?php echo $Lang['please_input_email']; ?>" />
						</div>
					</div>
					<?php if($Verify['allow_email_bind_captcha']==1): if($Verify['is_captcha']==1): if([positon]=='top'): ?>
<div class="form-group allow_email_bind_captcha">
    <label >图形验证码</label>
    <div class="input-group">
      <input  <?php if(captchaEmail3=='captchaEmail3'): ?>id="captcha_allow_email_bind_captchacaptchaEmail3"<?php else: ?>id="captcha_allow_email_bind_captcha"<?php endif; ?> type="text" name="captcha" class="form-control "  placeholder="请输入验证码" />
      <div class="input-group-append">
        <img  <?php if(captchaEmail3=='captchaEmail3'): ?>id="allow_email_bind_captchacaptchaEmail3"<?php else: ?>id="allow_email_bind_captcha"<?php endif; ?>   width="120px" class="border pointer" alt="验证码" onClick="getVerify('allow_email_bind_captcha')">
      </div>
    </div>
</div>
<?php else: ?>

<div class="form-group row">
  <label class="col-sm-3 col-form-label text-right">图形验证码</label>
  <div class="col-sm-8">
    <div class="input-group">
      <input <?php if(captchaEmail3=='captchaEmail3'): ?>id="captcha_allow_email_bind_captchacaptchaEmail3"<?php else: ?>id="captcha_allow_email_bind_captcha"<?php endif; ?> type="text" name="captcha" class="form-control "  placeholder="请输入验证码" />
      <div class="input-group-append">
        <img <?php if(captchaEmail3=='captchaEmail3'): ?>id="allow_email_bind_captchacaptchaEmail3"<?php else: ?> id="allow_email_bind_captcha"<?php endif; ?>  width="120px" class="border pointer" alt="验证码" onClick="getVerify('allow_email_bind_captcha','captchaEmail3')">
      </div>
    </div>
  </div>
</div>
<?php endif; ?>



<script>
  getVerify('allow_email_bind_captcha','captchaEmail3')

</script>
<?php endif; ?>
					<?php endif; ?>
					<div class="form-group row mb-0">
						<label class="col-sm-3 col-form-label text-right"><?php echo $Lang['verification_code']; ?></label>
						<div class="col-sm-8">
							<div class="input-group">
								<input type="text" name="code" id="changeEmailHandleCode2" class="form-control"
									placeholder="<?php echo $Lang['please_enter_code']; ?>" />
								<div class="input-group-append">
									<button class="btn btn-primary bind-email-button2"
										onclick="getCheckCode('change_email','email','bind-email-button2','post',2, 'changeEmailHandleModal2','captcha_allow_email_bind_captchacaptchaEmail3')"
										type="button" id="button-addon2"><?php echo $Lang['get_code']; ?></button>
								</div>
							</div>
						</div>
					</div>
				</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-primary mr-2" id="changeEmailHandleSubmit2"
					onclick="changeEmailBtn2()"><?php echo $Lang['determine']; ?></button>
				<button type="button" class="btn btn-outline-light" data-dismiss="modal"><?php echo $Lang['cancel']; ?></button>
			</div>
		</div>
	</div>
</div>
<!-- start: 邮箱提醒 关闭 -->
<div class="modal fade id="loginEmailReminderModal" tabindex="-1" role="dialog"
	aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title"><?php echo $Lang['off_reminder']; ?></h5>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<form>
					<input type="hidden" value="<?php echo $Token; ?>" />
					<div class="form-group row mb-4">
						<label class="col-sm-3 col-form-label text-right"><?php echo $Lang['mailbox']; ?></label>
						<div class="col-sm-8">
							<input type="text" name="email" readonly value="<?php echo $Userinfo['user']['email']; ?>" class="form-control"
								placeholder="<?php echo $Lang['please_input_email']; ?>" />
						</div>
					</div>
					<?php if($Verify['allow_cancel_email_captcha']==1): if($Verify['is_captcha']==1): if([positon]=='top'): ?>
<div class="form-group allow_cancel_email_captcha">
    <label >图形验证码</label>
    <div class="input-group">
      <input  <?php if([id]=='[id]'): ?>id="captcha_allow_cancel_email_captcha[id]"<?php else: ?>id="captcha_allow_cancel_email_captcha"<?php endif; ?> type="text" name="captcha" class="form-control "  placeholder="请输入验证码" />
      <div class="input-group-append">
        <img  <?php if([id]=='[id]'): ?>id="allow_cancel_email_captcha[id]"<?php else: ?>id="allow_cancel_email_captcha"<?php endif; ?>   width="120px" class="border pointer" alt="验证码" onClick="getVerify('allow_cancel_email_captcha')">
      </div>
    </div>
</div>
<?php else: ?>

<div class="form-group row">
  <label class="col-sm-3 col-form-label text-right">图形验证码</label>
  <div class="col-sm-8">
    <div class="input-group">
      <input <?php if([id]=='[id]'): ?>id="captcha_allow_cancel_email_captcha[id]"<?php else: ?>id="captcha_allow_cancel_email_captcha"<?php endif; ?> type="text" name="captcha" class="form-control "  placeholder="请输入验证码" />
      <div class="input-group-append">
        <img <?php if([id]=='[id]'): ?>id="allow_cancel_email_captcha[id]"<?php else: ?> id="allow_cancel_email_captcha"<?php endif; ?>  width="120px" class="border pointer" alt="验证码" onClick="getVerify('allow_cancel_email_captcha','[id]')">
      </div>
    </div>
  </div>
</div>
<?php endif; ?>



<script>
  getVerify('allow_cancel_email_captcha','[id]')

</script>
<?php endif; ?>
					<?php endif; ?>
					<div class="form-group row mb-0">
						<label class="col-sm-3 col-form-label text-right"><?php echo $Lang['verification_code']; ?></label>
						<div class="col-sm-8">
							<div class="input-group">
								<input type="text" name="code" id="loginEmailReminderCode" class="form-control"
									placeholder="<?php echo $Lang['please_enter_code']; ?>" onblur="emailReminderCode()" />
								<div class="input-group-append">
									<button class="btn btn-primary bind-email-button"
										onclick="getCheckCode('remind_email_send','email','bind-email-button','get', undefined, 'loginEmailReminderModal','captcha_allow_cancel_email_captcha')"
										type="button" id="button-addon2"><?php echo $Lang['get_code']; ?></button>
								</div>
							</div>
						</div>
					</div>

				</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-primary mr-2" id="loginEmailReminderSubmit"
					onclick="loginEmailReminderCheckForm()"><?php echo $Lang['determine']; ?></button>
				<button type="button" class="btn btn-outline-light" data-dismiss="modal"><?php echo $Lang['cancel']; ?></button>
			</div>
		</div>
	</div>
</div>
<!-- start: 邮箱提醒 开启 -->
<div class="modal fade" id="loginEmailReminderModalOpen" tabindex="-1" role="dialog"
	aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title"><?php echo $Lang['prompt']; ?></h5>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<div class="d-flex align-items-center">
					<i class="far fa-exclamation-circle fs-20 text-warning mr-2"></i>
					<?php echo $Lang['open_mailbox_reminder']; ?>
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-primary mr-2" id="loginEmailReminderSubmitOpen"
					onclick="loginEmailReminderSubmitOpen()"><?php echo $Lang['determine']; ?></button>
				<button type="button" class="btn btn-outline-light" data-dismiss="modal"><?php echo $Lang['cancel']; ?></button>
			</div>
		</div>
	</div>
</div>
<!-- start: 二次验证 开启 -->
<div class="modal fade" id="toggleSecondVerifyModalOpen" tabindex="-1" role="dialog"
	aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title"><?php echo $Lang['prompt']; ?></h5>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<div class="d-flex align-items-center">
					<i class="far fa-exclamation-circle fs-20 text-warning mr-2"></i>
					<?php echo $Lang['determine_verification']; ?>
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-outline-light" data-dismiss="modal"><?php echo $Lang['cancel']; ?></button>
				<button type="button" class="btn btn-primary mr-2" id="toggleSecondVerifySubmitOpen"
					onclick="toggleSecondVerifySubmitOpen()"><?php echo $Lang['determine']; ?></button>
			</div>
		</div>
	</div>
</div>

<!-- start: api -->
<div class="modal fade" id="getapiModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle"
	aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title"><?php echo $Lang['modify_key']; ?></h5>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<form>
					<div class="form-group row">
						<label class="col-sm-2 col-form-label text-right"><?php echo $Lang['api_key']; ?></label>
						<div class="col-sm-9">
							<div class="input-group">
								<input id="copy-apiss" type="password" name="api" value="<?php echo $Userinfo['user']['api_password']; ?>"
									data-clipboard-text="<?php echo $Userinfo['user']['api_password']; ?>" class="form-control api_passwordss"
									placeholder="<?php echo $Lang['please_enter_code']; ?>" />
								<div class="input-group-append">
									<button type="button" class="btn btn-secondary btn-password">
										<i class="far fa-eye"></i>
									</button>
								</div>
							</div>
						</div>
					</div>
					<div class="form-group row mb-0">
						<label class="col-sm-2"></label>
						<div class="col-sm-8">
							<button type="button" class="btn btn-default btn-sm btn-copies w-xs mr-1"
								data-clipboard-target="#copy-apiss" id="btn-copies" onclick="cpBtn()">
								<?php echo $Lang['copy']; ?>
							</button>
							<button type="button" onClick="getApiPwd()" class="btn btn-default btn-sm btn-random w-xs">
								<?php echo $Lang['reset']; ?>
							</button>
						</div>
					</div>
				</form>
				<script src="/themes/clientarea/default/assets/libs/clipboard/clipboard.min.js"></script>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-primary mr-2" id="getapiModalSubmit"
					onclick="getapiModalCheckForm()"><?php echo $Lang['determine']; ?></button>
				<button type="button" class="btn btn-outline-light" data-dismiss="modal"><?php echo $Lang['cancel']; ?></button>
			</div>
		</div>
	</div>
</div>

<!-- start: interflow -->
<div class="modal fade" id="interflowModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle"
	aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title"><?php echo $Lang['seting_license']; ?></h5>

				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<form id="accountbind-form">
					
					<div class="form-group row">
						<label class="col-sm-2 col-form-label text-right" name="i_type">
						</label>
						<div class="col-sm-9">
							<div class="input-group">
								<input id="copy-apiss" name="qq" class="form-control"/>
							</div>
						</div>
					</div>

				</form>
				<script src="/themes/clientarea/default/assets/libs/clipboard/clipboard.min.js"></script>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-primary mr-2" id="getapiModalSubmit"
					onclick="getapiModalCheckForm()"><?php echo $Lang['determine']; ?></button>
				<button type="button" class="btn btn-outline-light" data-dismiss="modal"><?php echo $Lang['cancel']; ?></button>
			</div>
		</div>
	</div>
</div>

<script src="/themes/clientarea/default/assets/js/security.js?v=<?php echo $Ver; ?>"></script>

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