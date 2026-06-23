<?php /*a:3:{s:64:"/www/wwwroot/cloud.hf.pw2/public/themes/web/ogmiao/activity.html";i:1761635032;s:69:"/www/wwwroot/cloud.hf.pw2/public/themes/web/ogmiao/common/header.html";i:1761636483;s:69:"/www/wwwroot/cloud.hf.pw2/public/themes/web/ogmiao/common/footer.html";i:1744620300;}*/ ?>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
  <meta charset="UTF-8">
  <title>橘喵云 | 活动中心</title>
  <meta name="description" content="橘喵云活动中心为您提供各类优惠活动，包括限时折扣、免费赠送、配置升级、线上线下活动以及站长计划，助您以更低成本体验高品质IDC服务。">
  <meta name="keywords" content="橘喵云,活动中心,限时折扣,优惠活动,免费赠送,配置升级,站长计划,IDC优惠,云服务器特惠">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta name="color-scheme" content="light">
  <meta name="theme-color" content="#f08a5d">
  <meta property="og:type" content="website">
  <meta property="og:url" content="https://www.ogmiao.com/activity.html">
  <meta property="og:title" content="橘喵云 | 活动中心">
  <meta property="og:description" content="参与橘喵云举办的各类优惠活动，享受超值折扣和免费赠送，体验高品质IDC服务。限时特惠，先到先得！">
  <meta property="og:image" content="https://www.ogmiao.com/static/images/og-activity.jpg">
  <meta property="twitter:card" content="summary_large_image">
  <meta property="twitter:url" content="https://www.ogmiao.com/activity.html">
  <meta property="twitter:title" content="橘喵云 | 活动中心">
  <meta property="twitter:description" content="参与橘喵云举办的各类优惠活动，享受超值折扣和免费赠送，体验高品质IDC服务。限时特惠，先到先得！">
  <meta property="twitter:image" content="https://www.ogmiao.com/static/images/og-activity.jpg">
  <link rel="stylesheet" href="<?php echo $setting['web_view']; ?>/assets/css/activity.css">
  <script type="application/ld+json">
  {
    "@context": "https://schema.org",
    "@type": "ItemList",
    "itemListElement": [
      {
        "@type": "Event",
        "name": "限时特惠 - 高性能云服务器7折优惠",
        "description": "4核8G内存 + 100G SSD + 5M带宽，适合中小型网站、应用部署和开发测试环境。",
        "startDate": "2025-01-01T00:00:00+08:00",
        "endDate": "2025-04-30T23:59:59+08:00",
        "location": {
          "@type": "VirtualLocation",
          "url": "https://www.ogmiao.com/cart"
        },
        "offers": {
          "@type": "Offer",
          "price": "279",
          "priceCurrency": "CNY",
          "availability": "https://schema.org/LimitedAvailability",
          "validFrom": "2025-01-01T00:00:00+08:00",
          "validThrough": "2025-04-30T23:59:59+08:00"
        },
        "organizer": {
          "@type": "Organization",
          "name": "橘喵云",
          "url": "https://www.ogmiao.com"
        }
      },
      {
        "@type": "Event",
        "name": "2025云计算技术交流会",
        "description": "探讨云计算最新技术趋势、应用场景及未来发展方向，邀请行业专家分享实践经验。",
        "startDate": "2025-04-15T14:00:00+08:00",
        "endDate": "2025-04-15T18:00:00+08:00",
        "location": {
          "@type": "Place",
          "name": "北京国际会议中心",
          "address": {
            "@type": "PostalAddress",
            "addressLocality": "北京",
            "addressCountry": "CN"
          }
        },
        "offers": {
          "@type": "Offer",
          "price": "0",
          "priceCurrency": "CNY",
          "availability": "https://schema.org/LimitedAvailability",
          "validFrom": "2025-01-01T00:00:00+08:00",
          "validThrough": "2025-04-15T14:00:00+08:00"
        },
        "organizer": {
          "@type": "Organization",
          "name": "橘喵云",
          "url": "https://www.ogmiao.com"
        }
      }
    ]
  }
  </script>
  <style>
/* Additional hover effects for activity cards */
.activity-card {
  position: relative;
  z-index: 1;
  overflow: hidden;
}

.activity-card img {
  transition: transform 0.5s ease;
}

.activity-card:hover img {
  transform: scale(1.05);
}

/* Smooth transitions for countdown containers */
.countdown-container {
  transition: transform 0.3s ease, box-shadow 0.3s ease;
}

.activity-card:hover .countdown-container {
  transform: translateY(-3px);
  box-shadow: 0 8px 20px rgba(0, 0, 0, 0.1);
}

/* Smooth transitions for buttons */
.btn-urgent, 
[style*="background-color"][style*="padding"][style*="text-decoration"][style*="border-radius"] {
  transition: all 0.3s ease !important;
}

/* Improve mobile navigation transitions */
.mobile-nav-item {
  transition: color 0.3s ease, transform 0.3s ease;
}

.mobile-nav-item:hover {
  transform: translateY(-3px);
}

.mobile-nav-item.active {
  transform: translateY(-3px);
}

/* Activity navigation transitions */
.activity-nav a {
  transition: all 0.3s cubic-bezier(0.25, 0.8, 0.25, 1);
}

.activity-nav a:hover {
  transform: translateY(-2px);
  box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
}
</style>
</head>
<body>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=5.0">
<link rel="dns-prefetch" href="https://fonts.googleapis.com">
<link rel="dns-prefetch" href="https://fonts.gstatic.com">
<link rel="preconnect" href="https://fonts.googleapis.com" crossorigin>
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link rel="preload" href="https://cloud.hfz.pw/themes/web/ogmiao/img/1.webp" as="image">
<link rel="icon" href="https://cloud.hfz.pw/themes/web/ogmiao/img/1.ico">
<link rel="apple-touch-icon" href="https://cloud.hfz.pw/themes/web/ogmiao/img/1.ico">
<link rel="shortcut icon" href="https://cloud.hfz.pw/themes/web/ogmiao/img/1.ico">
<link href="<?php echo $setting['web_view']; ?>/fonts/Poppins-Regular-Medium-SemiBold-Bold.css" rel="stylesheet" media="print" onload="this.media='all'">
<noscript>
<link href="<?php echo $setting['web_view']; ?>/fonts/Poppins-Regular-Medium-SemiBold-Bold.css" rel="stylesheet">
</noscript>
<meta charset="UTF-8">
<link rel="robots" href="https://cloud.hfz.pw/themes/web/ogmiao/robots.txt" type="text/plain">
<meta name="author" content="橘喵云">
<meta name="robots" content="index, follow">
<link rel="canonical" href="<?php echo (isset($canonical) && ($canonical !== '')?$canonical:'https://cloud.hfz.pw/'); ?>">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="<?php echo $setting['web_view']; ?>/fonts/Poppins-Regular-Medium-SemiBold-Bold-ExtraBold.css" rel="stylesheet">
<link rel="stylesheet" href="<?php echo $setting['web_view']; ?>/assets/css/header.css">
<?php echo (isset($head) && ($head !== '')?$head:''); ?>
</head>
<body>
<div class="scroll-progress-container">
<div class="scroll-progress-bar"></div>
</div>
<div class="page-transition"></div>
<header class="header-animate">
<div class="container">
  <nav>
      <a href="https://cloud.hfz.pw" class="logo-container nav-item-animate" style="animation-delay: 0.3s; text-decoration: none;">
          <img src="https://hfstore.xyz/wp-content/uploads/2025/10/未命名-份-份.png" alt="橘喵云logo" class="logo-img" width="36" height="36">
          
      </a>
      <div class="nav-container responsive-nav">
          <ul class="nav-links">
              <li class="nav-item-animate" style="animation-delay: 0.4s;"><a href="/" aria-current="page">首页</a></li>
              <li class="nav-item-animate" style="animation-delay: 0.5s;"><a href="https://cloud.hfz.pw/cart" aria-label="查看产品列表">产品服务</a></li>
              <li class="nav-item-animate" style="animation-delay: 0.6s;"><a href="https://cloud.hfz.pw/solutions.html">解决方案</a></li>
              <li class="nav-item-animate" style="animation-delay: 0.7s;"><a href="https://cloud.hfz.pw/bt.html">宝塔面板</a></li>
              <li class="nav-item-animate hide-on-medium" style="animation-delay: 0.8s;"><a href="https://cloud.hfz.pw/partner.html">合作伙伴</a></li>
              <li class="nav-item-animate hide-on-medium" style="animation-delay: 0.9s;"><a href="https://cloud.hfz.pw/activity.html">活动中心</a></li>
              <li class="nav-item-animate hide-on-medium" style="animation-delay: 1.0s;"><a href="https://hfz.pw">关于我们</a></li>
              <li class="nav-item-animate more-menu" style="animation-delay: 0.8s;">
                  <button class="more-menu-btn" aria-haspopup="true" aria-expanded="false">更多</button>
                  <div class="more-menu-dropdown">
                      <a href="https://cloud.hfz.pw/partner.html">合作伙伴</a>
                      <a href="https://cloud.hfz.pw/activity.html">活动中心</a>
                      <a href="https://hfz.pw">关于我们</a>
                  </div>
              </li>
              <?php echo (isset($nav_links) && ($nav_links !== '')?$nav_links:''); ?>
          </ul>
          <div class="nav-buttons nav-item-animate" style="animation-delay: 0.8s;">
  <div class="nav-buttons-container">
      <a href="https://cloud.hfz.pw/clientarea" class="btn-nav btn-login">用户中心</a>
      <a href="https://cloud.hfz.pw/register" class="btn-nav btn-register">注册</a>
  </div>
</div>
      </div>
      <div class="header-right-controls">
  <button class="mobile-menu-btn nav-item-animate" style="animation-delay: 0.9s;" aria-expanded="false" aria-label="打开菜单">☰</button>
</div>
  </nav>
</div>
<script src="<?php echo $setting['web_view']; ?>/assets/js/header.js"></script>
</header>
</body>
</html>

