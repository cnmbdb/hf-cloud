<!-- ========== Left Sidebar Start ========== -->
{if $Userinfo}
<div class="vertical-menu og-sidebar">
	<div data-simplebar class="h-100">
		<!--- Sidemenu -->
		<div id="sidebar-menu" class="menu-js">
			<!-- Left Menu Start -->
			<ul class="metismenu list-unstyled og-sidebar-menu" id="side-menu">
				<li class="og-sidebar-mobile-account">
					<a href="/clientarea" class="og-sidebar-mobile-user" title="{$Userinfo.user.username}">
						<span class="og-sidebar-mobile-avatar" aria-hidden="true">
							{if preg_match("/^[0-9]*[A-Za-z]+$/is", substr($Userinfo.user.username,0,1))}
							{$Userinfo.user.username|substr=0,1|upper}
							{elseif preg_match("/^[\x7f-\xff]*$/", substr($Userinfo.user.username,0,3))}
							{$Userinfo.user.username|substr=0,3}
							{else}
							{$Userinfo.user.username|substr=0,1|upper}
							{/if}
						</span>
						<span class="og-sidebar-mobile-meta">
							<span class="og-sidebar-mobile-label">个人中心</span>
							<span class="og-sidebar-mobile-name">{$Userinfo.user.username}</span>
						</span>
					</a>
					<div class="og-sidebar-mobile-actions">
						<a href="/clientarea" class="og-sidebar-mobile-action">用户中心</a>
						<a href="/logout" class="og-sidebar-mobile-action og-sidebar-mobile-action-solid">退出</a>
					</div>
				</li>

					<!-- 临时菜单 -->
				<!-- <li>
					<a href="/credit" class="waves-effect">
						<i class="bx bx-home-circle"></i>
						<span>信用额度</span>
					</a>
				</li> -->
				<!-- 临时菜单 -->
				{foreach $Nav as $nv}
				<li class="og-sidebar-item og-sidebar-item-level-1 {if $nv.child}og-sidebar-has-children{/if}">
					<a href="{if $nv.child}javascript: ;{else}{$nv.url}{/if}" class="og-sidebar-link og-sidebar-link-level-1 waves-effect" data-menu-level="1" {if $nv.child}aria-expanded="true"{/if}>
						{if $nv.fa_icon}<i class="{$nv.fa_icon}"></i>{else}<i class="bx bx-circle og-sidebar-fallback-icon"></i>{/if}
						{if (isset($nv.tag))}
							{$nv.tag}
						{/if}
						<span class="og-sidebar-title">{$nv.name}</span>
					</a>
					{if $nv.child}
					<ul class="sub-menu og-sidebar-submenu og-sidebar-submenu-level-2" aria-expanded="true">
						{foreach $nv.child as $subnav}
						<li class="og-sidebar-item og-sidebar-item-level-2 {if $subnav.child}og-sidebar-has-children{/if}">
							<a href="{if $subnav.child}javascript: ;{else}{$subnav.url}{/if}"
								class="og-sidebar-link og-sidebar-link-level-2 waves-effect" data-menu-level="2" {if $subnav.child}aria-expanded="true"{/if}>
								{if $subnav.fa_icon}<i class="{$subnav.fa_icon}"></i>{else}<i class="bx bx-circle og-sidebar-fallback-icon"></i>{/if}
								{if (isset($subnav.tag))}
									{$subnav.tag}
								{/if}
								<span class="og-sidebar-title">{$subnav.name}</span>
							</a>
							{if $subnav.child}
							<ul class="sub-menu og-sidebar-submenu og-sidebar-submenu-level-3" aria-expanded="true">
								{foreach $subnav.child as $submenu}
								<li class="og-sidebar-item og-sidebar-item-level-3">
									<a href="{if $submenu.child}javascript: ;{else}{$submenu.url}{/if}"
										class="og-sidebar-link og-sidebar-link-level-3 waves-effect" data-menu-level="3">
										{if $submenu.fa_icon}<i class="{$submenu.fa_icon}"></i>{else}<i class="bx bx-circle og-sidebar-fallback-icon"></i>{/if}
										{if (isset($submenu.tag))}
											{$submenu.tag}
										{/if}
										<span class="og-sidebar-title">{$submenu.name}</span>
									</a>
								</li>
								<!-- Nav Level 3 -->
								{/foreach}
							</ul>
							{/if}
						</li>
						<!-- Nav Level 2 -->
						{/foreach}
					</ul>
					{/if}
				</li>
				<!-- Nav Level 1 -->
				{/foreach}
			</ul>
		</div>
		<!-- Sidebar -->
	</div>
</div>
{else/}
<div class="vertical-menu menu-js og-sidebar">
	<div data-simplebar class="h-100">
		<!--- Sidemenu -->
		<div id="sidebar-menu" class="menu-js">
			<!-- Left Menu Start -->
			<ul class="metismenu list-unstyled og-sidebar-menu" id="side-menu">
				<li class="og-sidebar-item og-sidebar-item-level-1">
					<a href="/login" class="og-sidebar-link og-sidebar-link-level-1 waves-effect" data-menu-level="1">
						<i class="bx bx-user-check"></i>
						<span class="og-sidebar-title">登录</span>
					</a>
				</li>
				<li class="og-sidebar-item og-sidebar-item-level-1">
					<a href="/register" class="og-sidebar-link og-sidebar-link-level-1 waves-effect" data-menu-level="1">
						<i class="bx bx-user-plus"></i> 
						<span class="og-sidebar-title">注册</span>
					</a>
				</li>
			</ul>
		</div>
		<!-- Sidebar -->
	</div>
</div>
{/if}
