<!-- ========== Left Sidebar Start ========== -->
{if $Userinfo}
<div class="vertical-menu og-sidebar">
	<div data-simplebar class="h-100">
		<!--- Sidemenu -->
		<div id="sidebar-menu" class="menu-js">
			<!-- Left Menu Start -->
			<ul class="metismenu list-unstyled og-sidebar-menu" id="side-menu">
				<li class="og-sidebar-mobile-account">
					<a href="/clientarea" onclick="window.location.href=this.href; return false;" class="og-sidebar-link og-sidebar-link-level-1 waves-effect" data-menu-level="1" aria-expanded="true">
						<i class="bx bx-user-circle"></i>
						<span class="og-sidebar-title">个人中心</span>
					</a>
					<ul class="sub-menu og-sidebar-submenu og-sidebar-submenu-level-2" aria-expanded="true">
						<li class="og-sidebar-item og-sidebar-item-level-2">
							<a href="/clientarea" onclick="window.location.href=this.href; return false;" class="og-sidebar-link og-sidebar-link-level-2 waves-effect" data-menu-level="2">
								<span class="og-sidebar-title">用户中心</span>
							</a>
						</li>
						<li class="og-sidebar-item og-sidebar-item-level-2">
							<a href="/logout" onclick="window.location.href=this.href; return false;" class="og-sidebar-link og-sidebar-link-level-2 waves-effect" data-menu-level="2">
								<span class="og-sidebar-title">退出</span>
							</a>
						</li>
					</ul>
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
