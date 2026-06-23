<?php /*a:13:{s:73:"/www/wwwroot/cloud.hf.pw2/public/themes/clientarea/ogmiao/transaction.tpl";i:1743909273;s:75:"/www/wwwroot/cloud.hf.pw2/public/themes/clientarea/ogmiao/includes/head.tpl";i:1742354372;s:75:"/www/wwwroot/cloud.hf.pw2/public/themes/clientarea/ogmiao/includes/menu.tpl";i:1720065013;s:81:"/www/wwwroot/cloud.hf.pw2/public/themes/clientarea/ogmiao/includes/pageheader.tpl";i:1719999923;s:81:"/www/wwwroot/cloud.hf.pw2/public/themes/clientarea/ogmiao/includes/breadcrumb.tpl";i:1719999923;s:81:"/www/wwwroot/cloud.hf.pw2/public/themes/clientarea/ogmiao/includes/tablestyle.tpl";i:1719999923;s:89:"/www/wwwroot/cloud.hf.pw2/public/themes/clientarea/ogmiao/transaction/accounts_record.tpl";i:1719999922;s:87:"/www/wwwroot/cloud.hf.pw2/public/themes/clientarea/ogmiao/transaction/credit_record.tpl";i:1719999922;s:86:"/www/wwwroot/cloud.hf.pw2/public/themes/clientarea/ogmiao/transaction/credit_limit.tpl";i:1719999922;s:89:"/www/wwwroot/cloud.hf.pw2/public/themes/clientarea/ogmiao/transaction/recharge_record.tpl";i:1719999922;s:87:"/www/wwwroot/cloud.hf.pw2/public/themes/clientarea/ogmiao/transaction/refund_record.tpl";i:1719999922;s:89:"/www/wwwroot/cloud.hf.pw2/public/themes/clientarea/ogmiao/transaction/withdraw_record.tpl";i:1719999922;s:82:"/www/wwwroot/cloud.hf.pw2/public/themes/clientarea/ogmiao/includes/tablefooter.tpl";i:1719999923;}*/ ?>

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
<script>
	$(function () {
		var action = '<?php echo app('request')->get('action'); ?>'
		$('#accountsRecordSel').val(action == 'credit_record' ? 'credit_record' : (action == 'credit_limit' ? 'credit_limit' : 'accounts_record'))
		
		$('#accountsRecordSel').on('change', function () {
			location.href = 'transaction?action=' + $('#accountsRecordSel').val()
		});

		// 排序
		var action = '<?php echo app('request')->get('action'); ?>'
		$('.bg-light th').on('click', function () {
			var sort = '<?php echo app('request')->get('sort'); ?>'
			location.href = 'transaction?action=' + (action || 'accounts_record') + '&sort=' + (sort == 'desc' ? 'asc' : 'desc') + '&orderby=' + $(this).attr('prop') + '&page=<?php echo app('request')->get('page'); ?>&limit=<?php echo app('request')->get('limit'); ?>'
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
				} else if(orderby === 'invoice_id' || orderby === 'num') {
				n = 1
				} else if(orderby === 'amount_in'|| orderby === 'amount_out' || orderby === 'create_time'){
				n = 2
				} else if(orderby === 'transaction_time' || orderby === 'pay_time') {
				n = 3
				} else if(orderby === 'trans_id') {
				n = 4
				}
				if (sort === 'desc') {
				index = 1 + 2 * n
				} else if(sort === 'asc'){
				index = 0 + 2 * n
				}
				$('.bg-light th.pointer').children().children().eq(index).css('color','rgba(0, 0, 0, 0.8)')
				}
	})
