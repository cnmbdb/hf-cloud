<?php /*a:8:{s:71:"/www/wwwroot/cloud.hf.pw2/public/themes/clientarea/default/register.tpl";i:1758904948;s:76:"/www/wwwroot/cloud.hf.pw2/public/themes/clientarea/default/includes/head.tpl";i:1758904948;s:76:"/www/wwwroot/cloud.hf.pw2/public/themes/clientarea/default/includes/menu.tpl";i:1758904948;s:82:"/www/wwwroot/cloud.hf.pw2/public/themes/clientarea/default/includes/pageheader.tpl";i:1758904948;s:82:"/www/wwwroot/cloud.hf.pw2/public/themes/clientarea/default/includes/breadcrumb.tpl";i:1758904948;s:74:"/www/wwwroot/cloud.hf.pw2/public/themes/clientarea/default/error/alert.tpl";i:1758904948;s:82:"/www/wwwroot/cloud.hf.pw2/public/themes/clientarea/default/error/notifications.tpl";i:1758904948;s:78:"/www/wwwroot/cloud.hf.pw2/public/themes/clientarea/default/includes/verify.tpl";i:1758904948;}*/ ?>

<!DOCTYPE html>
<html lang="zh-CN">

<head>
	<meta charset="utf-8" />
	<title><?php echo $Title; ?> | <?php echo $Setting['company_name']; ?></title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta content="<?php echo $Setting['web_seo_desc']; ?>" name="description" />
	<meta content="<?php echo $Setting['web_seo_keywords']; ?>" name="keywords" />
	<meta content="<?php echo $Setting['company_name']; ?>" name="author" />

	<!-- <link rel="shortcut icon" href="/themes/clientarea/default/assets/images/favicon.ico"> -->
<link href="/themes/clientarea/default/assets/css/bootstrap.min.css?v=<?php echo $Ver; ?>" rel="stylesheet" type="text/css" />
<link href="/themes/clientarea/default/assets/css/icons.min.css?v=<?php echo $Ver; ?>" rel="stylesheet" type="text/css" />
<link href="/themes/clientarea/default/assets/css/app.min.css?v=<?php echo $Ver; ?>" rel="stylesheet" type="text/css" />
<?php if(($load_css=load_css('custom.css'))): ?>
    <link href="<?php echo $load_css; ?>?v=<?php echo $Ver; ?>" rel="stylesheet" type="text/css" />
<?php endif; ?>
<!-- 自定义全局样式 -->
<link href="/themes/clientarea/default/assets_custom/css/global.css?v=<?php echo $Ver; ?>" rel="stylesheet" >
<link href="/themes/clientarea/default/assets_custom/css/responsive.css?v=<?php echo $Ver; ?>" rel="stylesheet">
<!-- 字体图标 -->



 <link href="/themes/clientarea/default/assets_custom/fonts/iconfont.css?v=<?php echo $Ver; ?>" rel="stylesheet"> 

<!-- JAVASCRIPT -->
<script src="/themes/clientarea/default/assets/libs/jquery/jquery.min.js?v=<?php echo $Ver; ?>"></script>
<script src="/themes/clientarea/default/assets/libs/bootstrap/js/bootstrap.bundle.min.js?v=<?php echo $Ver; ?>"></script>
<script src="/themes/clientarea/default/assets/libs/metismenu/metisMenu.min.js?v=<?php echo $Ver; ?>"></script>
<script src="/themes/clientarea/default/assets/libs/simplebar/simplebar.min.js?v=<?php echo $Ver; ?>"></script>
<script src="/themes/clientarea/default/assets/libs/node-waves/waves.min.js?v=<?php echo $Ver; ?>"></script>

<!-- <script src="/themes/clientarea/default/assets/libs/error-all/solve-error.js" type="text/javascript"></script> -->
<!-- 自定义js -->
<script src="/themes/clientarea/default/assets_custom/js/throttle.js?v=<?php echo $Ver; ?>"></script>

