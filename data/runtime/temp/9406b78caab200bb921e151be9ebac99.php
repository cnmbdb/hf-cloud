<?php /*a:8:{s:73:"/www/wwwroot/cloud.hf.pw2/public/themes/clientarea/ogmiao/viewbilling.tpl";i:1720000043;s:75:"/www/wwwroot/cloud.hf.pw2/public/themes/clientarea/ogmiao/includes/head.tpl";i:1742354372;s:75:"/www/wwwroot/cloud.hf.pw2/public/themes/clientarea/ogmiao/includes/menu.tpl";i:1720065013;s:81:"/www/wwwroot/cloud.hf.pw2/public/themes/clientarea/ogmiao/includes/pageheader.tpl";i:1719999923;s:81:"/www/wwwroot/cloud.hf.pw2/public/themes/clientarea/ogmiao/includes/breadcrumb.tpl";i:1719999923;s:81:"/www/wwwroot/cloud.hf.pw2/public/themes/clientarea/ogmiao/includes/tablestyle.tpl";i:1719999923;s:84:"/www/wwwroot/cloud.hf.pw2/public/themes/clientarea/ogmiao/includes/deleteConfirm.tpl";i:1719999923;s:79:"/www/wwwroot/cloud.hf.pw2/public/themes/clientarea/ogmiao/includes/paymodal.tpl";i:1719999923;}*/ ?>

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
  .pb-md-36, .py-md-36 {
    padding-bottom: 9rem!important;
  }
  .pt-md-36, .py-md-36 {
    padding-top: 9rem!important;
  }
  .pb-md-30, .py-md-30 {
    padding-bottom: 7.5rem!important;
  }
  .pt-md-30, .py-md-30 {
    padding-top: 7.5rem!important;
  }
  .text-dark-50 {
    color: #7e8299!important;
  }
  .mb-10, .my-10 {
    margin-bottom: 2.5rem!important;
  }
  .border-right-md {
    border-right: 1px solid #ebedf3!important;
  }

  .pl-md-5, .px-md-5 {
    padding-left: 1.25rem!important;
  }

  .pb-9, .py-9 {
      padding-bottom: 2.25rem!important;
  }
  .pt-1, .py-1 {
      padding-top: .25rem!important;
  }
  .table.noborr thead th{
    border: none;
  }
  .box{
    width:100%;
    height: auto;
    background:#fff;
    border-radius:6px;
    padding: 1.25rem;
    font-size:.875rem;
  }
  .head-img {
    height:4.4rem;
  }
  .btnWidth{
    width: 7rem
  }
  .text-style{
    text-align: center;
    display: inline-block;
    font-weight: bold
  }
  .text-img-center{
    padding-top: 1.25rem
  }
