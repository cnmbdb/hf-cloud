<!-- ================================================================
     HFCloud / OG Miao - Sidebar Navigation (shadcn/ui Spec)
     Re-built with shadcn Sidebar design tokens and component structure.

     Reference: https://ui.shadcn.com/docs/components/sidebar
     Components:  Sidebar / SidebarHeader / SidebarContent / SidebarFooter
                  SidebarGroup / SidebarGroupLabel / SidebarMenu / SidebarMenuItem
                  SidebarMenuButton / SidebarMenuSub / SidebarMenuBadge / SidebarMenuAction
                  SidebarInput (search) / SidebarTrigger / SidebarSeparator

     Keyboard:    Ctrl/Cmd + B  -> toggle collapsed
                  Esc           -> close mobile drawer
     State:       Persists to localStorage 'sh_sidebar_state'
     ================================================================ -->

<!-- SidebarProvider equivalent - applies initial state from storage -->
<script>
(function(){
  try {
    var s = localStorage.getItem('sh_sidebar_state');
    if (s === 'collapsed') document.documentElement.classList.add('sh-sidebar-pre-collapsed');
  } catch(e){}
})();
</script>

<div class="sh-sidebar vertical-menu"
     data-variant="sidebar"
     data-side="left"
     data-state="expanded"
     data-mobile-state="closed"
     aria-label="侧边栏导航">

  <!-- ====== SidebarHeader ====== -->
  <div class="sh-sidebar-header">
    <a href="{$Setting.web_jump_url|default:'/clientarea'}" class="sh-sidebar-brand-box" aria-label="返回首页">
      <div class="sh-sidebar-logo" aria-hidden="true">
        {if $Setting.logo_url_home_mini}
          <img src="{$Setting.logo_url_home_mini}" alt="logo" loading="lazy">
        {else}
          <span class="sh-sidebar-logo-text">{$Setting.company_name|substr=0,1|upper}</span>
        {/if}
      </div>
      <div class="sh-sidebar-brand-info">
        <span class="sh-sidebar-brand-name">{$Setting.company_name|default:'HFCloud'}</span>
        <span class="sh-sidebar-brand-sub">{$Lang.clientarea|default:'用户中心'}</span>
      </div>
    </a>
  </div>

  <!-- ====== SidebarTrigger (rendered as floating button on desktop) ====== -->
  <button type="button" class="sh-sidebar-toggle" id="shSidebarToggle" aria-label="收起/展开侧边栏" title="收起/展开 (Ctrl/⌘+B)">
    <i class="bx bx-chevron-left" aria-hidden="true"></i>
  </button>

  {if $Userinfo}
  <!-- ====== SidebarContent ====== -->
  <div class="sh-sidebar-content" data-simplebar>
    <nav id="sidebar-menu" aria-label="主导航">

      <!-- SidebarInput (search) -->
      <div class="sh-sidebar-search">
        <i class="bx bx-search" aria-hidden="true"></i>
        <input type="text" id="shSidebarSearch" placeholder="{$Lang.search_menu|default:'搜索菜单...'}" aria-label="搜索菜单">
        <kbd class="sh-sidebar-kbd">⌘K</kbd>
      </div>

      <!-- SidebarGroup: Main -->
      {if isset($Nav)}
      <div class="sh-sidebar-group" data-group="main">
        <div class="sh-sidebar-group-label">{$Lang.nav_main|default:'主要功能'}</div>
        <div class="sh-sidebar-group-content">
          <ul class="sh-sidebar-menu list-unstyled" id="side-menu" role="menu">
            {foreach $Nav as $nv}
            <li class="sh-sidebar-menu-item" data-state="closed" role="none">
              <a href="{if $nv.child}#{$nv.id}{else}{$nv.url}{/if}"
                 class="sh-sidebar-menu-button {if $nv.child}has-arrow{/if}"
                 role="menuitem"
                 {if $nv.child}aria-expanded="false" aria-haspopup="true"{/if}
                 data-quick="{if isset($nv.quick)}1{else}0{/if}"
                 title="{$nv.name}">
                {if $nv.fa_icon}<span class="s-icon" aria-hidden="true"><i class="{$nv.fa_icon}"></i></span>{/if}
                <span class="sh-sidebar-menu-label">{$nv.name}</span>
                {if isset($nv.badge) && $nv.badge}<span class="sh-sidebar-menu-badge sh-sidebar-menu-badge--{$nv.badge_type|default:'count'}">{$nv.badge}</span>{/if}
                {if isset($nv.tag) && $nv.tag}<span class="sh-sidebar-menu-tag sh-sidebar-menu-tag--{$nv.tag_type|default:'new'}">{$nv.tag}</span>{/if}
                {if $nv.child}<span class="sh-sidebar-menu-arrow" aria-hidden="true"><i class="bx bx-chevron-right"></i></span>{/if}
              </a>
              {if $nv.child}
              <ul class="sh-sidebar-menu-sub" role="menu" aria-expanded="false">
                {foreach $nv.child as $subnav}
                <li class="sh-sidebar-menu-sub-item" data-state="closed" role="none">
                  <a href="{if $subnav.child}#{$subnav.id}{else}{$subnav.url}{/if}"
                     class="sh-sidebar-menu-sub-button {if $subnav.child}has-arrow{/if}"
                     role="menuitem"
                     {if $subnav.child}aria-expanded="false" aria-haspopup="true"{/if}
                     title="{$subnav.name}">
                    {if $subnav.fa_icon}<span class="s-icon" aria-hidden="true"><i class="{$subnav.fa_icon}"></i></span>{/if}
                    <span class="sh-sidebar-menu-label">{$subnav.name}</span>
                    {if isset($subnav.badge) && $subnav.badge}<span class="sh-sidebar-menu-badge sh-sidebar-menu-badge--{$subnav.badge_type|default:'count'}">{$subnav.badge}</span>{/if}
                    {if isset($subnav.tag) && $subnav.tag}<span class="sh-sidebar-menu-tag sh-sidebar-menu-tag--{$subnav.tag_type|default:'new'}">{$subnav.tag}</span>{/if}
                    {if $subnav.child}<span class="sh-sidebar-menu-arrow" aria-hidden="true"><i class="bx bx-chevron-right"></i></span>{/if}
                  </a>
                  {if $subnav.child}
                  <ul class="sh-sidebar-menu-sub" role="menu" aria-expanded="false">
                    {foreach $subnav.child as $submenu}
                    <li class="sh-sidebar-menu-sub-item" data-state="closed" role="none">
                      <a href="{$submenu.url}" class="sh-sidebar-menu-sub-button" role="menuitem" title="{$submenu.name}">
                        {if $submenu.fa_icon}<span class="s-icon" aria-hidden="true"><i class="{$submenu.fa_icon}"></i></span>{/if}
                        <span class="sh-sidebar-menu-label">{$submenu.name}</span>
                        {if isset($submenu.badge) && $submenu.badge}<span class="sh-sidebar-menu-badge sh-sidebar-menu-badge--{$submenu.badge_type|default:'count'}">{$submenu.badge}</span>{/if}
                        {if isset($submenu.tag) && $submenu.tag}<span class="sh-sidebar-menu-tag sh-sidebar-menu-tag--{$submenu.tag_type|default:'new'}">{$submenu.tag}</span>{/if}
                      </a>
                    </li>
                    {/foreach}
                  </ul>
                  {/if}
                </li>
                {/foreach}
              </ul>
              {/if}
            </li>
            {/foreach}
          </ul>
        </div>
      </div>
      {/if}

      <!-- SidebarSeparator (optional) -->
      <div class="sh-sidebar-separator" role="separator" aria-hidden="true"></div>

      <!-- SidebarGroup: Tools (dynamic, can be hydrated by JS) -->
      <div class="sh-sidebar-group" data-group="tools" data-dynamic="1" hidden></div>

    </nav>
  </div>

  <!-- ====== SidebarFooter ====== -->
  <div class="sh-sidebar-footer">
    <button type="button" class="sh-sidebar-user-card" id="sidebar-user-dropdown" aria-haspopup="true" aria-expanded="false">
      {if $Userinfo.user.qq}
        <img src="https://q1.qlogo.cn/g?b=qq&nk={$Userinfo.user.qq}&s=640" class="sh-sidebar-avatar" alt="{$Userinfo.user.username}的头像" loading="lazy">
      {else}
        <div class="sh-sidebar-avatar-placeholder" aria-hidden="true">
          {if preg_match("/^[0-9]*[A-Za-z]+$/is", substr($Userinfo.user.username,0,1))}
            {$Userinfo.user.username|substr=0,1|upper}
          {elseif preg_match("/^[\x7f-\xff]*$/", substr($Userinfo.user.username,0,3))}
            {$Userinfo.user.username|substr=0,3}
          {else}
            {$Userinfo.user.username|substr=0,1|upper}
          {/if}
        </div>
      {/if}
      <div class="sh-sidebar-user-info">
        <span class="sh-sidebar-username" title="{$Userinfo.user.username}">{$Userinfo.user.username}</span>
        <span class="sh-sidebar-userid">ID: {$Userinfo.user.id}{if $Userinfo.user.phonenumber} · {$Userinfo.user.phonenumber|substr=0,3}***{$Userinfo.user.phonenumber|substr=7}{/if}</span>
      </div>
      <i class="bx bx-dots-vertical-rounded sh-sidebar-user-chevron" aria-hidden="true"></i>
    </button>

    <div class="sh-sidebar-dropdown-menu" aria-labelledby="sidebar-user-dropdown" data-state="closed">
      <div class="sh-sidebar-dropdown-header">
        <span class="sh-sidebar-dropdown-username">{$Userinfo.user.username}</span>
        <span class="sh-sidebar-dropdown-email">{$Userinfo.user.email}</span>
      </div>
      <div class="sh-sidebar-separator" role="separator" aria-hidden="true"></div>
      <a class="dropdown-item" href="details">
        <i class="bx bxs-user-detail" aria-hidden="true"></i>
        <span>{$Lang.personal_information|default:'个人信息'}</span>
      </a>
      <a class="dropdown-item" href="security">
        <i class="bx bx-cog" aria-hidden="true"></i>
        <span>{$Lang.security_center|default:'安全中心'}</span>
      </a>
      <a class="dropdown-item" href="message">
        <i class="bx bxl-messenger" aria-hidden="true"></i>
        <span>{$Lang.message_center|default:'消息中心'}</span>
      </a>
      {if $Setting.certifi_open==1}
      <a class="dropdown-item" href="verified">
        <i class="bx bxs-id-card" aria-hidden="true"></i>
        <span>{$Lang.real_name_authentications|default:'实名认证'}</span>
      </a>
      {/if}
      <div class="sh-sidebar-separator" role="separator" aria-hidden="true"></div>
      <a class="dropdown-item text-danger" href="logout">
        <i class="bx bx-power-off" aria-hidden="true"></i>
        <span>{$Lang.log_out|default:'退出登录'}</span>
      </a>
    </div>
  </div>

  {else}
  <!-- ====== Guest SidebarContent ====== -->
  <div class="sh-sidebar-content">
    <nav id="sidebar-menu" aria-label="访客导航">
      <div class="sh-sidebar-group">
        <div class="sh-sidebar-group-label">{$Lang.navigation|default:'导航'}</div>
        <div class="sh-sidebar-group-content">
          <ul class="sh-sidebar-menu list-unstyled" id="side-menu" role="menu">
            <li class="sh-sidebar-menu-item" data-state="closed" role="none">
              <a href="/login" class="sh-sidebar-menu-button" role="menuitem" title="{$Lang.login|default:'登录'}">
                <span class="s-icon" aria-hidden="true"><i class="bx bx-user-check"></i></span>
                <span class="sh-sidebar-menu-label">{$Lang.login|default:'登录'}</span>
              </a>
            </li>
            <li class="sh-sidebar-menu-item" data-state="closed" role="none">
              <a href="/register" class="sh-sidebar-menu-button" role="menuitem" title="{$Lang.register|default:'注册'}">
                <span class="s-icon" aria-hidden="true"><i class="bx bx-user-plus"></i></span>
                <span class="sh-sidebar-menu-label">{$Lang.register|default:'注册'}</span>
              </a>
            </li>
          </ul>
        </div>
      </div>
    </nav>
  </div>
  {/if}

  <!-- ====== Backdrop (mobile drawer) ====== -->
  <div class="sh-sidebar-backdrop" id="shSidebarBackdrop" aria-hidden="true"></div>
