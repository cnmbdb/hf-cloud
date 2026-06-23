<?php /*a:11:{s:74:"/www/wwwroot/cloud.hf.pw2/public/themes/clientarea/ogmiao/submitticket.tpl";i:1720000043;s:75:"/www/wwwroot/cloud.hf.pw2/public/themes/clientarea/ogmiao/includes/head.tpl";i:1742354372;s:75:"/www/wwwroot/cloud.hf.pw2/public/themes/clientarea/ogmiao/includes/menu.tpl";i:1720065013;s:81:"/www/wwwroot/cloud.hf.pw2/public/themes/clientarea/ogmiao/includes/pageheader.tpl";i:1719999923;s:81:"/www/wwwroot/cloud.hf.pw2/public/themes/clientarea/ogmiao/includes/breadcrumb.tpl";i:1719999923;s:73:"/www/wwwroot/cloud.hf.pw2/public/themes/clientarea/ogmiao/error/alert.tpl";i:1719999922;s:81:"/www/wwwroot/cloud.hf.pw2/public/themes/clientarea/ogmiao/error/notifications.tpl";i:1719999922;s:95:"/www/wwwroot/cloud.hf.pw2/public/themes/clientarea/ogmiao/supporttickets/supporttickets-one.tpl";i:1719999922;s:95:"/www/wwwroot/cloud.hf.pw2/public/themes/clientarea/ogmiao/supporttickets/supporttickets-two.tpl";i:1719999922;s:81:"/www/wwwroot/cloud.hf.pw2/public/themes/clientarea/ogmiao/includes/summernote.tpl";i:1719999923;s:79:"/www/wwwroot/cloud.hf.pw2/public/themes/clientarea/ogmiao/includes/markdown.tpl";i:1719999923;}*/ ?>

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
				<?php endif; if($ErrorMsg): ?>
	<!-- <div class="alert alert-danger mb-4">
	<div class="alert-body"></div>
</div> -->
<script type="text/javascript">
	$(function () {
		toastr.error('');
	});
</script>
<?php endif; if($SuccessMsg): ?>
	<script type="text/javascript">
	$(function () {
		toastr.success('');
		setTimeout(function () {
			var url = 'supporttickets'
			if (url) {
				location.href = url
			}
		}, 500);
	});
</script>
<?php endif; if($SubmitTicket['department']): if(app('request')->get('step') != '2'): ?>
		<style>
	.border-hover:hover {
		box-shadow: 0px 0px 0px 1px #007bfc;
	}
</style>
<div class="card">
	<div class="card-body">
		<div class="ticket-top">
			<p><?php echo $Lang['ticket_top_one']; ?></p>

			<p><?php echo $Lang['ticket_top_two']; ?></p>

			<p><?php echo $Lang['ticket_top_three']; ?></p>

			<p><?php echo $Lang['ticket_top_four']; ?></p>

			<p><?php echo $Lang['ticket_top_five']; ?></p>

			<p><?php echo $Lang['ticket_top_six']; ?>:</p>

			<p><?php echo $Lang['ticket_top_seven']; ?></p>

			<p><?php echo $Lang['ticket_top_eight']; ?>
		</div>
	</div>
</div>

<div class="card">
	<div class="card-body">
		<div class="row">
			<?php if($SubmitTicket['department']): foreach($SubmitTicket['department'] as $department): ?>
			<div class="col-sm-4">
				<a href="submitticket?step=2&dptid=<?php echo $department['id']; ?>">
					<div class="card border border-hover">
						<div class="card-header bg-transparent ">
							<h5 class="my-0 "><?php echo $department['name']; ?></h5>
						</div>
						<div class="card-body">
							<p class="card-text text-muted"><?php echo $department['description']; ?> </p>
						</div>
					</div>
				</a>
			</div>
			<?php endforeach; else: ?>
			<!-- <div class="alert alert-danger mb-4">
	<div class="alert-body">[value]</div>
</div> -->
<script type="text/javascript">
	$(function () {
		toastr.error('[value]');
	});
</script>"}
			<?php endif; ?>
		</div>
	</div>