<link type="text/css" href="/themes/clientarea/default/assets/libs/toastr/build/toastr.min.css?v=<?php echo $Ver; ?>" rel="stylesheet" />
<script src="/themes/clientarea/default/assets/libs/toastr/build/toastr.min.js?v=<?php echo $Ver; ?>"></script>


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
<body data-sidebar="dark">
	<?php if($TplName != 'login' && $TplName != 'register' && $TplName != 'pwreset' && $TplName != 'bind' && $TplName != 'loginaccesstoken'): ?>
	<header id="page-topbar">
		<div class="navbar-header">
			<div class="d-flex">
				<!-- LOGO -->
				<div class="navbar-brand-box">
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
						<div class="user-center_header d-inline-flex align-items-center justify-content-center"
							style="display: inline-block;width: 30px;height: 30px;font-size: 16px;">
							<?php if(preg_match("/^[0-9]*[A-Za-z]+$/is", substr($Userinfo['user']['username'],0,1))): ?> 
							  <?php echo strtoupper(substr($Userinfo['user']['username'],0,1)); elseif(preg_match("/^[\x7f-\xff]*$/", substr($Userinfo['user']['username'],0,3))): ?> 
							  <?php echo substr($Userinfo['user']['username'],0,3); else: ?>
							  <?php echo strtoupper(substr($Userinfo['user']['username'],0,1)); ?> 
							<?php endif; ?>
						</div>
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
					<a href="/clientarea" class="waves-effect">
						<i class="bx bx-home-circle"></i>
						<span>首页</span>
					</a>
				</li>
				<li>
					<a href="/login" class="waves-effect">
						<i class="bx bx-user"></i>
						<span>登录</span>
					</a>
				</li>
				<li>
					<a href="/register" class="waves-effect">
						<i class="bx bx-user"></i> 
						<span>注册</span>
					</a>
				</li>
				<li>
					<a href="/cart" class="waves-effect">
						<i class="bx bx-cart-alt"></i>
						<span>订购产品</span>
					</a>
				</li>
				<li>				
					<a href="/news" class="waves-effect">
						<i class="bx bx-detail"></i>
						<span>新闻中心</span>
					</a>
				</li>
				<li>				
					<a href="/knowledgebase" class="waves-effect">
						<i class="bx bx-detail"></i>
						<span>帮助中心</span>
					</a>
				</li>
				<li>				
					<a href="/downloads" class="waves-effect">
						<i class="bx bx-download"></i>
						<span>资源下载</span>
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
			var url = '[url]'
			if (url) {
				location.href = url
			}
		}, 500);
	});
</script>
<?php endif; ?>
<script src="/themes/clientarea/default/assets/js/crypto-js.min.js" type="text/javascript"></script>
<script src="/themes/clientarea/default/assets/js/public.js?v=<?php echo $Ver; ?>"></script>

<style>
		.logo.text-center img{height:50px;}
    .input-group-prepend {
        width: 100px;
    }
	.auth-full-bg .bg-overlay {
		background: url(/themes/clientarea/default/assets_custom/img/new-background.jpg)no-repeat left top / 100% 1400px;
		background-size: cover;
		opacity:1;
	}
  .form-control,.btn-primary,.input-group-append{
    height: 46px;
  }
  .btn-primary{
    line-height: 28px;
  }
</style>
<script>
    var mk = '<?php echo $Setting['msfntk']; ?>';
