<?php /*a:3:{s:64:"/www/wwwroot/cloud.hf.pw2/public/themes/web/zjmf/management.html";i:1758904948;s:67:"/www/wwwroot/cloud.hf.pw2/public/themes/web/zjmf/common/header.html";i:1758904948;s:67:"/www/wwwroot/cloud.hf.pw2/public/themes/web/zjmf/common/footer.html";i:1758904948;}*/ ?>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8" />
  <title>管家服务 - <?php echo $setting['company_name']; ?></title>
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta name="description" content="" />
  <meta name="keywords" content="HFCloud" />
  <link href="<?php echo $setting['web_view']; ?>/assets/css/all.min.css" rel="stylesheet">
  <link href="<?php echo $setting['web_view']; ?>/assets/css/base.css" rel="stylesheet">
  <link href="<?php echo $setting['web_view']; ?>/assets/css/fontawesome.css" rel="stylesheet">
  <script src="<?php echo $setting['web_view']; ?>/assets/js/jquery.min.js"></script>
  <script src="<?php echo $setting['web_view']; ?>/assets/js/scripts.min.js"></script>
  <script type="text/javascript">
    $(function(){
      $(".menu_down").hover(function (){  
            $(this).find('ul').show();  
        },function (){  
            $(this).find('ul').hide();    
        }); 
    })
  </script>

</head>

<body>
   <div class="header hasBottom">
  <div class="container">
    <nav class="zjmf navbar navbar-default">
      <div class="row">
        <div class="navbar-header rel idx-1">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" style="background-image:url(<?php echo $setting['web_logo']; ?>)" href="/"></a>
          <div class="login pull-right visible-xs-block">
            <ul>
              
              <li class="pull-left">
                <a href="<?php echo $setting['web_url']; ?>/login"><?php echo $Lang['login']; ?></a>
              </li>
              <li class="pull-left">
                <a href="<?php echo $setting['web_url']; ?>/register"><?php echo $Lang['register']; ?></a>
              </li>
              
            </ul>
          </div>
        </div>
        <div class="navbar-collapse collapse" id="bs-example-navbar-collapse-1" aria-expanded="false" style="height: 1px;">
          <ul class="nav navbar-nav">

            <?php foreach($www_top as $key =>$val): ?>
              <li class="<?php if((in_array($val['nav_type'],[1,2]))): ?> dropdown static <?php endif; ?>">
              <!-- ------------一级菜单 ---start------------------- -->
              <?php if((!isset($val['son']))): ?>
              <a href="<?php echo $val['url']; ?>"><?php echo $val['name']; ?></a>
              <?php endif; if((isset($val['son']))): ?>
              <a href="#" data-toggle="dropdown" class="dropdown-toggle"><?php echo $val['name']; ?><span class="caret"></span></a>
              <?php endif; ?>
              <!-- ------------一级菜单 ---end------------------- -->

              <!-- -----------二级菜单 ---start------------------- -->
              <?php if((isset($val['son']))): if((in_array($val['nav_type'],[1,2]))): ?>
                      <ul class="dropdown-menu fullwidth">
                        <?php foreach($val['son'] as $k =>$v): ?>
                        <li class="w<?php echo count($val['son']); ?>">
                          <dl>
                            <dt><?php echo $v['name']; ?></dt>
                            <!-- 一级分组-商品分组 | 商品分组-商品  三级菜单 -->
                            <?php if((isset($v['son']))): foreach($v['son'] as $vs_k => $vs_v): ?>
                            <dd>
                              <a href="<?php echo $vs_v['url']; ?>"><?php echo $vs_v['name']; ?></a>
                            </dd>
                            <?php endforeach; ?>
                            <?php endif; ?>
                          </dl>
                        </li>
                        <?php endforeach; ?>
                      </ul>
                  <?php endif; if((!in_array($val['nav_type'],[1,2]))): ?>
                    <ul class="dropdown-menu fullwidth noLeft">
                      <?php foreach($val['son'] as $k =>$v): ?>
                        <li class="w50">
                          <?php if((!isset($v['son']))): ?>
                            <a href="<?php echo $v['url']; ?>" <?php if((isset($v['tag']))): ?> <?php echo $v['tag']; ?> <?php endif; ?>><?php echo $v['name']; ?></a>
                          <?php endif; if((isset($v['son']))): ?>
                            <a href="#" <?php if((isset($v['tag']))): ?> <?php echo $v['tag']; ?> <?php endif; ?>><?php echo $v['name']; ?><span class="caret"></span></a>
                          <?php endif; if((isset($v['son']))): ?>
                            <ul>
                              <?php foreach($v['son'] as $vs_k => $vs_v): ?>
                                  <li>
                                      <a href="<?php echo $vs_v['url']; ?>" <?php if((isset($vs_v['tag']))): ?> <?php echo $vs_v['tag']; ?> <?php endif; ?>><?php echo $vs_v['name']; ?></a>
                                  </li>
                              <?php endforeach; ?>
                            </ul>
                          <?php endif; ?>
                        </li>
                      <?php endforeach; ?>
                    </ul>
                  <?php endif; ?>

              <?php endif; ?>
              <!-- ------------二级菜单 ---end------------------- -->
            </li>
            <?php endforeach; ?>
            
            
          </ul>
          <ul class="nav navbar-nav navbar-right visible-lg-block">
           
           <?php if($userInfo): ?>
           <li class=""><a href="<?php echo $setting['web_url']; ?>/clients.html#/user-center">控制台</a></li>
            <li class="register">
              <a href="<?php echo $setting['web_url']; ?>/logout">退出账户</a>
            </li>
           <?php else: ?>
            <li class=""><a href="<?php echo $setting['web_url']; ?>/login"><?php echo $Lang['login']; ?></a></li>
            <li class="register">
              <a href="<?php echo $setting['web_url']; ?>/register"><?php echo $Lang['register']; ?></a>
            </li>
           <?php endif; ?>
          </ul>
        </div>
      </div>
    </nav>
  </div>