<div class="container" style="padding-top: 30px; padding-bottom: 50px;">
  <h1 style="text-align: center; margin-bottom: 30px; color: #f08a5d;">活动中心</h1>
  <p style="text-align: center; margin-bottom: 40px;">参与橘喵云举办的各类优惠活动，享受超值折扣和免费赠送，体验高品质IDC服务。</p>
  <div class="activity-nav">
    <a href="#all" class="active" data-category="all">全部活动</a>
    <a href="#discount" data-category="discount">限时折扣</a>
    <a href="#free" data-category="free">免费赠送</a>
    <a href="#upgrade" data-category="upgrade">配置升级</a>
    <a href="#events" data-category="events">线上线下活动</a>
    <a href="#webmaster" data-category="webmaster">站长计划</a>
  </div>
  <div id="all">
    <h2 style="text-align: center; margin-bottom: 30px;">🔍 热门活动概览</h2>
    <div id="discount" style="margin-bottom: 50px;" class="activity-section">
      <h3 style="color: #fc5c65; margin-bottom: 20px;">🔥 限时特惠 - 即将结束</h3>
      <div class="activity-cards-container">
        <div class="activity-card" data-category="discount">
          <div style="position: relative;">
            <span style="position: absolute; top: 10px; right: 10px; background-color: #f08a5d; color: white; padding: 5px 10px; border-radius: 20px; font-size: 14px; font-weight: bold;">7折优惠</span>
            <img src="https://cloud.hfz.pw/themes/web/ogmiao/placeholder.svg?height=400&width=600" alt="高性能云服务器" style="width: 100%; height: 180px; object-fit: cover; border-radius: 8px;">
          </div>
          <h4 style="margin-top: 15px; margin-bottom: 10px;">高性能云服务器 SSD-1</h4>
          <p style="color: #636e72; font-size: 14px; margin-bottom: 15px;">4核8G内存 + 100G SSD + 5M带宽，适合中小型网站、应用部署和开发测试环境。</p>
          <div class="countdown-container countdown-urgent">
            <div class="countdown-inner">
              <div class="countdown-decoration countdown-decoration-1"></div>
              <div class="countdown-decoration countdown-decoration-2"></div>
              <div class="countdown-header">
                <div class="countdown-label">限时抢购</div>
                <div class="countdown-title">活动即将结束，先到先得！</div>
              </div>
              <div class="countdown-timer-wrap" data-end-time="2025-04-30T23:59:59">
                <div class="countdown-unit">
                  <span class="countdown-number countdown-days">00</span>
                  <div class="countdown-text">天</div>
                </div>
                <div class="countdown-separator">:</div>
                <div class="countdown-unit">
                  <span class="countdown-number countdown-hours">00</span>
                  <div class="countdown-text">时</div>
                </div>
                <div class="countdown-separator">:</div>
                <div class="countdown-unit">
                  <span class="countdown-number countdown-minutes">00</span>
                  <div class="countdown-text">分</div>
                </div>
                <div class="countdown-separator">:</div>
                <div class="countdown-unit">
                  <span class="countdown-number countdown-seconds">00</span>
                  <div class="countdown-text">秒</div>
                </div>
                <div class="countdown-separator">:</div>
                <div class="countdown-milliseconds-wrap">
                  <span class="countdown-milliseconds countdown-ms">000</span>
                  <div class="countdown-milliseconds-text">毫秒</div>
                </div>
              </div>
              <div class="countdown-message">错过此次活动，再等一年！</div>
            </div>
          </div>
          <div style="margin-bottom: 15px;">
            <span style="text-decoration: line-through; color: #636e72; margin-right: 10px;">¥399/月</span>
            <span class="flash-price">¥279/月</span>
          </div>
          <div style="display: flex; justify-content: space-between; align-items: center;">
            <span style="color: #636e72; font-size: 14px;"><span class="limited-quantity">限量</span>仅剩5台</span>
            <a href="https://ogmiao.com/cart" class="btn-urgent">立即抢购</a>
          </div>
        </div>
        <div class="activity-card" data-category="discount">
          <div style="position: relative;">
            <span style="position: absolute; top: 10px; right: 10px; background-color: #f08a5d; color: white; padding: 5px 10px; border-radius: 20px; font-size: 14px; font-weight: bold;">6.5折</span>
            <img src="https://cloud.hfz.pw/themes/web/ogmiao/placeholder.svg?height=400&width=600" alt="企业级云服务器" style="width: 100%; height: 180px; object-fit: cover; border-radius: 8px;">
          </div>
          <h4 style="margin-top: 15px; margin-bottom: 10px;">企业级云服务器 ECS-2</h4>
          <p style="color: #636e72; font-size: 14px; margin-bottom: 15px;">8核16G内存 + 200G SSD + 10M带宽，适合企业网站、中型应用和数据处理。</p>
          <div class="countdown-container countdown-urgent">
            <div class="countdown-inner">
              <div class="countdown-decoration countdown-decoration-1"></div>
              <div class="countdown-decoration countdown-decoration-2"></div>
              <div class="countdown-header">
                <div class="countdown-label">限时抢购</div>
                <div class="countdown-title">活动即将结束，先到先得！</div>
              </div>
              <div class="countdown-timer-wrap" data-end-time="2025-05-15T23:59:59">
                <div class="countdown-unit">
                  <span class="countdown-number countdown-days">00</span>
                  <div class="countdown-text">天</div>
                </div>
                <div class="countdown-separator">:</div>
                <div class="countdown-unit">
                  <span class="countdown-number countdown-hours">00</span>
                  <div class="countdown-text">时</div>
                </div>
                <div class="countdown-separator">:</div>
                <div class="countdown-unit">
                  <span class="countdown-number countdown-minutes">00</span>
                  <div class="countdown-text">分</div>
                </div>
                <div class="countdown-separator">:</div>
                <div class="countdown-unit">
                  <span class="countdown-number countdown-seconds">00</span>
                  <div class="countdown-text">秒</div>
                </div>
                <div class="countdown-separator">:</div>
                <div class="countdown-milliseconds-wrap">
                  <span class="countdown-milliseconds countdown-ms">000</span>
                  <div class="countdown-milliseconds-text">毫秒</div>
                </div>
              </div>
              <div class="countdown-message">库存告急，即将售罄！</div>
            </div>
          </div>
          <div style="margin-bottom: 15px;">
            <span style="text-decoration: line-through; color: #636e72; margin-right: 10px;">¥699/月</span>
            <span class="flash-price">¥454/月</span>
          </div>
          <div style="display: flex; justify-content: space-between; align-items: center;">
            <span style="color: #636e72; font-size: 14px;"><span class="limited-quantity">限量</span>仅剩3台</span>
            <a href="https://ogmiao.com/cart" class="btn-urgent">立即抢购</a>
          </div>
        </div>
        <div class="activity-card" data-category="discount">
          <div style="position: relative;">
            <span style="position: absolute; top: 10px; right: 10px; background-color: #f08a5d; color: white; padding: 5px 10px; border-radius: 20px; font-size: 14px; font-weight: bold;">8折优惠</span>
            <img src="https://cloud.ogmiao.com/themes/web/ogmiao/placeholder.svg?height=400&width=600" alt="高防云服务器" style="width: 100%; height: 180px; object-fit: cover; border-radius: 8px;">
          </div>
          <h4 style="margin-top: 15px; margin-bottom: 10px;">高防云服务器 SEC-1</h4>
          <p style="color: #636e72; font-size: 14px; margin-bottom: 15px;">4核8G内存 + 100G SSD + 5M带宽 + 20G防护，适合游戏、金融等高防需求场景。</p>
          <div class="countdown-container countdown-urgent">
            <div class="countdown-inner">
              <div class="countdown-decoration countdown-decoration-1"></div>
              <div class="countdown-decoration countdown-decoration-2"></div>
              <div class="countdown-header">
                <div class="countdown-label">限时抢购</div>
                <div class="countdown-title">活动即将结束，先到先得！</div>
              </div>
              <div class="countdown-timer-wrap" data-end-time="2025-05-10T23:59:59">
                <div class="countdown-unit">
                  <span class="countdown-number countdown-days">00</span>
                  <div class="countdown-text">天</div>
                </div>
                <div class="countdown-separator">:</div>
                <div class="countdown-unit">
                  <span class="countdown-number countdown-hours">00</span>
                  <div class="countdown-text">时</div>
                </div>
                <div class="countdown-separator">:</div>
                <div class="countdown-unit">
                  <span class="countdown-number countdown-minutes">00</span>
                  <div class="countdown-text">分</div>
                </div>
                <div class="countdown-separator">:</div>
                <div class="countdown-unit">
                  <span class="countdown-number countdown-seconds">00</span>
                  <div class="countdown-text">秒</div>
                </div>
                <div class="countdown-separator">:</div>
                <div class="countdown-milliseconds-wrap">
                  <span class="countdown-milliseconds countdown-ms">000</span>
                  <div class="countdown-milliseconds-text">毫秒</div>
                </div>
              </div>
              <div class="countdown-message">仅剩最后几台，手慢无！</div>
            </div>
          </div>
          <div style="margin-bottom: 15px;">
            <span style="text-decoration: line-through; color: #636e72; margin-right: 10px;">¥599/月</span>
            <span class="flash-price">¥479/月</span>
          </div>
          <div style="display: flex; justify-content: space-between; align-items: center;">
            <span style="color: #636e72; font-size: 14px;"><span class="limited-quantity">限量</span>最后2台</span>
            <a href="https://ogmiao.com/cart" class="btn-urgent">立即抢购</a>
          </div>
        </div>
      </div>
    </div>
    <div id="free" style="margin-bottom: 50px;" class="activity-section">
      <h3 style="color: #26de81; margin-bottom: 20px;">🎁 免费赠送</h3>
      <div class="activity-cards-container">
        <div class="activity-card" data-category="free">
          <div style="position: relative;">
            <span style="position: absolute; top: 10px; right: 10px; background-color: #26de81; color: white; padding: 5px 10px; border-radius: 20px; font-size: 14px; font-weight: bold;">免费赠送</span>
            <img src="https://cloud.ogmiao.com/themes/web/ogmiao/placeholder.svg?height=400&width=600" alt="免费赠送服务器时长" style="width: 100%; height: 180px; object-fit: cover; border-radius: 8px;">
          </div>
          <h4 style="margin-top: 15px; margin-bottom: 10px;">新购云服务器赠送2个月</h4>
          <p style="color: #636e72; font-size: 14px; margin-bottom: 15px;">新购任意规格云服务器，一次性付费12个月，即可获赠2个月使用时长，相当于享受10个月的价格使用12个月。</p>
          <div class="countdown-container countdown-free">
            <div class="countdown-inner">
              <div class="countdown-decoration countdown-decoration-1" style="background: rgba(38, 222, 129, 0.1);"></div>
              <div class="countdown-decoration countdown-decoration-2" style="background: rgba(38, 222, 129, 0.05);"></div>
              <div class="countdown-header">
                <div class="countdown-label">限时活动</div>
                <div class="countdown-title">活动倒计时，把握机会！</div>
              </div>
              <div class="countdown-timer-wrap" data-end-time="2025-04-30T23:59:59">
                <div class="countdown-unit">
                  <span class="countdown-number countdown-days">00</span>
                  <div class="countdown-text">天</div>
                </div>
                <div class="countdown-separator">:</div>
                <div class="countdown-unit">
                  <span class="countdown-number countdown-hours">00</span>
                  <div class="countdown-text">时</div>
                </div>
                <div class="countdown-separator">:</div>
                <div class="countdown-unit">
                  <span class="countdown-number countdown-minutes">00</span>
                  <div class="countdown-text">分</div>
                </div>
                <div class="countdown-separator">:</div>
                <div class="countdown-unit">
                  <span class="countdown-number countdown-seconds">00</span>
                  <div class="countdown-text">秒</div>
                </div>
                <div class="countdown-separator">:</div>
                <div class="countdown-milliseconds-wrap">
                  <span class="countdown-milliseconds countdown-ms">000</span>
                  <div class="countdown-milliseconds-text">毫秒</div>
                </div>
              </div>
              <div class="countdown-message">免费赠送，先到先得！</div>
            </div>
          </div>
          <div style="display: flex; justify-content: space-between; align-items: center; background-color: rgba(38, 222, 129, 0.1); padding: 10px; border-radius: 8px; margin-bottom: 15px;">
            <h5 style="color: #26de81; margin-top: 0; margin-bottom: 5px; font-size: 14px;">获取条件：</h5>
            <p style="color: #636e72; font-size: 14px; margin: 0;">新用户首次购买任意规格云服务器，选择一次性付费12个月及以上，系统自动赠送2个月使用时长。</p>
          </div>
          <div style="display: flex; justify-content: space-between; align-items: center;">
            <span style="color: #636e72; font-size: 14px;">活动截止：2025-04-30</span>
            <a href="https://ogmiao.com/cart" style="background-color: #26de81; color: white; padding: 8px 15px; text-decoration: none; border-radius: 20px; font-weight: bold;">立即参与</a>
          </div>
        </div>
        <div class="activity-card" data-category="free">
          <div style="position: relative;">
            <span style="position: absolute; top: 10px; right: 10px; background-color: #26de81; color: white; padding: 5px 10px; border-radius: 20px; font-size: 14px; font-weight: bold;">免费赠送</span>
            <img src="https://cloud.ogmiao.com/themes/web/ogmiao/placeholder.svg?height=400&width=600" alt="免费赠送域名" style="width: 100%; height: 180px; object-fit: cover; border-radius: 8px;">
          </div>
          <h4 style="margin-top: 15px; margin-bottom: 10px;">新购高配云服务器送域名</h4>
          <p style="color: #636e72; font-size: 14px; margin-bottom: 15px;">新购8核16G及以上规格云服务器，即可免费获赠一个.com域名（价值68元），有效期1年。</p>
          <div class="countdown-container countdown-free">
            <div class="countdown-inner">
              <div class="countdown-decoration countdown-decoration-1" style="background: rgba(38, 222, 129, 0.1);"></div>
              <div class="countdown-decoration countdown-decoration-2" style="background: rgba(38, 222, 129, 0.05);"></div>
              <div class="countdown-header">
                <div class="countdown-label">限时活动</div>
                <div class="countdown-title">活动倒计时，把握机会！</div>
              </div>
              <div class="countdown-timer-wrap" data-end-time="2025-04-15T23:59:59">
                <div class="countdown-unit">
                  <span class="countdown-number countdown-days">00</span>
                  <div class="countdown-text">天</div>
                </div>
                <div class="countdown-separator">:</div>
                <div class="countdown-unit">
                  <span class="countdown-number countdown-hours">00</span>
                  <div class="countdown-text">时</div>
                </div>
                <div class="countdown-separator">:</div>
                <div class="countdown-unit">
                  <span class="countdown-number countdown-minutes">00</span>
                  <div class="countdown-text">分</div>
                </div>
                <div class="countdown-separator">:</div>
                <div class="countdown-unit">
                  <span class="countdown-number countdown-seconds">00</span>
                  <div class="countdown-text">秒</div>
                </div>
                <div class="countdown-separator">:</div>
                <div class="countdown-milliseconds-wrap">
                  <span class="countdown-milliseconds countdown-ms">000</span>
                  <div class="countdown-milliseconds-text">毫秒</div>
                </div>
              </div>
              <div class="countdown-message">免费域名，数量有限！</div>
            </div>
          </div>
          <div style="background-color: rgba(38, 222, 129, 0.1); padding: 10px; border-radius: 8px; margin-bottom: 15px;">
            <h5 style="color: #26de81; margin-top: 0; margin-bottom: 5px; font-size: 14px;">获取条件：</h5>
            <p style="color: #636e72; font-size: 14px; margin: 0;">新购8核16G及以上规格云服务器，付费周期为1年及以上，下单后联系客服申请免费域名。</p>
          </div>
          <div style="display: flex; justify-content: space-between; align-items: center;">
            <span style="color: #636e72; font-size: 14px;">活动截止：2025-04-15</span>
            <a href="https://ogmiao.com/cart" style="background-color: #26de81; color: white; padding: 8px 15px; text-decoration: none; border-radius: 20px; font-weight: bold;">立即参与</a>
          </div>
        </div>
        <div class="activity-card" data-category="free">
          <div style="position: relative;">
            <span style="position: absolute; top: 10px; right: 10px; background-color: #26de81; color: white; padding: 5px 10px; border-radius: 20px; font-size: 14px; font-weight: bold;">免费赠送</span>
            <img src="https://cloud.ogmiao.com/themes/web/ogmiao/placeholder.svg?height=400&width=600" alt="免费赠送SSL证书" style="width: 100%; height: 180px; object-fit: cover; border-radius: 8px;">
          </div>
          <h4 style="margin-top: 15px; margin-bottom: 10px;">购买云服务器送SSL证书</h4>
          <p style="color: #636e72; font-size: 14px; margin-bottom: 15px;">购买任意云服务器产品，即可免费获赠一个SSL证书（价值199元），有效期1年，保障您网站的安全。</p>
          <div class="countdown-container countdown-free">
            <div class="countdown-inner">
              <div class="countdown-decoration countdown-decoration-1" style="background: rgba(38, 222, 129, 0.1);"></div>
              <div class="countdown-decoration countdown-decoration-2" style="background: rgba(38, 222, 129, 0.05);"></div>
              <div class="countdown-header">
                <div class="countdown-label">限时活动</div>
                <div class="countdown-title">活动倒计时，把握机会！</div>
              </div>
              <div class="countdown-timer-wrap" data-end-time="2025-05-20T23:59:59">
                <div class="countdown-unit">
                  <span class="countdown-number countdown-days">00</span>
                  <div class="countdown-text">天</div>
                </div>
                <div class="countdown-separator">:</div>
                <div class="countdown-unit">
                  <span class="countdown-number countdown-hours">00</span>
                  <div class="countdown-text">时</div>
                </div>
                <div class="countdown-separator">:</div>
                <div class="countdown-unit">
                  <span class="countdown-number countdown-minutes">00</span>
                  <div class="countdown-text">分</div>
                </div>
                <div class="countdown-separator">:</div>
                <div class="countdown-unit">
                  <span class="countdown-number countdown-seconds">00</span>
                  <div class="countdown-text">秒</div>
                </div>
                <div class="countdown-separator">:</div>
                <div class="countdown-milliseconds-wrap">
                  <span class="countdown-milliseconds countdown-ms">000</span>
                  <div class="countdown-milliseconds-text">毫秒</div>
                </div>
              </div>
              <div class="countdown-message">免费SSL证书，提升网站安全！</div>
            </div>
          </div>
          <div style="background-color: rgba(38, 222, 129, 0.1); padding: 10px; border-radius: 8px; margin-bottom: 15px;">
            <h5 style="color: #26de81; margin-top: 0; margin-bottom: 5px; font-size: 14px;">获取条件：</h5>
            <p style="color: #636e72; font-size: 14px; margin: 0;"> 购买任意规格云服务器，付费周期为1年及以上，下单后联系客服申请免费SSL证书。</p>
          </div>
          <div style="display: flex; justify-content: space-between; align-items: center;">
            <span style="color: #636e72; font-size: 14px;">活动截止：2025-05-20</span>
            <a href="https://ogmiao.com/cart" style="background-color: #26de81; color: white; padding: 8px 15px; text-decoration: none; border-radius: 20px; font-weight: bold;">立即参与</a>
          </div>
        </div>
      </div>
    </div>
    <div id="upgrade" style="margin-bottom: 50px;" class="activity-section">
      <h3 style="color: #fed330; margin-bottom: 20px;">⚡ 配置升级</h3>
      <div class="activity-cards-container">
        <div class="activity-card" data-category="upgrade">
          <img src="https://cloud.ogmiao.com/themes/web/ogmiao/placeholder.svg?height=400&width=600" alt="内存免费升级" style="width: 100%; height: 180px; object-fit: cover; border-radius: 8px;">
          <h4 style="margin-top: 15px; margin-bottom: 10px;">云服务器内存免费升级</h4>
          <p style="color: #636e72; font-size: 14px; margin-bottom: 15px;">购买指定规格云服务器，享受内存免费升级优惠，性能提升50%，价格不变。</p>
          <div class="countdown-container countdown-upgrade">
            <div class="countdown-inner">
              <div class="countdown-decoration countdown-decoration-1" style="background: rgba(254, 211, 48, 0.1);"></div>
              <div class="countdown-decoration countdown-decoration-2" style="background: rgba(254, 211, 48, 0.05);"></div>
              <div class="countdown-header">
                <div class="countdown-label">限时升级</div>
                <div class="countdown-title">升级倒计时，把握机会！</div>
              </div>
              <div class="countdown-timer-wrap" data-end-time="2025-04-30T23:59:59">
                <div class="countdown-unit">
                  <span class="countdown-number countdown-days">00</span>
                  <div class="countdown-text">天</div>
                </div>
                <div class="countdown-separator">:</div>
                <div class="countdown-unit">
                  <span class="countdown-number countdown-hours">00</span>
                  <div class="countdown-text">时</div>
                </div>
                <div class="countdown-separator">:</div>
                <div class="countdown-unit">
                  <span class="countdown-number countdown-minutes">00</span>
                  <div class="countdown-text">分</div>
                </div>
                <div class="countdown-separator">:</div>
                <div class="countdown-unit">
                  <span class="countdown-number countdown-seconds">00</span>
                  <div class="countdown-text">秒</div>
                </div>
                <div class="countdown-separator">:</div>
                <div class="countdown-milliseconds-wrap">
                  <span class="countdown-milliseconds countdown-ms">000</span>
                  <div class="countdown-milliseconds-text">毫秒</div>
                </div>
              </div>
              <div class="countdown-message">免费升级，性能提升50%！</div>
            </div>
          </div>
          <div style="display: flex; justify-content: space-between; align-items: center; background-color: rgba(254, 211, 48, 0.1); padding: 10px; border-radius: 8px; margin-bottom: 15px;">
            <div style="text-align: center;">
              <div style="color: #636e72; font-size: 12px; margin-bottom: 5px;">升级前</div>
              <div style="font-weight: bold;">8GB内存</div>
            </div>
            <div style="font-size: 20px; color: #fed330;">→</div>
            <div style="text-align: center;">
              <div style="color: #636e72; font-size: 12px; margin-bottom: 5px;">升级后</div>
              <div style="font-weight: bold;">12GB内存</div>
            </div>
          </div>
          <div style="display: flex; justify-content: space-between; align-items: center;">
            <span style="color: #636e72; font-size: 14px;">活动截止：2025-04-30</span>
            <a href="https://ogmiao.com/cart" style="background-color: #fed330; color: white; padding: 8px 15px; text-decoration: none; border-radius: 20px; font-weight: bold;">立即升级</a>
          </div>
        </div>
        <div class="activity-card" data-category="upgrade">
          <img src="https://cloud.ogmiao.com/themes/web/ogmiao/placeholder.svg?height=400&width=600" alt="带宽免费升级" style="width: 100%; height: 180px; object-fit: cover; border-radius: 8px;">
          <h4 style="margin-top: 15px; margin-bottom: 10px;">云服务器带宽免费升级</h4>
          <p style="color: #636e72; font-size: 14px; margin-bottom: 15px;">购买指定规格云服务器，享受带宽免费升级优惠，网络速度提升一倍，价格不变。</p>
          <div class="countdown-container countdown-upgrade">
            <div class="countdown-inner">
              <div class="countdown-decoration countdown-decoration-1" style="background: rgba(254, 211, 48, 0.1);"></div>
              <div class="countdown-decoration countdown-decoration-2" style="background: rgba(254, 211, 48, 0.05);"></div>
              <div class="countdown-header">
                <div class="countdown-label">限时升级</div>
                <div class="countdown-title">升级倒计时，把握机会！</div>
              </div>
              <div class="countdown-timer-wrap" data-end-time="2025-05-15T23:59:59">
                <div class="countdown-unit">
                  <span class="countdown-number countdown-days">00</span>
                  <div class="countdown-text">天</div>
                </div>
                <div class="countdown-separator">:</div>
                <div class="countdown-unit">
                  <span class="countdown-number countdown-hours">00</span>
                  <div class="countdown-text">时</div>
                </div>
                <div class="countdown-separator">:</div>
                <div class="countdown-unit">
                  <span class="countdown-number countdown-minutes">00</span>
                  <div class="countdown-text">分</div>
                </div>
                <div class="countdown-separator">:</div>
                <div class="countdown-unit">
                  <span class="countdown-number countdown-seconds">00</span>
                  <div class="countdown-text">秒</div>
                </div>
                <div class="countdown-separator">:</div>
                <div class="countdown-milliseconds-wrap">
                  <span class="countdown-milliseconds countdown-ms">000</span>
                  <div class="countdown-milliseconds-text">毫秒</div>
                </div>
              </div>
              <div class="countdown-message">免费升级，网速提升一倍！</div>
            </div>
          </div>
          <div style="display: flex; justify-content: space-between; align-items: center; background-color: rgba(254, 211, 48, 0.1); padding: 10px; border-radius: 8px; margin-bottom: 15px;">
            <div style="text-align: center;">
              <div style="color: #636e72; font-size: 12px; margin-bottom: 5px;">升级前</div>
              <div style="font-weight: bold;">5Mbps带宽</div>
            </div>
            <div style="font-size: 20px; color: #fed330;">→</div>
            <div style="text-align: center;">
              <div style="color: #636e72; font-size: 12px; margin-bottom: 5px;">升级后</div>
              <div style="font-weight: bold;">10Mbps带宽</div>
            </div>
          </div>
          <div style="display: flex; justify-content: space-between; align-items: center;">
            <span style="color: #636e72; font-size: 14px;">活动截止：2025-05-15</span>
            <a href="https://ogmiao.com/cart" style="background-color: #fed330; color: white; padding: 8px 15px; text-decoration: none; border-radius: 20px; font-weight: bold;">立即升级</a>
          </div>
        </div>
        <div class="activity-card" data-category="upgrade">
          <img src="https://cloud.ogmiao.com/themes/web/ogmiao/placeholder.svg?height=400&width=600" alt="硬盘免费升级" style="width: 100%; height: 180px; object-fit: cover; border-radius: 8px;">
          <h4 style="margin-top: 15px; margin-bottom: 10px;">云服务器硬盘免费升级</h4>
          <p style="color: #636e72; font-size: 14px; margin-bottom: 15px;">购买指定规格云服务器，享受硬盘免费升级优惠，存储空间翻倍，价格不变。</p>
          <div class="countdown-container countdown-upgrade">
            <div class="countdown-inner">
              <div class="countdown-decoration countdown-decoration-1" style="background: rgba(254, 211, 48, 0.1);"></div>
              <div class="countdown-decoration countdown-decoration-2" style="background: rgba(254, 211, 48, 0.05);"></div>
              <div class="countdown-header">
                <div class="countdown-label">限时升级</div>
                <div class="countdown-title">升级倒计时，把握机会！</div>
              </div>
              <div class="countdown-timer-wrap" data-end-time="2025-05-10T23:59:59">
                <div class="countdown-unit">
                  <span class="countdown-number countdown-days">00</span>
                  <div class="countdown-text">天</div>
                </div>
                <div class="countdown-separator">:</div>
                <div class="countdown-unit">
                  <span class="countdown-number countdown-hours">00</span>
                  <div class="countdown-text">时</div>
                </div>
                <div class="countdown-separator">:</div>
                <div class="countdown-unit">
                  <span class="countdown-number countdown-minutes">00</span>
                  <div class="countdown-text">分</div>
                </div>
                <div class="countdown-separator">:</div>
                <div class="countdown-unit">
                  <span class="countdown-number countdown-seconds">00</span>
                  <div class="countdown-text">秒</div>
                </div>
                <div class="countdown-separator">:</div>
                <div class="countdown-milliseconds-wrap">
                  <span class="countdown-milliseconds countdown-ms">000</span>
                  <div class="countdown-milliseconds-text">毫秒</div>
                </div>
              </div>
              <div class="countdown-message">免费升级，存储空间翻倍！</div>
            </div>
          </div>
          <div style="display: flex; justify-content: space-between; align-items: center; background-color: rgba(254, 211, 48, 0.1); padding: 10px; border-radius: 8px; margin-bottom: 15px;">
            <div style="text-align: center;">
              <div style="color: #636e72; font-size: 12px; margin-bottom: 5px;">升级前</div>
              <div style="font-weight: bold;">100GB SSD</div>
            </div>
            <div style="font-size: 20px; color: #fed330;">→</div>
            <div style="text-align: center;">
              <div style="color: #636e72; font-size: 12px; margin-bottom: 5px;">升级后</div>
              <div style="font-weight: bold;">200GB SSD</div>
            </div>
          </div>
          <div style="display: flex; justify-content: space-between; align-items: center;">
            <span style="color: #636e72; font-size: 14px;">活动截止：2025-05-10</span>
            <a href="https://ogmiao.com/cart" style="background-color: #fed330; color: white; padding: 8px 15px; text-decoration: none; border-radius: 20px; font-weight: bold;">立即升级</a>
          </div>
        </div>
      </div>
    </div>
    <div id="events" style="margin-bottom: 50px;" class="activity-section">
      <h3 style="color: #f08a5d; margin-bottom: 20px;">📅 线上线下活动</h3>
      <div class="activity-cards-container">
        <div class="activity-card" data-category="events">
          <div style="position: relative;">
            <span style="position: absolute; top: 10px; right: 10px; background-color: #f08a5d; color: white; padding: 5px 10px; border-radius: 20px; font-size: 14px; font-weight: bold;">线下活动</span>
            <img src="https://cloud.ogmiao.com/themes/web/ogmiao/placeholder.svg?height=400&width=600" alt="云计算技术交流会" style="width: 100%; height: 180px; object-fit: cover; border-radius: 8px;">
          </div>
          <h4 style="margin-top: 15px; margin-bottom: 10px;">2025云计算技术交流会</h4>
          <div style="display: flex; gap: 15px; margin-bottom: 10px;">
            <span style="color: #636e72; font-size: 14px;">📅 2025-04-15</span>
            <span style="color: #636e72; font-size: 14px;">📍 北京国际会议中心</span>
          </div>
          <p style="color: #636e72; font-size: 14px; margin-bottom: 15px;">探讨云计算最新技术趋势、应用场景及未来发展方向，邀请行业专家分享实践经验。</p>
          <div class="countdown-container countdown-normal">
            <div class="countdown-inner">
              <div class="countdown-decoration countdown-decoration-1" style="background: rgba(240, 138, 93, 0.1);"></div>
              <div class="countdown-decoration countdown-decoration-2" style="background: rgba(240, 138, 93, 0.05);"></div>
              <div class="countdown-header">
                <div class="countdown-label">即将开始</div>
                <div class="countdown-title">活动开始倒计时</div>
              </div>
              <div class="countdown-timer-wrap" data-end-time="2025-04-15T14:00:00">
                <div class="countdown-unit">
                  <span class="countdown-number countdown-days">00</span>
                  <div class="countdown-text">天</div>
                </div>
                <div class="countdown-separator">:</div>
                <div class="countdown-unit">
                  <span class="countdown-number countdown-hours">00</span>
                  <div class="countdown-text">时</div>
                </div>
                <div class="countdown-separator">:</div>
                <div class="countdown-unit">
                  <span class="countdown-number countdown-minutes">00</span>
                  <div class="countdown-text">分</div>
                </div>
                <div class="countdown-separator">:</div>
                <div class="countdown-unit">
                  <span class="countdown-number countdown-seconds">00</span>
                  <div class="countdown-text">秒</div>
                </div>
                <div class="countdown-separator">:</div>
                <div class="countdown-milliseconds-wrap">
                  <span class="countdown-milliseconds countdown-ms">000</span>
                  <div class="countdown-milliseconds-text">毫秒</div>
                </div>
              </div>
              <div class="countdown-message">名额有限，抓紧报名！</div>
            </div>
          </div>
          <div style="display: flex; justify-content: space-between; align-items: center;">
            <span style="background-color: rgba(38, 222, 129, 0.1); color: #26de81; padding: 5px 10px; border-radius: 20px; font-size: 14px;">报名中</span>
            <a href="https://cloud.ogmiao.com/themes/web/ogmiao/events/cloud-meetup.html" style="background-color: #f08a5d; color: white; padding: 8px 15px; text-decoration: none; border-radius: 20px; font-weight: bold;">立即报名</a>
          </div>
        </div>
        <div class="activity-card" data-category="events">
          <div style="position: relative;">
            <span style="position: absolute; top: 10px; right: 10px; background-color: #26de81; color: white; padding: 5px 10px; border-radius: 20px; font-size: 14px; font-weight: bold;">线上活动</span>
            <img src="https://cloud.ogmiao.com/themes/web/ogmiao/placeholder.svg?height=400&width=600" alt="云服务器性能优化直播" style="width: 100%; height: 180px; object-fit: cover; border-radius: 8px;">
          </div>
          <h4 style="margin-top: 15px; margin-bottom: 10px;">云服务器性能优化技术直播</h4>
          <div style="display: flex; gap: 15px; margin-bottom: 10px;">
            <span style="color: #636e72; font-size: 14px;">📅 2025-04-18</span>
            <span style="color: #636e72; font-size: 14px;">📺 橘喵云官方B站</span>
          </div>
          <p style="color: #636e72; font-size: 14px; margin-bottom: 15px;">橘喵云技术专家在线分享云服务器性能优化技巧，包括系统调优、网络优化、数据库优化等内容。</p>
          <div class="countdown-container countdown-free">
            <div class="countdown-inner">
              <div class="countdown-decoration countdown-decoration-1" style="background: rgba(38, 222, 129, 0.1);"></div>
              <div class="countdown-decoration countdown-decoration-2" style="background: rgba(38, 222, 129, 0.05);"></div>
              <div class="countdown-header">
                <div class="countdown-label">即将开始</div>
                <div class="countdown-title">活动开始倒计时</div>
              </div>
              <div class="countdown-timer-wrap" data-end-time="2025-04-18T19:30:00">
                <div class="countdown-unit">
                  <span class="countdown-number countdown-days">00</span>
                  <div class="countdown-text">天</div>
                </div>
                <div class="countdown-separator">:</div>
                <div class="countdown-unit">
                  <span class="countdown-number countdown-hours">00</span>
                  <div class="countdown-text">时</div>
                </div>
                <div class="countdown-separator">:</div>
                <div class="countdown-unit">
                  <span class="countdown-number countdown-minutes">00</span>
                  <div class="countdown-text">分</div>
                </div>
                <div class="countdown-separator">:</div>
                <div class="countdown-unit">
                  <span class="countdown-number countdown-seconds">00</span>
                  <div class="countdown-text">秒</div>
                </div>
                <div class="countdown-separator">:</div>
                <div class="countdown-milliseconds-wrap">
                  <span class="countdown-milliseconds countdown-ms">000</span>
                  <div class="countdown-milliseconds-text">毫秒</div>
                </div>
              </div>
              <div class="countdown-message">免费技术直播，不容错过！</div>
            </div>
          </div>
          <div style="display: flex; justify-content: space-between; align-items: center;">
            <span style="background-color: rgba(254, 211, 48, 0.1); color: #fed330; padding: 5px 10px; border-radius: 20px; font-size: 14px;">即将开始</span>
            <a href="https://cloud.ogmiao.com/themes/web/ogmiao/events/live-optimization.html" style="background-color: #26de81; color: white; padding: 8px 15px; text-decoration: none; border-radius: 20px; font-weight: bold;">预约提醒</a>
          </div>
        </div>
        <div class="activity-card" data-category="events">
          <div style="position: relative;">
            <span style="position: absolute; top: 10px; right: 10px; background-color: #f08a5d; color: white; padding: 5px 10px; border-radius: 20px; font-size: 14px; font-weight: bold;">线下活动</span>
            <img src="https://cloud.ogmiao.com/themes/web/ogmiao/placeholder.svg?height=400&width=600" alt="IDC产业峰会" style="width: 100%; height: 180px; object-fit: cover; border-radius: 8px;">
          </div>
          <h4 style="margin-top: 15px; margin-bottom: 10px;">2025 IDC产业峰会</h4>
          <div style="display: flex; gap: 15px; margin-bottom: 10px;">
            <span style="color: #636e72; font-size: 14px;">📅 2025-05-20</span>
            <span style="color: #636e72; font-size: 14px;">📍 上海国际会展中心</span>
          </div>
          <p style="color: #636e72; font-size: 14px; margin-bottom: 15px;">聚焦IDC产业发展趋势，探讨数据中心建设、运营和创新，与行业领袖共同探索IDC未来发展方向。</p>
          <div class="countdown-container countdown-normal">
            <div class="countdown-inner">
              <div class="countdown-decoration countdown-decoration-1" style="background: rgba(240, 138, 93, 0.1);"></div>
              <div class="countdown-decoration countdown-decoration-2" style="background: rgba(240, 138, 93, 0.05);"></div>
              <div class="countdown-header">
                <div class="countdown-label">即将开始</div>
                <div class="countdown-title">活动开始倒计时</div>
              </div>
              <div class="countdown-timer-wrap" data-end-time="2025-05-20T09:00:00">
                <div class="countdown-unit">
                  <span class="countdown-number countdown-days">00</span>
                  <div class="countdown-text">天</div>
                </div>
                <div class="countdown-separator">:</div>
                <div class="countdown-unit">
                  <span class="countdown-number countdown-hours">00</span>
                  <div class="countdown-text">时</div>
                </div>
                <div class="countdown-separator">:</div>
                <div class="countdown-unit">
                  <span class="countdown-number countdown-minutes">00</span>
                  <div class="countdown-text">分</div>
                </div>
                <div class="countdown-separator">:</div>
                <div class="countdown-unit">
                  <span class="countdown-number countdown-seconds">00</span>
                  <div class="countdown-text">秒</div>
                </div>
                <div class="countdown-separator">:</div>
                <div class="countdown-milliseconds-wrap">
                  <span class="countdown-milliseconds countdown-ms">000</span>
                  <div class="countdown-milliseconds-text">毫秒</div>
                </div>
              </div>
              <div class="countdown-message">行业盛会，名额有限！</div>
            </div>
          </div>
          <div style="display: flex; justify-content: space-between; align-items: center;">
            <span style="background-color: rgba(38, 222, 129, 0.1); color: #26de81; padding: 5px 10px; border-radius: 20px; font-size: 14px;">报名中</span>
            <a href="https://cloud.ogmiao.com/themes/web/ogmiao/events/idc-summit.html" style="background-color: #f08a5d; color: white; padding: 8px 15px; text-decoration: none; border-radius: 20px; font-weight: bold;">立即报名</a>
          </div>
        </div>
      </div>
    </div>
    <div id="webmaster" style="margin-bottom: 50px;" class="activity-section">
      <h3 style="color: #ffbe76; margin-bottom: 20px;">🚀 站长计划</h3>
      <div class="activity-cards-container">
        <div class="activity-card" data-category="webmaster">
          <div style="position: relative;">
            <span style="position: absolute; top: 10px; right: 10px; background-color: #ffbe76; color: white; padding: 5px 10px; border-radius: 20px; font-size: 14px; font-weight: bold;">站长专享</span>
            <img src="https://cloud.ogmiao.com/themes/web/ogmiao/placeholder.svg?height=400&width=600" alt="站长专享服务器" style="width: 100%; height: 180px; object-fit: cover; border-radius: 8px;">
          </div>
          <h4 style="margin-top: 15px; margin-bottom: 10px;">站长专享云服务器套餐</h4>
          <p style="color: #636e72; font-size: 14px; margin-bottom: 15px;">为站长量身定制的云服务器套餐，高性能配置，超低价格，助力站长轻松建站和运营。</p>
          <div class="countdown-container countdown-webmaster">
            <div class="countdown-inner">
              <div class="countdown-decoration countdown-decoration-1" style="background: rgba(255, 190, 118, 0.1);"></div>
              <div class="countdown-decoration countdown-decoration-2" style="background: rgba(255, 190, 118, 0.05);"></div>
              <div class="countdown-header">
                <div class="countdown-label">限时专享</div>
                <div class="countdown-title">专属优惠倒计时</div>
              </div>
              <div class="countdown-timer-wrap" data-end-time="2025-06-30T23:59:59">
                <div class="countdown-unit">
                  <span class="countdown-number countdown-days">00</span>
                  <div class="countdown-text">天</div>
                </div>
                <div class="countdown-separator">:</div>
                <div class="countdown-unit">
                  <span class="countdown-number countdown-hours">00</span>
                  <div class="countdown-text">时</div>
                </div>
                <div class="countdown-separator">:</div>
                <div class="countdown-unit">
                  <span class="countdown-number countdown-minutes">00</span>
                  <div class="countdown-text">分</div>
                </div>
                <div class="countdown-separator">:</div>
                <div class="countdown-unit">
                  <span class="countdown-number countdown-seconds">00</span>
                  <div class="countdown-text">秒</div>
                </div>
                <div class="countdown-separator">:</div>
                <div class="countdown-milliseconds-wrap">
                  <span class="countdown-milliseconds countdown-ms">000</span>
                  <div class="countdown-milliseconds-text">毫秒</div>
                </div>
              </div>
              <div class="countdown-message">站长专享，超值优惠！</div>
            </div>
          </div>
          <div style="margin-bottom: 15px;">
            <div style="display: flex; align-items: flex-start; margin-bottom: 8px;">
              <span style="color: #ffbe76; margin-right: 8px; font-weight: bold;">✓</span>
              <span style="color: #636e72; font-size: 14px;">2核4G内存 + 80G SSD + 5M带宽，仅需99元/月</span>
            </div>
            <div style="display: flex; align-items: flex-start; margin-bottom: 8px;">
              <span style="color: #ffbe76; margin-right: 8px; font-weight: bold;">✓</span>
              <span style="color: #636e72; font-size: 14px;">免费提供网站备案服务</span>
            </div>
            <div style="display: flex; align-items: flex-start; margin-bottom: 8px;">
              <span style="color: #ffbe76; margin-right: 8px; font-weight: bold;">✓</span>
              <span style="color: #636e72; font-size: 14px;">赠送3个月DDoS防护服务</span>
            </div>
            <div style="display: flex; align-items: flex-start;">
              <span style="color: #ffbe76; margin-right: 8px; font-weight: bold;">✓</span>
              <span style="color: #636e72; font-size: 14px;">7*24小时技术支持</span>
            </div>
          </div>
          <div style="display: flex; justify-content: space-between; align-items: center;">
            <span style="color: #636e72; font-size: 14px;">需提供站长身份证明</span>
            <a href="https://cloud.ogmiao.com/themes/web/ogmiao/webmaster/server.html" style="background-color: #ffbe76; color: white; padding: 8px 15px; text-decoration: none; border-radius: 20px; font-weight: bold;">立即申请</a>
          </div>
        </div>
        <div class="activity-card" data-category="webmaster">
          <div style="position: relative;">
            <span style="position: absolute; top: 10px; right: 10px; background-color: #ffbe76; color: white; padding: 5px 10px; border-radius: 20px; font-size: 14px; font-weight: bold;">站长专享</span>
            <img src="https://cloud.ogmiao.com/themes/web/ogmiao/placeholder.svg?height=400&width=600" alt="站长建站套餐" style="width: 100%; height: 180px; object-fit: cover; border-radius: 8px;">
          </div>
          <h4 style="margin-top: 15px; margin-bottom: 10px;">站长一键建站套餐</h4>
          <p style="color: #636e72; font-size: 14px; margin-bottom: 15px;">包含云服务器、域名、SSL证书、建站系统，一站式解决站长建站需求，快速上线网站。</p>
          <div class="countdown-container countdown-webmaster">
            <div class="countdown-inner">
              <div class="countdown-decoration countdown-decoration-1" style="background: rgba(255, 190, 118, 0.1);"></div>
              <div class="countdown-decoration countdown-decoration-2" style="background: rgba(255, 190, 118, 0.05);"></div>
              <div class="countdown-header">
                <div class="countdown-label">限时专享</div>
                <div class="countdown-title">专属优惠倒计时</div>
              </div>
              <div class="countdown-timer-wrap" data-end-time="2025-05-31T23:59:59">
                <div class="countdown-unit">
                  <span class="countdown-number countdown-days">00</span>
                  <div class="countdown-text">天</div>
                </div>
                <div class="countdown-separator">:</div>
                <div class="countdown-unit">
                  <span class="countdown-number countdown-hours">00</span>
                  <div class="countdown-text">时</div>
                </div>
                <div class="countdown-separator">:</div>
                <div class="countdown-unit">
                  <span class="countdown-number countdown-minutes">00</span>
                  <div class="countdown-text">分</div>
                </div>
                <div class="countdown-separator">:</div>
                <div class="countdown-unit">
                  <span class="countdown-number countdown-seconds">00</span>
                  <div class="countdown-text">秒</div>
                </div>
                <div class="countdown-separator">:</div>
                <div class="countdown-milliseconds-wrap">
                  <span class="countdown-milliseconds countdown-ms">000</span>
                  <div class="countdown-milliseconds-text">毫秒</div>
                </div>
              </div>
              <div class="countdown-message">一键建站，快速上线！</div>
            </div>
          </div>
          <div style="margin-bottom: 15px;">
            <div style="display: flex; align-items: flex-start; margin-bottom: 8px;">
              <span style="color: #ffbe76; margin-right: 8px; font-weight: bold;">✓</span>
              <span style="color: #636e72; font-size: 14px;">2核4G云服务器 + .com域名 + SSL证书</span>
            </div>
            <div style="display: flex; align-items: flex-start; margin-bottom: 8px;">
              <span style="color: #ffbe76; margin-right: 8px; font-weight: bold;">✓</span>
              <span style="color: #636e72; font-size: 14px;">WordPress/Discuz/帝国CMS等多种建站系统</span>
            </div>
            <div style="display: flex; align-items: flex-start; margin-bottom: 8px;">
              <span style="color: #ffbe76; margin-right: 8px; font-weight: bold;">✓</span>
              <span style="color: #636e72; font-size: 14px;">专业技术人员协助建站</span>
            </div>
            <div style="display: flex; align-items: flex-start;">
              <span style="color: #ffbe76; margin-right: 8px; font-weight: bold;">✓</span>
              <span style="color: #636e72; font-size: 14px;">赠送SEO优化指导</span>
            </div>
          </div>
          <div style="display: flex; justify-content: space-between; align-items: center;">
            <span style="color: #636e72; font-size: 14px;">首年仅需999元</span>
            <a href="https://cloud.ogmiao.com/themes/web/ogmiao/webmaster/website.html" style="background-color: #ffbe76; color: white; padding: 8px 15px; text-decoration: none; border-radius: 20px; font-weight: bold;">立即购买</a>
          </div>
        </div>
        <div class="activity-card" data-category="webmaster">
          <div style="position: relative;">
            <span style="position: absolute; top: 10px; right: 10px; background-color: #ffbe76; color: white; padding: 5px 10px; border-radius: 20px; font-size: 14px; font-weight: bold;">站长��享</span>
            <img src="https://cloud.ogmiao.com/themes/web/ogmiao/placeholder.svg?height=400&width=600" alt="站长推广计划" style="width: 100%; height: 180px; object-fit: cover; border-radius: 8px;">
          </div>
          <h4 style="margin-top: 15px; margin-bottom: 10px;">站长推广返佣计划</h4>
          <p style="color: #636e72; font-size: 14px; margin-bottom: 15px;">成为橘喵云推广合作伙伴，获取专属推广链接，每成功推广一单可获得高额返佣。</p>
          <div class="countdown-container countdown-webmaster">
            <div class="countdown-inner">
              <div class="countdown-decoration countdown-decoration-1" style="background: rgba(255, 190, 118, 0.1);"></div>
              <div class="countdown-decoration countdown-decoration-2" style="background: rgba(255, 190, 118, 0.05);"></div>
              <div class="countdown-header">
                <div class="countdown-label">限时专享</div>
                <div class="countdown-title">专属优惠倒计时</div>
              </div>
              <div class="countdown-timer-wrap" data-end-time="2025-12-31T23:59:59">
                <div class="countdown-unit">
                  <span class="countdown-number countdown-days">00</span>
                  <div class="countdown-text">天</div>
                </div>
                <div class="countdown-separator">:</div>
                <div class="countdown-unit">
                  <span class="countdown-number countdown-hours">00</span>
                  <div class="countdown-text">时</div>
                </div>
                <div class="countdown-separator">:</div>
                <div class="countdown-unit">
                  <span class="countdown-number countdown-minutes">00</span>
                  <div class="countdown-text">分</div>
                </div>
                <div class="countdown-separator">:</div>
                <div class="countdown-unit">
                  <span class="countdown-number countdown-seconds">00</span>
                  <div class="countdown-text">秒</div>
                </div>
                <div class="countdown-separator">:</div>
                <div class="countdown-milliseconds-wrap">
                  <span class="countdown-milliseconds countdown-ms">000</span>
                  <div class="countdown-milliseconds-text">毫秒</div>
                </div>
              </div>
              <div class="countdown-message">高额返佣，合作共赢！</div>
            </div>
          </div>
          <div style="margin-bottom: 15px;">
            <div style="display: flex; align-items: flex-start; margin-bottom: 8px;">
              <span style="color: #ffbe76; margin-right: 8px; font-weight: bold;">✓</span>
              <span style="color: #636e72; font-size: 14px;">首单返佣比例高达30%</span>
            </div>
            <div style="display: flex; align-items: flex-start; margin-bottom: 8px;">
              <span style="color: #ffbe76; margin-right: 8px; font-weight: bold;">✓</span>
              <span style="color: #636e72; font-size: 14px;">老带新额外奖励10%</span>
            </div>
            <div style="display: flex; align-items: flex-start; margin-bottom: 8px;">
              <span style="color: #ffbe76; margin-right: 8px; font-weight: bold;">✓</span>
              <span style="color: #636e72; font-size: 14px;">提供专业推广物料</span>
            </div>
            <div style="display: flex; align-items: flex-start;">
              <span style="color: #ffbe76; margin-right: 8px; font-weight: bold;">✓</span>
              <span style="color: #636e72; font-size: 14px;">每月固定结算，无最低提现额度</span>
            </div>
          </div>
          <div style="display: flex; justify-content: space-between; align-items: center;">
            <span style="color: #636e72; font-size: 14px;">需提供站长身份证明</span>
            <a href="https://cloud.ogmiao.com/themes/web/ogmiao/affiliate.html" style="background-color: #ffbe76; color: white; padding: 8px 15px; text-decoration: none; border-radius: 20px; font-weight: bold;">立即加入</a>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>