</script>
<div class="container-fluid p-0">
    <?php if($Setting['login_header']): ?>
    <div class="text-center"><?php echo $Setting['login_header']; ?></div>
    <?php endif; ?>
    <div class="row no-gutters">
        <div class="col-xl-7 bglogo">
            <div class="auth-full-bg pt-lg-5 p-4" style="height:100%">
                <div class="w-100">
                    <?php if($Setting['custom_login_background_img']): ?>
                    <div class="bg-overlay" style="background: url(<?php echo $Setting['custom_login_background_img']; ?>) center no-repeat !important; background-size:cover !important;"></div>
					<?php else: ?>
                    <div class="bg-overlay"></div>
					<?php endif; ?>

                    <div class="d-flex h-100 flex-column justify-content-center">
                        <div class="row justify-content-center">
                            <div class="col-lg-7">
                                <div class="text-center">
                                    <div dir="ltr">
                                        <div class="owl-carousel owl-theme auth-review-carousel"
                                            id="auth-review-carousel">
                                            <div class="item">
                                                <div class="py-3">
                                                    <h1 class="text-white text-left">
                                                        <?php echo $Setting['custom_login_background_char']; ?></h1>
                                                    <p class="text-white-50 text-left">
                                                        <?php echo $Setting['custom_login_background_description']; ?></p>
                                                </div>

                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div> 
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- end col -->

        <div class="col-xl-5">
            <div class="auth-full-page-content p-4">
                <div class="login_right mx-auto">
                    <div class="d-flex flex-column h-100">
                        <div class="my-auto">
                            <div  class="logo text-center" >
                              <a href="<?php echo $Setting['web_jump_url']; ?>"><img  src="<?php echo $Setting['web_logo']; ?>" alt="" class="cursor" ></a>
                            </div>
                            <ul class="affs-nav nav nav-tabs nav-tabs-custom nav-justified" role="tablist">

								<?php if($Register['allow_register_phone']): ?>
									<li class="nav-item">
										<a class="nav-link fs-14 bg-transparent <?php if($Get['action']=="phone" || !$Get['action']): ?>active<?php endif; ?>" data-toggle="tab" href="#phone" role="tab" aria-selected="false"> <?php echo $Lang['mobile_registration']; ?></a>
									</li>
								<?php endif; if($Register['allow_register_email']): ?>
									<li class="nav-item">
										<a class="nav-link fs-14 bg-transparent <?php if(($Register['allow_register_email'] && !$Register['allow_register_phone']) || $Get['action']=="email"): ?>active<?php endif; ?>" data-toggle="tab" href="#email" role="tab" aria-selected="true"><?php echo $Lang['email_registration']; ?></a>
									</li>
								<?php endif; ?>

                            </ul>

                            <div class="mt-4">
								<div class="tab-content">	
									<?php if($Register['allow_register_email']): ?>
									<div id="email" class="tab-pane <?php if(($Register['allow_register_email'] && !$Register['allow_register_phone']) || $Get['action']=="email"): ?>active<?php endif; ?>" role="tabpanel">
										<form class="needs-validation" novalidate method="post" action="/register?action=email" onsubmit="encryptPass('phonePwd');encryptPass('phonePwdCheck');" ><input type="hidden" name="token" value="<?php echo $Token; ?>">
											<div class="form-group">
												<label for="email"><?php echo $Lang['mailbox']; ?></label>
												<input type="text" class="form-control" id="emailInp" name="email"
													placeholder="<?php echo $Lang['please_input_email']; ?>" value="<?php echo $Post['email']; ?>" required>
												<div class="invalid-feedback"><?php echo $Lang['please_input_email']; ?></div>
											</div>
											<?php if($Verify['allow_register_email_captcha']==1): if($Verify['is_captcha']==1): if(top=='top'): ?>
    <!--  20241015 新增模板钩子 -->
    <?php $hooks=hook('template_custom_clientarea_captcha_html',['id'=>'allow_register_email_captcha']); if(!empty($hooks[0])): foreach($hooks as $item): ?>
        <?php echo $item; ?>
      <?php endforeach; else: ?>
      <div class="form-group allow_register_email_captcha">
        <label >图形验证码</label>
        <div class="input-group">
          <input  <?php if([id]=='[id]'): ?>id="captcha_allow_register_email_captcha[id]"<?php else: ?>id="captcha_allow_register_email_captcha"<?php endif; ?> type="text" name="captcha" class="form-control "  placeholder="请输入验证码" />
          <div class="input-group-append">
            <img  <?php if([id]=='[id]'): ?>id="allow_register_email_captcha[id]"<?php else: ?>id="allow_register_email_captcha"<?php endif; ?>   width="120px" class="border pointer" alt="验证码" onClick="getVerify('allow_register_email_captcha')">
          </div>
        </div>
      </div>
    <?php endif; else: ?>

    <div class="form-group row">
      <label class="col-sm-3 col-form-label text-right">图形验证码</label>
      <div class="col-sm-8">
        <div class="input-group">
          <input <?php if([id]=='[id]'): ?>id="captcha_allow_register_email_captcha[id]"<?php else: ?>id="captcha_allow_register_email_captcha"<?php endif; ?> type="text" name="captcha" class="form-control "  placeholder="请输入验证码" />
          <div class="input-group-append">
            <img <?php if([id]=='[id]'): ?>id="allow_register_email_captcha[id]"<?php else: ?> id="allow_register_email_captcha"<?php endif; ?>  width="120px" class="border pointer" alt="验证码" onClick="getVerify('allow_register_email_captcha','[id]')">
          </div>
        </div>
      </div>
    </div>
  <?php endif; ?>



  <script>
    getVerify('allow_register_email_captcha','[id]')

  </script>
