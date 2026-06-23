<?php /*a:8:{s:69:"/www/wwwroot/cloud.hf.pw2/public/themes/clientarea/ogmiao/billing.tpl";i:1743844276;s:75:"/www/wwwroot/cloud.hf.pw2/public/themes/clientarea/ogmiao/includes/head.tpl";i:1742354372;s:75:"/www/wwwroot/cloud.hf.pw2/public/themes/clientarea/ogmiao/includes/menu.tpl";i:1720065013;s:81:"/www/wwwroot/cloud.hf.pw2/public/themes/clientarea/ogmiao/includes/pageheader.tpl";i:1719999923;s:81:"/www/wwwroot/cloud.hf.pw2/public/themes/clientarea/ogmiao/includes/breadcrumb.tpl";i:1719999923;s:81:"/www/wwwroot/cloud.hf.pw2/public/themes/clientarea/ogmiao/includes/tablestyle.tpl";i:1719999923;s:84:"/www/wwwroot/cloud.hf.pw2/public/themes/clientarea/ogmiao/includes/deleteConfirm.tpl";i:1719999923;s:79:"/www/wwwroot/cloud.hf.pw2/public/themes/clientarea/ogmiao/includes/paymodal.tpl";i:1719999923;}*/ ?>

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

<!-- getModal 自定义body弹窗 -->
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
<script type="text/javascript">
  $(function () {

  });
  function deleteConfirm(action, title, text, data) {
    if (!title) {
      title = '<?php echo $Lang['prompt']; ?>';
    }
    if (text) {
      content = '<div class="d-flex align-items-center"><i class="fas fa-exclamation-circle fs-20 text-warning mr-2"></i> ' + text + '</div>';
      area = ['420px'];
    } else {
      content = $('.' + action).html();
      area = ['500px'];
    }
    $('#customModal').modal('show')
		$('#customBody').html(content)
		$(document).on('click', '#customSureBtn', function () {
			var WebUrl = '/';
			if (data && !$('#customBody').find('form').eq(0).serialize()) {
				data = data;
			} else {
				data = $('#customBody').find('form').eq(0).serialize();
			}
			$.ajax({
				url: WebUrl + action + '/' + data.id,
				type: 'DELETE',
				data: data,
				dataType: 'json',
				beforeSend: function () {
				},
				success: function (data) {
					if (data.status == '200') {
						toastr.success(data.msg);
						
						location.reload()
					} else {
						toastr.error(data.msg);
					}
				}
			});
		});
    
  }
</script>

<style>
/* 账单页面样式 */
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

.card {
  border: none;
  border-radius: 15px;
  box-shadow: 0 10px 25px rgba(0, 0, 0, 0.05);
  transition: all 0.3s ease;
  overflow: hidden;
  margin-bottom: 20px;
}

.card-body {
  padding: 20px;
}

/* 表格容器样式 */
.table-container {
  position: relative;
}

/* 表格头部样式 */
.table-header {
  display: flex;
  justify-content: space-between;
  align-items: center;
  margin-bottom: 15px;
  flex-wrap: wrap;
}

/* 状态选择器样式 */
#statusSel {
  height: 38px;
  border-radius: 8px;
  border: 1px solid rgba(240, 138, 93, 0.2);
  transition: all 0.3s ease;
  box-shadow: 0 2px 10px rgba(240, 138, 93, 0.05);
  padding: 0.375rem 1.75rem 0.375rem 0.75rem;
  background-color: #fff;
}

#statusSel:focus {
  border-color: var(--primary);
  box-shadow: 0 0 0 0.2rem rgba(240, 138, 93, 0.25);
  outline: none;
}

#statusSel:hover {
  border-color: var(--primary);
  box-shadow: 0 2px 8px rgba(240, 138, 93, 0.15);
  transform: translateY(-1px);
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
  color: rgba(0, 0, 0, 0.1);
  transition: all 0.3s ease;
}

.pointer:hover .bx-caret-up,
.pointer:hover .bx-caret-down {
  color: var(--primary);
}

/* 状态标签样式 */
.status {
  padding: 5px 10px;
  border-radius: 50px;
  font-size: 12px;
  font-weight: 600;
  display: inline-block;
  text-transform: capitalize;
}

.status-unpaid {
  background-color: rgba(255, 159, 67, 0.15);
  color: #ff9f43;
}

.status-paid {
  background-color: rgba(40, 199, 111, 0.15);
  color: #28c76f;
}

.status-cancelled {
  background-color: rgba(234, 84, 85, 0.15);
  color: #ea5455;
}

.status-refunded {
  background-color: rgba(0, 207, 232, 0.15);
  color: #00cfe8;
}

