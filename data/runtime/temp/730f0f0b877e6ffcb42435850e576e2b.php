<?php /*a:3:{s:60:"/www/wwwroot/cloud.hf.pw2/public/themes/web/zjmf/server.html";i:1758904948;s:67:"/www/wwwroot/cloud.hf.pw2/public/themes/web/zjmf/common/header.html";i:1758904948;s:67:"/www/wwwroot/cloud.hf.pw2/public/themes/web/zjmf/common/footer.html";i:1758904948;}*/ ?>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8" />
  <title>独立服务器 - <?php echo $setting['company_name']; ?></title>
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta name="description" content="智简魔方" />
  <meta name="keywords" content="智简魔方" />
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




<section class="page-hero dedi space2x">
			<div class="container page-hero-text">
				<div class="row">
					<div class="col-sm-6">
									<h2>独立服务器</h2>
						<div class="noti-holder animated">
		                                <a href="#" tabindex="0">
		                                    <div class="noti">
		                                        <span class="badge">适用于</span><span class="text">核心数据库、高性能计算业务</span>
		                                    </div>
		                                </a>
		                </div>
						<p class="hero-slogan">为核心数据库、高性能计算业务提供云端专用的高性能、安全隔离的物理集群。实现配置随意扩展，灵活开展业务。</p>
						<a id="contorlTai" class="free-use-btn btn-white" style="color: #4F60BF;margin-top:15px;"><?php echo $Lang['buynow']; ?></a>
					</div>
				</div>
			</div>
		</section>
<section class="space2x" id="plans">
	<div class="container">

				
					
<div class="head-top text-center">
	<h2 class="head-title">产品套餐</h2>
</div>

<div class="newProductPackage">
	<table class="table vps-hosting-pricing-table newTable">
		<thead>
			<tr>
				<th>CPU</th>
				<th>内存</th>
				<th>硬盘</th>
				<th>带宽</th>
				<th>流量</th>
				<th>IPs</th>
				<th>防御</th>
				<th colspan="2">金额</th>
			</tr>
		</thead>
		<tbody>
			<tr class="vps-pricing-row">
				<td data-value="套餐">
					<div>
						<div>测试</div>
						<small class="newbadge badge-secondary">配置二</small>
					</div>
				</td>
				<td data-value="处理器">
					<span> 1 Cores<br></span>
				</td>
				<td data-value="内存">
					<span> 512MB<br></span>
				</td>
				<td data-value="SSD"><span> 10GB<br>
				</span></td>
				<td data-value="IP"><span> 1 IPV4<br>
				</span></td>
				<td data-value="流量"><span> 500GB<br>
				</span></td>
				<td data-value="带宽"><span> 500Mbps<br>
				</span></td>
				<td data-value="价格">
				<span class="rate">¥119.99</span>
				<span class="won">/ 月付
				</span>
				</td>
				<td class="text-center text-nowrap">
				<a href="/cart" class="btn btn-block btn-primary" style="border-radius: 20px;background: #2B5FEC;">立刻订购</a>
				</td>
			</tr>
		</tbody>
	</table>
</div>