<?php endif; ?>
											<?php endif; if($Register['allow_email_register_code']==1): ?>
											<div class="form-group">
												<label for="code"><?php echo $Lang['verification_code']; ?></label>
												<div class="input-group">
													<input type="text" class="form-control" id="code" name="code"
														placeholder="<?php echo $Lang['please_enter_code']; ?>" value="<?php echo $Post['code']; ?>" required>
													<div class="input-group-append">
														<button class="btn btn-primary" type="button"  onclick="getCode(this,'register_email_send','allow_register_email_captcha')"><?php echo $Lang['get_code']; ?></button>
													</div>
												</div>
											</div>
											<?php endif; ?>
											<div class="form-group">
												<label for="password"><?php echo $Lang['password']; ?></label>
												<input type="password" class="form-control" name="password"
													id="phonePwd" placeholder="<?php echo $Lang['please_enter_password']; ?>" required>
											</div>
											<div class="form-group">
												<label for="checkPassword"><?php echo $Lang['confirm_password']; ?></label>
												<input type="password" class="form-control" name="checkPassword"
													id="phonePwdCheck" placeholder="<?php echo $Lang['please_password_again']; ?>" required>
											</div>
											<?php foreach($Register['login_register_custom_require'] as $custom): ?>
											<div class="form-group">
												<label for="<?php echo $custom['name']; ?>"><?php echo $Register[login_register_custom_require_list][$custom['name']]; ?></label>
												<input type="<?php if($custom['name']=='password'): ?>password<?php else: ?>text<?php endif; ?>" class="form-control" name="<?php echo $custom['name']; ?>" id="<?php echo $custom['name']; ?>" value="<?php echo $Post[$custom['name']]; ?>" >
											</div>
											<?php endforeach; foreach($Register['fields'] as $k => $list): ?>
												<div class="form-group">
													<label for="<?php echo $list['id']; ?>"><?php echo $list['fieldname']; ?></label>
													<?php if($list['fieldtype'] == 'dropdown'): ?>
														<!-- 下拉 -->
														<select name="fields[<?php echo $list['id']; ?>]" class="form-control ">
															<?php foreach($list['dropdown_option'] as $key => $val): ?>
																<option value="<?php echo $key; ?>" <?php if((isset($_fields[$key]))): ?> selected <?php endif; ?>><?php echo $val; ?></option>
															<?php endforeach; ?>
														</select>
													<?php elseif($list['fieldtype'] == 'password'): ?>
														<!-- 密码 -->
														<input name="fields[<?php echo $list['id']; ?>]" type="password" <?php if((isset($_fields[$list['id']]))): ?> value="<?php echo $_fields[$list['id']]; ?>" <?php endif; ?>class="form-control" placeholder="<?php echo $Lang['custom_password_box']; ?>" />
													<?php elseif($list['fieldtype'] == 'text' || $list['fieldtype'] == 'link'): ?>
														<!-- 文本框、链接 -->
														<input name="fields[<?php echo $list['id']; ?>]" type="text" class="form-control" <?php if((isset($_fields[$list['id']]))): ?> value="<?php echo $_fields[$list['id']]; ?>" <?php endif; ?> placeholder="<?php echo $list['fieldname']; ?>" />
													<?php elseif($list['fieldtype'] == 'tickbox'): ?>
														<!-- 选项框 -->
														<input type="checkbox" name="fields[<?php echo $list['id']; ?>]" <?php if((isset($_fields[$list['id']]))): ?> checked <?php endif; ?>><?php echo $list['fieldname']; elseif($list['fieldtype'] == 'textarea'): ?>
														<!-- 文本域 -->
														<textarea name="fields[<?php echo $list['id']; ?>]" cols="30" rows="10" class="form-control"><?php if((isset($_fields[$list['id']]))): ?> <?php echo $_fields[$list['id']]; ?> <?php endif; ?></textarea>
													<?php endif; ?>
												</div>
											<?php endforeach; ?>
											<!--销售-->
											<?php if($setsaler == '2'): ?>
											<div class="form-group">
												<label for="checkPassword"><?php echo $Lang['sales_representative']; ?></label>
												<select name="sale_id" class="form-control">
													<option value="0"><?php echo $Lang['nothing']; ?></option>
													<?php foreach($saler as $list): ?>
													<option <?php if($list['id']==$Post['id']): ?>selected<?php endif; ?> value="<?php echo $list['id']; ?>"><?php echo $list['user_nickname']; ?></option>
													<?php endforeach; ?>
												</select>
											</div>
											<?php endif; ?>
											<div class="mt-3">                                       
												<button class="btn btn-primary py-2 fs-14 btn-block waves-effect waves-light  d-flex justify-content-center align-items-center"
													type="submit" onclick="if(!beforeSubmit(this)){ return false;}"><?php echo $Lang['register']; ?></button>
											</div>

										</form>
									</div>
									<?php endif; if($Register['allow_register_phone']): ?>
									<div id="phone" class="tab-pane <?php if($Get['action']=="phone" || !$Get['action']): ?>active<?php endif; ?>" role="tabpanel">
										<form class="needs-validation" novalidate method="post" action="/register?action=phone" onsubmit="encryptPass('emailPwd');encryptPass('emailPwdCheck');"><input type="hidden" name="token" value="<?php echo $Token; ?>">
											<div class="form-group">
												<label for="username"><?php echo $Lang['phone_number']; ?></label>
												<div class="input-group">
													<?php if($Register['allow_login_register_sms_global']==1): ?>
													<div class="input-group-prepend">
														<select class="form-control select2 select2-hidden-accessible"
															data-select2-id="1" tabindex="-1" aria-hidden="true"
															name="phone_code" value="<?php echo $Post['phone_code']; ?>" id="phoneCodeSel">
															<?php foreach($SmsCountry as $list): ?>
															<option value="<?php echo $list['phone_code']; ?>"  <?php if($list['phone_code']=="+86"): ?>selected <?php endif; ?>>
																<?php echo $list['link']; ?>
															</option>
															<?php endforeach; ?>
														</select>
													</div>
													<?php endif; ?>
													<input type="text" class="form-control" id="phoneInp" name="phone"
														placeholder="<?php echo $Lang['please_enter_your_mobile_phone_number']; ?>"  value="<?php echo $Post['phone']; ?>" required>
												</div>
											</div>
											<?php if($Verify['allow_register_phone_captcha']==1): if($Verify['is_captcha']==1): if(top=='top'): ?>
    <!--  20241015 新增模板钩子 -->
    <?php $hooks=hook('template_custom_clientarea_captcha_html',['id'=>'allow_register_phone_captcha']); if(!empty($hooks[0])): foreach($hooks as $item): ?>
        <?php echo $item; ?>
      <?php endforeach; else: ?>
      <div class="form-group allow_register_phone_captcha">
        <label >图形验证码</label>
        <div class="input-group">
          <input  <?php if([id]=='[id]'): ?>id="captcha_allow_register_phone_captcha[id]"<?php else: ?>id="captcha_allow_register_phone_captcha"<?php endif; ?> type="text" name="captcha" class="form-control "  placeholder="请输入验证码" />
          <div class="input-group-append">
            <img  <?php if([id]=='[id]'): ?>id="allow_register_phone_captcha[id]"<?php else: ?>id="allow_register_phone_captcha"<?php endif; ?>   width="120px" class="border pointer" alt="验证码" onClick="getVerify('allow_register_phone_captcha')">
          </div>
        </div>
      </div>
    <?php endif; else: ?>

    <div class="form-group row">
      <label class="col-sm-3 col-form-label text-right">图形验证码</label>
      <div class="col-sm-8">
        <div class="input-group">
          <input <?php if([id]=='[id]'): ?>id="captcha_allow_register_phone_captcha[id]"<?php else: ?>id="captcha_allow_register_phone_captcha"<?php endif; ?> type="text" name="captcha" class="form-control "  placeholder="请输入验证码" />
          <div class="input-group-append">
            <img <?php if([id]=='[id]'): ?>id="allow_register_phone_captcha[id]"<?php else: ?> id="allow_register_phone_captcha"<?php endif; ?>  width="120px" class="border pointer" alt="验证码" onClick="getVerify('allow_register_phone_captcha','[id]')">
          </div>
        </div>
      </div>
    </div>
  <?php endif; ?>



  <script>
    getVerify('allow_register_phone_captcha','[id]')

  </script>