/* 操作按钮样式 */
.text-success, .text-primary, .text-danger {
  transition: all 0.3s ease;
}

.text-success {
  color: #28c76f !important;
}

.text-primary {
  color: var(--primary) !important;
}

.text-danger {
  color: #ea5455 !important;
}

.text-success:hover, .text-primary:hover, .text-danger:hover {
  opacity: 0.8;
  transform: translateY(-2px);
}

/* 账单号样式 */
.badge-light {
  background-color: rgba(240, 138, 93, 0.1);
  color: var(--primary);
  font-weight: 600;
  padding: 5px 10px;
  border-radius: 5px;
  transition: all 0.3s ease;
}

.badge-light:hover {
  background-color: rgba(240, 138, 93, 0.2);
  transform: translateY(-1px);
}

/* 表格底部样式 */
.table-footer {
  display: flex;
  justify-content: space-between;
  align-items: center;
  padding: 15px 0;
  flex-wrap: wrap;
}

.table-tools {
  display: flex;
  align-items: center;
  margin-bottom: 10px;
}

.table-pagination {
  display: flex;
  align-items: center;
}

/* 合并支付按钮样式 */
.btn-primary {
  background-color: var(--primary);
  border-color: var(--primary);
  color: white;
  box-shadow: 0 4px 15px rgba(240, 138, 93, 0.3);
  border-radius: 50px;
  padding: 0.5rem 1.5rem;
  font-weight: 600;
  transition: all 0.3s ease;
}

.btn-primary:hover {
  background-color: var(--primary-dark);
  border-color: var(--primary-dark);
  transform: translateY(-3px);
  box-shadow: 0 6px 20px rgba(240, 138, 93, 0.4);
}

.btn-primary:disabled {
  background-color: rgba(240, 138, 93, 0.5);
  border-color: rgba(240, 138, 93, 0.5);
  box-shadow: none;
  cursor: not-allowed;
}

/* 合并支付信息样式 */
#pay-combine {
  color: var(--gray);
  margin-left: 10px;
  font-size: 14px;
}

#pay-combine span {
  color: var(--primary);
  font-weight: 600;
}

/* 分页样式 */
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

/* 每页显示数量选择器样式 */
#limitSel {
  height: 30px;
  border-radius: 5px;
  border: 1px solid rgba(240, 138, 93, 0.2);
  transition: all 0.3s ease;
  padding: 0 0.5rem;
  background-color: #fff;
  margin: 0 5px;
}

#limitSel:focus {
  border-color: var(--primary);
  box-shadow: 0 0 0 0.2rem rgba(240, 138, 93, 0.25);
  outline: none;
}

/* 复选框样式 */
.custom-control-input:checked ~ .custom-control-label::before {
  color: #fff;
  border-color: var(--primary);
  background-color: var(--primary);
}

.custom-checkbox .custom-control-input:checked ~ .custom-control-label::after {
  background-image: url("data:image/svg+xml,%3csvg xmlns='http://www.w3.org/2000/svg' width='8' height='8' viewBox='0 0 8 8'%3e%3cpath fill='%23fff' d='M6.564.75l-3.59 3.612-1.538-1.55L0 4.26l2.974 2.99L8 2.193z'/%3e%3c/svg%3e");
}

.custom-control-input:focus ~ .custom-control-label::before {
  box-shadow: 0 0 0 0.2rem rgba(240, 138, 93, 0.25);
}

/* 无数据提示样式 */
.no-data {
  text-align: center;
  padding: 30px;
  color: var(--gray);
  font-size: 14px;
}

/* 响应式调整 */
@media (max-width: 992px) {
  .table-header, .table-footer {
    flex-direction: column;
    align-items: flex-start;
  }
  
  .table-search, .table-pagination {
    margin-top: 10px;
    width: 100%;
  }
  
  .table-tools {
    width: 100%;
    justify-content: space-between;
  }
  
  .table-pageinfo {
    margin-bottom: 10px;
  }
}

@media (max-width: 768px) {
  .table.tablelist th,
  .table.tablelist td {
    padding: 10px !important;
  }
  
  .pagination .page-item .page-link {
    min-width: 30px;
    padding: 0.4rem 0.6rem;
  }
  
  .btn-primary {
    padding: 0.4rem 1rem;
  }
}