<!-- <div class="price-list">
	<div class="price-row price-head">
		<div class="price-title">CPU</div>
		<div class="price-title">内存</div>
		<div class="price-title">硬盘</div>
		<div class="price-title">带宽</div>
		<div class="price-title">流量</div>
		<div class="price-title">IPs</div>
		<div class="price-title">防御</div>
		<div class="price-title">金额</div>
		<div class="price-title"></div>
	</div>
        <div class="price-row">		
			<div class="price-title hidden-md hidden-lg text-left">
				<small class="badge badge-secondary">配置一</small>
			</div>    
        			<div class="price-title">
				<span class="hidden-md hidden-lg">CPU:</span>
										<div class="hidden-xs hidden-sm">
						<small class="badge badge-secondary">配置一</small>
					</div>
										I3-2核
			</div>
        			<div class="price-title">
				<span class="hidden-md hidden-lg">内存:</span>
										8GB
			</div>
        			<div class="price-title">
				<span class="hidden-md hidden-lg">硬盘:</span>
										1T HDD
			</div>
        			<div class="price-title">
				<span class="hidden-md hidden-lg">带宽:</span>
										100M(10M CN2)
			</div>
        			<div class="price-title">
				<span class="hidden-md hidden-lg">流量:</span>
										不限
			</div>
        			<div class="price-title">
				<span class="hidden-md hidden-lg">IPv4:</span>
										2
			</div>
        			<div class="price-title">
				<span class="hidden-md hidden-lg">防御:</span>
										无
			</div>
        		<div class="price-title">
			<span class="hidden-md hidden-lg">价格:</span>
			<p class="price">
				<span class="big">¥1,800 </span>
				<span class="won d-inline-block d-md-block">
									/ 每月
                                </span>
			</p>
		</div>
		<div class="price-title">
							<a href="#" class="btn btn-primary d-block d-md-inline-block w-100">
					立即訂購
				</a>
					</div>
    </div>
        <div class="price-row">		
			<div class="price-title hidden-md hidden-lg text-left">
				<small class="badge badge-secondary">配置二</small>
			</div>    
        			<div class="price-title">
				<span class="hidden-md hidden-lg">CPU:</span>
										<div class="hidden-xs hidden-sm">
						<small class="badge badge-secondary">配置二</small>
					</div>
										E3-4核
			</div>
        			<div class="price-title">
				<span class="hidden-md hidden-lg">内存:</span>
										16GB
			</div>
        			<div class="price-title">
				<span class="hidden-md hidden-lg">硬盘:</span>
										1T HDD
			</div>
        			<div class="price-title">
				<span class="hidden-md hidden-lg">带宽:</span>
										100M(10M CN2)
			</div>
        			<div class="price-title">
				<span class="hidden-md hidden-lg">流量:</span>
										不限
			</div>
        			<div class="price-title">
				<span class="hidden-md hidden-lg">IPv4:</span>
										2
			</div>
        			<div class="price-title">
				<span class="hidden-md hidden-lg">防御:</span>
										无
			</div>
        		<div class="price-title">
			<span class="hidden-md hidden-lg">价格:</span>
			<p class="price">
				<span class="big">¥2,100 </span>
				<span class="won d-inline-block d-md-block">
									/ 每月
                                </span>
			</p>
		</div>
		<div class="price-title">
							<a href="#" class="btn btn-primary d-block d-md-inline-block w-100">
					立即訂購
				</a>
					</div>
    </div>
        <div class="price-row">		
			<div class="price-title hidden-md hidden-lg text-left">
				<small class="badge badge-secondary">配置三</small>
			</div>    
        			<div class="price-title">
				<span class="hidden-md hidden-lg">CPU:</span>
										<div class="hidden-xs hidden-sm">
						<small class="badge badge-secondary">配置三</small>
					</div>
										E3-4核
			</div>
        			<div class="price-title">
				<span class="hidden-md hidden-lg">内存:</span>
										16GB
			</div>
        			<div class="price-title">
				<span class="hidden-md hidden-lg">硬盘:</span>
										1T HDD
			</div>
        			<div class="price-title">
				<span class="hidden-md hidden-lg">带宽:</span>
										100M(20M CN2)
			</div>
        			<div class="price-title">
				<span class="hidden-md hidden-lg">流量:</span>
										不限
			</div>
        			<div class="price-title">
				<span class="hidden-md hidden-lg">IPv4:</span>
										2
			</div>
        			<div class="price-title">
				<span class="hidden-md hidden-lg">防御:</span>
										无
			</div>
        		<div class="price-title">
			<span class="hidden-md hidden-lg">价格:</span>
			<p class="price">
				<span class="big">¥4,200 </span>
				<span class="won d-inline-block d-md-block">
									/ 每月
                                </span>
			</p>
		</div>
		<div class="price-title">
							<a href="#" class="btn btn-primary d-block d-md-inline-block w-100">
					立即訂購
				</a>
					</div>
    </div>
        <div class="price-row">		
			<div class="price-title hidden-md hidden-lg text-left">
				<small class="badge badge-secondary">配置四</small>
			</div>    
        			<div class="price-title">
				<span class="hidden-md hidden-lg">CPU:</span>
										<div class="hidden-xs hidden-sm">
						<small class="badge badge-secondary">配置四</small>
					</div>
										E5-16核
			</div>
        			<div class="price-title">
				<span class="hidden-md hidden-lg">内存:</span>
										32GB
			</div>
        			<div class="price-title">
				<span class="hidden-md hidden-lg">硬盘:</span>
										2x480G SSD
			</div>
        			<div class="price-title">
				<span class="hidden-md hidden-lg">带宽:</span>
										100M(10M CN2)
			</div>
        			<div class="price-title">
				<span class="hidden-md hidden-lg">流量:</span>
										不限
			</div>
        			<div class="price-title">
				<span class="hidden-md hidden-lg">IPv4:</span>
										2
			</div>
        			<div class="price-title">
				<span class="hidden-md hidden-lg">防御:</span>
										无
			</div>
        		<div class="price-title">
			<span class="hidden-md hidden-lg">价格:</span>
			<p class="price">
				<span class="big">¥3,500 </span>
				<span class="won d-inline-block d-md-block">
									/ 每月
                                </span>
			</p>
		</div>
		<div class="price-title">
							<a href="#" class="btn btn-primary d-block d-md-inline-block w-100">
					立即訂購
				</a>
					</div>
    </div>