</div>
<link href="<?php echo $setting['web_view']; ?>/assets/css/management.css" rel="stylesheet">
   			<section class="page-hero management space2x">
				<div class="container page-hero-text text-center">
					<div class="row">
						<div class="col-sm-12">
								<h2><?php echo $Lang['navmanagement']; ?></h2>
								<p class="hero-slogan">在建立安全合规的云平台上不懈努力</p>
							<div>
						</div>
				</div>
				</div>
				</div>
			</section>
			
	<div class="hy-servers ">
    <div class="container ">
      <dl class="t1">
        <dt><img alt="7X24小时快速响应" src="<?php echo $setting['web_view']; ?>/assets/img/management/hy-server01.png"></dt>
        <dd>
          <span>7X24小时快速响应</span>
          <p>若您在了解或使用<?php echo $setting['company_name']; ?>时遇到问题，您可以通过400热线、工单系统、QQ客服寻求帮助，我们将竭诚为您服务。</p>
        </dd>
      </dl>
      <dl class="t2">
        <dt><img alt="0元免费备案" src="<?php echo $setting['web_view']; ?>/assets/img/management/hy-server02.png"></dt>
        <dd>
          <span>0元免费备案</span>
          <p>在<?php echo $setting['company_name']; ?>购买云主机服务，提供免费备案。<?php echo $setting['company_name']; ?>备案服务速度快、周期短，备案地区覆盖全国30个省份地区。</p>
        </dd>
      </dl>
      <dl class="t3">
        <dt><img alt="量身定制上云迁移方案" src="<?php echo $setting['web_view']; ?>/assets/img/management/hy-server03.png"></dt>
        <dd>
          <span>量身定制上云迁移方案</span>
          <p>专业的技术服务团队为您量身定制上云迁移方案，保障业务应用和数据平滑迁移，助您轻松上云。</p>
        </dd>
      </dl>
      <dl class="t4">
        <dt><img alt="业务全程护航" src="<?php echo $setting['web_view']; ?>/assets/img/management/hy-server04.png"></dt>
        <dd>
          <span>业务全程护航</span>
          <p>提供相关软件安装和基础环境配置同步，覆盖客户业务的整个生命周期，保障业务在任何阶段都能稳定运行。</p>
        </dd>
      </dl>
    </div>
  </div>
  <section class="space2x">
  <div class="container " style="padding: 0">
    <div class="server-list">
      <h2>全面的服务内容</h2>
      <div class="server-content">
        <dl class="type">
          <dt>服务级别</dt>
          <dd class="first">
            <span>基础级</span>
            <em>免费</em>
          </dd>
          <dd>
            <span>专业级</span>
            <em class="line">￥9800/年</em>
          </dd>
          <dd>
            <span>企业级</span>
            <em class="line">￥19800/年</em>
            <div class="ask">
              为回馈广大客户，企业服务面向全部客户免费提供，详情咨询客服
            </div>
          </dd>
        </dl>
        <table cellpadding="0" cellspacing="0" class="server-table">
          <thead>
            <tr>
              <th colspan="4">服务方式</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td width="28%" align="left">提供正式用户ID</td>
              <td width="24%" align="center"><img alt="支持" src="<?php echo $setting['web_view']; ?>/assets/img/management/has-true.png"></td>
              <td width="24%" align="center"><img alt="支持" src="<?php echo $setting['web_view']; ?>/assets/img/management/has-true.png"></td>
              <td width="24%" align="center"><img alt="支持" src="<?php echo $setting['web_view']; ?>/assets/img/management/has-true.png"></td>
            </tr>
            <tr>
              <td width="28%" align="left">24H有问必答系统支持</td>
              <td width="24%" align="center"><img alt="支持" src="<?php echo $setting['web_view']; ?>/assets/img/management/has-true.png"></td>
              <td width="24%" align="center"><img alt="支持" src="<?php echo $setting['web_view']; ?>/assets/img/management/has-true.png"></td>
              <td width="24%" align="center"><img alt="支持" src="<?php echo $setting['web_view']; ?>/assets/img/management/has-true.png"></td>
            </tr>
            <tr>
              <td width="28%" align="left">24H客户服务电话支持</td>
              <td width="24%" align="center"><img alt="支持" src="<?php echo $setting['web_view']; ?>/assets/img/management/has-true.png"></td>
              <td width="24%" align="center"><img alt="支持" src="<?php echo $setting['web_view']; ?>/assets/img/management/has-true.png"></td>
              <td width="24%" align="center"><img alt="支持" src="<?php echo $setting['web_view']; ?>/assets/img/management/has-true.png"></td>
            </tr>
            <tr>
              <td width="28%" align="left">售后支持QQ</td>
              <td width="24%" align="center"><img alt="支持" src="<?php echo $setting['web_view']; ?>/assets/img/management/has-true.png"></td>
              <td width="24%" align="center"><img alt="支持" src="<?php echo $setting['web_view']; ?>/assets/img/management/has-true.png"></td>
              <td width="24%" align="center"><img alt="支持" src="<?php echo $setting['web_view']; ?>/assets/img/management/has-true.png"></td>
            </tr>
            <tr>
              <td width="28%" align="left">指定工程师7*24小时服务</td>
              <td width="24%" align="center"><img alt="支持" src="<?php echo $setting['web_view']; ?>/assets/img/management/has-true.png"></td>
              <td width="24%" align="center"><img alt="支持" src="<?php echo $setting['web_view']; ?>/assets/img/management/has-true.png"></td>
              <td width="24%" align="center"><img alt="支持" src="<?php echo $setting['web_view']; ?>/assets/img/management/has-true.png"></td>
            </tr>
          </tbody>
        </table>
        <table cellpadding="0" cellspacing="0" class="server-table">
          <thead>
            <tr>
              <th colspan="4">系统及基础服务</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td width="28%" align="left">云服务器无限次重启</td>
              <td width="24%" align="center"><img alt="支持" src="<?php echo $setting['web_view']; ?>/assets/img/management/has-true.png"></td>
              <td width="24%" align="center"><img alt="支持" src="<?php echo $setting['web_view']; ?>/assets/img/management/has-true.png"></td>
              <td width="24%" align="center"><img alt="支持" src="<?php echo $setting['web_view']; ?>/assets/img/management/has-true.png"></td>
            </tr>
            <tr>
              <td width="28%" align="left">云服务器无限次重装操作系统</td>
              <td width="24%" align="center"><img alt="支持" src="<?php echo $setting['web_view']; ?>/assets/img/management/has-true.png"></td>
              <td width="24%" align="center"><img alt="支持" src="<?php echo $setting['web_view']; ?>/assets/img/management/has-true.png"></td>
              <td width="24%" align="center"><img alt="支持" src="<?php echo $setting['web_view']; ?>/assets/img/management/has-true.png"></td>
            </tr>
            <tr>
              <td width="28%" align="left">云服务器重置密码</td>
              <td width="24%" align="center"><img alt="支持" src="<?php echo $setting['web_view']; ?>/assets/img/management/has-true.png"></td>
              <td width="24%" align="center"><img alt="支持" src="<?php echo $setting['web_view']; ?>/assets/img/management/has-true.png"></td>
              <td width="24%" align="center"><img alt="支持" src="<?php echo $setting['web_view']; ?>/assets/img/management/has-true.png"></td>
            </tr>
            <tr>
              <td width="28%" align="left">提供服务器CPU/内存/磁盘/网络等性能监控数据</td>
              <td width="24%" align="center"><img alt="支持" src="<?php echo $setting['web_view']; ?>/assets/img/management/has-true.png"></td>
              <td width="24%" align="center"><img alt="支持" src="<?php echo $setting['web_view']; ?>/assets/img/management/has-true.png"></td>
              <td width="24%" align="center"><img alt="支持" src="<?php echo $setting['web_view']; ?>/assets/img/management/has-true.png"></td>
            </tr>
            <tr>
              <td width="28%" align="left">同集群服务器组建私网环境</td>
              <td width="24%" align="center"><img alt="支持" src="<?php echo $setting['web_view']; ?>/assets/img/management/has-true.png"></td>
              <td width="24%" align="center"><img alt="支持" src="<?php echo $setting['web_view']; ?>/assets/img/management/has-true.png"></td>
              <td width="24%" align="center"><img alt="支持" src="<?php echo $setting['web_view']; ?>/assets/img/management/has-true.png"></td>
            </tr>
            <tr>
              <td width="28%" align="left">VNC控制台登录</td>
              <td width="24%" align="center"><img alt="支持" src="<?php echo $setting['web_view']; ?>/assets/img/management/has-true.png"></td>
              <td width="24%" align="center"><img alt="支持" src="<?php echo $setting['web_view']; ?>/assets/img/management/has-true.png"></td>
              <td width="24%" align="center"><img alt="支持" src="<?php echo $setting['web_view']; ?>/assets/img/management/has-true.png"></td>
            </tr>
            <tr>
              <td width="28%" align="left">SDN产品配置部署</td>
              <td width="24%" align="center"><img alt="支持" src="<?php echo $setting['web_view']; ?>/assets/img/management/has-true.png"></td>
              <td width="24%" align="center"><img alt="支持" src="<?php echo $setting['web_view']; ?>/assets/img/management/has-true.png"></td>
              <td width="24%" align="center"><img alt="支持" src="<?php echo $setting['web_view']; ?>/assets/img/management/has-true.png"></td>
            </tr>
            <tr>
              <td width="28%" align="left">服务器数据快照备份</td>
              <td width="24%" align="center"><img alt="支持" src="<?php echo $setting['web_view']; ?>/assets/img/management/has-true.png"></td>
              <td width="24%" align="center"><img alt="支持" src="<?php echo $setting['web_view']; ?>/assets/img/management/has-true.png"></td>
              <td width="24%" align="center"><img alt="支持" src="<?php echo $setting['web_view']; ?>/assets/img/management/has-true.png"></td>
            </tr>
            <tr>
              <td width="28%" align="left">服务器系统补丁更新</td>
              <td width="24%" align="center"><img alt="支持" src="<?php echo $setting['web_view']; ?>/assets/img/management/has-true.png"></td>
              <td width="24%" align="center"><img alt="支持" src="<?php echo $setting['web_view']; ?>/assets/img/management/has-true.png"></td>
              <td width="24%" align="center"><img alt="支持" src="<?php echo $setting['web_view']; ?>/assets/img/management/has-true.png"></td>
            </tr>
            <tr>
              <td width="28%" align="left">安装配置指定基础软件或服务器组件</td>
              <td width="24%" align="center"><img alt="支持" src="<?php echo $setting['web_view']; ?>/assets/img/management/has-true.png"></td>
              <td width="24%" align="center"><img alt="支持" src="<?php echo $setting['web_view']; ?>/assets/img/management/has-true.png"></td>
              <td width="24%" align="center"><img alt="支持" src="<?php echo $setting['web_view']; ?>/assets/img/management/has-true.png"></td>
            </tr>
          </tbody>
        </table>
        <table cellpadding="0" cellspacing="0" class="server-table">
          <thead>
            <tr>
              <th colspan="4">云运维服务</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td width="28%" align="left">运行环境部署</td>
              <td width="24%" align="center"><img alt="支持" src="<?php echo $setting['web_view']; ?>/assets/img/management/has-true.png"></td>
              <td width="24%" align="center"><img alt="支持" src="<?php echo $setting['web_view']; ?>/assets/img/management/has-true.png"></td>
              <td width="24%" align="center"><img alt="支持" src="<?php echo $setting['web_view']; ?>/assets/img/management/has-true.png"></td>
            </tr>
            <tr>
              <td width="28%" align="left">应用软件部署</td>
              <td width="24%" align="center"><img alt="支持" src="<?php echo $setting['web_view']; ?>/assets/img/management/has-true.png"></td>
              <td width="24%" align="center"><img alt="支持" src="<?php echo $setting['web_view']; ?>/assets/img/management/has-true.png"></td>
              <td width="24%" align="center"><img alt="支持" src="<?php echo $setting['web_view']; ?>/assets/img/management/has-true.png"></td>
            </tr>
            <tr>
              <td width="28%" align="left">服务器管理与监控软件部署</td>
              <td width="24%" align="center"><img alt="支持" src="<?php echo $setting['web_view']; ?>/assets/img/management/has-true.png"></td>
              <td width="24%" align="center"><img alt="支持" src="<?php echo $setting['web_view']; ?>/assets/img/management/has-true.png"></td>
              <td width="24%" align="center"><img alt="支持" src="<?php echo $setting['web_view']; ?>/assets/img/management/has-true.png"></td>
            </tr>
            <tr>
              <td width="28%" align="left">软件部署</td>
              <td width="24%" align="center"><img alt="支持" src="<?php echo $setting['web_view']; ?>/assets/img/management/has-true.png"></td>
              <td width="24%" align="center"><img alt="支持" src="<?php echo $setting['web_view']; ?>/assets/img/management/has-true.png"></td>
              <td width="24%" align="center"><img alt="支持" src="<?php echo $setting['web_view']; ?>/assets/img/management/has-true.png"></td>
            </tr>
            <tr>
              <td width="28%" align="left">数据库部署</td>
              <td width="24%" align="center"><img alt="支持" src="<?php echo $setting['web_view']; ?>/assets/img/management/has-true.png"></td>
              <td width="24%" align="center"><img alt="支持" src="<?php echo $setting['web_view']; ?>/assets/img/management/has-true.png"></td>
              <td width="24%" align="center"><img alt="支持" src="<?php echo $setting['web_view']; ?>/assets/img/management/has-true.png"></td>
            </tr>
            <tr>
              <td width="28%" align="left">服务器运行状态监控</td>
              <td width="24%" align="center"><img alt="支持" src="<?php echo $setting['web_view']; ?>/assets/img/management/has-true.png"></td>
              <td width="24%" align="center"><img alt="支持" src="<?php echo $setting['web_view']; ?>/assets/img/management/has-true.png"></td>
              <td width="24%" align="center"><img alt="支持" src="<?php echo $setting['web_view']; ?>/assets/img/management/has-true.png"></td>
            </tr>
            <tr>
              <td width="28%" align="left">系统优化</td>
              <td width="24%" align="center"><img alt="不支持" src="<?php echo $setting['web_view']; ?>/assets/img/management/has-false.png"></td>
              <td width="24%" align="center"><img alt="支持" src="<?php echo $setting['web_view']; ?>/assets/img/management/has-true.png"></td>
              <td width="24%" align="center"><img alt="支持" src="<?php echo $setting['web_view']; ?>/assets/img/management/has-true.png"></td>
            </tr>
            <tr>
              <td width="28%" align="left">故障排查检测</td>
              <td width="24%" align="center"><img alt="不支持" src="<?php echo $setting['web_view']; ?>/assets/img/management/has-false.png"></td>
              <td width="24%" align="center"><img alt="支持" src="<?php echo $setting['web_view']; ?>/assets/img/management/has-true.png"></td>
              <td width="24%" align="center"><img alt="支持" src="<?php echo $setting['web_view']; ?>/assets/img/management/has-true.png"></td>
            </tr>
            <tr>
              <td width="28%" align="left">数据迁移服务</td>
              <td width="24%" align="center"><img alt="不支持" src="<?php echo $setting['web_view']; ?>/assets/img/management/has-false.png"></td>
              <td width="24%" align="center"><img alt="支持" src="<?php echo $setting['web_view']; ?>/assets/img/management/has-true.png"></td>
              <td width="24%" align="center"><img alt="支持" src="<?php echo $setting['web_view']; ?>/assets/img/management/has-true.png"></td>
            </tr>
            <tr>
              <td width="28%" align="left">安全配置</td>
              <td width="24%" align="center"><img alt="不支持" src="<?php echo $setting['web_view']; ?>/assets/img/management/has-false.png"></td>
              <td width="24%" align="center"><img alt="支持" src="<?php echo $setting['web_view']; ?>/assets/img/management/has-true.png"></td>
              <td width="24%" align="center"><img alt="支持" src="<?php echo $setting['web_view']; ?>/assets/img/management/has-true.png"></td>
            </tr>
            <tr>
              <td width="28%" align="left">数据安全备份解决方案</td>
              <td width="24%" align="center"><img alt="不支持" src="<?php echo $setting['web_view']; ?>/assets/img/management/has-false.png"></td>
              <td width="24%" align="center"><img alt="支持" src="<?php echo $setting['web_view']; ?>/assets/img/management/has-true.png"></td>
              <td width="24%" align="center"><img alt="支持" src="<?php echo $setting['web_view']; ?>/assets/img/management/has-true.png"></td>
            </tr>
          </tbody>
        </table>
        <table cellpadding="0" cellspacing="0" class="server-table">
          <thead>
            <tr>
              <th colspan="4">其他金牌服务</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td width="28%" align="left">Mysql主从数据库同步部署、数据库读写分离</td>
              <td width="24%" align="center"><img alt="不支持" src="<?php echo $setting['web_view']; ?>/assets/img/management/has-false.png"></td>
              <td width="24%" align="center"><img alt="支持" src="<?php echo $setting['web_view']; ?>/assets/img/management/has-true.png"></td>
              <td width="24%" align="center"><img alt="支持" src="<?php echo $setting['web_view']; ?>/assets/img/management/has-true.png"></td>
            </tr>
            <tr>
              <td width="28%" align="left">负载均衡解决方案</td>
              <td width="24%" align="center"><img alt="不支持" src="<?php echo $setting['web_view']; ?>/assets/img/management/has-false.png"></td>
              <td width="24%" align="center"><img alt="不支持" src="<?php echo $setting['web_view']; ?>/assets/img/management/has-false.png"></td>
              <td width="24%" align="center"><img alt="支持" src="<?php echo $setting['web_view']; ?>/assets/img/management/has-true.png"></td>
            </tr>
            <tr>
              <td width="28%" align="left">业务异地灾备方案与实施</td>
              <td width="24%" align="center"><img alt="不支持" src="<?php echo $setting['web_view']; ?>/assets/img/management/has-false.png"></td>
              <td width="24%" align="center"><img alt="不支持" src="<?php echo $setting['web_view']; ?>/assets/img/management/has-false.png"></td>
              <td width="24%" align="center"><img alt="支持" src="<?php echo $setting['web_view']; ?>/assets/img/management/has-true.png"></td>
            </tr>
            <tr>
              <td width="28%" align="left">提供相关教程文档</td>
              <td width="24%" align="center"><img alt="不支持" src="<?php echo $setting['web_view']; ?>/assets/img/management/has-false.png"></td>
              <td width="24%" align="center"><img alt="支持" src="<?php echo $setting['web_view']; ?>/assets/img/management/has-true.png"></td>
              <td width="24%" align="center"><img alt="支持" src="<?php echo $setting['web_view']; ?>/assets/img/management/has-true.png"></td>
            </tr>
            <tr>
              <td width="28%" align="left">架构与咨询</td>
              <td width="24%" align="center"><img alt="不支持" src="<?php echo $setting['web_view']; ?>/assets/img/management/has-false.png"></td>
              <td width="24%" align="center"><img alt="不支持" src="<?php echo $setting['web_view']; ?>/assets/img/management/has-false.png"></td>
              <td width="24%" align="center"><img alt="支持" src="<?php echo $setting['web_view']; ?>/assets/img/management/has-true.png"></td>
            </tr>
            <tr>
              <td width="28%" align="left">企业培训</td>
              <td width="24%" align="center"><img alt="不支持" src="<?php echo $setting['web_view']; ?>/assets/img/management/has-false.png"></td>
              <td width="24%" align="center"><img alt="不支持" src="<?php echo $setting['web_view']; ?>/assets/img/management/has-false.png"></td>
              <td width="24%" align="center"><img alt="支持" src="<?php echo $setting['web_view']; ?>/assets/img/management/has-true.png"></td>
            </tr>
            <tr>
              <td width="28%" align="left">上门服务</td>
              <td width="24%" align="center"><img alt="不支持" src="<?php echo $setting['web_view']; ?>/assets/img/management/has-false.png"></td>
              <td width="24%" align="center"><img alt="不支持" src="<?php echo $setting['web_view']; ?>/assets/img/management/has-false.png"></td>
              <td width="24%" align="center"><img alt="支持" src="<?php echo $setting['web_view']; ?>/assets/img/management/has-true.png"></td>
            </tr>
          </tbody>
        </table>
        <table cellpadding="0" cellspacing="0" class="server-table">
          <thead>
            <tr>
              <th colspan="4">服务数量</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td width="28%" align="left">服务器数量</td>
              <td width="24%" align="center">5台</td>
              <td width="24%" align="center">5台</td>
              <td width="24%" align="center">5台</td>
            </tr>
          </tbody>
        </table>
      </div>
    </div>
  </div>
  </section>