@media (max-width: 576px) {
  .table-responsive {
    border-radius: 10px;
    overflow: hidden;
  }
  
  .table.tablelist th,
  .table.tablelist td {
    padding: 8px 5px !important;
    font-size: 12px;
  }
  
  .status {
    padding: 3px 8px;
    font-size: 11px;
  }
  
  .badge-light {
    padding: 3px 6px;
    font-size: 11px;
  }
  
  .pagination .page-item .page-link {
    min-width: 28px;
    padding: 0.3rem 0.5rem;
    font-size: 12px;
  }
  
  .btn-primary {
    padding: 0.35rem 0.8rem;
    font-size: 12px;
  }
  
  #pay-combine {
    font-size: 12px;
  }
}
</style>

<div class="card">
	<div class="card-body">
    <form action="combinebilling">
		<div class="table-container"> 
			<div class="table-header">
				<div class="table-filter">

				</div>
				<div class="table-search d-flex justify-content-end">
					<select class="form-control" id="statusSel" title="请选择状态" style="width: 150px">
						<option value=""><?php echo $Lang['whole']; ?></option>
						<option value="Unpaid"><?php echo $Lang['unpaid']; ?></option>
						<option value="Paid"><?php echo $Lang['paid']; ?></option>
						<option value="Cancelled"><?php echo $Lang['cancelled']; ?></option>
						<option value="Refunded"><?php echo $Lang['refunded']; ?></option>
					</select>
				</div>

			</div>
			<div class="table-responsive">
				<table class="table tablelist">
					<colgroup>
						<col>
						<col width="15%">
						<col>
						<col>
						<col>
						<col>
						<col>
						<col>
					</colgroup>
					<thead class="bg-light">
						<tr>
							<th class="checkbox">
                <div class="custom-control custom-checkbox mb-3">
                   
                    <input type="checkbox" name="headCheckbox" onchange="headCheckboxAll(this)" class="custom-control-input" id="customCheck" >
                    <label class="custom-control-label" for="customCheck"></label>
                </div>
							</th>
							<th class="pointer" prop="id">
								<span><?php echo $Lang['bill_no']; ?></span>
								<span class="text-black-50 d-inline-flex flex-column justify-content-center ml-1 offset-3">
									<i class="bx bx-caret-up"></i>
									<i class="bx bx-caret-down"></i>
								</span>
							</th>
							<th>
								<span><?php echo $Lang['type']; ?></span>
							</th>
							<th class="pointer" prop="subtotal">
								<span><?php echo $Lang['amount_money']; ?></span>
								<span class="text-black-50 d-inline-flex flex-column justify-content-center ml-1 offset-3">
									<i class="bx bx-caret-up"></i>
									<i class="bx bx-caret-down"></i>
								</span>
							</th>
							<th class="pointer" prop="paid_time">
								<span><?php echo $Lang['payment_time']; ?></span>
								<span class="text-black-50 d-inline-flex flex-column justify-content-center ml-1 offset-3">
									<i class="bx bx-caret-up"></i>
									<i class="bx bx-caret-down"></i>
								</span>
							</th>
							<th class="pointer" prop="payment_zh">
								<span><?php echo $Lang['payment_zh']; ?></span>
							</th>
							<th class="pointer" prop="due_time">
								<span><?php echo $Lang['overdue_time']; ?></span>
								<span class="text-black-50 d-inline-flex flex-column justify-content-center ml-1 offset-3">
									<i class="bx bx-caret-up"></i>
									<i class="bx bx-caret-down"></i>
								</span>
							</th>
							<th class="pointer" prop="status">
								<span><?php echo $Lang['state']; ?></span>
								<span class="text-black-50 d-inline-flex flex-column justify-content-center ml-1 offset-3">
									<i class="bx bx-caret-up"></i>
									<i class="bx bx-caret-down"></i>
								</span>
							</th>
							<th width="180px"><?php echo $Lang['operating']; ?></th>
						</tr>
					</thead>
					<tbody>
						<?php if($Billing): foreach($Billing as $index => $bill): ?>
						<tr>
							<td>
								<div class="custom-control custom-checkbox mb-3">
                  					<!-- xue 直接在复选框里写name value  改错了莫怪 -->
									<input type="checkbox" class="custom-control-input row-checkbox" onclick="rowCheckbox(this)" id="customCheck<?php echo $bill['id']; ?>"
                  data-name="ids[<?php echo $index; ?>]" name="ids[<?php echo $index; ?>]" data-value="<?php echo $bill['id']; ?>" value="<?php echo $bill['id']; ?>">
									<label class="custom-control-label" for="customCheck<?php echo $bill['id']; ?>"></label>
								</div>
							</td>
							<td><a href="viewbilling?id=<?php echo $bill['id']; ?>"><span class="badge badge-light"># <?php echo $bill['id']; ?></span></a></td>
							<td><?php echo $bill['type_zh']; ?></td>
							<td><?php echo $bill['subtotal']; ?></td>
							<td><?php if($bill['paid_time']): ?><?php echo date("Y-m-d H:i",!is_numeric($bill['paid_time'])? strtotime($bill['paid_time']) : $bill['paid_time']); else: ?>-<?php endif; ?></td>
							<td><?php if($bill['payment_zh']): ?><?php echo $bill['payment_zh']; else: ?>-<?php endif; ?></td>
							<td><?php if($bill['due_time']): ?><?php echo date("Y-m-d H:i",!is_numeric($bill['due_time'])? strtotime($bill['due_time']) : $bill['due_time']); else: ?>-<?php endif; ?></td>
							<td>
								<span class="status badge status-<?php echo strtolower($bill['status']); ?>"><?php echo $bill['status_zh']['name']; ?></span>
							</td>
							<td>
								<a href="viewbilling?id=<?php echo $bill['id']; ?>" class="text-success mr-2"><i class="fas fa-eye"></i> <?php echo $Lang['see']; ?></a>
								<?php if($bill['status'] == 'Unpaid'): ?>
								<a href="javascript: payamount(<?php echo $bill['id']; ?>);" class="text-primary mr-2"><i class="fas fa-check-circle"></i> <?php echo $Lang['payment']; ?></a>
								<a href="javascript: deleteConfirm('invoices', '<?php echo $Lang['delete_bill']; ?>', '<?php echo $Lang['want_delete_the_bill']; ?>', {id: <?php echo $bill['id']; ?>, token: '<?php echo $Token; ?>'});"
									class="text-danger"><i class="fas fa-times-circle"></i> <?php echo $Lang['delete']; ?></a>
								<?php endif; ?>
							</td>
						</tr>
						<?php endforeach; else: ?>
						<tr>
							<td colspan="9">
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
          <button class="btn btn-primary mr-1" disabled id="readBtn" type="submit"><?php echo $Lang['consolidated_payment']; ?></button>
          <span id="pay-combine"><?php echo $Lang['you_have']; ?><span><?php echo $Count; ?></span><?php echo $Lang['paid_total']; ?><span><?php echo $Total_money; ?></span><?php echo $Lang['element']; ?></span>
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
		</div>
    </form>
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