</style>
<div class="box" id="pdfCentent">
  <div class="col-md-12">
    <header>
      <div class="row align-items-center">
        <div class="col-sm-7 text-center text-sm-left mb-3 mb-sm-0"> 
      <?php if($Setting['logo_url_bill'] !=''): ?>
      <img class="head-img" src="<?php echo $Setting['logo_url_bill']; ?>"> 
      <?php else: ?>
			<img class="head-img" src="<?php echo $Setting['system_url']; ?>/themes/clientarea/<?php echo $Setting['templates']; ?>/assets/images/logo-inovice.png">
      <?php endif; ?>
		</div>
        <div class="col-sm-5 text-center text-sm-right">
          <?php if($ViewBilling['detail']['status'] == 'Paid'): ?>
          <p class="mb-0"><h3 class="text-success btnWidth text-style text-img-center"><?php echo $Lang['paid']; ?></h3></p>
            <p class="mb-0" style="display: none;"><button class="btn btn-primary btnWidth" id="payamount" onclick="javascript: payamount(<?php echo $Pay['invoiceid']; ?>);"><?php echo $Lang['pay_immediately']; ?></button></p>

          <?php elseif($ViewBilling['detail']['status'] == 'Unpaid'): ?>
          <p class="mb-0"><h3 class="text-danger btnWidth text-style" style="margin-bottom:.25rem"><?php echo $Lang['unpaid']; ?></h3></p>
            <p class="mb-0"><button class="btn btn-primary btnWidth" id="payamount" onclick="javascript: payamount(<?php echo $Pay['invoiceid']; ?>);"><?php echo $Lang['pay_immediately']; ?></button></p>
          <?php elseif($ViewBilling['detail']['status'] == 'Cancelled'): ?>
            <p class="mb-0"><h5 class="text-success btnWidth text-style text-img-center"><?php echo $Lang['cancelled']; ?></h5></p>
          <?php elseif($ViewBilling['detail']['status'] == 'Refunded'): ?>
            <p class="mb-0"><h5 class="text-success btnWidth text-style text-img-center"><?php echo $Lang['refunded']; ?></h5></p>
          <?php endif; ?>
        </div>
      </div>
      <hr>
    </header>
    <main>
      <div class="row">
        <div class="col-sm-6 text-sm-right order-sm-1"> <strong><?php echo $Lang['payee_information']; ?>:</strong>
          <address>
            <?php echo $ViewBilling['payee']; ?>
          </address>
        </div>
        <div class="col-sm-6 order-sm-0"> <strong><?php echo $Lang['payer_information']; ?>:</strong>
          <address>
            <?php echo $ViewBilling['detail']['companyname']; ?><br>
          <?php echo $Lang['full_name']; ?>：<?php echo $ViewBilling['detail']['username']; ?><br>
          <?php echo $Lang['telephone']; ?>：<?php if($ViewBilling['detail']['phonenumber'] == ""): ?>-
                <?php else: ?><?php echo $ViewBilling['detail']['phonenumber']; ?>
                <?php endif; ?>
          </address>
        </div>
      </div>
      <div class="row">
        <div class="col-sm-6"> <strong><?php echo $Lang['creation_time']; ?>:</strong><br>
          <span> <?php echo date("Y-m-d H:i:s",!is_numeric($ViewBilling['detail']['create_time'])? strtotime($ViewBilling['detail']['create_time']) : $ViewBilling['detail']['create_time']); ?> </span> <br>
          <br>
        </div>
      </div>
      <div class="card">
        <div class="card-body p-0">
          <div class="table-responsive" style="min-height:auto;border-radius: 0px 0px calc(.25rem - 1px) calc(.25rem - 1px);">
            <table class="table mb-0" style="border:#ddd 1px solid">
              <thead class="card-header px-3">
                <tr>
                  <td class="border-top-0" style="width:80%"><strong><?php echo $Lang['bill_details']; ?></strong></td>
                  <td class="text-center border-top-0" style="width:5%"><strong><?php echo $Lang['table_title_divert_type']; ?></strong></td>
                  <td class="text-center border-top-0" style="width:15%"><strong><?php echo $Lang['amount_money']; ?></strong></td>
                </tr>
              </thead>
              <tbody>
              <?php foreach($ViewBilling['invoice_items'] as $item): ?>
                <tr>
                  <td>
                    <?php foreach(explode("\n", $item['description']) as $desc): ?>
                      <div><?php echo $desc; ?></div>
                    <?php endforeach; ?>
                  </td>
                  <td class="text-center"><?php echo $item['type_zh']; ?></td>
                  <td class="text-center"><?php echo $ViewBilling['currency']['prefix']; ?><?php echo $item['amount']; ?><?php echo $ViewBilling['currency']['suffix']; ?></td>
                </tr>
              <?php endforeach; ?>
              </tbody>
        <tfoot class="card-footer">
          <tr>
                  <td class="text-left"></td>
                  <td class="text-center"><strong><?php echo $Lang['total']; ?></strong></td>
                  <td class="text-center"><strong><?php echo $ViewBilling['currency']['prefix']; ?><?php echo $Pay['total']; ?><?php echo $ViewBilling['currency']['suffix']; ?></strong></td>
                </tr>
        </tfoot>
            </table>
          </div>
        </div>
      </div>
      <br>
      <?php if($ViewBilling['detail']['status'] == 'Paid' || $ViewBilling['detail']['status'] == 'Refunded'): ?>
      <div class="table-responsive d-print-none" style="min-height:auto;">
        <table class="table table-bordered">
          <?php if($ViewBilling['accounts']): ?>
          <thead>
            <tr>
              <td class="text-center"><strong><?php echo $Lang['transaction_serial_number']; ?></strong></td>
              <td class="text-center"><strong><?php echo $Lang['amount_money']; ?></strong></td>
              <td class="text-center"><strong><?php echo $Lang['payment_zh']; ?></strong></td>
              <td class="text-center"><strong><?php echo $Lang['payment_time']; ?></strong></td>
            </tr>
          </thead>
          <tbody>
            <?php foreach($ViewBilling['accounts'] as $var): ?>
              <tr>
                <td class="text-center"><?php echo $var['trans_id']; ?></td>
                <td class="text-center"><?php echo $ViewBilling['currency']['prefix']; ?><?php echo $var['amount_in']; ?><?php echo $ViewBilling['currency']['suffix']; ?></td>
                <td class="text-center"><?php echo $var['gateway']; ?></td>
                <td class="text-center"><?php echo date("Y-m-d H:i:s",!is_numeric($var['pay_time'])? strtotime($var['pay_time']) : $var['pay_time']); ?></td>
              </tr>
            <?php endforeach; ?>
          </tbody>
          <?php endif; ?>
        </table>
      </div>
      <?php endif; ?>
    </main>
  <!-- Footer -->
  <footer class="text-center">
    <div class="btn-group btn-group-sm d-print-none"> <a href="javascript:window.print()" class="btn btn-light border text-black-50 shadow-none printicon"><i class="fa fa-print"></i> Print</a> <a href="#" class="btn btn-light border text-black-50 shadow-none pdfdownload"><i class="fa fa-download"></i> Download</a> </div>
  </footer>
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
<script src="/themes/clientarea/default/assets/libs/html2canvas/html2canvas.min.js?v=<?php echo $Ver; ?>"></script>
<script src="/themes/clientarea/default/assets/libs/jspdf/jspdf.umd.min.js?v=<?php echo $Ver; ?>"></script>
<script>
  /* 原HTML代码
  <div class="card card-custom position-relative overflow-hidden col-md-9" id="pdfCentent">
      <!--begin::Shape-->
      <div class="position-absolute opacity-30" style="left:0;z-index:1">
        <span class="svg-icon svg-icon-10x svg-logo-white">
          <!--begin::Svg Icon | path:/metronic/theme/html/demo1/dist/assets/media/svg/shapes/abstract-8.svg-->
          <svg xmlns="http://www.w3.org/2000/svg" width="176" height="165" viewBox="0 0 176 165" fill="none">
            <g clip-path="url(#clip0)">
              <path d="M-10.001 135.168C-10.001 151.643 3.87924 165.001 20.9985 165.001C38.1196 165.001 51.998 151.643 51.998 135.168C51.998 118.691 38.1196 105.335 20.9985 105.335C3.87924 105.335 -10.001 118.691 -10.001 135.168Z" fill="#AD84FF"></path>
              <path d="M28.749 64.3117C28.749 78.7296 40.8927 90.4163 55.8745 90.4163C70.8563 90.4163 83 78.7296 83 64.3117C83 49.8954 70.8563 38.207 55.8745 38.207C40.8927 38.207 28.749 49.8954 28.749 64.3117Z" fill="#AD84FF"></path>
              <path d="M82.9996 120.249C82.9996 144.964 103.819 165 129.501 165C155.181 165 176 144.964 176 120.249C176 95.5342 155.181 75.5 129.501 75.5C103.819 75.5 82.9996 95.5342 82.9996 120.249Z" fill="#AD84FF"></path>
              <path d="M98.4976 23.2928C98.4976 43.8887 115.848 60.5856 137.249 60.5856C158.65 60.5856 176 43.8887 176 23.2928C176 2.69692 158.65 -14 137.249 -14C115.848 -14 98.4976 2.69692 98.4976 23.2928Z" fill="#AD84FF"></path>
              <path d="M-10.0011 8.37466C-10.0011 20.7322 0.409554 30.7493 13.2503 30.7493C26.0911 30.7493 36.5 20.7322 36.5 8.37466C36.5 -3.98287 26.0911 -14 13.2503 -14C0.409554 -14 -10.0011 -3.98287 -10.0011 8.37466Z" fill="#AD84FF"></path>
              <path d="M-2.24881 82.9565C-2.24881 87.0757 1.22081 90.4147 5.50108 90.4147C9.78135 90.4147 13.251 87.0757 13.251 82.9565C13.251 78.839 9.78135 75.5 5.50108 75.5C1.22081 75.5 -2.24881 78.839 -2.24881 82.9565Z" fill="#AD84FF"></path>
              <path d="M55.8744 12.1044C55.8744 18.2841 61.0788 23.2926 67.5001 23.2926C73.9196 23.2926 79.124 18.2841 79.124 12.1044C79.124 5.92653 73.9196 0.917969 67.5001 0.917969C61.0788 0.917969 55.8744 5.92653 55.8744 12.1044Z" fill="#AD84FF"></path>
            </g>
          </svg>
          <!--end::Svg Icon-->
        </span>
      </div>
      <!--end::Shape-->
      <!--begin::Invoice header-->
      <div class="row justify-content-center py-8 px-8 py-md-36 px-md-0 bg-primary" style="position: relative;">
        <div class="col-md-9">
          <div class="d-flex justify-content-between align-items-md-center flex-column flex-md-row" >
            <div class="d-flex flex-column px-0 order-2 order-md-1" style="z-index:2">
              <span class="font-size-20 font-weight-bold text-white mb-3"><?php echo $ViewBilling['detail']['username']; ?></span>

              <span class="d-flex flex-column font-size-16 font-weight-bold text-white">
                <span><?php echo $ViewBilling['detail']['companyname']; ?></span>
                <span><?php echo $UserInfo['user']['address1']; ?></span>
              </span>
            </div>
            <h3 class="display-4 font-weight-bold text-white order-1 order-md-2">
            <?php if($Pay['PayStatus']=='Paid'): ?>
            <?php echo $Lang['paid']; else: ?>
            <?php echo $Lang['unpaid']; ?>
            <?php endif; ?>
            </h3>
          </div>
        </div>

        <i class="bx bx-cloud-download text-white fs-24 pdfdownload pointer" style="position: absolute;right: 20px;bottom: 20px;"></i>
      </div>
      
      <!-- 下载pdf -->
      <!-- <div class="text-right pt-4" style="min-height: 43px;">
        <span class="pdfdownload pointer">
          <i class="bx bx-cloud-download"></i>
          下载
        </span>
      </div> -->
      
      <!--end::Invoice header-->
      <div class="row justify-content-center py-8 px-8 py-md-30 px-md-0">
        <div class="col-md-9">
          <!--begin::Invoice body-->
          <div class="row pb-26">
            <div class="col-md-3 border-right-md pr-md-10 py-md-10">
              <!--begin::Invoice To-->
              <div class="text-dark-50 font-size-lg font-weight-bold mb-3"><?php echo $Lang['payment_to']; ?>:</div>
              <div class="font-size-lg font-weight-bold mb-10"><?php echo $ViewBilling['payee']; ?></div>
              <!--end::Invoice To-->
              <!--begin::Invoice No-->
              <div class="text-dark-50 font-size-lg font-weight-bold mb-3"><?php echo $Lang['payment_method']; ?>:</div>
              <div class="font-size-lg font-weight-bold mb-10"><?php echo $ViewBilling['detail']['payment_zh']; ?></div>
              <!--end::Invoice No-->
              <!--begin::Invoice Date-->
              <div class="text-dark-50 font-size-lg font-weight-bold mb-3"><?php echo $Lang['billing_time']; ?>:</div>
              <div class="font-size-lg font-weight-bold"><?php if($ViewBilling['detail']['paid_time']): ?>
              <?php echo date("Y-m-d H:i:s",!is_numeric($ViewBilling['detail']['paid_time'])? strtotime($ViewBilling['detail']['paid_time']) : $ViewBilling['detail']['paid_time']); ?><br><br>
            <?php else: ?>
              -
            <?php endif; ?></div>
              <!--end::Invoice Date-->
            </div>
            <div class="col-md-9 py-10 pl-md-10">
              <div class="table-responsive">
                <table class="table noborr">
                  <colgroup>
                    <col width="80px">
                    <col >
                    <col width="120px">
                  </colgroup>
                  <thead>
                    <tr>
                      <th class="pt-1 pb-9 pl-0 pl-md-5 font-weight-bolder text-muted font-size-lg text-uppercase"><?php echo $Lang['type']; ?></th>
                      <th class="pt-1 pb-9 text-left font-weight-bolder text-muted font-size-lg text-uppercase"><?php echo $Lang['project']; ?></th>
                      <th class="pt-1 pb-9 text-right font-weight-bolder text-muted font-size-lg text-uppercase"><?php echo $Lang['amount_money']; ?></th>
                    </tr>
                  </thead>
                  <tbody>
                  <?php foreach($ViewBilling['invoice_items'] as $item): ?>
                  <tr>
                      <td class="font-weight-bold pl-0 pl-md-5 pt-7 d-flex align-items-center"><?php echo $item['type_zh']; ?></td>
                      <td class="text-left pt-7">
                      <?php foreach(explode("\n", $item['description']) as $desc): ?>
                        <div class="font-weight-bold"><?php echo $desc; ?></div>
                      <?php endforeach; ?></td>
                      <td class="text-right pt-7 font-weight-bold"><?php echo $ViewBilling['currency']['prefix']; ?><?php echo $item['amount']; ?><?php echo $ViewBilling['currency']['suffix']; ?></td>
                  </tr>
                  <?php endforeach; ?>
                  
                  </tbody>
                </table>
              </div>
            </div>
          </div>
          <!--end::Invoice body-->
          

          <?php if($ViewBilling['accounts']): ?>
          <div class="table-responsive mt-3">
              <table class="table table-bordered mb-0">

                  <thead>
                      <tr>
                          <th><?php echo $Lang['transaction_date']; ?></th>
                          <th><?php echo $Lang['payment_method']; ?></th>
                          <th><?php echo $Lang['transaction_serial_number']; ?></th>
                          <th><?php echo $Lang['amount_money']; ?></th>
                      </tr>
                  </thead>
                  <tbody>
                    <?php foreach($ViewBilling['accounts'] as $accounts): ?>
                      <tr class="table-light">
                          <td><?php echo date("Y-m-d H:i:s",!is_numeric($accounts['pay_time'])? strtotime($accounts['pay_time']) : $accounts['pay_time']); ?></td>
                          <td><?php echo $accounts['gateway']; ?></td>
                          <td><?php if($accounts['trans_id']): ?><?php echo $accounts['trans_id']; else: ?>-<?php endif; ?></td>
                          <td><?php echo $accounts['amount_in']; ?></td>
                      </tr>
                    <?php endforeach; ?>
                    
                  </tbody>
              </table>
          </div>
          <?php endif; ?>
        </div>
      </div>


      
      
    </div>




	<div class="col-sm-3">
		<div class="card">
			<div class="card-body">
      
       <div id="pay-content">

        </div>
    </div>
		</div>	
	</div>
  */