</script>
<div class="card">
	<div class="card-body">
		<div class="card-title">
			<?php echo $Lang['transaction_records']; ?>
		</div>

		<div class="table-container">
			<ul class="nav nav-tabs mb-4" role="tablist">
				<li class="nav-item waves-effect waves-light">
					<a class="nav-link <?php if(app('request')->get('action')=='accounts_record' or app('request')->get('action')=='credit_record' or app('request')->get('action')=='credit_limit' or !app('request')->get('action')): ?>active<?php endif; ?>"
						href="transaction?action=accounts_record&sort=<?php echo app('request')->get('sort'); ?>&orderby=<?php echo app('request')->get('orderby'); ?>&page=<?php echo app('request')->get('page'); ?>&limit=<?php echo app('request')->get('limit'); ?>"
						role="tab"><?php echo $Lang['records_of_consumption']; ?></a>
				</li>
				<li class="nav-item waves-effect waves-light">
					<a class="nav-link <?php if(app('request')->get('action')=='recharge_record'): ?>active<?php endif; ?>"
						href="transaction?action=recharge_record&sort=<?php echo app('request')->get('sort'); ?>&orderby=<?php echo app('request')->get('orderby'); ?>&page=<?php echo app('request')->get('page'); ?>&limit=<?php echo app('request')->get('limit'); ?>"
						role="tab"><?php echo $Lang['recharge_record']; ?></a>
				</li>
				<li class="nav-item waves-effect waves-light">
					<a class="nav-link <?php if(app('request')->get('action')=='refund_record'): ?>active<?php endif; ?>"
						href="transaction?action=refund_record&sort=<?php echo app('request')->get('sort'); ?>&orderby=<?php echo app('request')->get('orderby'); ?>&page=<?php echo app('request')->get('page'); ?>&limit=<?php echo app('request')->get('limit'); ?>"
						role="tab"><?php echo $Lang['refund_record']; ?></a>
				</li>
				<li class="nav-item waves-effect waves-light">
					<a class="nav-link <?php if(app('request')->get('action')=='withdraw_record'): ?>active<?php endif; ?>"
						href="transaction?action=withdraw_record&sort=<?php echo app('request')->get('sort'); ?>&orderby=<?php echo app('request')->get('orderby'); ?>&page=<?php echo app('request')->get('page'); ?>&limit=<?php echo app('request')->get('limit'); ?>"
						role="tab"><?php echo $Lang['withdrawal_record']; ?></a>
				</li>
        
			</ul>
			<div class="table-header">
				<div class="table-filter">

				</div>
				<div class="table-search d-flex justify-content-end">
					<?php if(app('request')->get('action')=='accounts_record' || app('request')->get('action')=='credit_record' || app('request')->get('action')=='credit_limit' || !app('request')->get('action')): ?>
					<select class="form-control custom-select" id="accountsRecordSel" title="<?php echo $Lang['please_select']; ?>" style="width: 180px">
						<option value="accounts_record"><?php echo $Lang['transaction_flow']; ?></option>
						<option value="credit_record"><?php echo $Lang['balance']; ?></option>
						<?php if($Userinfo['user']['is_open_credit_limit']==1): ?>
            			<option value="credit_limit"><?php echo $Lang['credit_amount']; ?></option>
            			<?php endif; ?>
					</select>
					<?php endif; ?>
				</div>
			</div>

			<div class="table-responsive">
				<?php if(app('request')->get('action')=='accounts_record' or !app('request')->get('action')): ?>
				<table class="table tablelist">
  <colgroup>
    <col>
    <col>
    <col>
    <col>
    <col>
    <col>
    <col>
    <col>
  </colgroup>
  <thead class="bg-light">
    <tr>
      <th class="pointer" prop="id">
        <span>ID</span>
        <span class="text-black-50 d-inline-flex flex-column justify-content-center ml-1 offset-3">
          <i class="bx bx-caret-up"></i>
          <i class="bx bx-caret-down"></i>
        </span>
      </th>
      <th class="pointer" prop="invoice_id">
        <span><?php echo $Lang['bill_no']; ?></span>
        <span class="text-black-50 d-inline-flex flex-column justify-content-center ml-1 offset-3">
          <i class="bx bx-caret-up"></i>
          <i class="bx bx-caret-down"></i>
        </span>
      </th>
      <th class="pointer" prop="amount_in">
        <span><?php echo $Lang['amount_money']; ?></span>
        <span class="text-black-50 d-inline-flex flex-column justify-content-center ml-1 offset-3">
          <i class="bx bx-caret-up"></i>
          <i class="bx bx-caret-down"></i>
        </span>
      </th>
      <th>
        <span><?php echo $Lang['describe']; ?></span>
      </th>
      <th>
        <span><?php echo $Lang['payment_method']; ?></span>
      </th>
      <th>
        <span><?php echo $Lang['type']; ?></span>
      </th>
      <th class="pointer" prop="transaction_time">
        <span><?php echo $Lang['transaction_time']; ?></span>
        <span class="text-black-50 d-inline-flex flex-column justify-content-center ml-1 offset-3">
          <i class="bx bx-caret-up"></i>
          <i class="bx bx-caret-down"></i>
        </span>
      </th>
      <th class="pointer" prop="trans_id">
        <span><?php echo $Lang['transaction_serial_number']; ?></span>
        <span class="text-black-50 d-inline-flex flex-column justify-content-center ml-1 offset-3">
          <i class="bx bx-caret-up"></i>
          <i class="bx bx-caret-down"></i>
        </span>
      </th>
    </tr>
  </thead>
  <tbody>
    <?php if($Transaction): foreach($Transaction as $list): ?>
    <tr>
      <td><?php echo $list['id']; ?></td>
      <td><a href="viewbilling?id=<?php echo $list['invoice_id']; ?>"><span class="badge badge-light">#<?php echo $list['invoice_id']; ?></span></a></td>
      <td><?php echo $Currency['prefix']; if($list['refund']): ?><?php echo $list['amount_in']; else: ?><?php echo $list['amount_out']; ?><?php endif; ?></td>
      <td><?php echo $list['description']; ?></td>
      <td><?php echo $list['payment_zh']; ?></td>
      <td><?php echo $list['type_zh']; ?></td>
      <td><?php echo date("Y-m-d H:i:s",!is_numeric($list['pay_time'])? strtotime($list['pay_time']) : $list['pay_time']); ?></td>
      <td><?php echo $list['trans_id']; ?></td>
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
				<?php elseif(app('request')->get('action')=='credit_record'): ?>
				<table class="table tablelist">
  <colgroup>
    <col>
    <col>
    <col>
    <col>
    <col>
  </colgroup>
  <thead class="bg-light">
    <tr>
      <th class="pointer" prop="id">
        <span>ID</span>
        <span class="text-black-50 d-inline-flex flex-column justify-content-center ml-1 offset-3">
          <i class="bx bx-caret-up"></i>
          <i class="bx bx-caret-down"></i>
        </span>
      </th>
      <th class="pointer" prop="amount">
        <span><?php echo $Lang['amount_money']; ?></span>
        <span class="text-black-50 d-inline-flex flex-column justify-content-center ml-1 offset-3">
          <i class="bx bx-caret-up"></i>
          <i class="bx bx-caret-down"></i>
        </span>
      </th>
      <th class="pointer" prop="description">
        <span><?php echo $Lang['describe']; ?></span>
        <span class="text-black-50 d-inline-flex flex-column justify-content-center ml-1 offset-3">
          <i class="bx bx-caret-up"></i>
          <i class="bx bx-caret-down"></i>
        </span>
      </th>
      <th class="pointer" prop="type">
        <span><?php echo $Lang['type']; ?></span>
        <span class="text-black-50 d-inline-flex flex-column justify-content-center ml-1 offset-3">
          <i class="bx bx-caret-up"></i>
          <i class="bx bx-caret-down"></i>
        </span>
      </th>
      <th class="pointer" prop="create_time">
        <span><?php echo $Lang['payment_time']; ?></span>
        <span class="text-black-50 d-inline-flex flex-column justify-content-center ml-1 offset-3">
          <i class="bx bx-caret-up"></i>
          <i class="bx bx-caret-down"></i>
        </span>
      </th>
    </tr>
  </thead>
  <tbody>
    <?php if($Transaction): foreach($Transaction as $list): ?>
    <tr>
      <td><?php echo $list['id']; ?></td>
      <td><?php echo $Currency['prefix']; ?><?php echo $list['amount']; ?></td>
      <td><?php echo $list['description']; ?></td>
      <td><?php echo $list['type']; ?></td>
      <td><?php echo date("Y-m-d H:i:s",!is_numeric($list['create_time'])? strtotime($list['create_time']) : $list['create_time']); ?></td>
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
				<?php elseif(app('request')->get('action')=='credit_limit'): ?>
				<table class="table tablelist">
  <colgroup>
    <col>
    <col>
    <col>
    <col>
    <col>
    <col>
    <col>
    <col>
  </colgroup>
  <thead class="bg-light">
    <tr>
      <th class="pointer" prop="id">
        <span>ID</span>
        <span class="text-black-50 d-inline-flex flex-column justify-content-center ml-1 offset-3">
          <i class="bx bx-caret-up"></i>
          <i class="bx bx-caret-down"></i>
        </span>
      </th>
      <th class="pointer" prop="invoice_id">
        <span><?php echo $Lang['bill_no']; ?></span>
        <span class="text-black-50 d-inline-flex flex-column justify-content-center ml-1 offset-3">
          <i class="bx bx-caret-up"></i>
          <i class="bx bx-caret-down"></i>
        </span>
      </th>
      <th class="pointer" prop="amount_in">
        <span><?php echo $Lang['amount_money']; ?></span>
        <span class="text-black-50 d-inline-flex flex-column justify-content-center ml-1 offset-3">
          <i class="bx bx-caret-up"></i>
          <i class="bx bx-caret-down"></i>
        </span>
      </th>
      <th class="pointer" prop="id">
        <span><?php echo $Lang['type']; ?></span>
        <span class="text-black-50 d-inline-flex flex-column justify-content-center ml-1 offset-3">
          <i class="bx bx-caret-up"></i>
          <i class="bx bx-caret-down"></i>
        </span>
      </th>
      <th class="pointer" prop="type">
        <span><?php echo $Lang['transaction_time']; ?></span>
        <span class="text-black-50 d-inline-flex flex-column justify-content-center ml-1 offset-3">
          <i class="bx bx-caret-up"></i>
          <i class="bx bx-caret-down"></i>
        </span>
      </th>
    </tr>
  </thead>
  <tbody>
    <?php if($Transaction): foreach($Transaction as $list): ?>
    <tr>
      <td><?php echo $list['id']; ?></td>
      <td><a href="viewbilling?id=<?php echo $list['id']; ?>"><span class="badge badge-light">#<?php echo $list['id']; ?></span></a></td>
      <td><?php echo $list['subtotal']; ?></td>
      <td><?php echo $list['type']; ?></td>
      <td><?php echo date("Y-m-d H:i:s",!is_numeric($list['paid_time'])? strtotime($list['paid_time']) : $list['paid_time']); ?></td>
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
				<?php elseif(app('request')->get('action')=='recharge_record'): ?>
				<table class="table tablelist">
  <colgroup>
    <col>
    <col>
    <col>
    <col>
    <col>
    <col>
    <col>
  </colgroup>
  <thead class="bg-light">
    <tr>
      <th class="pointer" prop="id">
        <span>ID</span>
        <span class="text-black-50 d-inline-flex flex-column justify-content-center ml-1 offset-3">
          <i class="bx bx-caret-up"></i>
          <i class="bx bx-caret-down"></i>
        </span>
      </th>
      <th class="pointer" prop="invoice_id">
        <span><?php echo $Lang['bill_no']; ?></span>
        <span class="text-black-50 d-inline-flex flex-column justify-content-center ml-1 offset-3">
          <i class="bx bx-caret-up"></i>
          <i class="bx bx-caret-down"></i>
        </span>
      </th>
      <th class="pointer" prop="amount_in">
        <span><?php echo $Lang['amount_money']; ?></span>
        <span class="text-black-50 d-inline-flex flex-column justify-content-center ml-1 offset-3">
          <i class="bx bx-caret-up"></i>
          <i class="bx bx-caret-down"></i>
        </span>
      </th>
      <th>
        <span><?php echo $Lang['payment_method']; ?></span>
      </th>
      <th>
        <span><?php echo $Lang['describe']; ?></span>
      </th>
      <th class="pointer" prop="pay_time">
        <span><?php echo $Lang['recharge_time']; ?></span>
        <span class="text-black-50 d-inline-flex flex-column justify-content-center ml-1 offset-3">
          <i class="bx bx-caret-up"></i>
          <i class="bx bx-caret-down"></i>
        </span>
      </th>
      <th class="pointer" prop="trans_id">
        <span><?php echo $Lang['transaction_serial_number']; ?></span>
        <span class="text-black-50 d-inline-flex flex-column justify-content-center ml-1 offset-3">
          <i class="bx bx-caret-up"></i>
          <i class="bx bx-caret-down"></i>
        </span>
      </th>
    </tr>
  </thead>
  <tbody>
    <?php if($Transaction): foreach($Transaction as $list): ?>
    <tr>
      <td><?php echo $list['id']; ?></td>
      <td><a href="viewbilling?id=<?php echo $list['invoice_id']; ?>"><span class="badge badge-light">#<?php echo $list['invoice_id']; ?></span></a></td>
      <td><?php echo $Currency['prefix']; if($list['refund']): ?><?php echo $list['amount_in']; else: ?><?php echo $list['amount_out']; ?><?php endif; ?></td>
      <td><?php echo $list['payment_zh']; ?></td>
      <td><?php echo $list['description']; ?></td>
      <td><?php echo date("Y-m-d H:i:s",!is_numeric($list['pay_time'])? strtotime($list['pay_time']) : $list['pay_time']); ?></td>
      <td><?php echo $list['trans_id']; ?></td>
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
				<?php elseif(app('request')->get('action')=='refund_record'): ?>
				<table class="table tablelist">
  <colgroup>
    <col>
    <col>
    <col>
    <col>
    <col>
  </colgroup>
  <thead class="bg-light">
    <tr>
      <th class="pointer" prop="id">
        <span>ID</span>
        <span class="text-black-50 d-inline-flex flex-column justify-content-center ml-1 offset-3">
          <i class="bx bx-caret-up"></i>
          <i class="bx bx-caret-down"></i>
        </span>
      </th>
      <th class="pointer" prop="invoice_id">
        <span><?php echo $Lang['bill_no']; ?></span>
        <span class="text-black-50 d-inline-flex flex-column justify-content-center ml-1 offset-3">
          <i class="bx bx-caret-up"></i>
          <i class="bx bx-caret-down"></i>
        </span>
      </th>
      <th class="pointer" prop="amount_out">
        <span><?php echo $Lang['amount_money']; ?></span>
        <span class="text-black-50 d-inline-flex flex-column justify-content-center ml-1 offset-3">
          <i class="bx bx-caret-up"></i>
          <i class="bx bx-caret-down"></i>
        </span>
      </th>
      <th>
        <span><?php echo $Lang['describe']; ?></span>
      </th>
      <th class="pointer" prop="pay_time">
        <span><?php echo $Lang['refund_time']; ?></span>
        <span class="text-black-50 d-inline-flex flex-column justify-content-center ml-1 offset-3">
          <i class="bx bx-caret-up"></i>
          <i class="bx bx-caret-down"></i>
        </span>
      </th>
    </tr>
  </thead>
  <tbody>
    <?php if($Transaction): foreach($Transaction as $list): ?>
    <tr>
      <td><?php echo $list['id']; ?></td>
      <td><a href="viewbilling?id=<?php echo $list['invoice_id']; ?>"><span class="badge badge-light">#<?php echo $list['invoice_id']; ?></span></a></td>
      <td><?php echo $Currency['prefix']; ?><?php echo $list['amount_out']; ?></td>
      <td><?php echo $list['description']; ?></td>
      <td><?php echo date("Y-m-d H:i:s",!is_numeric($list['pay_time'])? strtotime($list['pay_time']) : $list['pay_time']); ?></td>
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
				<?php elseif(app('request')->get('action')=='withdraw_record'): ?>
				<table class="table tablelist">
  <colgroup>
    <col>
    <col>
    <col>
    <col>
    <col>
  </colgroup>
  <thead class="bg-light">
    <tr>
      <th class="pointer" prop="id">
        <span>ID</span>
        <span class="text-black-50 d-inline-flex flex-column justify-content-center ml-1 offset-3">
          <i class="bx bx-caret-up"></i>
          <i class="bx bx-caret-down"></i>
        </span>
      </th>
      <th class="pointer" prop="num">
        <span><?php echo $Lang['amount_money']; ?></span>
        <span class="text-black-50 d-inline-flex flex-column justify-content-center ml-1 offset-3">
          <i class="bx bx-caret-up"></i>
          <i class="bx bx-caret-down"></i>
        </span>
      </th>
      <th>
        <span><?php echo $Lang['describe']; ?></span>
      </th>
      <th>
        <span><?php echo $Lang['source']; ?></span>
      </th>
      <th class="pointer" prop="create_time">
        <span><?php echo $Lang['withdrawal_time']; ?></span>
        <span class="text-black-50 d-inline-flex flex-column justify-content-center ml-1 offset-3">
          <i class="bx bx-caret-up"></i>
          <i class="bx bx-caret-down"></i>
        </span>
      </th>
    </tr>
  </thead>
  <tbody>
    <?php if($Transaction): foreach($Transaction as $list): ?>
    <tr>
      <td><?php echo $list['id']; ?></td>
      <td><?php echo $list['num']; ?></td>
      <td><?php echo $list['des']; ?></td>
      <td><?php echo $list['reason']; ?></td>
      <td><?php echo date("Y-m-d H:i",!is_numeric($list['create_time'])? strtotime($list['create_time']) : $list['create_time']); ?></td>
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
				<?php endif; ?>
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
				location.href = 'transaction?action=<?php echo app('request')->get('action'); ?>&keywords=<?php echo app('request')->get('keywords'); ?>&sort=<?php echo app('request')->get('sort'); ?>&orderby=<?php echo app('request')->get('orderby'); ?>&page=1&limit=' + $('#limitSel').val()
			} else {
				location.href = 'transaction?keywords=<?php echo app('request')->get('keywords'); ?>&sort=<?php echo app('request')->get('sort'); ?>&orderby=<?php echo app('request')->get('orderby'); ?>&page=1&limit=' + $('#limitSel').val()
			}

		})


	})