</div> -->

				
	</div>
</section>
<section>
	<div class="pro-server">
		<div class="solutionDiv" style="margin-bottom: 20px;">
		  <div class="newlineone"></div>
		  <div style="font-size:26px;color:#fff;margin:0px 50px;">提供云端专用的高性能、安全隔离的物理集群</div>
		  <div class="newlinetwo"></div>
		</div>
		<div class="free-use-btn solutionBtn">
		  <a>立即选购</a>
		</div>
	</div>
</section>
<section class="space">
	<div class="newHome-service">
		<div class="container">
			<div class="host-model">
			  <div class="hometitleSpan tac"><span>产品亮点</span></div>
			  <div class="newHome-service-div row">
				<div class="col-md-3 col-sm-12">
					<div class="service-div-content-two">
						<div class="service-div-img">
							<img src="<?php echo $setting['web_view']; ?>/assets/img/newImg/cost_performance.png" alt="">
						</div>
						<div class="service-div-text-two">
							<div>性价比高</div>
							<div>支持CPU核数与内存灵活组合，支持云磁盘和弹性公网IP灵活挂载，支持在线配置变更和关机不计费</div>
						</div>
					</div>
				</div>
				<div class="col-md-3 col-sm-12">
					<div class="service-div-content-two">
						<div class="service-div-img">
							<img src="<?php echo $setting['web_view']; ?>/assets/img/newImg/safe_stable.png" alt="">
						</div>
						<div class="service-div-text-two">
							<div>安全，稳定</div>
							<div>基于大规模分布式集群下智能调度，支持秒级热迁移，用户业务无感；支持部署集，虚机散部策略；支持自动快照策略设定</div>
						</div>
					</div>
				</div>
				<div class="col-md-3 col-sm-12">
					<div class="service-div-content-two">
						<div class="service-div-img">
							<img src="<?php echo $setting['web_view']; ?>/assets/img/newImg/high_performance.png" alt="">
						</div>
						<div class="service-div-text-two">
							<div>高性能</div>
							<div>存储优化NVME SSD本地盘IOPS达到40万；数据持久性高于99.9999999%；网络性能最高支持25G网卡吞吐和1000万PPS</div>
						</div>
					</div>
				</div>
				<div class="col-md-3 col-sm-12">
					<div class="service-div-content-two">
						<div class="service-div-img">
							<img src="<?php echo $setting['web_view']; ?>/assets/img/newImg/convenient_management.png" alt="">
						</div>
						<div class="service-div-text-two">
							<div>管理便捷</div>
							<div>控制台功能强大，支持对上千数量级实例的多重实时管理；多维度监控预警，帮助您提前发现问题，减少损失</div>
						</div>
					</div>
				</div>
			  </div>
		  </div>
		</div>
	  </div>
</section>