<!-- 移动端底部导航栏 -->
<div id="mobileNav" class="mobile-nav">
  <a href="/" class="mobile-nav-item">
    <div class="mobile-nav-icon">🏠</div>
    <span>首页</span>
  </a>
  <a href="/activity.html" class="mobile-nav-item active">
    <div class="mobile-nav-icon">🎁</div>
    <span>活动</span>
  </a>
  <a href="#discount" class="mobile-nav-item">
    <div class="mobile-nav-icon">🏷️</div>
    <span>特惠</span>
  </a>
  <a href="#free" class="mobile-nav-item">
    <div class="mobile-nav-icon">🎉</div>
    <span>免费</span>
  </a>
  <a href="#webmaster" class="mobile-nav-item">
    <div class="mobile-nav-icon">🚀</div>
    <span>站长</span>
  </a>
</div>

<script src="<?php echo $setting['web_view']; ?>/assets/js/activity.js"></script>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=5.0">
<link rel="dns-prefetch" href="https://fonts.googleapis.com">
<link rel="dns-prefetch" href="https://fonts.gstatic.com">
<link rel="preconnect" href="https://fonts.googleapis.com" crossorigin>
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link rel="preload" href="https://cloud.ogmiao.com/themes/web/ogmiao/img/1.webp" as="image">
<link rel="icon" href="https://cloud.ogmiao.com/themes/web/ogmiao/img/1.ico">
<link rel="apple-touch-icon" href="https://cloud.ogmiao.com/themes/web/ogmiao/img/1.ico">
<link rel="shortcut icon" href="https://cloud.ogmiao.com/themes/web/ogmiao/img/1.ico">
<link href="<?php echo $setting['web_view']; ?>/assets/fonts/Poppins-Regular-Medium-SemiBold-Bold.css" rel="stylesheet" media="print" onload="this.media='all'">
<noscript>
 <link href="<?php echo $setting['web_view']; ?>/assets/fonts/Poppins-Regular-Medium-SemiBold-Bold.css" rel="stylesheet">