</script>
		</div>
	</div>
</div>

<style>
/* Transaction page specific styles */
.nav-tabs {
    border-bottom: 1px solid rgba(240, 138, 93, 0.2);
    margin-bottom: 1.5rem;
}

.nav-tabs .nav-item {
    margin-right: 10px;
}

.nav-tabs .nav-link {
    color: var(--gray);
    border: none;
    padding: 0.75rem 1rem;
    border-radius: 8px 8px 0 0;
    font-weight: 500;
    position: relative;
    transition: all 0.3s ease;
}

.nav-tabs .nav-link:hover {
    color: var(--primary);
    background-color: rgba(240, 138, 93, 0.05);
}

.nav-tabs .nav-link.active {
    color: var(--primary);
    background-color: transparent;
    font-weight: 600;
}

.nav-tabs .nav-link.active::after {
    content: "";
    position: absolute;
    bottom: -1px;
    left: 0;
    width: 100%;
    height: 2px;
    background-color: var(--primary);
    border-radius: 2px 2px 0 0;
}

.table-header {
    display: flex;
    justify-content: space-between;
    align-items: center;
    margin-bottom: 1rem;
}

/* Improve select dropdown appearance */
#accountsRecordSel {
    height: calc(1.5em + 0.75rem + 2px);
    padding: 0.375rem 1.75rem 0.375rem 0.75rem;
    font-size: 0.875rem;
    font-weight: 500;
    color: var(--dark);
    background-color: #fff;
    border: 1px solid rgba(240, 138, 93, 0.2);
    border-radius: 50px;
    transition: all 0.3s;
    box-shadow: 0 2px 5px rgba(240, 138, 93, 0.1);
    cursor: pointer;
}

