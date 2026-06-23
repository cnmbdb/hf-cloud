<?php /*a:6:{s:76:"/www/wwwroot/cloud.hf.pw2/public/themes/clientarea/ogmiao/supporttickets.tpl";i:1743911671;s:75:"/www/wwwroot/cloud.hf.pw2/public/themes/clientarea/ogmiao/includes/head.tpl";i:1742354372;s:75:"/www/wwwroot/cloud.hf.pw2/public/themes/clientarea/ogmiao/includes/menu.tpl";i:1720065013;s:81:"/www/wwwroot/cloud.hf.pw2/public/themes/clientarea/ogmiao/includes/pageheader.tpl";i:1719999923;s:81:"/www/wwwroot/cloud.hf.pw2/public/themes/clientarea/ogmiao/includes/breadcrumb.tpl";i:1719999923;s:81:"/www/wwwroot/cloud.hf.pw2/public/themes/clientarea/ogmiao/includes/tablestyle.tpl";i:1719999923;}*/ ?>

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

<div class="card">
    <div class="card-body">
        <h4 class="card-title mb-4">
            <i class="fas fa-ticket-alt mr-2" style="color: var(--primary);"></i>我的工单
        </h4>
        
        <div class="d-flex flex-wrap justify-content-between mb-4">
            <div class="search-container position-relative">
                <div class="input-group search-input-group">
                    <div class="input-group-prepend">
                        <span class="input-group-text bg-white border-right-0">
                            <i class="fas fa-search text-muted search-icon"></i>
                        </span>
                    </div>
                    <input type="text" id="searchInput" class="form-control border-left-0 search-input" placeholder="搜索工单标题..." />
                    <div class="input-group-append d-none" id="searchClearBtn">
                        <span class="input-group-text bg-white border-left-0 pointer">
                            <i class="fas fa-times text-muted"></i>
                        </span>
                    </div>
                </div>
                <div id="noResultsMessage" class="search-no-results d-none">
                    <div class="alert alert-info mt-2 mb-0">
                        <i class="fas fa-info-circle mr-2"></i>没有找到匹配的工单
                    </div>
                </div>
            </div>
            
            <div>
                <a href="submitticket" class="btn btn-primary">
                    <i class="fas fa-plus mr-1"></i> <?php echo $Lang['submit_work_order']; ?>
                </a>
            </div>
        </div>
        
        <div class="table-container">
            <div class="table-responsive">
                <table class="table tablelist" id="ticketsTable">
                    <colgroup>
                        <col width="8%">
                        <col width="35%">
                        <col width="15%">
                        <col width="15%">
                        <col width="12%">
                        <col width="15%">
                    </colgroup>
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th><?php echo $Lang['title']; ?></th>
                            <th><?php echo $Lang['creation_time']; ?></th>
                            <th><?php echo $Lang['update_time']; ?></th>
                            <th><?php echo $Lang['state']; ?></th>
                            <th><?php echo $Lang['operating']; ?></th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php if($SupportTickets): foreach($SupportTickets as $ticket): ?>
                        <tr class="ticket-row">
                            <td><?php echo $ticket['tid']; ?></td>
                            <td class="ticket-title">
                                <a href="viewticket?tid=<?php echo $ticket['tid']; ?>&c=<?php echo $ticket['c']; ?>" class="text-dark">
                                    <span class="badge badge-info mr-2"><?php echo $ticket['department_name']; ?></span> 
                                    <span class="title-text"><?php echo $ticket['title']; ?></span>
                                    <?php if($ticket['priority'] == "high"): ?>
                                        <span class="badge badge-warning ml-2" data-toggle="popover" data-trigger="hover" title="事态紧急的工单" data-content="您提交工单时认为事态紧急，运维人员会优先处理您的工单。">紧急</span>
                                    <?php elseif($ticket['priority'] == "low"): ?>
                                        <span class="badge badge-dark ml-2" data-toggle="popover" data-trigger="hover" title="事态不紧急的工单" data-content="您提交工单时认为事态不是非常紧急，运维人员会根据实际情况稍微靠后处理您的工单。感谢您为高效运维工作做出贡献！">宽松</span>
                                    <?php endif; ?>
                                </a>
                            </td>
                            <td>
                                <div class="d-flex align-items-center">
                                    <i class="far fa-calendar-alt mr-2" style="color: var(--primary);"></i>
                                    <span><?php echo date("Y-m-d H:i",!is_numeric($ticket['create_time'])? strtotime($ticket['create_time']) : $ticket['create_time']); ?></span>
                                </div>
                            </td>
                            <td>
                                <div class="d-flex align-items-center">
                                    <i class="far fa-clock mr-2" style="color: var(--primary);"></i>
                                    <span><?php echo date("Y-m-d H:i",!is_numeric($ticket['last_reply_time'])? strtotime($ticket['last_reply_time']) : $ticket['last_reply_time']); ?></span>
                                </div>
                            </td>
                            <td>
                                <span class="badge status-badge text-white px-3 py-2" style="background-color: <?php echo $ticket['status']['color']; ?>; border-radius: 50px; box-shadow: 0 2px 5px rgba(0,0,0,0.1);">
                                    <?php echo $ticket['status']['title']; ?>
                                </span>
                            </td>
                            <td>
                                <?php if($ticket['status']['id'] == "4"): ?>
                                    <a href="viewticket?tid=<?php echo $ticket['tid']; ?>&c=<?php echo $ticket['c']; ?>" class="btn btn-outline-secondary btn-sm">
                                        <i class="fas fa-book mr-1"></i> 回顾
                                    </a>
                                <?php elseif($ticket['status']['id'] == "2"): ?>
                                    <a href="viewticket?tid=<?php echo $ticket['tid']; ?>&c=<?php echo $ticket['c']; ?>" class="btn btn-primary btn-sm">
                                        <i class="fas fa-reply mr-1"></i> 处理
                                    </a>
                                <?php else: ?>
                                    <a href="viewticket?tid=<?php echo $ticket['tid']; ?>&c=<?php echo $ticket['c']; ?>" class="btn btn-outline-info btn-sm">
                                        <i class="fas fa-eye mr-1"></i> 查看
                                    </a>
                                <?php endif; ?>
                            </td>
                        </tr>
                        <?php endforeach; else: ?>
                        <tr id="noTicketsRow">
                            <td colspan="6">
                                <div class="no-data">
                                    <i class="fas fa-ticket-alt mb-3" style="font-size: 2rem; color: var(--gray);"></i>
                                    <p><?php echo $Lang['nothing']; ?></p>
                                </div>
                            </td>
                        </tr>
                        <?php endif; ?>
                    </tbody>
                </table>
            </div>
            <div class="table-footer">
                <div class="table-pageinfo">
                    <?php echo $Lang['common']; ?> <?php echo $Total; ?> <?php echo $Lang['strips']; ?>
                </div>
                <div class="table-pagination">
                    <ul class="pagination pagination-sm">
                        <?php echo $Pages; ?>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>