</noscript>
<meta charset="UTF-8">
<link rel="robots" href="https://cloud.ogmiao.com/themes/web/ogmiao/robots.txt" type="text/plain">
<meta name="author" content="橘喵云">
<meta name="robots" content="index, follow">
<link rel="canonical" href="<?php echo (isset($canonical) && ($canonical !== '')?$canonical:'https://cloud.ogmiao.com/'); ?>">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="<?php echo $setting['web_view']; ?>/assets/fonts/Poppins-Regular-Medium-SemiBold-Bold-ExtraBold.css" rel="stylesheet">
<style>
:root {
--primary: #f08a5d;
--primary-dark: #e67e22;
--primary-light: #fad7a0;
--secondary: #f9b384;
--accent: #ffbe76;
--dark: #2d3436;
--light: #ffffff;
--gray: #636e72;
--gray-light: #f8f8f8;
--footer-bg: #f5f5f5;
--footer-text: #555555;
--footer-title: #333333;
--success: #26de81;
--warning: #fed330;
--danger: #fc5c65;
--bg-gradient: linear-gradient(135deg, rgba(240, 138, 93, 0.8), rgba(249, 179, 132, 0.8));
--card-shadow: 0 10px 25px rgba(0, 0, 0, 0.05);
--card-hover-shadow: 0 15px 35px rgba(0, 0, 0, 0.1);
--container-max-width: 1200px;
--container-padding: 15px;
--section-padding-large: 6rem;
--section-padding-medium: 4rem;
--section-padding-small: 3rem;
--grid-gap-large: 2rem;
--grid-gap-medium: 1.5rem;
--grid-gap-small: 1rem;
--font-size-h1-large: 3.5rem;
--font-size-h1-medium: 2.8rem;
--font-size-h1-small: 2.2rem;
--font-size-h1-xs: 1.8rem;
--font-size-h2-large: 2.5rem;
--font-size-h2-medium: 2.2rem;
--font-size-h2-small: 1.8rem;
--font-size-h2-xs: 1.5rem;
}
* {
margin: 0;
padding: 0;
box-sizing: border-box;
font-family: "Poppins", "PingFang SC", "Microsoft YaHei", "微软雅黑", "Hiragino Sans GB", "STHeiti",
 "WenQuanYi Micro Hei", sans-serif;
}
@font-face {
font-family: "PingFang SC";
src: local("PingFang SC"), local("PingFangSC");
font-weight: normal;
font-style: normal;
}
@font-face {
font-family: "Microsoft YaHei";
src: local("Microsoft YaHei"), local("微软雅黑");
font-weight: normal;
font-style: normal;
}
html {
font-size: 16px;
scroll-behavior: smooth;
}
@media (max-width: 1200px) {
html {
 font-size: 15px;
}
}
@media (max-width: 992px) {
html {
 font-size: 14px;
}
}
@media (max-width: 768px) {
html {
 font-size: 13px;
}
}
@media (max-width: 576px) {
html {
 font-size: 12px;
}
}
body {
line-height: 1.6;
color: var(--dark);
background-color: var(--light);
overflow-x: hidden;
-webkit-font-smoothing: antialiased;
-moz-osx-font-smoothing: grayscale;
opacity: 1;
visibility: visible;
}
img {
max-width: 100%;
height: auto;
}
.container {
width: 90%;
max-width: var(--container-max-width);
margin: 0 auto;
padding: 0 var(--container-padding);
position: relative;
z-index: 1;
}
@media (max-width: 576px) {
.container {
 width: 95%;
 padding: 0 10px;
}
}
header {
 background-color: var(--light);
 color: var(--dark);
 padding: 0;
 height: 70px;
 position: sticky;
 top: 0;
 z-index: 100;
 box-shadow: 0 2px 15px rgba(0, 0, 0, 0.05);
 display: flex;
 align-items: center;
 transition: all 0.3s ease;
}
nav {
display: flex;
justify-content: space-between;
align-items: center;
}
.logo-container {
 display: flex;
 align-items: center;
 transition: all 0.3s ease;
}
.logo-container:hover {
 transform: scale(1.03);
}
.logo-img {
 width: 36px;
 height: 36px;
 margin-right: 10px;
 border-radius: 8px;
 border: none;
 object-fit: contain;
 transition: all 0.3s ease;
}
.logo {
 font-size: 1.5rem;
 font-weight: 700;
 color: var(--primary);
 display: inline-block;
 transition: all 0.3s ease;
}
.logo-container:hover .logo {
 color: var(--primary-dark);
}
.nav-container {
display: flex;
align-items: center;
}
@media (max-width: 992px) {
.nav-container {
 position: fixed;
 top: 70px;
 left: 0;
 width: 100%;
 flex-direction: column;
 background: white;
 max-height: 0;
 overflow: hidden;
 opacity: 0;
 transition: all 0.4s ease;
 box-shadow: 0 10px 20px rgba(0, 0, 0, 0.1);
 z-index: 101;
 pointer-events: none;
}
.nav-container.active {
 max-height: 500px;
 opacity: 1;
 pointer-events: auto;
 padding: 1rem 0;
}
}
@media (max-width: 576px) {
.logo {
 font-size: 1.5rem;
}
.logo-img {
 width: 35px;
 height: 35px;
}
}
.nav-links {
display: flex;
list-style: none;
transition: all 0.3s ease-in-out;
}
@media (max-width: 992px) {
.nav-links {
 width: 100%;
 flex-direction: column;
 padding: 0;
}
.nav-links li {
 margin: 0.8rem 0;
 text-align: center;
}
.nav-links a {
 display: block;
 padding: 0.5rem 0;
}
}
.nav-links li {
margin-left: 25px;
}
.nav-links a {
 color: var(--dark);
 text-decoration: none;
 transition: all 0.3s;
 font-size: 0.9rem;
 font-weight: 500;
 position: relative;
 padding: 0.4rem 0.8rem;
 border-radius: 6px;
}
.nav-links a:hover {
 color: var(--primary);
 background-color: rgba(240, 138, 93, 0.05);
}
.nav-links a::after {
content: "";
position: absolute;
bottom: -5px;
left: 0;
width: 0;
height: 2px;
background-color: var(--primary);
transition: width 0.3s cubic-bezier(0.68, -0.55, 0.27, 1.55);
}
.nav-links a:hover::after {
width: 100%;
}
@media (max-width: 992px) {
.nav-links a::after {
 bottom: 0;
 width: 0;
 height: 2px;
 left: 50%;
 transform: translateX(-50%);
 transition: width 0.3s ease;
}
.nav-links a:hover::after {
 width: 50%;
}
}
.mobile-menu-btn {
display: none;
background: none;
border: none;
color: var(--dark);
font-size: 1.2rem;
cursor: pointer;
transition: transform 0.3s ease;
position: relative;
z-index: 102;
}
@media (max-width: 992px) {
.mobile-menu-btn {
 display: block;
}
}
.mobile-menu-btn.active {
transform: rotate(90deg);
color: var(--primary);
}
.nav-buttons {
display: flex;
align-items: center;
gap: 0.5rem;
margin-left: 1rem;
}
.btn-nav {
 display: inline-block;
 padding: 0.5rem 1.2rem;
 border-radius: 8px;
 text-decoration: none;
 font-weight: 600;
 font-size: 0.85rem;
 transition: all 0.3s cubic-bezier(0.23, 1, 0.32, 1);
 text-align: center;
 box-shadow: 0 2px 8px rgba(0, 0, 0, 0.05);
}
.btn-login {
 color: var(--primary);
 border: 1px solid var(--primary);
 background-color: transparent;
}
.btn-login:hover {
 background-color: rgba(240, 138, 93, 0.1);
 transform: translateY(-2px);
 box-shadow: 0 4px 12px rgba(240, 138, 93, 0.15);
}
.btn-register {
 background-color: var(--primary);
 color: white;
 box-shadow: 0 4px 10px rgba(240, 138, 93, 0.3);
 border: none;
}
.btn-register:hover {
 background-color: var(--primary-dark);
 transform: translateY(-2px);
 box-shadow: 0 6px 15px rgba(240, 138, 93, 0.4);
}
@media (max-width: 992px) {
 .nav-buttons .dark-mode-switch {
   height: 38px;
   width: 70px;
   margin: 0 auto;
   flex-shrink: 0;
 }
 .nav-container.active .nav-buttons {
   display: flex;
   flex-direction: row;
   flex-wrap: wrap;
   justify-content: center;
   gap: 1rem;
   margin-top: 1rem;
 }
 .nav-container.active .btn-nav {
   width: 45%;
   max-width: 150px;
 }
 .mobile-menu-btn {
   width: 40px;
   height: 40px;
   display: flex;
   align-items: center;
   justify-content: center;
   font-size: 1.4rem;
 }
}
@media (max-width: 992px) {
.nav-buttons {
 margin-left: auto;
 margin-right: 3rem;
}
.btn-nav {
 padding: 0.4rem 1rem;
 font-size: 0.85rem;
}
}
@media (max-width: 992px) {
 .nav-buttons {
   display: flex;
   width: 100%;
   justify-content: center;
   margin: 1rem 0 0.5rem;
   flex-wrap: wrap;
 }
 .nav-buttons-container {
   display: flex;
   justify-content: center;
   width: 100%;
   margin-bottom: 0.5rem;
 }
 .nav-buttons .btn-nav {
   width: auto;
   min-width: 110px;
   margin: 0 0.3rem;
 }
 .nav-container.active {
   padding: 0.8rem 0 1rem;
 }
}
@media (max-width: 480px) {
 .nav-buttons-container {
   flex-direction: row;
   justify-content: center;
   gap: 0.5rem;
 }
 .nav-buttons .btn-nav {
   min-width: 100px;
   padding: 0.4rem 0.8rem;
   font-size: 0.8rem;
 }
}
@media (max-width: 360px) {
 .nav-buttons .btn-nav {
   min-width: 90px;
   padding: 0.35rem 0.7rem;
   font-size: 0.75rem;
 }
}
@keyframes breathe {
0% {
 transform: scale(1);
}
50% {
 transform: scale(1.03);
}
100% {
 transform: scale(1);
}
}
@keyframes breatheLight {
0% {
 transform: scale(1);
}
50% {
 transform: scale(1.05);
}
100% {
 transform: scale(1);
}
}
@keyframes float {
0% {
 transform: translateY(0);
}
50% {
 transform: translateY(-10px);
}
100% {
 transform: translateY(0);
}
}
@keyframes pulse {
0% {
 transform: scale(1); opacity: 1;
}
50% {
 transform: scale(1.1); opacity: 0.8;
}
100% {
 transform: scale(1); opacity: 1;
}
}
@keyframes slideInDown {
0% {
 transform: translateY(-100%); opacity: 0;
}
100% {
 transform: translateY(0); opacity: 1;
}
}
@keyframes fadeInDown {
0% {
 transform: translateY(-20px); opacity: 0;
}
100% {
 transform: translateY(0); opacity: 1;
}
}
@keyframes ripple {
0% {
 transform: scale(0); opacity: 0.5;
}
100% {
 transform: scale(2); opacity: 0;
}
}
.btn-ripple-effect {
position: absolute;
border-radius: 50%;
background-color: rgba(255, 255, 255, 0.3);
transform: scale(0);
animation: ripple 0.6s linear;
pointer-events: none;
}
.header-animate {
animation: slideInDown 0.8s cubic-bezier(0.175, 0.885, 0.32, 1.275) forwards;
}
.nav-item-animate {
opacity: 0;
animation: fadeInDown 0.5s ease-out forwards;
}
header {
will-change: transform, opacity;
}
.nav-links li,
.logo-container,
.nav-buttons {
will-change: transform, opacity;
}
.page-transition {
position: fixed;
top: 0;
left: 0;
width: 100%;
height: 100%;
background-color: var(--light);
z-index: 9999;
opacity: 1;
transition: opacity 0.8s ease-out;
pointer-events: none;
}
.page-transition.fade-out {
opacity: 0;
}
.reduce-motion * {
animation: none !important;
transition: none !important;
transform: none !important;
}
@media (prefers-reduced-motion: reduce) {
* {
 animation-duration: 0.001ms !important;
 animation-iteration-count: 1 !important;
 transition-duration: 0.001ms !important;
 scroll-behavior: auto !important;
}
.header-animate,
.nav-item-animate,
.hero-content > * {
 animation: none !important;
 opacity: 1 !important;
 transform: none !important;
}
.page-transition {
 display: none !important;
}
}
.scroll-progress-container {
 position: fixed;
 top: 0;
 left: 0;
 width: 100%;
 height: 4px;
 background: transparent;
 z-index: 1000;
}
.scroll-progress-bar {
 height: 100%;
 background: var(--primary);
 width: 0%;
 transition: width 0.1s ease;
 box-shadow: 0 2px 5px rgba(240, 138, 93, 0.3);
}
@media (max-width: 480px) {
 .nav-container.active .nav-buttons {
   flex-direction: row;
   width: 100%;
   gap: 0.5rem;
   justify-content: center;
 }
 .nav-container.active .btn-nav {
   width: auto;
   min-width: 90px;
   max-width: 130px;
   padding: 0.4rem 0.8rem;
   font-size: 0.8rem;
 }
 .nav-links li {
   margin: 0.5rem 0;
 }
 .nav-links a {
   font-size: 0.85rem;
   padding: 0.3rem 0.6rem;
 }
}
@media (max-width: 360px) {
 .nav-container.active .btn-nav {
   width: auto;
   min-width: 80px;
   padding: 0.35rem 0.7rem;
   font-size: 0.75rem;
 }
 .nav-links a {
   font-size: 0.8rem;
   padding: 0.25rem 0.5rem;
 }
}
.header-right-controls {
 display: flex;
 align-items: center;
 gap: 10px;
}
@media (max-width: 992px) {
 .mobile-menu-btn {
   width: 40px;
   height: 40px;
   display: flex;
   align-items: center;
   justify-content: center;
   font-size: 1.4rem;
 }
}
@media (max-width: 360px) {
 .header-right-controls {
   gap: 5px;
 }
}
@media (min-width: 993px) and (max-width: 1250px) {
 .nav-links li {
   margin-left: 15px;
 }
 .nav-links a {
   font-size: 0.85rem;
   padding: 0.4rem 0.6rem;
 }
 .btn-nav {
   padding: 0.4rem 0.8rem;
   font-size: 0.8rem;
 }
 .nav-buttons {
   margin-left: 0.5rem;
 }
}