</div>
	<?php else: ?>
		<link href="/themes/clientarea/default/assets/libs/summernote/summernote-bs4.min.css?v=<?php echo $Ver; ?>" rel="stylesheet" type="text/css">
<script src="/themes/clientarea/default/assets/libs/summernote/summernote-bs4.min.js?v=<?php echo $Ver; ?>"></script>
<script src="/themes/clientarea/default/assets/libs/summernote/lang/summernote-zh-CN.min.js?v=<?php echo $Ver; ?>"></script>
<script>
$(document).ready(function(){
	$(".summernote").summernote({
		placeholder: '请输入您的问题',
		height: 250,
		lang: 'zh-CN',
		tabsize: 4,
		minHeight: null,
		maxHeight: null,
		focus: !0,
	    toolbar: [//工具栏配置
            ['style', ['bold', 'italic', 'underline', 'clear']],
            ['para', ['ul', 'ol', 'paragraph']],
        ],
	})
});
</script>
<!-- markdown 存在的问题: class名称和项目名称冲突 导致工具栏字体图标无法显示 -->

<!-- <link href="/themes/clientarea/default/assets/libs/markdown/css/bootstrap-markdown.min.css" rel="stylesheet" type="text/css">
<link href="/themes/clientarea/default/assets/libs/markdown/css/htmleaf-demo.css" rel="stylesheet" type="text/css">
<script src="/themes/clientarea/default/assets/libs/markdown/js/bootstrap-markdown.js"></script>
<script src="/themes/clientarea/default/assets/libs/markdown/locale/bootstrap-markdown.zh.js"></script>
<script>
  $(function () {
    $(".markdown").markdown({autofocus:false,savable:false, language:'zh'})
  })
</script> -->

<link href="/themes/clientarea/default/assets/libs/markdown-editor/dist/css/bootstrap-markdown-editor.css?v=<?php echo $Ver; ?>" rel="stylesheet" type="text/css">

<script src="/themes/clientarea/default/assets/libs/markdown-editor/js/ace.js?v=<?php echo $Ver; ?>"></script>
<script src="/themes/clientarea/default/assets/libs/markdown-editor/js/marked.min.js?v=<?php echo $Ver; ?>"></script>
<script src="/themes/clientarea/default/assets/libs/markdown-editor/dist/js/bootstrap-markdown-editor.js?v=<?php echo $Ver; ?>"></script>
<script>
  $(function () {
    $(".markdown").markdownEditor({
      preview: true,
			onPreview: function (content, callback) {
				callback(marked(content));
			}
    })
  })
</script>
<style>
   .was-validated .custom-control-input:valid ~ .custom-control-label::before{
    background-color: #fff;
  }
  .bootstrap-select.is-valid .dropdown-toggle, .was-validated .bootstrap-select select:valid+.dropdown-toggle{
      border: 1px solid #ced4da;
  }
    .biankuang{
    border: 1px solid #ced4da;
  }
  .form-control.is-valid, .was-validated .form-control:valid{
    display: block;
    width: 100%;
    padding: 0.47rem 0.75rem;
    font-size: 0.8125rem;
    font-weight: 400;
    line-height: 1.5;
    color: #495057; 
    background-color: #fff;
    background-clip: padding-box;
    border: 1px solid #ced4da;
    border-radius: 0.25rem;
    background-image: url(data:image/svg+xml;base64,PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0idXRmLTgiP…45NSwyLjI2LDYsMi4xMyw2LDJWMS41QzYsMS4yMiw1Ljc4LDEsNS41LDF6Ii8+Cjwvc3ZnPgo=);
    background-position-y: 50%;
    background-position-x: calc(100% - 11px);
    background-repeat: no-repeat;
    padding-right: 24px;
  }
