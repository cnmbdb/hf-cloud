<?php /*a:3:{s:59:"/www/wwwroot/cloud.hf.pw2/public/themes/web/zjmf/about.html";i:1758904948;s:67:"/www/wwwroot/cloud.hf.pw2/public/themes/web/zjmf/common/header.html";i:1758904948;s:67:"/www/wwwroot/cloud.hf.pw2/public/themes/web/zjmf/common/footer.html";i:1758904948;}*/ ?>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8" />
  <title>关于我们 - <?php echo $setting['company_name']; ?></title>
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
  <section class="page-hero company space2x">
				<div class="container page-hero-text">
					<div class="row">
						<div class="col-sm-6">
							<h2><?php echo $setting['company_name']; ?></h2>
							<p class="hero-slogan">我们专注于提供云计算、网站建设、服务器租用、服务器托管，网络安全、大数据等互联网解决方案服务。</p>
						</div>
					</div>
				</div>
			</section>

			<section class="pages-tabs">
				<div class="pages-tabsFix">
				    <div class="container">
							<div class="tabs-item active">
							<a href="about.html">关于我们</a>
					    </div>
							<!-- <div class="tabs-item">
							<a href="news.html">新闻中心</a>
					    </div> -->
					    <div class="tabs-item">
							<a href="contact.html">联系我们</a>
					    </div>


				    </div>
				</div>
			</section>
		<section class="about-contact space2x">
    <div class="container">
    	<div class="row">
	    	<div class="col-sm-8">
		    	<h2 class="mb-4">公司简介</h2>
		    	<p><?php echo $setting['company_profile']; ?></p>
			</div>
	    	<div class="col-sm-4">
		    	<div class="about-image"></div>
	    	</div>
    	</div>
    </div>
</section>		
<section class="about-wrap space2x">
    <div class="container" style="height: 100%;display: flex;justify-content: center;align-items: center;">
		<span style="font-size: 30px;font-weight: 400;color: #FFFFFF;">公司全面建设"忠实诚信、高效执行、务实创新和谐共赢"的企业文化</span>
		<!-- <div class="row">
			<div class="col-sm-3">
				<div class="datacenter-item">
					<h2>1000<small>个</small></h2>
					<p>全球CDN节点</p>
				</div>
			</div>
			<div class="col-sm-3">
				<div class="datacenter-item">
					<h2>42<small>个</small></h2>
					<p>覆盖国家及地区</p>
				</div>
			</div>
			<div class="col-sm-3">
				<div class="datacenter-item">
					<h2>99.9<small>%</small></h2>
					<p>数据可靠性</p>
				</div>
			</div>
			<div class="col-sm-3">
				<div class="datacenter-item">
					<h2>3<small>个</small></h2>
					<p>清洗中心</p>
				</div>
			</div>
		</div> -->
    </div>
</section>

<section id="contact-info" class="space2x">
			<div class="container">
				<div class="row">
					<div class="col-sm-10 col-sm-offset-1 text-center">
				<h2 class="section-title">企业文化</h2>
				<div class="section-subtitle">以客户为中心，以结果为导向，坚持化繁为简，追求极致，赢得客户的信赖</div>
			</div>
				</div>
				<div class="citron-like width-819">
	                <ul>


	                    <li class="remove-hover has-hover">
	                        <div class="li-inner-can" style="background:url(<?php echo $setting['web_view']; ?>/assets/img/compass_gaoxiao_1.png) no-repeat bottom right;">
	                            <div class="li-img ">
	                                <img src="<?php echo $setting['web_view']; ?>/assets/img/compass_gaoxiao.png" alt="compass">
	                            </div>
	                            <h1>技术驱动</h1>
	                            <p>始终坚持以客户价值为导向，快速迭代，努力让用户获得体验最简、品质最高的产品与服务</p>
	                        </div>
	                    </li>

	                    <li class="remove-hover has-hover">
	                        <div class="li-inner-can" style="background:url(<?php echo $setting['web_view']; ?>/assets/img/compass_structure_1.png) no-repeat bottom right;">
	                            <div class="li-img li-img-small">
	                                <img src="<?php echo $setting['web_view']; ?>/assets/img/compass_structure.png" alt="compass">
	                            </div>
															<h1>深挖本源</h1>
	                            <p>专注匠心，怀抱纯粹之心，专注价值实现，朝着目标不断迈进，深耕技术发展。</p>
	                        </div>
	                    </li>

	                    <li class="remove-hover has-hover">
	                        <div class="li-inner-can" style="background:url(<?php echo $setting['web_view']; ?>/assets/img/compass_tanxing_1.png) no-repeat bottom right;">
	                            <div class="li-img ">
	                                <img src="<?php echo $setting['web_view']; ?>/assets/img/compass_tanxing.png" alt="compass">
	                            </div>
															<h1>客户第一</h1>
	                            <p>坚持以客户需求为导向,坚持客户利益第一,诚信为本的经营宗旨,为广大客户提供最优质的服务</p>
	                        </div>
	                    </li>

	                    <li class="remove-hover no-border-right has-hover">
	                        <div class="li-inner-can" style="background:url(<?php echo $setting['web_view']; ?>/assets/img/compass_safe_1.png) no-repeat bottom right;">
	                            <div class="li-img li-img-small">
	                                <img src="<?php echo $setting['web_view']; ?>/assets/img/compass_safe.png" alt="compass">
	                            </div>
															<h1>不忘初心</h1>
	                            <p>坚持诚信，以社会责任为己任，赢得社会信赖；打造赋能型组织，为每一位员工提供舞台，赢得员工信赖</p>
	                        </div>
	                    </li>

	                </ul>
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