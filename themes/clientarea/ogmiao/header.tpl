
<!DOCTYPE html>
<html lang="zh-CN">

<head>
	<meta charset="utf-8" />
	<title>{$Title} - {$Setting.company_name}</title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no, viewport-fit=cover">
	<meta content="{$Setting.web_seo_desc}" name="description" />
	<meta content="{$Setting.web_seo_keywords}" name="keywords" />
	<meta content="{$Setting.company_name}" name="author" />

	{include file="includes/head"}
  <script>
	var setting_web_url = ''
  var language={:json_encode($_LANG)};
  </script>
	{php}$hooks=hook('client_area_head_output');{/php}
	{if $hooks}
		{foreach $hooks as $item}
			{$item}
		{/foreach}
	{/if}
<style>
    .logo-lg img{
      width:150px;
      height:auto;
    }
</style>
</head>

<body data-topbar="dark" data-sidebar="dark">
	{if $TplName != 'login' && $TplName != 'register' && $TplName != 'pwreset' && $TplName != 'bind' && $TplName != 'loginaccesstoken' }
	<header id="page-topbar" class="og-client-web-header">
		<div class="og-client-nav-shell">
			<a href="{$Setting.web_jump_url}" class="og-client-logo" aria-label="{$Setting.company_name}首页">
				{if $Setting.web_logo_home}
				<img src="{$Setting.web_logo_home}" alt="{$Setting.company_name}logo" onerror="this.onerror=null;this.src='/themes/web/ogmiao/img/hfcloud-logo.png';">
				{else}
				<span>HF</span>
				{/if}
			</a>
			<nav class="og-client-primary-nav" aria-label="主导航">
				<a href="/">首页</a>
				<a href="/cart">产品服务</a>
			</nav>
			<div class="og-client-actions">
				<button type="button" class="og-client-menu-trigger" id="vertical-menu-btn" aria-label="打开菜单">
					<i class="fa fa-fw fa-bars"></i>
				</button>
				{if $Setting.allow_user_language}
				<div class="dropdown d-inline-block og-client-language">
					<button type="button" class="og-client-icon-button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" aria-label="选择语言">
						<i class="bx bx-globe"></i>
					</button>
					<div class="dropdown-menu dropdown-menu-right">
						{php}
							$parse = parse_url(request()->url());
							$path=$parse['path'];
							$query=$parse['query'];
							$query = preg_replace('/&language=[a-zA-Z0-9_-]+/','',$query);
						{/php}
						{foreach $Language as $key=>$list}
						<a href="?{if $query}{$query}&{/if}language={$key}" class="dropdown-item notify-item language" data-lang="zh-cn">
							<img src="/upload/common/country/{$list.display_flag}.png" alt="" class="mr-1" height="12">
							<span class="align-middle">{$list.display_name}</span>
						</a>
						{/foreach}
					</div>
				</div>
				{/if}
					{if $Userinfo}
					<a href="/clientarea" class="og-client-user-chip d-none d-lg-inline-flex" title="{$Userinfo.user.username}">
						<span class="og-client-user-avatar" aria-hidden="true">
							{if preg_match("/^[0-9]*[A-Za-z]+$/is", substr($Userinfo.user.username,0,1))}
							{$Userinfo.user.username|substr=0,1|upper}
							{elseif preg_match("/^[\x7f-\xff]*$/", substr($Userinfo.user.username,0,3))}
							{$Userinfo.user.username|substr=0,3}
							{else}
							{$Userinfo.user.username|substr=0,1|upper}
							{/if}
						</span>
						<span class="og-client-user-meta">
							<span class="og-client-user-label">个人中心</span>
							<span class="og-client-user-name">{$Userinfo.user.username}</span>
						</span>
					</a>
					<a href="/logout" class="og-client-nav-button og-client-nav-button-solid og-client-logout-button d-none d-lg-inline-flex">退出</a>
					{else}
					<a href="/clientarea" class="og-client-nav-button og-client-nav-button-outline">用户中心</a>
					<a href="/login" class="og-client-nav-button og-client-nav-button-solid">登录</a>
					{/if}
			</div>
		</div>
	</header>

	{include file="includes/menu"}

	<div class="main-content">
		<div class="page-content">
			{if $TplName != 'clientarea'}
			{include file="includes/pageheader"}
			{/if}
			<div class="container-fluid">
				{/if}