<style>
    /* 搜索框样式 */
    .search-container {
        max-width: 400px;
        width: 100%;
        margin-bottom: 1rem;
    }
    
    .search-input-group {
        border-radius: 50px;
        overflow: hidden;
        box-shadow: 0 2px 10px rgba(240, 138, 93, 0.1);
        transition: all 0.3s ease;
    }
    
    .search-input-group:focus-within {
        box-shadow: 0 5px 15px rgba(240, 138, 93, 0.15);
        transform: translateY(-2px);
    }
    
    .search-input {
        border-radius: 0 50px 50px 0 !important;
        padding-left: 0;
    }
    
    .search-input:focus {
        box-shadow: none;
    }
    
    .search-input-group .input-group-text {
        border-radius: 50px 0 0 50px;
        background-color: white;
        border-color: #ced4da;
    }
    
    .search-input-group .input-group-append .input-group-text {
        border-radius: 0 50px 50px 0;
        cursor: pointer;
    }
    
    .search-icon {
        color: var(--primary) !important;
    }
    
    /* 工单列表样式 */
    .table {
        margin-bottom: 0;
    }
    
    .table th {
        font-weight: 600;
        color: #333;
        background-color: rgba(240, 138, 93, 0.05);
        border-bottom: 2px solid rgba(240, 138, 93, 0.2);
    }
    
    .table td {
        vertical-align: middle;
    }
    
    .table tr {
        transition: all 0.2s ease;
    }
    
    .table tr:hover {
        background-color: rgba(240, 138, 93, 0.03);
    }
    
    /* 状态标签样式 */
    .status-badge {
        font-weight: 500;
        letter-spacing: 0.3px;
        text-shadow: 0 1px 2px rgba(0,0,0,0.2);
    }
    
    /* 高亮搜索结果 */
    .highlight {
        background-color: rgba(255, 230, 0, 0.3);
        padding: 2px;
        border-radius: 3px;
    }
    
    /* 无数据状态 */
    .no-data {
        text-align: center;
        padding: 3rem 1rem;
        color: var(--gray);
    }
    
    /* 响应式调整 */
    @media (max-width: 768px) {
        .search-container {
            max-width: 100%;
            margin-right: 0;
        }
        
        .table td, .table th {
            padding: 0.75rem 0.5rem;
        }
    }
</style>

<script>
    $(document).ready(function() {
        // 搜索功能
        const searchInput = $('#searchInput');
        const searchClearBtn = $('#searchClearBtn');
        const noResultsMessage = $('#noResultsMessage');
        const ticketRows = $('.ticket-row');
        const noTicketsRow = $('#noTicketsRow');
        
        // 初始化 popover
        $('[data-toggle="popover"]').popover();
        
        // 搜索输入事件
        searchInput.on('input', function() {
            const searchTerm = $(this).val().toLowerCase().trim();
            
            // 显示/隐藏清除按钮
            if (searchTerm.length > 0) {
                searchClearBtn.removeClass('d-none');
            } else {
                searchClearBtn.addClass('d-none');
            }
            
            let hasResults = false;
            
            // 过滤工单
            ticketRows.each(function() {
                const titleElement = $(this).find('.title-text');
                const title = titleElement.text().toLowerCase();
                
                if (title.includes(searchTerm)) {
                    $(this).show();
                    hasResults = true;
                    
                    // 高亮匹配文本
                    if (searchTerm.length > 0) {
                        const regex = new RegExp('(' + searchTerm + ')', 'gi');
                        const highlightedText = titleElement.text().replace(regex, '<span class="highlight">$1</span>');
                        titleElement.html(highlightedText);
                    } else {
                        titleElement.text(titleElement.text()); // 移除高亮
                    }
                } else {
                    $(this).hide();
                }
            });
            
            // 显示/隐藏无结果消息
            if (!hasResults && ticketRows.length > 0) {
                noResultsMessage.removeClass('d-none');
                noTicketsRow.addClass('d-none');
            } else {
                noResultsMessage.addClass('d-none');
                if (!hasResults) {
                    noTicketsRow.removeClass('d-none');
                } else {
                    noTicketsRow.addClass('d-none');
                }
            }
        });
        
        // 清除搜索
        searchClearBtn.on('click', function() {
            searchInput.val('');
            searchInput.trigger('input');
            searchInput.focus();
        });
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