</div>

<!-- shadcn sidebar bootstrap script (async, non-render-blocking) -->
<script>
(function(){
  // Anti-FOUC coordinator:
  // The pre-collapsed class is added by the inline boot script above BEFORE
  // the sidebar DOM is rendered. CSS rules in shadcn-sidebar.css honor this
  // class to apply the collapsed visual state at parse time, eliminating the
  // flash-of-expanded-sidebar. Once the JS Sidebar has finished initializing
  // and set data-state="collapsed", we can safely remove the helper class.
  var html = document.documentElement;
  if (!html.classList.contains('sh-sidebar-pre-collapsed')) return;

  function cleanup() {
    html.classList.remove('sh-sidebar-pre-collapsed');
  }

  // Path A: Sidebar already initialized (unlikely since this script is inline)
  if (window.Sidebar && window.Sidebar.setState) {
    window.Sidebar.setState('collapsed');
    cleanup();
    return;
  }

  // Path B: wait for the shadcn-sidebar.js to load (defer) and run
  document.addEventListener('DOMContentLoaded', function(){
    // Poll briefly for the Sidebar global; sidebar.js is loaded with defer
    // so it runs after DOMContentLoaded on most browsers.
    var tries = 0;
    (function waitForSidebar(){
      if (window.Sidebar && window.Sidebar.setState) {
        window.Sidebar.setState('collapsed');
        cleanup();
      } else if (tries++ < 20) {
        setTimeout(waitForSidebar, 25);
      } else {
        // Give up after ~500ms; CSS will still keep things visually correct
        // because data-state="expanded" on the sidebar will be overridden by
        // the pre-collapsed rules. Clean up to avoid stacking classes.
        cleanup();
      }
    })();
  });
})();
</script>