/* 更多菜单下拉样式 */
.more-menu {
 position: relative;
 display: inline-block;
}

.more-menu-btn {
 display: flex;
 align-items: center;
 color: var(--dark);
 text-decoration: none;
 transition: all 0.3s;
 font-size: 0.9rem;
 font-weight: 500;
 padding: 0.4rem 0.8rem;
 border-radius: 6px;
 cursor: pointer;
 background: none;
 border: none;
}

.more-menu-btn:hover {
 color: var(--primary);
 background-color: rgba(240, 138, 93, 0.05);
}

.more-menu-btn::after {
 content: "▼";
 font-size: 0.7rem;
 margin-left: 5px;
 transition: transform 0.3s;
}

.more-menu.active .more-menu-btn::after {
 transform: rotate(180deg);
}

.more-menu-dropdown {
 position: absolute;
 top: 100%;
 left: 0;
 background-color: white;
 min-width: 180px;
 box-shadow: 0 8px 16px rgba(0, 0, 0, 0.1);
 border-radius: 8px;
 padding: 0.5rem 0;
 z-index: 200;
 opacity: 0;
 visibility: hidden;
 transform: translateY(10px);
 transition: all 0.3s ease;
}

.more-menu.active .more-menu-dropdown {
 opacity: 1;
 visibility: visible;
 transform: translateY(0);
}