<?php endif; ?>
											<?php endif; ?>
											<div class="form-group">
												<label for="code"><?php echo $Lang['verification_code']; ?></label>
												<div class="input-group">
													<input type="text" class="form-control" id="code" name="code"
														placeholder="<?php echo $Lang['please_enter_code']; ?>" value="<?php echo $Post['code']; ?>" required>
													<div class="input-group-append"> 
														<button class="btn btn-primary" type="button"  onclick="getCode(this,'register_phone_send','allow_register_phone_captcha')"><?php echo $Lang['get_code']; ?></button>
													</div>
												</div>
											</div>
											<div class="form-group">
												<label for="password"><?php echo $Lang['password']; ?></label>
												<input type="password" class="form-control" name="password" 
													id="emailPwd" placeholder="<?php echo $Lang['please_enter_password']; ?>" required>
											</div>
											<div class="form-group">
												<label for="checkPassword"><?php echo $Lang['confirm_password']; ?></label>
												<input type="password" class="form-control" name="checkPassword" 
													id="emailPwdCheck" placeholder="<?php echo $Lang['please_password_again']; ?>" required>
											</div>
											<?php foreach($Register['login_register_custom_require'] as $custom): ?>
											<div class="form-group">
												<label for="<?php echo $custom['name']; ?>"><?php echo $Register[login_register_custom_require_list][$custom['name']]; ?></label>
												<input type="<?php if($custom['name']=='password'): ?>password<?php else: ?>text<?php endif; ?>" class="form-control" name="<?php echo $custom['name']; ?>" id="<?php echo $custom['name']; ?>"  value="<?php echo $Post[$custom['name']]; ?>" >
											</div>
											<?php endforeach; foreach($Register['fields'] as $k => $list): ?>
											<div class="form-group">
												<label for="<?php echo $list['id']; ?>"><?php echo $list['fieldname']; ?></label>															
												<?php if($list['fieldtype'] == 'dropdown'): ?>
													<!-- 下拉 -->
													<select name="fields[<?php echo $list['id']; ?>]" class="form-control ">
														<?php foreach($list['dropdown_option'] as $key => $val): ?>
															<option value="<?php echo $key; ?>" <?php if((isset($_fields[$key]))): ?> selected <?php endif; ?>><?php echo $val; ?></option>
														<?php endforeach; ?>
													</select>
												<?php elseif($list['fieldtype'] == 'password'): ?>
												<!-- 密码 -->
													<input name="fields[<?php echo $list['id']; ?>]" type="password" <?php if((isset($_fields[$list['id']]))): ?> value="<?php echo $_fields[$list['id']]; ?>" <?php endif; ?>class="form-control" placeholder="<?php echo $Lang['custom_password_box']; ?>" />
												<?php elseif($list['fieldtype'] == 'text' || $list['fieldtype'] == 'link'): ?>
													<!-- 文本框、链接 -->
													<input name="fields[<?php echo $list['id']; ?>]" type="text" class="form-control" <?php if((isset($_fields[$list['id']]))): ?> value="<?php echo $_fields[$list['id']]; ?>" <?php endif; ?> placeholder="<?php echo $list['fieldname']; ?>" />
												<?php elseif($list['fieldtype'] == 'tickbox'): ?>
													<!-- 选项框 -->
													<input type="checkbox" name="fields[<?php echo $list['id']; ?>]" <?php if((isset($_fields[$list['id']]))): ?> checked <?php endif; ?>><?php echo $list['fieldname']; elseif($list['fieldtype'] == 'textarea'): ?>
													<!-- 文本域 -->
													<textarea name="fields[<?php echo $list['id']; ?>]" cols="30" rows="10" class="form-control"><?php if((isset($_fields[$list['id']]))): ?> <?php echo $_fields[$list['id']]; ?> <?php endif; ?></textarea>
												<?php endif; ?>												
											</div>														
											<?php endforeach; ?>
											<!--销售-->
											<?php if($setsaler == '2'): ?>
											<div class="form-group">
												<label for="checkPassword"><?php echo $Lang['sales_representative']; ?></label>
												<select name="sale_id" class="form-control">
													<option value="0"><?php echo $Lang['nothing']; ?></option>
													<?php foreach($saler as $list): ?>
													<option value="<?php echo $list['id']; ?>" <?php if(($Post['sale_id']==$list['id'])): ?>selected<?php endif; ?>><?php echo $list['user_nickname']; ?></option>
													<?php endforeach; ?>
												</select>
											</div>
											<?php endif; ?>
											<div class="mt-3">                                       
												<button class="btn btn-primary py-2 fs-14 btn-block waves-effect waves-light  d-flex justify-content-center align-items-center" type="submit" onclick="if(!beforeSubmit(this)) {return false;}"><?php echo $Lang['register']; ?></button>
											</div>

										</form>
									</div>
									<?php endif; ?>
								</div>
                                <div class="mt-5 text-center">
                                    <p>
                                        <input type="checkbox" id="agreePrivacy">
                                        <span>
                                            <?php echo $Lang['have_read_agree']; ?>
                                            <a href="<?php echo $Setting['web_tos_url']; ?>" class="font-weight-medium text-primary"
                                                target="_blank"><?php echo $Lang['terms_service']; ?></a>
                                            <?php echo $Lang['ands']; ?>
                                            <a href="<?php echo $Setting['web_privacy_url']; ?>" class="font-weight-medium text-primary"
                                                target="_blank"><?php echo $Lang['privacy_policy']; ?></a>
                                        </span>
                                    </p>
                                </div>
                                <div class="mt-5 text-center">
                                    <p><?php echo $Lang['there_already_account']; ?> <a href="login" class="font-weight-medium text-primary"> <?php echo $Lang['sign_in']; ?></a> </p>
                                </div>
                            </div>
                        </div>
                    </div>


                </div>
            </div>
        </div>
        <!-- end col -->
    </div>

    <?php if($Setting['login_footer']): ?>
    <div class="text-center"><?php echo $Setting['login_footer']; ?></div>
    <?php endif; ?>
    <!-- end row -->