#accountsRecordSel:hover {
    border-color: var(--primary);
    box-shadow: 0 4px 10px rgba(240, 138, 93, 0.15);
    transform: translateY(-1px);
}

#accountsRecordSel:focus {
    border-color: var(--primary);
    outline: 0;
    box-shadow: 0 0 0 3px rgba(240, 138, 93, 0.25);
}

/* Improve table appearance */
.table th {
    font-weight: 600;
    color: var(--dark);
    background-color: rgba(240, 138, 93, 0.05);
    border-bottom: 2px solid rgba(240, 138, 93, 0.2);
    cursor: pointer;
}

.table th.pointer:hover {
    background-color: rgba(240, 138, 93, 0.1);
}

.table td {
    vertical-align: middle;
    border-bottom: 1px solid rgba(0, 0, 0, 0.05);
}

.table tr:hover td {
    background-color: rgba(240, 138, 93, 0.03);
}

/* Card title styling */
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

/* Responsive adjustments */
@media (max-width: 768px) {
    .nav-tabs .nav-item {
        margin-right: 5px;
    }
    
    .nav-tabs .nav-link {
        padding: 0.5rem 0.75rem;
        font-size: 0.9rem;
    }
    
    .card-title {
        font-size: 1.1rem;
        margin-bottom: 1.25rem;
    }
    
    #accountsRecordSel {
        width: 150px !important;
    }
}

@media (max-width: 576px) {
    .nav-tabs {
        display: flex;
        flex-wrap: nowrap;
        overflow-x: auto;
        padding-bottom: 5px;
    }
    
    .nav-tabs .nav-item {
        flex: 0 0 auto;
    }
    
    .nav-tabs .nav-link {
        padding: 0.4rem 0.6rem;
        font-size: 0.85rem;
        white-space: nowrap;
    }
    
    .table-header {
        flex-direction: column;
        align-items: flex-start;
    }
    
    .table-search {
        width: 100%;
        margin-top: 10px;
    }
    
    #accountsRecordSel {
        width: 100% !important;
    }
}
</style>

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