</style>
<div class="card">
	<div class="card-body">
    
		<form method="post" class="needs-validation" novalidate enctype="multipart/form-data">
			<div class="row">
				<div class="col-sm-4 col-12">
					<div class="form-group">
						<label class="form-control-label" for="dptid"><?php echo $Lang['department']; ?></label>
						<select class="form-control" id="dptid" name="dptid" onchange="window.location.href='submitticket?step=2&dptid='+$(this).val()">
							<?php foreach($SubmitTicket['department'] as $department): ?>
							<option value="<?php echo $department['id']; ?>" <?php if(app('request')->get('dptid')==$department['id']): ?>selected<?php endif; ?>> <?php echo $department['name']; ?>
								</option> <?php endforeach; ?> </select> </div> </div> <div class="col-sm-4 col-12">
								<div class="form-group">
									<label class="form-control-label" for="hostid"><?php echo $Lang['related_products']; ?></label>
									<select class="form-control" id="hostid" name="hostid">
										<?php foreach($SubmitTicket['ticketpage']['host_list'] as $key => $host): ?>
										<option value="<?php echo $key; ?>" <?php if(app('request')->get('pid')==$key): ?>selected<?php endif; ?>><?php echo $host; ?> </option> <?php endforeach; ?> </select>
											</div> </div> <div class="col-sm-4 col-12">
											<div class="form-group">
												<label class="form-control-label" for="priority"><?php echo $Lang['priority']; ?></label>
												<select class="form-control" id="priority" name="priority">
													<?php foreach($SubmitTicket['ticketpage']['priority'] as $key => $priority): ?>
													<option value="<?php echo strtolower($key); ?>" <?php if($key=='Medium'): ?>selected<?php endif; ?>><?php echo $priority; ?> </option>
														<?php endforeach; ?> </select> </div> </div> <div class="col-12">
														<div class="form-group">
															<label class="form-control-label" for="title"><?php echo $Lang['title']; ?></label>
															<input type="text" class="form-control" id="title" name="title" value="<?php echo app('request')->get('title'); ?>" required/>
														</div>
											</div>
											<div class="col-12">
												<?php foreach($ticketCustom as $k => $list): ?>
													<div class="form-group">
														<label for="<?php echo $list['id']; ?>"><?php echo $list['fieldname']; ?></label>
														<?php if($list['fieldtype'] == 'dropdown'): ?>
															<!-- 下拉 -->
															<select name="customfield[<?php echo $list['id']; ?>]" class="form-control " <?php echo !empty($list['required']) ? 'required'  :  ''; ?>>
																<?php foreach($list['dropdown_option'] as $key => $val): ?>
																	<option value="<?php echo $key; ?>" <?php if((isset($_fields[$key]))): ?> selected <?php endif; ?>><?php echo $val; ?></option>
																<?php endforeach; ?>
															</select>
														<?php elseif($list['fieldtype'] == 'password'): ?>
															<!-- 密码 -->
															<input name="customfield[<?php echo $list['id']; ?>]" type="password" <?php if((isset($_fields[$list['id']]))): ?> value="<?php echo $_fields[$list['id']]; ?>" <?php endif; ?>class="form-control" placeholder="<?php echo $Lang['custom_password_box']; ?>" <?php echo !empty($list['required']) ? 'required'  :  ''; ?>/>
														<?php elseif($list['fieldtype'] == 'text' || $list['fieldtype'] == 'link'): ?>
															<!-- 文本框、链接 -->
															<input name="customfield[<?php echo $list['id']; ?>]" type="text" class="form-control" <?php if((isset($_fields[$list['id']]))): ?> value="<?php echo $_fields[$list['id']]; ?>" <?php endif; ?> placeholder="<?php echo $list['fieldname']; ?>" <?php echo !empty($list['required']) ? 'required'  :  ''; ?>/>
														<?php elseif($list['fieldtype'] == 'tickbox'): ?>
                            
															<!-- 选项框 -->
                               							<div class="custom-control custom-switch mb-3" dir="ltr">
                                                        <input type="checkbox" class="custom-control-input" name="customfield[<?php echo $list['id']; ?>]" <?php if((isset($_fields[$list['id']]))): ?> checked <?php endif; ?> id="customSwitchsizesm" <?php echo !empty($list['required']) ? 'required'  :  ''; ?>>
                                                        <label class="custom-control-label" for="customSwitchsizesm"></label>
                                                    	</div>
															<!-- <input type="checkbox" class="custom-control-input" name="customfield[<?php echo $list['id']; ?>]" <?php if((isset($_fields[$list['id']]))): ?> checked <?php endif; ?>><?php echo $list['fieldname']; ?> -->
														<?php elseif($list['fieldtype'] == 'textarea'): ?>
															<!-- 文本域 -->
															<textarea name="customfield[<?php echo $list['id']; ?>]" cols="30" rows="10" class="form-control" <?php echo !empty($list['required']) ? 'required'  :  ''; ?>><?php if((isset($_fields[$list['id']]))): ?> <?php echo $_fields[$list['id']]; ?> <?php endif; ?></textarea>
														<?php endif; ?>
													</div>
												<?php endforeach; ?>
											</div>
											<div class="col-12">
												<div class="form-group">
													<label class="form-control-label" for="content"><?php echo $Lang['content']; ?></label>
													<textarea class="form-control" id="content" name="content" rows="10"
														placeholder="<?php echo $Lang['please_enter_question']; ?>" required></textarea>
													<!-- <textarea class="form-control markdown" id="content" name="content" rows="10"
														placeholder="请输入问题" required data-provide="markdown-editable"></textarea> -->
														<!-- <div class="markdown"></div> -->
												</div>
											</div>
											<div class="col-12">
												<div class="form-group">
													<label class="form-control-label col-form-label col-12"><?php echo $Lang['attachment']; ?></label>
													<div class="row" id="filelist">
														<div class="col-12 mb-2 filebox d-flex justify-content-between">
															<input type="file" class="form-control-file fileWacth w-75" name="attachments[]">
															<a class="btn btn-danger deletefileBtn" style="display:none"><?php echo $Lang['delete']; ?></a>
														</div>
													</div>
													<a class="btn btn-success mt-2" id="addFileBtn"><?php echo $Lang['add_more']; ?></a>
												</div>
											</div>
											<div class="col-6 col-sm-3">
												<div class="form-group">
													<button type="submit" class="btn btn-primary btn-block submitBtn">
														<span><?php echo $Lang['submit_work_order']; ?></span>
													</button>
												</div>
											</div>
											<div class="col-6 col-sm-3">
												<div class="form-group">
													<a href="supporttickets" class="btn btn-block btn-light"><?php echo $Lang['cancel']; ?></a>
												</div>
											</div>
								</div>

		</form>
	</div>
