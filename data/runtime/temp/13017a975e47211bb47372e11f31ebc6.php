<?php /*a:3:{s:60:"/www/wwwroot/cloud.hf.pw2/public/themes/web/zjmf/domain.html";i:1758904948;s:67:"/www/wwwroot/cloud.hf.pw2/public/themes/web/zjmf/common/header.html";i:1758904948;s:67:"/www/wwwroot/cloud.hf.pw2/public/themes/web/zjmf/common/footer.html";i:1758904948;}*/ ?>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8" />
  <title>云服务器 - <?php echo $setting['company_name']; ?></title>
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


<section class="page-hero domain space2x">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-md-7 col-lg-8">
                        <div class="hero-content-wrap text-white text-center position-relative">
                            <h1 class="text-white">域名注册</h1>
                            <p class="lead">注册一个域名，实现更多可能</p>
                            <div class="domain-checker-wrap">
                                <form action="domain-search-result.php" class="domain-transfer-form d-block mx-auto">
                                    <div class="input-group">
                                        <input type="text" name="domain" id="domain" class="form-control" placeholder="请输入您需要搜索的域名">
                                        <div class="input-group-append">
                                            <button class="btn search-btn btn-brand-03 btn-hover d-flex align-items-center" type="submit">
                                                <span class="ti-world mr-2"></span> 查询域名
                                            </button>
                                        </div>
                                    </div>
                                </form>
                                <div class="domain-list-wrap text-center mt-4">
                                    <ul class="list-inline domain-search-list">
                                        <li class="list-inline-item border rounded"><a href="#"><img src="<?php echo $setting['web_view']; ?>/assets/img/domain/com-w.png" alt="com" width="60" class="img-fluid"> <span>¥60</span></a>
                                        </li>
                                        <li class="list-inline-item border rounded"><a href="#"><img src="<?php echo $setting['web_view']; ?>/assets/img/domain/online-w.png" alt="com" width="60" class="img-fluid"> <span>¥28</span></a>
                                        </li>
                                        <li class="list-inline-item border rounded"><a href="#"><img src="<?php echo $setting['web_view']; ?>/assets/img/domain/net-w.png" alt="com" width="60" class="img-fluid"> <span>¥68</span></a>
                                        </li>
                                        <li class="list-inline-item border rounded"><a href="#"><img src="<?php echo $setting['web_view']; ?>/assets/img/domain/org-w.png" alt="com" width="60" class="img-fluid"> <span>¥79</span></a>
                                        </li>
                                        <li class="list-inline-item border rounded"><a href="#"><img src="<?php echo $setting['web_view']; ?>/assets/img/domain/store-w.png" alt="com" width="60" class="img-fluid"> <span>¥26</span></a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