</script>

<script>
  var _url = '';

  $(function() {
    $(document).on('click', '.pdfdownload', function () {
      let targetElement = document.getElementById('pdfCentent')
      let scrollHeight = targetElement.getBoundingClientRect().top + window.scrollY;
      window.scroll({
        top: scrollHeight
      });
      $(this).hide();
      $(".printicon").hide();
      setTimeout(function(){
        $(".pdfdownload").show();
        $(".printicon").show();
      }, 100);
      toastr.success('<?php echo $Lang['please_wait_while_building']; ?>...')
      html2canvas(document.getElementById('pdfCentent'), {
        allowTaint: true
      }).then(function (canvas) {
        let contentWidth = canvas.width
        let contentHeight = canvas.height
        let pageHeight = contentWidth / 592.28 * 841.89
        let leftHeight = contentHeight
        let position = 0
        let imgWidth = 595.28
        let imgHeight = 592.28 / contentWidth * contentHeight
        let pageData = canvas.toDataURL('image/jpeg', 1.0)
        let PDF = new jsPDF('', 'pt', 'a4')
        if (leftHeight < pageHeight) {
          PDF.addImage(pageData, 'JPEG', 0, 0, imgWidth, imgHeight)
        } else {
          while (leftHeight > 0) {
            PDF.addImage(pageData, 'JPEG', 0, position, imgWidth, imgHeight)
            leftHeight -= pageHeight
            position -= 841.89
            if (leftHeight > 0) {
              PDF.addPage()
            }
          }
        }
        PDF.save('<?php echo $Lang['bill']; ?>#<?php echo app('request')->get('id'); ?>_' + new Date().getTime())
      })
    });
  })