</div>
<script>
  // Example starter JavaScript for disabling form submissions if there are invalid fields
  (function() {
    'use strict';
    window.addEventListener('load', function() {
      // Fetch all the forms we want to apply custom Bootstrap validation styles to
      var forms = document.getElementsByClassName('needs-validation');
      // Loop over them and prevent submission
      console.log(forms);
      var validation = Array.prototype.filter.call(forms, function(form) {
        
        form.addEventListener('submit', function(event) {
          if (form.checkValidity() === false) {
            event.preventDefault();
            event.stopPropagation();
          }else{
            // 提交按钮加载中
                // $("form").submit();
                $('.submitBtn').empty()
                $('.submitBtn').prepend(`<i class="bx bx-loader bx-spin font-size-16 align-middle mr-2"></i>提交工单`);
			  	$('.submitBtn').attr('disabled', true);
          }
      
          form.classList.add('was-validated');
        }, false);
      });
    },false);
  })();
  
  </script>
<script>
	$(function () {
		// 添加更多附件
		$('#addFileBtn').on('click', function () {
			var fileHtml = `
					<div class="col-12 mb-2 filebox d-flex justify-content-between">
						<input type="file" class="form-control-file fileWacth w-75" name="attachments[]">
								<a class="btn btn-danger deletefileBtn" style="display:none">删除</a>
					</div>
			`
			$('#filelist').append(fileHtml)
		});

		// 删除附件
		$('#filelist').on('click', '.deletefileBtn', function () {
			$(this).hide().parent('.filebox').remove()
		});
		$('#filelist').on('change','.fileWacth',function(){
          if($(this).prop('files').length){
			$(this).next().show()									
		  }
		})										
		
	})
</script>
	<?php endif; else: ?>
	<link href="/themes/clientarea/default/assets/libs/summernote/summernote-bs4.min.css?v=<?php echo $Ver; ?>" rel="stylesheet" type="text/css">