</div>
<!-- end container-fluid -->
<script src="/themes/clientarea/default/assets/js/public.js"></script>
<script>
	function beforeSubmit(_this)
	{
		var is_checked = $('#agreePrivacy:checked')
		if(is_checked.length == 0)
		{
			toastr.error('<?php echo $Lang['check_privacy']; ?>');
			return false;
		}
		$(_this).parents('form').submit();
	}
</script>
<?php if($TplName != 'login' && $TplName != 'register' && $TplName != 'pwreset' && $TplName != 'bind' && $TplName != 'loginaccesstoken'): ?>
</div>
</div>
</div>

<footer class="footer">
	<div class="container-fluid">
		<div class="row">
			<div class="col-sm-6">
				&copy; <?php echo $Setting['company_name']; ?>.
			</div>
			<div class="col-sm-6">
				<div class="text-sm-right d-none d-sm-block">
					
				</div>
			</div>
		</div>
	</div>
</footer>
<?php endif; ?>
<script src="/themes/clientarea/default/assets/js/app.js?v=<?php echo $Ver; ?>"></script>
<?php $hooks=hook('client_area_footer_output'); if($hooks): foreach($hooks as $item): ?>
		<?php echo $item; ?>
	<?php endforeach; ?>
<?php endif; ?>
</body>

</html>