<section class="popular-domain-list space2x bg-gray">
            <div class="container">
                <div class="row justify-content-center">
                   <div class="col-sm-10 text-center">
					<h2 class="section-title">域名推荐</h2>
					<div class="section-subtitle">域名注册/续费/转入最新优惠</div>
				</div>
                </div>
                <div class="row">
                    <div class="col-md-6 col-lg-4">
                        <div class="single-popular-domain position-relative bg-white rounded shadow-sm ">
                            <img src="<?php echo $setting['web_view']; ?>/assets/img/domain/com.png" alt="domain" class="img-fluid">
                            <div class="domain-info-wrap">
                                <span class="position-absolute badge badge-warning">最受欢迎</span>
                                <p>全球注册量第一的域名，域名注册的首选！<br>com是company简称，表示公司企业</p>
                                <ul class="list-inline domain-price-list">
                                    <li class="list-inline-item domain-old-price">
                                        <del>¥100</del>
                                    </li>
                                    <li class="list-inline-item domain-new-price">¥59</li>
                                </ul>
                            </div>
                            <div class="action-btns mt-3">
                                <a href="#" class="btn btn-brand-01 btn-xs mr-2">注册域名</a>
                                <a href="#" class="btn btn-outline-brand-01 btn-xs">转入域名</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6 col-lg-4">
                        <div class="single-popular-domain position-relative bg-white rounded shadow-sm ">
                            <img src="<?php echo $setting['web_view']; ?>/assets/img/domain/online.png" alt="domain" class="img-fluid">
                            <div class="domain-info-wrap">
                                <p>英文自然含义为“在线”，在互联网时代讲究的是在线的生活，在线已成为我们一种生活方式。</p>
                                <ul class="list-inline domain-price-list">
                                    <li class="list-inline-item domain-old-price">
                                        <del>¥79</del>
                                    </li>
                                    <li class="list-inline-item domain-new-price">¥9</li>
                                </ul>
                            </div>
                            <div class="action-btns mt-3">
                                <a href="#" class="btn btn-brand-01 btn-xs mr-2">注册域名</a>
                                <a href="#" class="btn btn-outline-brand-01 btn-xs">转入域名</a>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-6 col-lg-4">
                        <div class="single-popular-domain position-relative bg-white rounded shadow-sm ">
                            <img src="<?php echo $setting['web_view']; ?>/assets/img/domain/club.png" alt="domain" class="img-fluid">
                            <div class="domain-info-wrap">
                                <p>英文直译为“俱乐部”，新造词汇又称可乐部，全球认知度高，适用于各类会所、社团等网站。</p>
                                <ul class="list-inline domain-price-list">
                                    <li class="list-inline-item domain-old-price">
                                        <del>¥53</del>
                                    </li>
                                    <li class="list-inline-item domain-new-price">¥13</li>
                                </ul>
                            </div>
                            <div class="action-btns mt-3">
                                <a href="#" class="btn btn-brand-01 btn-xs mr-2">注册域名</a>
                                <a href="#" class="btn btn-outline-brand-01 btn-xs">转入域名</a>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-6 col-lg-4">
                        <div class="single-popular-domain position-relative bg-white rounded shadow-sm ">
                            <img src="<?php echo $setting['web_view']; ?>/assets/img/domain/net.png" alt="domain" class="img-fluid">
                            <div class="domain-info-wrap">
                                <p>.Net是国际上广泛流行的通用域名，一般用于从事Internet相关的网络服务的机构或公司</p>
                                <ul class="list-inline domain-price-list">
                                    <li class="list-inline-item domain-old-price">
                                        <del>¥79</del>
                                    </li>
                                    <li class="list-inline-item domain-new-price">¥49</li>
                                </ul>
                            </div>
                            <div class="action-btns mt-3">
                                <a href="#" class="btn btn-brand-01 btn-xs mr-2">注册域名</a>
                                <a href="#" class="btn btn-outline-brand-01 btn-xs">转入域名</a>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-6 col-lg-4">
                        <div class="single-popular-domain position-relative bg-white rounded shadow-sm ">
                            <img src="<?php echo $setting['web_view']; ?>/assets/img/domain/pro.png" alt="domain" class="img-fluid">
                            <div class="domain-info-wrap">
                                <p>“pro”是“professional”（专业）的缩写，它面向具有特定从业资质的专业人士和组织注册。</p>
                                <ul class="list-inline domain-price-list">
                                    <li class="list-inline-item domain-old-price">
                                        <del>¥129</del>
                                    </li>
                                    <li class="list-inline-item domain-new-price">¥29</li>
                                </ul>
                            </div>
                            <div class="action-btns mt-3">
                                <a href="#" class="btn btn-brand-01 btn-xs mr-2">注册域名</a>
                                <a href="#" class="btn btn-outline-brand-01 btn-xs">转入域名</a>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-6 col-lg-4">
                        <div class="single-popular-domain position-relative bg-white rounded shadow-sm ">
                            <img src="<?php echo $setting['web_view']; ?>/assets/img/domain/org.png" alt="domain" class="img-fluid">
                            <div class="domain-info-wrap">
                                <p>.org与.com和.net同是目前国际上广泛流行的顶级域名，适用于各类组织机构，包括非盈利团体。</p>
                                <ul class="list-inline domain-price-list">
                                    <li class="list-inline-item domain-old-price">
                                        <del>¥99</del>
                                    </li>
                                    <li class="list-inline-item domain-new-price">¥78</li>
                                </ul>
                            </div>
                            <div class="action-btns mt-3">
                                <a href="#" class="btn btn-brand-01 btn-xs mr-2">注册域名</a>
                                <a href="#" class="btn btn-outline-brand-01 btn-xs">转入域名</a>
                            </div>
                        </div>
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