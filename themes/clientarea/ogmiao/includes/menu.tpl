<!-- shadcn sidebar -->
{if $Userinfo}
<div class="vertical-menu">
  <div data-simplebar class="h-100">
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
              <span>{$nv.name}</span>
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
                  <span>{$subnav.name}</span>
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
                      <span>{$submenu.name}</span>
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
</div>
{else}
<div class="vertical-menu">
  <div data-simplebar class="h-100">
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
</div>
{/if}