<script src="/themes/clientarea/default/assets/libs/summernote/summernote-bs4.min.js?v=<?php echo $Ver; ?>"></script>
<script src="/themes/clientarea/default/assets/libs/summernote/lang/summernote-zh-CN.min.js?v=<?php echo $Ver; ?>"></script>
<script>
$(document).ready(function(){
	$(".summernote").summernote({
		placeholder: '请输入您的问题',
		height: 250,
		lang: 'zh-CN',
		tabsize: 4,
		minHeight: null,
		maxHeight: null,
		focus: !0,
	    toolbar: [//工具栏配置
            ['style', ['bold', 'italic', 'underline', 'clear']],
            ['para', ['ul', 'ol', 'paragraph']],
        ],
	})
});
</script>
<!-- markdown 存在的问题: class名称和项目名称冲突 导致工具栏字体图标无法显示 -->

<!-- <link href="/themes/clientarea/default/assets/libs/markdown/css/bootstrap-markdown.min.css" rel="stylesheet" type="text/css">
<link href="/themes/clientarea/default/assets/libs/markdown/css/htmleaf-demo.css" rel="stylesheet" type="text/css">
<script src="/themes/clientarea/default/assets/libs/markdown/js/bootstrap-markdown.js"></script>
<script src="/themes/clientarea/default/assets/libs/markdown/locale/bootstrap-markdown.zh.js"></script>
<script>
  $(function () {
    $(".markdown").markdown({autofocus:false,savable:false, language:'zh'})
  })
</script> -->

<link href="/themes/clientarea/default/assets/libs/markdown-editor/dist/css/bootstrap-markdown-editor.css?v=<?php echo $Ver; ?>" rel="stylesheet" type="text/css">

<script src="/themes/clientarea/default/assets/libs/markdown-editor/js/ace.js?v=<?php echo $Ver; ?>"></script>
<script src="/themes/clientarea/default/assets/libs/markdown-editor/js/marked.min.js?v=<?php echo $Ver; ?>"></script>
<script src="/themes/clientarea/default/assets/libs/markdown-editor/dist/js/bootstrap-markdown-editor.js?v=<?php echo $Ver; ?>"></script>
<script>
  $(function () {
    $(".markdown").markdownEditor({
      preview: true,
			onPreview: function (content, callback) {
				callback(marked(content));
			}
    })
  })
</script>
<style>
   .was-validated .custom-control-input:valid ~ .custom-control-label::before{
    background-color: #fff;
  }
  .bootstrap-select.is-valid .dropdown-toggle, .was-validated .bootstrap-select select:valid+.dropdown-toggle{
      border: 1px solid #ced4da;
  }
    .biankuang{
    border: 1px solid #ced4da;
  }
  .form-control.is-valid, .was-validated .form-control:valid{
    display: block;
    width: 100%;
    padding: 0.47rem 0.75rem;
    font-size: 0.8125rem;
    font-weight: 400;
    line-height: 1.5;
    color: #495057; 
    background-color: #fff;
    background-clip: padding-box;
    border: 1px solid #ced4da;
    border-radius: 0.25rem;
    background-image: url(data:image/svg+xml;base64,PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0idXRmLTgiP…45NSwyLjI2LDYsMi4xMyw2LDJWMS41QzYsMS4yMiw1Ljc4LDEsNS41LDF6Ii8+Cjwvc3ZnPgo=);
    background-position-y: 50%;
    background-position-x: calc(100% - 11px);
    background-repeat: no-repeat;
    padding-right: 24px;
  }