<script>
	var _url = '';
	var status = '<?php echo app('request')->get('status'); ?>'
	// 排序
	$('.bg-light .pointer').on('click', function () {
		var sort = '<?php echo app('request')->get('sort'); ?>'
		location.href = 'billing?status=<?php echo app('request')->get('status'); ?>&sort=' + (sort == 'desc' ? 'asc' : 'desc') + '&orderby=' + $(this).attr('prop') + '&page=<?php echo app('request')->get('page'); ?>&limit=<?php echo app('request')->get('limit'); ?>'
	})
	//排序样式
	changeStyle()
	function changeStyle() {
		$('.bg-light th.pointer').children().children().css('color','rgba(0, 0, 0, 0.1)')
	var sort = '<?php echo app('request')->get('sort'); ?>'
	let orderby = '<?php echo app('request')->get('orderby'); ?>'
	let index,
	n
	if(orderby === 'id') {
				n = 0
	} else if(orderby === 'subtotal') {
				n = 1
	} else if(orderby === 'paid_time'){
				n = 2
	} else if(orderby === 'due_time') {
				n = 3
	} else if(orderby === 'status') {
				n = 4
	}
	if (sort === 'desc') {
			index = 1 + 2 * n
	} else if(sort === 'asc'){
			index = 0 + 2 * n
	}
		$('.bg-light th.pointer').children().children().eq(index).css('color','rgba(0, 0, 0, 0.8)')
	}
	// 状态筛选
	$('#statusSel').on('change', function () {
		location.href = "billing?status=" + $('#statusSel').val() + "&sort=<?php echo app('request')->get('sort'); ?>&orderby=<?php echo app('request')->get('orderby'); ?>&page=<?php echo app('request')->get('page'); ?>&limit=<?php echo app('request')->get('limit'); ?>"
	});
// 每页数量选择改变
	$('#limitSel').on('change', function () {
		location.href = '/billing?keywords=<?php echo app('request')->get('keywords'); ?>&sort=<?php echo app('request')->get('sort'); ?>&orderby=<?php echo app('request')->get('orderby'); ?>&page=1&limit=' + $('#limitSel').val()

	})
	
	// 添加表格行悬停效果
	$(document).ready(function() {
		// 初始化状态选择器
		$('#statusSel').val(status);
		
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
		
		// 添加按钮悬停效果
		$('.btn-primary').not(':disabled').hover(
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
	});
</script>
<script src="/themes/clientarea/default/assets/js/billing.js?v=<?php echo $Ver; ?>"></script>

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