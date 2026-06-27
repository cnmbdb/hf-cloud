<!-- shadcn sidebar -->
<div class="vertical-menu">
  <!-- 1. Brand/Switcher Header (Fixed) -->
  <div class="sh-sidebar-header">
    <div class="sh-sidebar-brand-box">
      <div class="sh-sidebar-logo">
        {if $Setting.logo_url_home_mini}
          <img src="{$Setting.logo_url_home_mini}" alt="logo" height="24">
        {else}
          <span class="sh-sidebar-logo-text">{$Setting.company_name|substr=0,1|upper}</span>
        {/if}
      </div>
      <div class="sh-sidebar-brand-info">
        <span class="sh-sidebar-brand-name">{$Setting.company_name}</span>
        <span class="sh-sidebar-brand-sub">{$Lang.clientarea|default='用户中心'}</span>
      </div>
      <i class="bx bx-unfold sh-sidebar-switcher-icon"></i>
    </div>
  </div>

  {if $Userinfo}
  <!-- 2. Navigation Content for logged in user (Scrollable with simplebar) -->
  <div data-simplebar class="sh-sidebar-content-scroll">
    <nav id="sidebar-menu">
      <div class="sh-sidebar-group">
        <ul class="sh-sidebar-menu metismenu list-unstyled" id="side-menu">
          {foreach $Nav as $nv}
          <li class="sh-sidebar-menu-item">
            <a href="{if $nv.child}javascript:;{else}{$nv.url}{/if}"
               class="sh-sidebar-menu-button {if $nv.child}has-arrow{/if} waves-effect"
               {if $nv.child}aria-expanded="false"{/if}>
              {if $nv.fa_icon}<span class="s-icon"><i class="{$nv.fa_icon}"></i></span>{/if}
              {if isset($nv.tag)}{$nv.tag}{/if}
              <span>{$nv.name|replace:'▼':''|replace:'▲':''|trim}</span>
              {if $nv.child}<span class="s-chevron">&#9660;</span>{/if}
            </a>
            {if $nv.child}
            <ul class="sh-sidebar-menu-sub mm-collapse" aria-expanded="false">
              {foreach $nv.child as $subnav}
              <li class="sh-sidebar-menu-sub-item">
                <a href="{if $subnav.child}javascript:;{else}{$subnav.url}{/if}"
                   class="sh-sidebar-menu-sub-button {if $subnav.child}has-arrow{/if} waves-effect"
                   {if $subnav.child}aria-expanded="false"{/if}>
                  {if $subnav.fa_icon}<span class="s-icon"><i class="{$subnav.fa_icon}"></i></span>{/if}
                  {if isset($subnav.tag)}{$subnav.tag}{/if}
                  <span>{$subnav.name|replace:'▼':''|replace:'▲':''|trim}</span>
                  {if $subnav.child}<span class="s-chevron">&#9660;</span>{/if}
                </a>
                {if $subnav.child}
                <ul class="sh-sidebar-menu-sub mm-collapse" aria-expanded="false">
                  {foreach $subnav.child as $submenu}
                  <li class="sh-sidebar-menu-sub-item">
                    <a href="{if $submenu.child}javascript:;{else}{$submenu.url}{/if}"
                       class="sh-sidebar-menu-sub-button {if $submenu.child}has-arrow{/if} waves-effect"
                       {if $submenu.child}aria-expanded="false"{/if}>
                      {if $submenu.fa_icon}<span class="s-icon"><i class="{$submenu.fa_icon}"></i></span>{/if}
                      {if isset($submenu.tag)}{$submenu.tag}{/if}
                      <span>{$submenu.name|replace:'▼':''|replace:'▲':''|trim}</span>
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
    </nav>
  </div>

  <!-- 3. User Profile Footer for logged in user (Fixed) -->
  <div class="sh-sidebar-footer dropdown">
    <div class="sh-sidebar-user-card" id="sidebar-user-dropdown" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
      {if $Userinfo.user.qq}
        <img src="https://q1.qlogo.cn/g?b=qq&nk={$Userinfo.user.qq}&s=640" class="sh-sidebar-avatar" alt="user avatar">
      {else}
        <div class="sh-sidebar-avatar-placeholder">
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
        <span class="sh-sidebar-username">{$Userinfo.user.username}</span>
        <span class="sh-sidebar-userid">ID: {$Userinfo.user.id}</span>
      </div>
      <i class="bx bx-chevron-right sh-sidebar-user-chevron"></i>
    </div>
    
    <div class="dropdown-menu dropdown-menu-right sh-sidebar-dropdown-menu" aria-labelledby="sidebar-user-dropdown">
      <div class="sh-sidebar-dropdown-header">
        <span class="sh-sidebar-dropdown-username">{$Userinfo.user.username}</span>
        <span class="sh-sidebar-dropdown-email">{$Userinfo.user.email}</span>
      </div>
      <div class="dropdown-divider"></div>
      <a class="dropdown-item" href="details">
        <i class="bx bxs-user-detail mr-2"></i>
        <span>{$Lang.personal_information|default='个人信息'}</span>
      </a>
      <a class="dropdown-item" href="security">
        <i class="bx bx-cog mr-2"></i>
        <span>{$Lang.security_center|default='安全中心'}</span>
      </a>
      <a class="dropdown-item" href="message">
        <i class="bx bxl-messenger mr-2"></i>
        <span>{$Lang.message_center|default='消息中心'}</span>
      </a>
      {if $Setting.certifi_open==1}
      <a class="dropdown-item" href="verified"> 
        <i class="bx bxs-id-card mr-2"></i>
        <span>{$Lang.real_name_authentications|default='实名认证'}</span>
      </a>
      {/if}
      <div class="dropdown-divider"></div>
      <a class="dropdown-item text-danger" href="logout">
        <i class="bx bx-power-off mr-2"></i>
        <span>{$Lang.log_out|default='退出登录'}</span>
      </a>
    </div>
  </div>

  {else}
  <!-- 2. Navigation Content for guest user (Scrollable with simplebar) -->
  <div data-simplebar class="sh-sidebar-content-scroll">
    <nav id="sidebar-menu">
      <div class="sh-sidebar-group">
        <div class="sh-sidebar-group-label">{$Lang.navigation|default='导航'}</div>
        <ul class="sh-sidebar-menu" id="side-menu">
          <li class="sh-sidebar-menu-item">
            <a href="/login" class="sh-sidebar-menu-button waves-effect">
              <span class="s-icon"><i class="bx bx-user-check"></i></span>
              <span>{$Lang.login|default='登录'}</span>
            </a>
          </li>
          <li class="sh-sidebar-menu-item">
            <a href="/register" class="sh-sidebar-menu-button waves-effect">
              <span class="s-icon"><i class="bx bx-user-plus"></i></span>
              <span>{$Lang.register|default='注册'}</span>
            </a>
          </li>
        </ul>
      </div>
    </nav>
  </div>
  {/if}
</div>