</style>
<div class="card">
	<div class="card-body">
    
		<form method="post" class="needs-validation" novalidate enctype="multipart/form-data">
			<div class="row">
				<div class="col-sm-4 col-12">
					<div class="form-group">
						<label class="form-control-label" for="dptid"><?php echo $Lang['department']; ?></label>
						<select class="form-control" id="dptid" name="dptid" onchange="window.location.href='submitticket?step=2&dptid='+$(this).val()">
							<?php foreach($SubmitTicket['department'] as $department): ?>
							<option value="<?php echo $department['id']; ?>" <?php if(app('request')->get('dptid')==$department['id']): ?>selected<?php endif; ?>> <?php echo $department['name']; ?>
								</option> <?php endforeach; ?> </select> </div> </div> <div class="col-sm-4 col-12">
								<div class="form-group">
									<label class="form-control-label" for="hostid"><?php echo $Lang['related_products']; ?></label>
									<select class="form-control" id="hostid" name="hostid">
										<?php foreach($SubmitTicket['ticketpage']['host_list'] as $key => $host): ?>
										<option value="<?php echo $key; ?>" <?php if(app('request')->get('pid')==$key): ?>selected<?php endif; ?>><?php echo $host; ?> </option> <?php endforeach; ?> </select>
											</div> </div> <div class="col-sm-4 col-12">
											<div class="form-group">
												<label class="form-control-label" for="priority"><?php echo $Lang['priority']; ?></label>
												<select class="form-control" id="priority" name="priority">
													<?php foreach($SubmitTicket['ticketpage']['priority'] as $key => $priority): ?>
													<option value="<?php echo strtolower($key); ?>" <?php if($key=='Medium'): ?>selected<?php endif; ?>><?php echo $priority; ?> </option>
														<?php endforeach; ?> </select> </div> </div> <div class="col-12">
														<div class="form-group">
															<label class="form-control-label" for="title"><?php echo $Lang['title']; ?></label>
															<input type="text" class="form-control" id="title" name="title" value="<?php echo app('request')->get('title'); ?>" required/>
														</div>
											</div>
											<div class="col-12">
												<?php foreach($ticketCustom as $k => $list): ?>
													<div class="form-group">
														<label for="<?php echo $list['id']; ?>"><?php echo $list['fieldname']; ?></label>
														<?php if($list['fieldtype'] == 'dropdown'): ?>
															<!-- 下拉 -->
															<select name="customfield[<?php echo $list['id']; ?>]" class="form-control " <?php echo !empty($list['required']) ? 'required'  :  ''; ?>>
																<?php foreach($list['dropdown_option'] as $key => $val): ?>
																	<option value="<?php echo $key; ?>" <?php if((isset($_fields[$key]))): ?> selected <?php endif; ?>><?php echo $val; ?></option>
																<?php endforeach; ?>
															</select>
														<?php elseif($list['fieldtype'] == 'password'): ?>
															<!-- 密码 -->
															<input name="customfield[<?php echo $list['id']; ?>]" type="password" <?php if((isset($_fields[$list['id']]))): ?> value="<?php echo $_fields[$list['id']]; ?>" <?php endif; ?>class="form-control" placeholder="<?php echo $Lang['custom_password_box']; ?>" <?php echo !empty($list['required']) ? 'required'  :  ''; ?>/>
														<?php elseif($list['fieldtype'] == 'text' || $list['fieldtype'] == 'link'): ?>
															<!-- 文本框、链接 -->
															<input name="customfield[<?php echo $list['id']; ?>]" type="text" class="form-control" <?php if((isset($_fields[$list['id']]))): ?> value="<?php echo $_fields[$list['id']]; ?>" <?php endif; ?> placeholder="<?php echo $list['fieldname']; ?>" <?php echo !empty($list['required']) ? 'required'  :  ''; ?>/>
														<?php elseif($list['fieldtype'] == 'tickbox'): ?>
                            
															<!-- 选项框 -->
                               							<div class="custom-control custom-switch mb-3" dir="ltr">
                                                        <input type="checkbox" class="custom-control-input" name="customfield[<?php echo $list['id']; ?>]" <?php if((isset($_fields[$list['id']]))): ?> checked <?php endif; ?> id="customSwitchsizesm" <?php echo !empty($list['required']) ? 'required'  :  ''; ?>>
                                                        <label class="custom-control-label" for="customSwitchsizesm"></label>
                                                    	</div>
															<!-- <input type="checkbox" class="custom-control-input" name="customfield[<?php echo $list['id']; ?>]" <?php if((isset($_fields[$list['id']]))): ?> checked <?php endif; ?>><?php echo $list['fieldname']; ?> -->
														<?php elseif($list['fieldtype'] == 'textarea'): ?>
															<!-- 文本域 -->
															<textarea name="customfield[<?php echo $list['id']; ?>]" cols="30" rows="10" class="form-control" <?php echo !empty($list['required']) ? 'required'  :  ''; ?>><?php if((isset($_fields[$list['id']]))): ?> <?php echo $_fields[$list['id']]; ?> <?php endif; ?></textarea>
														<?php endif; ?>
													</div>
												<?php endforeach; ?>
											</div>
											<div class="col-12">
												<div class="form-group">
													<label class="form-control-label" for="content"><?php echo $Lang['content']; ?></label>
													<textarea class="form-control" id="content" name="content" rows="10"
														placeholder="<?php echo $Lang['please_enter_question']; ?>" required></textarea>
													<!-- <textarea class="form-control markdown" id="content" name="content" rows="10"
														placeholder="请输入问题" required data-provide="markdown-editable"></textarea> -->
														<!-- <div class="markdown"></div> -->
												</div>
											</div>
											<div class="col-12">
												<div class="form-group">
													<label class="form-control-label col-form-label col-12"><?php echo $Lang['attachment']; ?></label>
													<div class="row" id="filelist">
														<div class="col-12 mb-2 filebox d-flex justify-content-between">
															<input type="file" class="form-control-file fileWacth w-75" name="attachments[]">
															<a class="btn btn-danger deletefileBtn" style="display:none"><?php echo $Lang['delete']; ?></a>
														</div>
													</div>
													<a class="btn btn-success mt-2" id="addFileBtn"><?php echo $Lang['add_more']; ?></a>
												</div>
											</div>
											<div class="col-6 col-sm-3">
												<div class="form-group">
													<button type="submit" class="btn btn-primary btn-block submitBtn">
														<span><?php echo $Lang['submit_work_order']; ?></span>
													</button>
												</div>
											</div>
											<div class="col-6 col-sm-3">
												<div class="form-group">
													<a href="supporttickets" class="btn btn-block btn-light"><?php echo $Lang['cancel']; ?></a>
												</div>
											</div>
								</div>

		</form>
	</div>