.more-menu-dropdown a {
 display: block;
 padding: 0.5rem 1rem;
 color: var(--dark);
 text-decoration: none;
 transition: all 0.2s;
 font-size: 0.85rem;
}

.more-menu-dropdown a:hover {
 background-color: rgba(240, 138, 93, 0.05);
 color: var(--primary);
}

/* 特定分辨率下的导航栏调整 */
@media (min-width: 993px) and (max-width: 1100px) {
 .nav-links .hide-on-medium {
   display: none;
 }
 
 .more-menu {
   display: inline-block;
 }
}

@media (min-width: 1101px) {
 .more-menu {
   display: none;
 }
}

@media (max-width: 992px) {
 .more-menu {
   display: none;
 }
 
 .nav-links .hide-on-medium {
   display: block;
 }
 
 .more-menu-dropdown {
   position: static;
   box-shadow: none;
   opacity: 1;
   visibility: visible;
   transform: none;
   padding: 0;
   margin: 0.5rem 0;
   width: 100%;
   background-color: transparent;
 }
 
 .more-menu-dropdown a {
   padding: 0.5rem 0;
   text-align: center;
 }
}

footer {
 background-color: var(--footer-bg, #f5f5f5);
 color: var(--footer-text, #555555);
 padding: 3rem 0 1.5rem;
 position: relative;
 z-index: 10;
}
.footer-grid {
 display: grid;
 grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
 gap: 2rem;
 margin-bottom: 2rem;
}
.footer-about {
 grid-column: span 1;
}
.footer-col h3 {
 color: var(--footer-title, #333333);
 font-size: 1.2rem;
 font-weight: 600;
 margin-bottom: 1.2rem;
 position: relative;
}
.footer-col p {
 margin-bottom: 1rem;
 font-size: 0.9rem;
 line-height: 1.6;
}
.footer-tagline {
 font-style: italic;
 color: var(--primary, #f08a5d);
 margin-bottom: 1rem;
 font-size: 0.95rem;
}
.footer-social {
 display: flex;
 gap: 1rem;
 margin-top: 1.5rem;
}
.footer-social-icon {
 display: flex;
 align-items: center;
 justify-content: center;
 width: 36px;
 height: 36px;
 background-color: rgba(240, 138, 93, 0.1);
 border-radius: 50%;
 color: var(--primary, #f08a5d);
 text-decoration: none;
 transition: all 0.3s;
 font-size: 1.2rem;
}
.footer-social-icon:hover {
 background-color: var(--primary, #f08a5d);
 color: white;
 transform: translateY(-3px);
}
.footer-links {
 list-style: none;
 padding: 0;
 margin: 0;
}
.footer-links li {
 margin-bottom: 0.8rem;
}
.footer-links a {
 color: var(--footer-text, #555555);
 text-decoration: none;
 font-size: 0.9rem;
 transition: all 0.3s;
 display: inline-block;
}
.footer-links a:hover {
 color: var(--primary, #f08a5d);
 transform: translateX(5px);
}
.copyright {
 text-align: center;
 padding-top: 1.5rem;
 border-top: 1px solid rgba(0, 0, 0, 0.1);
 font-size: 0.85rem;
}
@media (max-width: 768px) {
 .footer-grid {
   grid-template-columns: 1fr !important;
   gap: 2rem;
 }
 .footer-col {
   text-align: center;
 }
 .footer-col h3 {
   font-size: 1.1rem;
   margin-bottom: 0.8rem;
   position: relative;
   padding-bottom: 0.5rem;
 }
 .footer-col h3::after {
   content: "";
   position: absolute;
   bottom: 0;
   left: 50%;
   transform: translateX(-50%);
   width: 50px;
   height: 2px;
   background-color: var(--primary);
 }
 .footer-col p {
   font-size: 0.85rem;
   margin-bottom: 0.8rem;
 }
 .footer-tagline {
   font-size: 0.9rem;
   margin-bottom: 0.8rem;
 }
 .footer-social {
   justify-content: center;
   margin-top: 1rem;
 }
 .footer-links {
   display: flex;
   flex-wrap: wrap;
   justify-content: center;
   gap: 0.5rem 1rem;
 }
 .footer-links li {
   margin-bottom: 0.5rem;
 }
 .footer-links a {
   font-size: 0.85rem;
   padding: 0.3rem 0.5rem;
 }
 .copyright {
   padding-top: 1rem;
   font-size: 0.8rem;
 }
}
@media (max-width: 480px) {
 footer {
   padding: 2rem 0 5rem;
 }
 .footer-col h3 {
   font-size: 1rem;
 }
 .footer-col p,
 .footer-links a {
   font-size: 0.8rem;
 }
 .footer-social-icon {
   width: 32px;
   height: 32px;
   font-size: 1rem;
 }
}
.mobile-nav {
 display: none;
 position: fixed;
 bottom: 0;
 left: 0;
 width: 100%;
 background-color: white;
 box-shadow: 0 -2px 10px rgba(0, 0, 0, 0.1);
 z-index: 9999;
 padding: 0.5rem 0;
 justify-content: space-around;
 overflow-x: auto;
 white-space: nowrap;
 border-top: 1px solid rgba(0, 0, 0, 0.05);
}
.mobile-nav-item {
 display: flex;
 flex-direction: column;
 align-items: center;
 text-decoration: none;
 color: var(--gray);
 font-size: 0.65rem;
 padding: 0.3rem 0.5rem;
 min-width: 60px;
 transition: all 0.3s ease;
}
.mobile-nav-icon {
 font-size: 1.1rem;
 margin-bottom: 0.2rem;
 transition: all 0.3s ease;
}
.mobile-nav-item.active {
 color: var(--primary);
}
.mobile-nav-item:hover {
 color: var(--primary);
}
@media (max-width: 375px) {
 .mobile-nav-item {
   font-size: 0.6rem;
   min-width: 50px;
 }
 .mobile-nav-icon {
   font-size: 1rem;
 }
}
@media (max-width: 768px) {
 .mobile-nav {
   display: flex !important;
 }
   body {
   padding-bottom: 60px !important;
 }
}
.back-to-top {
 position: fixed;
 bottom: 30px;
 right: 30px;
 width: 55px;
 height: 55px;
 border-radius: 50%;
 display: flex;
 align-items: center;
 justify-content: center;
 text-decoration: none;
 opacity: 0;
 visibility: hidden;
 transition: all 0.4s cubic-bezier(0.175, 0.885, 0.32, 1.275);
 z-index: 9999;
 overflow: hidden;
 background: linear-gradient(135deg, #f08a5d, #f9b384);
 box-shadow: 0 6px 20px rgba(240, 138, 93, 0.3);
 transform: translateY(20px);
}
.back-to-top::before {
 content: "";
 position: absolute;
 top: 0;
 left: 0;
 width: 100%;
 height: 100%;
 background: linear-gradient(135deg, rgba(255, 255, 255, 0.2), rgba(255, 255, 255, 0));
 z-index: 1;
}
.back-to-top-icon {
 position: relative;
 z-index: 2;
 font-size: 1.5rem;
 color: white;
 transition: all 0.4s cubic-bezier(0.175, 0.885, 0.32, 1.275);
 width: 30px;
 height: 30px;
 background-image: url('https://cloud.ogmiao.com/themes/web/ogmiao/img/miao.svg');
 background-size: contain;
 background-repeat: no-repeat;
 background-position: center;
}
.back-to-top-icon::before {
 content: "";
}
.back-to-top.visible {
 opacity: 1;
 visibility: visible;
 transform: translateY(0);
}
.back-to-top:hover {
 transform: translateY(-5px) scale(1.05);
 box-shadow: 0 10px 25px rgba(240, 138, 93, 0.4);
}
.back-to-top:hover .back-to-top-icon {
 transform: translateY(-5px);
}
.back-to-top:active {
 transform: scale(0.95);
 box-shadow: 0 3px 10px rgba(240, 138, 93, 0.3);
}
.back-to-top .ripple {
 position: absolute;
 border-radius: 50%;
 background-color: rgba(255, 255, 255, 0.4);
 transform: scale(0);
 animation: ripple 0.8s linear;
 pointer-events: none;
}
@keyframes ripple {
 0% { transform: scale(0); opacity: 0.5; }
 100% { transform: scale(2.5); opacity: 0; }
}
@media (max-width: 768px) {
 .back-to-top {
   bottom: 75px;     right: 20px;
   width: 50px;
   height: 50px;
 }
}
@media (max-width: 480px) {
 .back-to-top {
   bottom: 80px;
   right: 15px;
   width: 45px;
   height: 45px;
 }
 .back-to-top-icon {
   font-size: 1.3rem;
 }
}
.scroll-progress-indicator {
 position: absolute;
 top: 0;
 left: 0;
 width: 100%;
 height: 100%;
 border-radius: 50%;
 background: transparent;
 z-index: 0;
}
.scroll-progress-indicator::before {
 content: "";
 position: absolute;
 top: 3px;
 left: 3px;
 right: 3px;
 bottom: 3px;
 border-radius: 50%;
 border: 2px solid rgba(255, 255, 255, 0.2);
}
.scroll-progress-indicator::after {
 content: "";
 position: absolute;
 top: 3px;
 left: 3px;
 right: 3px;
 bottom: 3px;
 border-radius: 50%;
 border: 2px solid white;
 clip-path: var(--scroll-progress, polygon(0% 0%, 100% 0%, 100% 0%, 0% 0%));
 transition: clip-path 0.3s ease;
}
.back-to-top.visible {
 opacity: 1 !important;
 visibility: visible !important;
 transform: translateY(0) !important;
}
</style>

<footer>
<div class="container">
   <div class="footer-grid">
       <div class="footer-col footer-about">
           <h3>关于我们</h3>
           <p>橘喵云是一家专业的IDC服务提供商，致力于为企业提供高品质的数据中心服务，包括服务器托管、云服务器、网络安全等全方位解决方案。</p>
           <div class="footer-tagline">您的数字家园守护者</div>
           <div class="footer-social">
               <a href="#" class="footer-social-icon">📱</a>
               <a href="#" class="footer-social-icon">💬</a>
               <a href="#" class="footer-social-icon">📧</a>
           </div>
       </div>
       <div class="footer-col">
           <h3>产品服务</h3>
           <ul class="footer-links">
               <li><a href="#">服务器托管</a></li>
               <li><a href="#">云服务器</a></li>
               <li><a href="#">网络安全</a></li>
               <li><a href="#">域名注册</a></li>
               <li><a href="https://cloud.ogmiao.com/solutions.html">解决方案</a></li>
           </ul>
       </div>
       <div class="footer-col">
           <h3>帮助中心</h3>
           <ul class="footer-links">
               <li><a href="#">常见问题</a></li>
               <li><a href="#">技术文档</a></li>
               <li><a href="https://cloud.ogmiao.com/terms.html">服务条款</a></li>
               <li><a href="https://cloud.ogmiao.com/privacy.html">隐私政策</a></li>
               <li><a href="#">投诉建议</a></li>
           </ul>
       </div>
       <div class="footer-col">
           <h3>联系方式</h3>
           <ul class="footer-links">
               <li><a href="#">暂无电话</a></li>
               <li><a href="#">ogmiao@outlook.com</a></li>
               <li><a href="#">上海市浦东新区</a></li>
           </ul>
       </div>
   </div>
   <div class="copyright">
       <p>&copy; 2025 橘喵云. 保留所有权利 | <a href="https://cloud.ogmiao.com/terms.html" style="color: inherit; text-decoration: underline;">服务条款</a> | <a href="https://cloud.ogmiao.com/privacy.html" style="color: inherit; text-decoration: underline;">隐私政策</a></p>
   </div>
</div>
<a href="#" id="backToTop" class="back-to-top" aria-label="回到顶部">
 <div class="scroll-progress-indicator"></div>
 <div class="back-to-top-icon"></div>
</a>
</footer>
<nav class="mobile-nav" id="mobileNav">
</nav>
<link rel="stylesheet" href="<?php echo $setting['web_view']; ?>/assets/css/footer.css">
<script src="<?php echo $setting['web_view']; ?>/assets/js/footer.js"></script>
</body>
</html>

</body>
</html>