<section class="foot">
	<div class="container">
		<div class="foot-item">
			<div class="foot-info">
				<div class="foot-text">即刻加入我们</div>
        <div class="foot-text-two">一起进入智能化世界，开启云服务之旅，让您的业务飞速拓展</div>
				<a href="/register" class="btn btn-default">立即注册</a>
			</div>
		</div>
	</div>
</section>
<div class="footer">
  <div class="container">
    <div class="row">
      <div class="col-md-3">
        <div class="address-holder">
          <a href="/index.html">
            <div class="phone" id="company-logo-wrapper">
              <img id="company-logo" src="<?php echo $setting['web_logo']; ?>" />
            </div>
          </a>
          <p class="mt-4 text-foot"><?php echo $setting['company_profile']; ?></p>       
         
        </div>
      </div>
      <?php foreach($www_bottom as $key => $val): ?>
        <div class="col-md-2">
          <div class="footer-menu-holder">
            <h4><?php echo $val['name']; ?></h4>
            <?php if((isset($val['son']))): ?>
              <ul class="footer-menu">
                <?php foreach($val['son'] as $k => $v): ?>
                  <li><a href="<?php echo $v['url']; ?>" <?php if((isset($v['tag']))): ?> <?php echo $v['tag']; ?> <?php endif; ?>><?php echo $v['name']; ?></a></li>
                <?php endforeach; ?>
              </ul>
            <?php endif; ?>

          </div>
        </div>
      <?php endforeach; ?>
      
            <div class="col-md-3">
        <div class="footer-menu-holder">
          <h4>联系我们</h4>
       <div class="phone footer-contact-list"><i class="fas fa-phone"></i><span><?php echo $setting['company_phone']; ?></span></div>
          <div class="email footer-contact-list"><i class="fas fa-envelope"></i><span><?php echo $setting['company_email']; ?></span></div>
          <div class="address footer-contact-list">
            <i class="fas fa-map-marker"></i>
            <span><?php echo $setting['company_address']; ?></span>
          </div>
          <!-- <div class="icp footer-contact-list">
            <i class="fas fa-map-marker"></i>
            <span><?php echo $setting['company_record']; ?></span>
          </div> -->
          </div>
    </div>
    
    </div>
    <div class="friendlyLink row">
      <div class="friendlyLink-title col-md-2 col-sm-12">友情链接</div>
      <div class="friendlyLinkDiv col-md-10 col-sm-12">
        <?php foreach($f_links as $k => $v): ?>
          <span><a href="<?php echo $v['domain']; ?>" <?php echo $v['link_tag']; ?>><?php echo $v['name']; ?></a></span>
        <?php endforeach; ?>
      </div>
    </div>
    
    
  </div>
  <div class="beianNumber">
    <div class="beianNumber-des">
      Copyright 2002-2021 <?php echo $setting['company_name']; ?> All Rights Reserved.
    </div>
  </div>
</div>

</body>

</html>