</div>
<script>
  // Example starter JavaScript for disabling form submissions if there are invalid fields
  (function() {
    'use strict';
    window.addEventListener('load', function() {
      // Fetch all the forms we want to apply custom Bootstrap validation styles to
      var forms = document.getElementsByClassName('needs-validation');
      // Loop over them and prevent submission
      console.log(forms);
      var validation = Array.prototype.filter.call(forms, function(form) {
        
        form.addEventListener('submit', function(event) {
          if (form.checkValidity() === false) {
            event.preventDefault();
            event.stopPropagation();
          }else{
            // 提交按钮加载中
                // $("form").submit();
                $('.submitBtn').empty()
                $('.submitBtn').prepend(`<i class="bx bx-loader bx-spin font-size-16 align-middle mr-2"></i>提交工单`);
			  	$('.submitBtn').attr('disabled', true);
          }
      
          form.classList.add('was-validated');
        }, false);
      });
    },false);
  })();
  
  </script>
<script>
	$(function () {
		// 添加更多附件
		$('#addFileBtn').on('click', function () {
			var fileHtml = `
					<div class="col-12 mb-2 filebox d-flex justify-content-between">
						<input type="file" class="form-control-file fileWacth w-75" name="attachments[]">
								<a class="btn btn-danger deletefileBtn" style="display:none">删除</a>
					</div>
			`
			$('#filelist').append(fileHtml)
		});

		// 删除附件
		$('#filelist').on('click', '.deletefileBtn', function () {
			$(this).hide().parent('.filebox').remove()
		});
		$('#filelist').on('change','.fileWacth',function(){
          if($(this).prop('files').length){
			$(this).next().show()									
		  }
		})										
		
	})
</script>
<?php endif; if($TplName != 'login' && $TplName != 'register' && $TplName != 'pwreset' && $TplName != 'bind' && $TplName != 'loginaccesstoken'): ?>
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