</script>
<script>
  function getQueryString(name) {
    var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)", "i");
    var r = window.location.search.substr(1).match(reg);
    if (r != null) return unescape(r[2]);
    return null;
  }

  window.onload = function() {
    //来自购物车页面就自动唤醒支付窗口
    var wakeup = getQueryString("wakeup");
    if (wakeup == 1) {
        $("#payamount").click();
        var payStatus = '<?php echo $ViewBilling['detail']['status']; ?>';
        if(payStatus == 'Paid'){
          setTimeout(function () {
            $('#pay').hide();
            $('.modal-backdrop').hide();
            let invoiceid = '<?php echo $Pay['invoiceid']; ?>'
            $.post('/check_order', {id:'<?php echo $Pay['invoiceid']; ?>'},
                function(data){
                    if(data.status==1000){
                        $("#myLargeModalLabel").html("账单 - "+invoiceid);
                        if (data.data){
                            location.href = data.data
                        } else if ('<?php echo $ReturnUrl; ?>') {
                            location.href = '<?php echo $ReturnUrl; ?>'
                        } else if ('<?php echo $ViewBilling['detail']['url']; ?>') { // 账单有回跳地址 优先处理
                            location.href = '<?php echo $ViewBilling['detail']['url']; ?>'
                        } else if ('<?php echo $ViewBilling['invoice_items']['0']['hid']; ?>' == '0') {
                            location.href = 'service?groupid=<?php echo $ViewBilling['invoice_items']['0']['groupid']; ?>'
                        } else {
                            location.href = 'servicedetail?id=<?php echo $ViewBilling['invoice_items']['0']['hid']; ?>'
                        }
                    }

                }
            )
          },3000)
      }
    }
  }
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