<!-- <section class="vps-contrast space2x" id="duibi">
	<div class="container">
		<div class="head-top text-center">
			<h2 class="head-title text-white">产品对比</h2>
		</div>
		
		<div class="hardware-panel">
			<div class="row">
				<div class="col-md-2">
					<div class="hardware-main">
						<div class="hardware-title">类别</div>
						<div class="hardware-list">
							<div class="hardware-list-item">
								<img src="<?php echo $setting['web_view']; ?>/assets/img/compass_weifuwu.png" alt="">
								<strong>节约成本</strong>
							</div>
							<div class="hardware-list-item">
								<img src="<?php echo $setting['web_view']; ?>/assets/img/compass_pingtaikuozhan.png" alt="">
								<strong>操作管理</strong>
							</div>
							<div class="hardware-list-item">
								<img src="<?php echo $setting['web_view']; ?>/assets/img/compass_cunchuguanli.png" alt="">
								<strong>容灾备份</strong>
							</div>
							<div class="hardware-list-item">
								<img src="<?php echo $setting['web_view']; ?>/assets/img/clever.png" alt="">
								<strong>安全可靠</strong>
							</div>
							<div class="hardware-list-item">
								<img src="<?php echo $setting['web_view']; ?>/assets/img/compass_duozuhuguanli.png" alt="">
								<strong>扩展灵活</strong>
							</div>
						</div>
					</div>
				</div>
				<div class="col-md-5">
					<div class="hardware-main kf-main">
						<div class="hardware-title">云服务器</div>
						<div class="hardware-list">
							<div class="hardware-list-item">
								拥有自主机房 10+
							</div>
							<div class="hardware-list-item">
								在线管理平台
							</div>
							<div class="hardware-list-item">
								硬件环境统计、性能稳定、可靠性高、分享不受限
							</div>
							<div class="hardware-list-item">
								主动资源管理，部署灵活可控，速度快
							</div>
							<div class="hardware-list-item">
								主但节点在线率23.5小时，稳定可靠
							</div>
						</div>
					</div>
				</div>
				<div class="col-md-5">
					<div class="hardware-main">
						<div class="hardware-title">传统服务器</div>
						<div class="hardware-list">
							<div class="hardware-list-item">
								拥有自主机房 10+
							</div>
							<div class="hardware-list-item">
								在线管理平台
							</div>
							<div class="hardware-list-item">
								硬件环境统计、性能稳定、可靠性高、分享不受限
							</div>
							<div class="hardware-list-item">
								主动资源管理，部署灵活可控，速度快
							</div>
							<div class="hardware-list-item">
								主但节点在线率23.5小时，稳定可靠
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		
	</div>
</section>

<section class="vps-news space2x bg-white" id="faq">
	<div class="container">
		<div class="head-top text-center">
			<h2 class="head-title">帮助文档</h2>
		</div>
		<div class="row">
			<div class="col-md-4">
				<div class="news-box">
					<h3 class="news-title">快速入门</h3>
					<ul class="news-list">
						<li class="news-item">
							<a href="#" class="link">创建云主机</a>
						</li>
						<li class="news-item">
							<a href="#" class="link">配置升级降级</a>
						</li>
						<li class="news-item">
							<a href="#" class="link">重装操作系统</a>
						</li>
						<li class="news-item">
							<a href="#" class="link">添加修改安全组</a>
						</li>
					</ul>
				</div>
			</div>
			<div class="col-md-4">
				<div class="news-box">
					<h3 class="news-title">常见问题</h3>
					<ul class="news-list">
						<li class="news-item">
							<a href="#" class="link">云主机登录</a>
						</li>
						<li class="news-item">
							<a href="#" class="link">云主机安全</a>
						</li>
						<li class="news-item">
							<a href="#" class="link">云主机环境配置</a>
						</li>
						<li class="news-item">
							<a href="#" class="link">云硬盘挂载与卸载</a>
						</li>
					</ul>
				</div>
			</div>
			<div class="col-md-4">
				<div class="news-box">
					<h3 class="news-title">计费说明</h3>
					<ul class="news-list">
						<li class="news-item">
							<a href="#" class="link">计费方式</a>
						</li>
						<li class="news-item">
							<a href="#" class="link">欠费处理</a>
						</li>
						<li class="news-item">
							<a href="#" class="link">续费方式</a>
						</li>
					</ul>
				</div>
			</div>
		</div>
	</div>
</section> -->

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
