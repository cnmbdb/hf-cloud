<?php /*a:3:{s:68:"/www/wwwroot/cloud.hf.pw2/public/Z5OtUlpd/themes/default/plugins.tpl";i:1758904948;s:72:"/www/wwwroot/cloud.hf.pw2/public/Z5OtUlpd/themes/default/error/alert.tpl";i:1758904948;s:80:"/www/wwwroot/cloud.hf.pw2/public/Z5OtUlpd/themes/default/error/notifications.tpl";i:1758904948;}*/ ?>
<!DOCTYPE html>
<!--                                             
	__  ___          __      __          ____                                            
   /  |/  ____  ____/ __  __/ ___  _____/ __ \________  ____ _____   _________  ____ ___ 
  / /|_/ / __ \/ __  / / / / / _ \/ ___/ / / / ___/ _ \/ __ `/ __ \ / ___/ __ \/ __ `__ \
 / /  / / /_/ / /_/ / /_/ / /  __(__  / /_/ / /__/  __/ /_/ / / / _/ /__/ /_/ / / / / / /
/_/  /_/\____/\__,_/\__,_/_/\___/____/\____/\___/\___/\__,_/_/ /_(_\___/\____/_/ /_/ /_/ 

Design production By ModulesOcean.com
-->
<html lang="zh">

<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title>插件列表 - 魔方财务</title>
  <!-- Styling -->
  <link rel="stylesheet" href="<?php echo $Themes; ?>/assets/css/bootstrap.min.css" />
  <!--  <link rel="stylesheet" href="<?php echo $Themes; ?>/assets/css/bootstrap-icons.css"> -->
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.0/font/bootstrap-icons.css">
  <link href="<?php echo $Themes; ?>/assets/css/fontawesome-all.min.css" rel="stylesheet">
  <link href="<?php echo $Themes; ?>/assets/css/style.css" rel="stylesheet">
  <script src="<?php echo $Themes; ?>/assets/js/popper.min.js"></script>
  <script src="<?php echo $Themes; ?>/assets/js/jquery.min.js"></script>
  <script src="<?php echo $Themes; ?>/assets/js/bootstrap.min.js"></script>
  <script src="<?php echo $Themes; ?>/assets/js/packery.pkgd.min.js"></script>
  <script src="<?php echo $Themes; ?>/assets/js/draggabilly.pkgd.min.js"></script>
  <link href="<?php echo $Themes; ?>/assets/css/bootstrap-datetimepicker.min.css" rel="stylesheet">
  <script src="<?php echo $Themes; ?>/assets/js/bootstrap-datetimepicker.min.js"></script>
  <script src="<?php echo $Themes; ?>/assets/js/moment.js"></script>
  <script src="<?php echo $Themes; ?>/assets/js/daterangepicker.js"></script>
  <script src="<?php echo $Themes; ?>/assets/js/bootstrapValidator.min.js"></script>
  <link href="<?php echo $Themes; ?>/assets/css/daterangepicker.css" rel="stylesheet">
  <style>
    /*@media screen and (max-width: 992px) {
      .logo-div {
        display: none;
      }
    }*/
    .logo-div {
      width: 200px;
      height: 30px;
    }
    .nav-item {
      padding: 0 10px;
    }
    .dropdown-menu {
      min-width: auto;
      border: none;
      border-radius: 2px;
      left: 15%;
    }


    .sub-nav {
      background:#fff;
      color:#333;
    }
    .sub-nav:hover {
      background:#eceff4;
    }
    .navbar .navbar-nav .link-item {
      height:36px;
      line-height:36px;
      margin-right: 0;
      padding:0 8px;
    }
    .dropdown .nav-link.dropdown-toggle{
      margin-right:0;
      padding: 0 9px;
    }
    .dropdown-toggle::after {
      display:none;
    }
    .nav-item.dropdown {
      padding-left: 2px;
    }
    .dropdown-menu {
      display:none;
    }
    .nav-item.dropdown:hover .dropdown-menu
    {
      display:block;
    }
    .nav-item.dropdown:hover .arrow {
      transform:rotate(180deg);
      transition: .3s;
    }


  </style>
  <!-- wyh + -->
  <script src="<?php echo $Themes; ?>/assets/libs/toastr/build/toastr.min.js"></script>
  <link rel="stylesheet" href="<?php echo $Themes; ?>/assets/libs/toastr/build/toastr.min.css" />
</head>
<body>
<header class="header">
  <div class="container-fluid">
    <nav class="navbar navbar-expand-lg navbar-dark">
      <div class="logo-div">
        <a class="navbar-brand" href="/<?php echo config('database.admin_application'); ?>/#/home-page"></a>
      </div>
      <button class="navbar-toggler" type="button" id="menu-button">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarNavDropdown">
        <!-- 给li下的nav-link添加class:selected即可实现选中效果 -->
        <ul class="navbar-nav" >
          <?php foreach($topMenu as $val): if($val['child']): ?>
              <li class="nav-item dropdown" >
                <a class="nav-link dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
                   aria-expanded="false" href="#"><?php echo $val['title']; ?>
                  <img class="arrow" src="<?php echo $svg_menu; ?>" style="width:10px;height:auto;margin-left:4px;margin-top:-4px;">
                </a>
                <ul class="dropdown-menu" style="background: #fff;">
                  <?php foreach($val['child'] as $val1): ?>
                    <li class="sub-nav"><a class="nav-link link-item" href="<?php echo $val1['url']; ?>" style="color: #333;"><?php echo $val1['title']; ?></a></li>
                  <?php endforeach; ?>
                </ul>
              </li>
            <?php else: ?>
              <li class="nav-item">
                <a class="nav-link <?php echo !empty($val['is_active']) ? 'selected' : ''; ?>" href="<?php echo $val['url']; ?>">
                  <?php echo $val['title']; ?>
                </a>
              </li>
            <?php endif; ?>
          <?php endforeach; ?>
        </ul>
        <!--<ul class="navbar-nav navbar-right ml-auto">
          <li>
            <div class="top-search input-group">
              <span class="input-group-btn">
              <i class="bi bi-search"></i>
              </span>
              <input type="text" class="form-control" placeholder="请搜索...">
            </div>
          </li>-->
        <!-- <li>
          <div class="btn-group top-country-btn-group">
            <div class="dropdown-toggle top-country-img" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
              <img src="https://w2.test.idcsmart.com/upload/common/country/CN.png">
            </div>
            <ul class="dropdown-menu top-country-dropdown-menu">
              <li>
                <img src="https://w2.test.idcsmart.com/upload/common/country/HK.png" >
                <span>繁體中文</span>
              </li>
              <li>
                <img src="https://w2.test.idcsmart.com/upload/common/country/CN.png" >
                <span>中文简体</span>
              </li>
              <li>
              <img src="https://w2.test.idcsmart.com/upload/common/country/US.png" >
                <span>English</span>
              </li>
            </ul>
          </div>
        </li> -->
        <!--<li>
        <div class="btn-group">
            <div class="dropdown-toggle top-user-logo" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">

            </div>
            <ul class="dropdown-menu top-user-dropdown-menu">
              <li class="top-username">

              </li>
              <li class="update-password">
                修改密码
              </li>
              <li class="logout">
                退出登录
              </li>
            </ul>
          </div>
        </li>-->
        <!-- <li class="nav-item">
          <a class="nav-link" href="javascript:void(0);">
            <i class="bi bi-search"></i>
          </a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="javascript:void(0);">
            <i class="bi bi-bell-fill"></i>
          </a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="javascript:void(0);">
            <i class="bi bi-question-circle-fill"></i>
          </a>
        </li>
        <li class="nav-item">
          <a class="nav-link avatar-img" href="javascript:void(0);">
            <img class="avatar avatar-sm"
              src="https://gravatar.loli.net/avatar/99a1148b81c606f1ec711152e525d833?s=25&d=mp" />
          </a>
        </li> -->
        </ul>
      </div>
    </nav>
  </div>
</header>
</body>
<script type="text/javascript">
  $(function() {
    // logo hover打开
    var timer = ''
    $('.top-user-logo').mouseover(function() {
      $('.top-user-dropdown-menu').addClass('show');
      $('.top-country-dropdown-menu').removeClass('show');
    })
    $('.top-user-logo').mouseout(function() {
      timer = setTimeout(() => {
        $('.top-user-dropdown-menu').removeClass('show');
        clearTimeout(timer)
      }, 3000);
    });
    $('.top-user-dropdown-menu').mouseover(function() {
      $('.top-user-dropdown-menu').addClass('show');
      clearTimeout(timer)
    })
    $('.top-user-dropdown-menu').mouseout(function() {
      $(this).removeClass('show');
    })
    // country hover打开
    // var timer2 = ''
    // $('.top-country-img').mouseover(function() {
    //   $('.top-country-dropdown-menu').addClass('show');
    //   $('.top-user-dropdown-menu').removeClass('show');
    // })
    // $('.top-country-img').mouseout(function() {
    //     timer2 = setTimeout(() => {
    //     $('.top-country-dropdown-menu').removeClass('show');
    //     clearTimeout(timer2)
    //    }, 3000);
    // });
    // $('.top-country-dropdown-menu').mouseover(function() {
    //   $('.top-country-dropdown-menu').addClass('show');
    //   clearTimeout(timer2)
    // })
    // $('.top-country-dropdown-menu').mouseout(function() {
    //   $(this).removeClass('show');
    // })
    // 用户信息start
    let userInfo = window.localStorage.getItem('userInfo') ? JSON.parse(window.localStorage.getItem('userInfo')) : ''
    $('.top-user-logo').text(userInfo && userInfo.user_nickname && userInfo.user_nickname.charAt(0).toUpperCase())
    $('.top-username').text(userInfo && userInfo.user_nickname)
    // 修改密码
    $(".update-password").click(function(){
      window.location.href =  window.location.origin + '/admin/#/edit-person'
    });
    // 退出登录

    $('.logout').click(function(){
      $.ajax({
        type: "GET",
        url: window.location.origin + "/admin/logout",
        success: function success(res) {
          window.location.href =  window.location.origin + '/admin/#/login'
        }
      });
    })
    // 用户信息end

    window.directory = 'admin'; // 管理端目录

    var $grid = $('.home-dashboard-container').packery({
      itemSelector: ".dashboard-item",
      columnWidth: ".dashboard-sizer",
      percentPosition: "true"
    });

    // make all grid-items draggable
    $grid.find('.dashboard-item').each(function(i, gridItem) {
      var draggie = new Draggabilly(gridItem, {
        handle: ".card-header"
      });
      // bind drag events to Packery
      $grid.packery('bindDraggabillyEvents', draggie);
    });

    // tooltip
    $('[data-toggle="tooltip"]').tooltip({ boundary: 'window' });

    // popover
    $('[data-toggle="popover"]').popover();

    // 左侧菜单展开/收起
    $('#side-menu .menu').bind('click', function(event) {
      const c = $(this).attr('class');
      console.log(c);
      // console.log(c);
      if (c.indexOf('active') >= 0) {
        $(this).removeClass('active');
        $(this).find('ul').eq(0).removeClass('mm-show');
        $(this).find('i').eq(0).removeClass('rotate');
      } else {
        $(this).addClass('active');
        $(this).find('ul').eq(0).addClass('mm-show');
        $(this).find('i').eq(0).addClass('rotate');
      }
      event.stopPropagation();
    });

    // 左侧菜单点击
    $('#side-menu .link').bind('click', function(event) {
      const c = $(this).attr('data-url');
      // console.log(c);
      if (c) {
        window.location.href = c;
      }

      event.stopPropagation();
    })

    // 更多搜索
    $('#search-more').bind('click', function(aaa) {
      console.log(aaa)
      console.log('show');
      if ($('.more-search').is(':visible')) {
        $('.more-search').slideUp(300);
        $(this).html('高级搜索');
      } else {
        $('.more-search').slideDown(300);
        $(this).html('收起搜索');
      }
    });

    // 顶部显示/隐藏菜单按钮
    $('#menu-button').bind('click', function() {
      // console.log($('.vertical-menu').is(':visible'));
      if ($('.vertical-menu').is(':visible')) {
        $('.vertical-menu').hide();
      } else {
        $('.vertical-menu').show();
      }
    });

    // 日期控件
    $('.datetime').datetimepicker();

    // 日期范围
    $('.daterange').daterangepicker({
              ranges: {
                '今天': [moment(), moment()],
                '本周': [moment().startOf('week'), moment().endOf('week')],
                '本月': [moment().startOf('month'), moment().endOf('month')],
                '今年': [moment().startOf('year'), moment().endOf('year')]
              },
              startDate: moment(),
              endDate: moment().endOf('month')
            },
            function(start, end) {
              $('#daterange-btn span').html(start.format('MMMM D, YYYY') + ' - ' + end.format('MMMM D, YYYY'));
            }
    );

    $('#navTabs').on("click", "div", function(e) {
      $('#typeValue').val(e.target.dataset.value);
      document.getElementById('navTabsForm').submit();
    });

    // 全选/全不选
    $('#selectAll').bind('click', function() {
      var selectAll = $(this).is(":checked");
      if (selectAll) {
        $('.row-checkbox').prop('checked', true);
      } else {
        $('.row-checkbox').prop('checked', false);
      }
    })


  });

  // 获取选中的表格id列表
  function getSelectedRow() {
    const selectdId = [];
    $(".row-checkbox:checked").each(function() {
      selectdId.push($(this).attr('id'));
    });
    console.log(selectdId);
    return selectdId;
  }

  (function($) {
    $.fn.serializeJson = function() {
      var serializeObj = {};
      $(this.serializeArray()).each(function() {
        serializeObj[this.name] = this.value;
      });
      return serializeObj;
    };
  })(jQuery);

  function Toast(msg, duration) {
    duration = isNaN(duration) ? 1000 : duration;
    var m = document.createElement('div');
    m.innerHTML = msg;
    m.style.cssText =
            "max-width:60%;min-width: 150px;padding:0 14px;height: 40px;color: rgb(255, 255, 255);line-height: 40px;text-align: center;border-radius: 4px;position: fixed;top: 50%;left: 50%;transform: translate(-50%, -50%);z-index: 999999;background: rgba(0, 0, 0,.7);font-size: 16px;";
    document.body.appendChild(m);
    setTimeout(function() {
      var d = 0.5;
      m.style.webkitTransition = '-webkit-transform ' + d + 's ease-in, opacity ' + d +
              's ease-in';
      m.style.opacity = '0';
      setTimeout(function() {
        document.body.removeChild(m)
      }, d * 1000);
    }, duration);
  }

  function getQueryVariable(variable) {
    var query = window.location.search.substring(1);
    var vars = query.split("&");
    for (var i = 0; i < vars.length; i++) {
      var pair = vars[i].split("=");
      if(pair[0] == variable){return pair[1];}
              }
    return (false);
  }
</script><div class="vertical-menu">
  <div data-simplebar="init" class="h-100">
    <div class="simplebar-wrapper" style="margin: 0px;">
      <div class="simplebar-height-auto-observer-wrapper">
        <div class="simplebar-height-auto-observer"></div>
      </div>
      <div class="simplebar-mask">
        <div class="simplebar-offset" style="right: 0px; bottom: 0px;">
          <div class="simplebar-content-wrapper mm-active" style="height: 100%; overflow: hidden;">
            <div class="simplebar-content mm-show" style="padding: 0px;">
              <!--- Sidemenu -->
              <div id="sidebar-menu">
                <!-- Left Menu Start -->
                <!-- <ul class="metismenu list-unstyled mm-show" id="side-menu"> 以前的js效果-->
                <ul class="metismenu list-unstyled mm-show" id="side-menu-diy">
                  <?php foreach($PluginsMenu as $nv): ?>
                    <li class="menu">
                      <a href="<?php if($nv['menu']): ?>javascript: ;<?php else: ?><?php echo $nv['url']; ?><?php endif; ?>" aria-expanded="true" class="menu-title-a">
                        <span class="menu-title"><?php echo $nv['title']; ?></span><i class="bi-chevron-down"></i>
                      </a>
                      <?php if($nv['menu']): ?>
                        <ul class="sub-menu mm-collapse mm-show" aria-expanded="false">
                          <?php foreach($nv['menu'] as $subnav): ?>
                            <li class="<?php if($subnav['url'] == $PluginUrl): ?>mm-active<?php endif; ?> link">
                              <a href="<?php if($subnav['menu']): ?>javascript: ;<?php else: ?><?php echo $subnav['url']; ?><?php endif; ?>"
                                 class="<?php if($subnav['menu']): ?>has-arrow<?php endif; ?> waves-effect">
                                <span><?php echo $subnav['name']; ?></span>
                              </a>
                            </li>
                          <?php endforeach; ?>
                        </ul>
                      <?php endif; ?>
                    </li>
                  <?php endforeach; ?>


                  <!--<li class="menu active">
                    <a href="javascript: ;" aria-expanded="true">
                      <span>插件中心</span> <i class="bi-chevron-down"></i>
                    </a>
                    <ul class="sub-menu mm-collapse mm-show" aria-expanded="false">
                      <?php foreach($PluginsMenu as $v): ?>
                        <li class="<?php if($v['name'] == $Addons): ?>mm-active<?php endif; ?> link"><a href="<?php echo $v['menu']; ?>"><?php echo $v['title']; ?></a></li>
                      <?php endforeach; ?>

                    </ul>
                  </li>-->


                    </ul>
              </div>
              <!-- Sidebar -->
            </div>
          </div>
        </div>
      </div>
      <div class="simplebar-placeholder" style="width: auto;"></div>
    </div>
    <div class="simplebar-track simplebar-horizontal" style="visibility: hidden;">
      <div class="simplebar-scrollbar" style="transform: translate3d(0px, 0px, 0px); display: none;"></div>
    </div>
    <div class="simplebar-track simplebar-vertical" style="visibility: hidden;">
      <div class="simplebar-scrollbar" style="height: 613px; transform: translate3d(0px, 0px, 0px); display: none;">
      </div>
    </div>
  </div>
</div>
<style>
.menu-title {
  float: left;
  max-width: 120px;
  overflow: hidden;
  height: 26px;
  text-overflow: ellipsis;
  white-space: nowrap;
}
#side-menu-diy {
  padding: 0px;
}
.bi-chevron-up::before {
  content: "\f286";
}
</style>
<!-- 折叠效果js -->
<script>
$('#sidebar-menu').on('click','.menu-title-a',function(){
    $(this).siblings('ul').slideToggle()
    if ($(this).find('.bi-chevron-down').length > 0) {
      $(this).find('.bi-chevron-down').addClass('bi-chevron-up').removeClass('bi-chevron-down')
    } else if ($(this).find('.bi-chevron-up').length > 0) {
      $(this).find('.bi-chevron-up').addClass('bi-chevron-down').removeClass('bi-chevron-up')
    }
})
</script><?php if($ErrorMsg): ?>
    <!-- <div class="alert alert-danger mb-4">
	<div class="alert-body"></div>
</div> -->
<link type="text/css" href="<?php echo $Themes; ?>/assets/libs/toastr/build/toastr.min.css" rel="stylesheet" />
<script src="<?php echo $Themes; ?>/assets/libs/toastr/build/toastr.min.js"></script>
<script type="text/javascript">
	$(function () {
		toastr.error('');
	});
</script>
<?php endif; if($SuccessMsg): ?>
    <link type="text/css" href="<?php echo $Setting['web_view']; ?>/assets/libs/toastr/build/toastr.min.css" rel="stylesheet" />
<script src="<?php echo $Setting['web_view']; ?>/assets/libs/toastr/build/toastr.min.js"></script>

<script type="text/javascript">
	$(function () {
		toastr.success('');
		setTimeout(function () {
			var url = ''
			if (url) {
				location.href = url
			}
		}, 500);
	});
</script>
<?php endif; ?>
<style>
    .page-item{
        width: 26px;
        text-align: center;
    }
</style>
<section class="admin-main">
    <div class="container-fluid">
        <div class="page-container">
            <div class="card">
                <div class="card-body">
                    <div class="help-block">
                        <?php echo $Lang['plug_in_tips']; ?>

                    </div>
                    <div class="table-container">
                        <div class="table-header">
                            <div class="table-filter">
                                <div class="row">
                                    <div class="col">
                                         <btn class="btn btn-primary w-xs"
                                             onclick="window.open('https://my.idcsmart.com/shop')">
                                              <?php echo $Lang['moreInterFace']; ?>
                                         </btn>
                                    </div>
                                </div>
                            </div>
                            <div class="table-search">
                                <div class="row justify-content-end">
                                    <div class="search-box" style="padding-right:15px;">
                                        <div class="position-relative table-tools">
                                            <input type="text" class="form-control" id="searchInp" placeholder="<?php echo $Lang['enter_keywords']; ?>">
                                            <btn class="btn btn-primary w-xs" id="searchIcon"><i class="fas fa-search"></i> <?php echo $Lang['search']; ?></btn>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="table-body table-responsive">
                            <table class="table table-bordered table-hover">
                                <thead class="thead-light">
                                <tr>
                                    <th class="center "><?php echo $Lang['plug_in_name']; ?></th>
                                    <th><?php echo $Lang['plug_in_id']; ?></th>
                                    <th><?php echo $Lang['describe']; ?></th>
                                    <th><?php echo $Lang['author']; ?></th>
                                    <th><?php echo $Lang['current_version']; ?></th>
                                    <th><?php echo $Lang['latest_version']; ?></th>
                                    <th><?php echo $Lang['state']; ?></th>
                                    <th><?php echo $Lang['operating']; ?></th>
                                </tr>
                                </thead>

                                <tbody>
                                <?php if(is_array($Plugins) || $Plugins instanceof \think\Collection || $Plugins instanceof \think\Paginator): if( count($Plugins)==0 ) : echo "" ;else: foreach($Plugins as $key=>$vo): ?>
                                    <tr>
                                        <td><?php echo $vo['title']; ?><br><?php echo $vo['menu']; ?></td>
                                        <td><?php echo $vo['name']; ?></td>
                                        <td><?php echo $vo['description']; ?></td>
                                        <td><?php echo $vo['author']; ?></td>
                                        <td><?php echo $vo['version']; ?></td>
                                        <td><?php echo $vo['app_version']; ?></td>
                                        <td><?php echo $status[$vo['status']]; ?></td>
                                        <td>
                                            <?php if($vo['status']==3): ?>
                                                <button  class="btn btn-xs btn-primary js-ajax-dialog-btn" type="button"
                                                        onclick="plinstall('<?php echo $vo['name']; ?>')"><?php echo $Lang['install']; ?></button>
                                            <?php else: if($vo['update_btn']): ?>

                                                        <button  class="btn btn-xs btn-success" type="button"
                                                                onclick="plupdate('<?php echo $vo['name']; ?>','<?php echo $vo['app_id']; ?>')" <?php if($vo['update_disable']): ?> disabled <?php endif; ?>>
                                                            <span <?php if($vo['update_disable']): ?> data-toggle="tooltip" data-placement="top" title="<?php echo $Lang['to_update_tips']; ?>" <?php endif; ?>><?php echo $Lang['to_update']; ?> </span></button>

                                                <?php endif; if($vo['status']==0): ?>
                                                    <button class="btn btn-xs btn-success" type="button"
                                                       onclick="pltoggle('<?php echo $vo['id']; ?>','<?php echo $vo['status']; ?>')"><?php echo $Lang['enable']; ?></button>
                                                <?php else: ?>
                                                <button class="btn btn-xs btn-warning" type="button"
                                                       onclick="pltoggle('<?php echo $vo['id']; ?>','<?php echo $vo['status']; ?>')"><?php echo $Lang['disable']; ?></button>
                                                <?php endif; ?>
                                                 <button class="btn btn-xs btn-danger" type="button"
                                                      onclick="pluninstall('<?php echo $vo['id']; ?>')"><?php echo $Lang['uninstall']; ?></button>
                                            <?php endif; ?>
                                        </td>
                                    </tr>
                                <?php endforeach; endif; else: echo "" ;endif; ?>
                            </table>
                        </div>
                        <div class="table-footer">
                            <div class="table-pagination">
                                <div class="table-pageinfo mr-2">
                                    <span><?php echo $Lang['common']; ?> <?php echo $pageInfo['count']; ?> <?php echo $Lang['strips']; ?></span>
                                    <span class="mx-2"><?php echo $Lang['each_page']; ?>
                                        <select name="limit" id="limitSel" style="width: 60px;border-color:#ddd;border-radius:4px;background:#fff">
                                              <option value="10" <?php if($pageInfo['limit']==10): ?>selected<?php endif; ?>>10</option>
                                              <option value="15" <?php if($pageInfo['limit']==15): ?>selected<?php endif; ?>>15</option>
                                              <option value="20" <?php if($pageInfo['limit']==20): ?>selected<?php endif; ?>>20</option>
                                              <option value="50" <?php if($pageInfo['limit']==50): ?>selected<?php endif; ?>>50</option>
                                              <option value="100" <?php if($pageInfo['limit']==100): ?>selected<?php endif; ?>>100</option>
                                        </select> <?php echo $Lang['strips']; ?></span>
                                </div>
                                <ul class="pagination pagination-sm">
                                    <?php echo $pageInfo['pages']; ?>
                                </ul>
                            </div>
                        </div>
                        <!--<div class="table-footer">
                            <div class="table-pagination">
                                <div class="table-pageinfo">
                                    每页显示 10 条数据
                                </div>
                                <nav>
                                    <ul class="pagination">
                                        <li class="page-item disabled"><a class="page-link" href="#">上一页</a></li>
                                        <li class="page-item"><a class="page-link" href="#">1</a></li>
                                        <li class="page-item active"><a class="page-link" href="#">2</a></li>
                                        <li class="page-item"><a class="page-link" href="#">3</a></li>
                                        <li class="page-item"><a class="page-link" href="#">下一页</a></li>
                                    </ul>
                                </nav>
                            </div>
                        </div>-->
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- 提示框 -->
<div class="modal" tabindex="-1" role="dialog" id="comfirmModal">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title"><?php echo $Lang['prompt']; ?></h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body" id="tipContent">

            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-light" data-dismiss="modal"><?php echo $Lang['cancel']; ?></button>
                <button type="button" class="btn btn-primary" id="sureBtn"><?php echo $Lang['determine']; ?></button>
            </div>
        </div>
    </div>
</div>
</div>
<script>
console.log(localStorage.getItem('zjmf_lang_file_name'))
    $(function(){
        $('[data-toggle="tooltip"]').tooltip();
    })
    // 安装
    function plinstall(name) {
        $('#comfirmModal').modal('show')
        $('#tipContent').text('<?php echo $Lang['are_you_sure_install']; ?>')
        $(document).on('click', '#sureBtn', function () {
            $.ajax({
                type: "POST",
                url: '' + '/<?php echo $Admin; ?>/pl_install',
                data: {
                    name: name,
                    module: 'addons'
                },
                success: function (data) {
                    if (data.status == 200) {
                        toastr.success(data.msg)
                        location.reload()
                    } else
                        toastr.error(data.msg)
                }

            });
        });
    }

    // 更新
    function plupdate(name, app_id) {
        $('#comfirmModal').modal('show')
        $('#tipContent').text('<?php echo $Lang['are_you_sure_to_update']; ?>')
        $(document).on('click', '#sureBtn', function () {
            $(this).html('<i class="fa fa-spinner fa-pulse fa-3x fa-fw" style="\n' +
                '    font-size: 14px;\n' +
                '    margin-right: 4px;\n' +
                '"></i><?php echo $Lang['determine']; ?>');
            $(this).attr('disabled', true);
            var _this = this;
            $.ajax({
                type: "POST",
                url: '' + '/<?php echo $Admin; ?>/pl_update',
                data: {
                    name: name,
                    app_id: app_id,
                    module: 'addons'
                },
                success: function (data) {
                    $(_this).html('<?php echo $Lang['determine']; ?>');
                    $(_this).attr('disabled', false);
                    if (data.status == 200) {
                        toastr.success(data.msg)
                        location.reload()
                    } else
                        toastr.error(data.msg)
                }

            });
        });
    }

    // 卸载
    function pluninstall(id) {
        $('#comfirmModal').modal('show')
        $('#tipContent').text('<?php echo $Lang['are_you_sure_uninstall']; ?>')
        $(document).on('click', '#sureBtn', function () {
            $.ajax({
                type: "POST",
                url: '' + '/<?php echo $Admin; ?>/pl_uninstall',
                data: {
                    id: id,
                },
                success: function (data) {

                    if (data.status == 200) {
                        toastr.success(data.msg)
                        location.reload()
                    } else
                        toastr.error(data.msg)
                }


            });
        });

    }

    // 启用/禁用
    function pltoggle(id, status) {
        $('#comfirmModal').modal('show')
        var obj = {}
        if (status == 0) {
            obj = {
                id: id,
                enable: '1'
            }
            $('#tipContent').text('<?php echo $Lang['are_you_sure_to_enable_it']; ?>')
        } else {
            obj = {
                id: id,
                disable: '1',
            }
            $('#tipContent').text('<?php echo $Lang['are_you_sure_to_disable_it']; ?>')
        }
        $(document).on('click', '#sureBtn', function () {
            $.ajax({
                type: "POST",
                url: '' + '/<?php echo $Admin; ?>/pl_toggle',
                data: obj,
                success: function (data) {

                    if (data.status == 200) {
                        toastr.success(data.msg)
                        location.reload()
                    } else
                        toastr.error(data.msg)
                }

            });
        });

    }

    // 每页条数
    $("#limitSel").blur(function () {
        var limit = 'limit='+this.value;
        window.location.href="/<?php echo adminAddress(); ?>/plugins?"+limit+'&languagesys=<?php echo app('request')->get('languagesys'); ?>'
    });
    // 关键字搜索
    $('#searchInp').val('<?php echo app('request')->get('keywords'); ?>')
    $('#searchInp').on('keydown', function (e) {
        if (e.keyCode == 13) {
            location.href = '/<?php echo adminAddress(); ?>/plugins?'+
                'keywords=' + $('#searchInp').val()+'&page=<?php echo app('request')->get('page'); ?>&limit=<?php echo app('request')->get('limit'); ?>'+'&languagesys=<?php echo app('request')->get('languagesys'); ?>'
        }
    })
    $('#searchIcon').on('click', function () {
        location.href = '/<?php echo adminAddress(); ?>/plugins?'+
            'keywords=' + $('#searchInp').val()+'&page=<?php echo app('request')->get('page'); ?>&limit=<?php echo app('request')->get('limit'); ?>'+'&languagesys=<?php echo app('request')->get('languagesys'); ?>'
    });

</script><input hidden="hidden" value="<?php echo $errorMsg; ?>" id="errorMsg" />
<script>
	$(function() {
		let errorMsg = document.getElementById('errorMsg').value;
		if (errorMsg) {
			Toast(errorMsg);
		}
	});
</script>
</body>
</html>
