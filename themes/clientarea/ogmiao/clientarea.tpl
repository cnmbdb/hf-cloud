<head>
<style>
/* 手机端优化样式 */
@media (max-width: 767px) {
  /* 强制单列布局 */
  .clientarea-dashboard-row {
    display: flex;
    flex-direction: column;
  }
  
  .col-md-12, .col-xl-8, .col-xl-4 {
    width: 100% !important;
    max-width: 100% !important;
    flex: 0 0 100% !important;
    padding-left: 10px !important;
    padding-right: 10px !important;
  }
  
  /* 调整卡片间距和内边距 */
  .card {
    margin-bottom: 15px !important;
  }
  
  .card-body {
    padding: 15px !important;
  }
  
  /* 手机端内容排序 - 使用order属性重新排列元素 */
  /* 欢迎卡片放在最上面 */
  section:nth-of-type(4) {
    order: 1;
  }
  
  /* 已激活实例放在第二位 */
  section:nth-of-type(1) {
    order: 2;
  }
  
  /* 待办事项放在第三位 */
  section:nth-of-type(6) {
    order: 3;
  }
  
  /* 账户资产放在第四位 */
  section:nth-of-type(5) {
    order: 4;
  }
  
  /* 资源列表放在第五位 */
  section:nth-of-type(2) {
    order: 5;
  }
  
  /* 公告放在最后 */
  section:nth-of-type(3) {
    order: 6;
  }
  
  /* 优化欢迎卡片在手机端的显示 */
  .welcome-card .card-body {
    padding: 15px !important;
  }
  
  /* 优化用户信息显示 */
  .user-avatar-container {
    width: 50px !important;
    height: 50px !important;
  }
  
  /* 优化安全设置图标大小 */
  .user-center_safety {
    width: 36px !important;
    height: 36px !important;
  }
  
  /* 优化待办事项在手机端的显示 */
  .todo-item {
    padding: 10px !important;
  }
  
  .todo-icon {
    width: 32px !important;
    height: 32px !important;
    min-width: 32px !important;
    margin-right: 10px !important;
  }
  
  /* 优化资源列表在手机端的显示 */
  .resource-container {
    margin-top: 0 !important;
  }
  
  /* 优化公告在手机端的显示 */
  .news-grid {
    grid-template-columns: 1fr !important;
  }
  
  /* 优化已激活实例在手机端的显示 */
  .user-center_product_grid {
    grid-template-columns: 1fr !important;
    gap: 10px !important;
  }
  
  /* 优化余额图表在手机端的显示 */
  #balanceCharts {
    height: 180px !important;
    margin: 0 auto !important;
  }
  
  /* 优化按钮在手机端的显示 */
  .btn {
    padding: 8px 15px !important;
    font-size: 14px !important;
  }
  
  /* 增加手机端的触摸区域 */
  .user-center_product, .todo-item, .news-card {
    padding: 12px !important;
  }
  
  /* 优化手机端的字体大小 */
  .card-title {
    font-size: 16px !important;
  }
  
  .product-name, .todo-title {
    font-size: 14px !important;
  }
  
  .product-count, .todo-description {
    font-size: 12px !important;
  }
}

/* 手机端快捷导航 */
.mobile-quick-nav {
  display: none;
  position: fixed;
  bottom: 0;
  left: 0;
  width: 100%;
  background-color: #fff;
  box-shadow: 0 -2px 10px rgba(0, 0, 0, 0.1);
  z-index: 1000;
  padding: 8px 0;
  justify-content: space-around;
}

.quick-nav-item {
  display: flex;
  flex-direction: column;
  align-items: center;
  color: #555;
  text-decoration: none;
  padding: 5px 0;
  font-size: 12px;
}

.quick-nav-item i {
  font-size: 20px;
  color: #f08a5d;
  margin-bottom: 3px;
}

.quick-nav-item span {
  font-size: 12px;
}

.quick-nav-item:hover, .quick-nav-item:active {
  color: #f08a5d;
}

@media (max-width: 767px) {
  .mobile-quick-nav {
    display: flex;
  }
  
  /* 为底部导航腾出空间 */
  body {
    padding-bottom: 60px;
  }
  
  /* 修复底部导航在暗色模式下的样式 */
  .dark .mobile-quick-nav {
    background-color: #1a1a1a;
    box-shadow: 0 -2px 10px rgba(0, 0, 0, 0.3);
  }
  
  .dark .quick-nav-item {
    color: #e0e0e0;
  }
}
</style>
</head>
<link rel="stylesheet" href="https://cloud.ogmiao.com/themes/clientarea/ogmiao/assets/css/clientarea.css">
    
    <script src="/themes/clientarea/default/assets/libs/echarts/echarts.min.js?v={$Ver}"></script>
    <script>
    $(function () {
      initBalanceChart();
      
      loadResourceList();
      
      addAnimations();
      
      enhanceStyles();
    });
    
    
function initBalanceChart() {
  var credit = '{$ClientArea.index.client.credit}';
  var unpaid = '{$ClientArea.index.invoice_unpaid}';
  var creditNum = parseFloat(credit.replace('{$Lang.element}', ''));
  var unpaidNum = parseFloat(unpaid.replace('{$Lang.element}', ''));

  var percentage = 0;
  if (creditNum > 0 || unpaidNum > 0) {
    percentage = parseFloat(creditNum / (creditNum + unpaidNum)).toFixed(2);
  }
  
  var myChart = echarts.init(document.getElementById("balanceCharts"));
  
  var option = {
    title: {
      text: '{a|' + credit + '}\n{c|' + '{$Lang.current_balance}' + '}',
      x: 'center',
      y: 'center',
      textStyle: {
        rich: {
          a: {
            fontSize: 16,
            color: '#fafafa',
            fontWeight: 600,
            padding: [0, 0, 5, 0]
          },
          c: {
            fontSize: 12,
            color: '#a1a1aa',
            padding: [5, 0]
          }
        }
      }
    },
    series: [
      {
        type: 'gauge',
        radius: '80%',
        clockwise: true,
        startAngle: '270',
        endAngle: '-89.9999',
        splitNumber: 0,
        detail: {
          offsetCenter: [0, -20],
          formatter: ' '
        },
        pointer: {
          show: false
        },
        axisLine: {
          show: true,
          lineStyle: {
            color: [
              [0, '#fafafa'],
              [percentage, '#fafafa'],
              [1, '#27272a']
            ],
            width: 9
          }
        },
        axisTick: {
          show: false
        },
        splitLine: {
          show: false,
          length: 32,
          lineStyle: {
            color: '#fff',
            width: 6
          }
        },
        axisLabel: {
          show: false
        }
      }
    ]
  };
  myChart.setOption(option, true);
  window.myChart = myChart;
  
  // Add resize handler to adjust chart on window resize
  window.addEventListener("resize", function() {
    myChart.resize();
    
    // Check if we're at the problematic resolution and adjust if needed
    const width = window.innerWidth;
    const height = window.innerHeight;
    
    if ((width >= 1340 && width <= 1350 && height >= 1320 && height <= 1340) || 
        (width === 1344 && height === 1329)) {
      // Apply specific adjustments for this resolution
      const chartContainer = document.getElementById("balanceCharts");
      if (chartContainer) {
        chartContainer.style.width = "180px";
        chartContainer.style.height = "180px";
        
        // Force chart resize after DOM update
        setTimeout(() => {
          myChart.resize();
        }, 100);
      }
    }
  });
}
    
    function loadResourceList() {
      $('#sourceListBox').html(`<div class=\"spinner-grow\" role=\"status\" style=\"color: var(--primary);\"><span class=\"sr-only\">Loading...</span></div>`);
      
      $.ajax({
        type: "get",
        url: '/clientarea',
        data: {
          action: 'list'
        },
        timeout: 15000,
        success: function (data) {
          $('#sourceListBox').html(data);
          syncActiveInstancesFromResourceList(data);
          requestAnimationFrame(function() {
            applyResourceListStyles();
          });
        },
        error: function() {
          $('#sourceListBox').html('<div class="text-center py-4"><p>加载资源列表失败，请<a href="javascript:loadResourceList()">重试</a>或刷新页面</p></div>');
        }
      });
    }

    function syncActiveInstancesFromResourceList(data) {
      const $grid = $('#activeInstancesGrid');
      if (!$grid.length || !data) return;

      const $parsed = $('<div>').append($.parseHTML(data, document, true));
      const resources = [];

      $parsed.find('.resource-card').each(function() {
        const $card = $(this);
        const title = $.trim($card.find('.card-hostname').text());
        const status = $.trim($card.find('.card-status').text());
        const ip = $.trim($card.find('.ip-badge').text());
        const href = $card.find('.view-details-btn').attr('href') || '#';
        if (title) {
          resources.push({ title: title, status: status, ip: ip, href: href });
        }
      });

      if (!resources.length) {
        $parsed.find('.tablelist tbody tr').each(function() {
          const $row = $(this);
          if ($row.find('.no-data').length) return;
          const $cells = $row.find('td');
          const $hostLink = $row.find('a[href*="servicedetail"]');
          const title = $.trim($hostLink.text() || $cells.eq(1).text());
          const status = $.trim($cells.eq(0).text());
          const ip = $.trim($cells.eq(4).text());
          const href = $hostLink.attr('href') || '#';
          if (title) {
            resources.push({ title: title, status: status, ip: ip, href: href });
          }
        });
      }

      if (!resources.length) return;

      $grid.empty();
      resources.forEach(function(resource) {
        const $item = $('<a>', {
          href: resource.href,
          class: 'user-center_product active-instance-card'
        });
        const $icon = $('<div>', { class: 'product-icon' }).append($('<i>', { class: 'bx bx-server' }));
        const $info = $('<div>', { class: 'product-info' })
          .append($('<span>', { class: 'product-name', text: resource.title }))
          .append($('<span>', { class: 'product-count', text: resource.status || '实例' }));
        const $meta = $('<div>', { class: 'product-arrow active-instance-ip', text: resource.ip || '-' });
        $item.append($icon, $info, $meta);
        $grid.append($item);
      });
    }

    function applyResourceListStyles() {
      $('.table').addClass('custom-styled-table');
      $('.pagination .page-item.active .page-link').addClass('active-page-link');
      $('.dataTables_length select, .custom-select, select.form-control').addClass('styled-select');
      $('.table .btn').addClass('btn-sm');
      $('.dataTables_info').addClass('styled-info');
      $('.dataTables_wrapper .row:last-child').addClass('pagination-container');
      
      $('.pagination .page-item').not('.active, .disabled').hover(
        function() {
          $(this).find('.page-link').css({
            'transform': 'translateY(-2px)',
            'box-shadow': '0 5px 15px rgba(240, 138, 93, 0.1)'
          });
        },
        function() {
          $(this).find('.page-link').css({
            'transform': 'translateY(0)',
            'box-shadow': '0 2px 5px rgba(240, 138, 93, 0.05)'
          });
        }
      );
      
      $('.dataTables_length select').hover(
        function() {
          $(this).css({
            'border-color': 'var(--primary)',
            'box-shadow': '0 4px 10px rgba(240, 138, 93, 0.15)',
            'transform': 'translateY(-1px)'
          });
        },
        function() {
          $(this).css({
            'border-color': 'rgba(240, 138, 93, 0.2)',
            'box-shadow': '0 2px 5px rgba(240, 138, 93, 0.1)',
            'transform': 'translateY(0)'
          });
        }
      );
      
      const infoText = $('.dataTables_info').text();
      if (infoText) {
        const enhancedText = infoText.replace(/(\d+)/g, '<span style="color: var(--primary); font-weight: 600;">$1</span>');
        $('.dataTables_info').html(enhancedText);
      }
      
      optimizeTableResponsive();
    }
    
    function optimizeTableResponsive() {
      const screenWidth = window.innerWidth;
      
      const tables = $('.table');
      
      if (tables.length > 0) {
        if (screenWidth <= 576) {
          tables.each(function() {
            $(this).find('th, td').css({
              'padding': '0.75rem 0.5rem',
              'font-size': '0.85rem'
            });
            
            $(this).find('.btn').css({
              'padding': '0.3rem 0.6rem',
              'font-size': '0.75rem'
            });
            
            $(this).find('td').css('white-space', 'nowrap');
          });
          
          $('.dataTables_paginate .pagination').css({
            'flex-wrap': 'wrap',
            'justify-content': 'center'
          });
          
          $('.dataTables_length').css({
            'text-align': 'center',
            'margin-bottom': '0.75rem'
          });
          
          $('.dataTables_filter').css({
            'text-align': 'center',
            'margin-bottom': '0.75rem'
          });
        } else if (screenWidth <= 768) {
          tables.each(function() {
            $(this).find('th, td').css({
              'padding': '0.85rem 0.6rem',
              'font-size': '0.9rem'
            });
            
            $(this).find('.btn').css({
              'padding': '0.35rem 0.7rem',
              'font-size': '0.8rem'
            });
          });
        }
      }
      
      if (screenWidth <= 576) {
        $('.todo-card .btn-block').each(function() {
          $(this).css({
            'display': 'flex',
            'align-items': 'center',
            'text-align': 'left',
            'white-space': 'normal',
            'height': 'auto',
            'line-height': '1.3'
          });
          
          $(this).find('i').css({
            'margin-right': '0.3rem',
            'flex-shrink': '0'
          });
        });
      }
    }
    
    $(window).on('resize', function() {
      optimizeTableResponsive();
    });
    
    function addAnimations() {
      $('.card').addClass('card-animation');
      $('.btn-primary').addClass('pulse');
      $('.badge').addClass('blink');
      
      const welcomeTitle = document.getElementById('welcome-title');
      if (welcomeTitle) {
        welcomeTitle.classList.add('visible');
      }
    }
    
    function enhanceStyles() {
      enhanceAnnouncementTitles();
      
      enhanceAvatars();
      
      enhanceEmptyStates();
      
      enhanceButtons();
    }
    
    function enhanceAnnouncementTitles() {
      const titles = document.querySelectorAll(".notice_item_title");
      titles.forEach(function(title) {
        if (!title.classList.contains('enhanced')) {
          title.classList.add('enhanced', 'notice-title-styled');
          
          if (!title.querySelector(".title-dot")) {
            const dot = document.createElement("span");
            dot.className = "title-dot";
            title.insertBefore(dot, title.firstChild);
          }
        }
      });
    }
    
    function enhanceAvatars() {
      const avatarContainers = document.querySelectorAll(".user-center_header");
      avatarContainers.forEach(function(container) {
        if (!container.classList.contains('enhanced')) {
          container.classList.add('enhanced');
          
          if (!container.querySelector("img") && container.textContent.trim()) {
            const text = container.textContent.trim();
            container.innerHTML = "";
            
            const span = document.createElement("span");
            span.textContent = text;
            span.className = "avatar-text";
            container.appendChild(span);
          }
        }
      });
    }
    
    function adjustAvatarSizes() {
      const avatarContainers = document.querySelectorAll(".user-center_header");
      avatarContainers.forEach(function(container) {
        const span = container.querySelector("span");
        if (span) {
          const containerWidth = container.offsetWidth;
          if (containerWidth >= 60) {
            span.style.fontSize = "28px";
          } else if (containerWidth >= 40) {
            span.style.fontSize = "20px";
          } else {
            span.style.fontSize = "16px";
          }
        }
      });
      
      adjustAvatarSizes();
    }
    
    function enhanceEmptyStates() {
      const emptyContainer = document.querySelector(".user-center_product_grid > div");
      if (emptyContainer && !emptyContainer.classList.contains('enhanced')) {
        emptyContainer.classList.add('enhanced', 'empty-container-styled');
        
        const iconTextGroup = emptyContainer.querySelector("div");
        if (iconTextGroup) {
          iconTextGroup.classList.add('icon-text-group');
        }
        
        const serverIcon = iconTextGroup?.querySelector(".bx.bx-server");
        if (serverIcon) {
          serverIcon.classList.add('server-icon');
        }
        
        const button = emptyContainer.querySelector(".btn");
        if (button) {
          button.classList.add('action-button');
        }
      }
    }
    
    function enhanceButtons() {
      const infoBadges = document.querySelectorAll(".badge-info");
      infoBadges.forEach(function(badge) {
        badge.classList.add('info-badge-styled');
      });
      
      const infoButtons = document.querySelectorAll(".btn-outline-info");
      infoButtons.forEach(function(btn) {
        btn.classList.add('info-button-styled');
      });
    }
    
    function debounce(func, wait) {
      let timeout;
      return function() {
        const context = this;
        const args = arguments;
        clearTimeout(timeout);
        timeout = setTimeout(function() {
          func.apply(context, args);
        }, wait);
      };
    }
    
    window.addEventListener('resize', debounce(function() {
      adjustAvatarSizes();
    }, 250));


    
    document.addEventListener("DOMContentLoaded", function() {
      const titles = document.querySelectorAll(".notice_item_title");
      titles.forEach(function(title) {
        title.style.display = "inline-block";
        title.style.maxWidth = "100%";
        title.style.overflow = "hidden";
        title.style.textOverflow = "ellipsis";
        title.style.whiteSpace = "nowrap";
        title.style.color = "var(--dark)";
        title.style.position = "relative";
        title.style.paddingLeft = "1rem";
        
        if (!title.querySelector(".title-dot")) {
          const dot = document.createElement("span");
          dot.className = "title-dot";
          dot.style.position = "absolute";
          dot.style.left = "0";
          dot.style.top = "50%";
          dot.style.transform = "translateY(-50%)";
          dot.style.width = "5px";
          dot.style.height = "5px";
          dot.style.borderRadius = "50%";
          dot.style.backgroundColor = "var(--primary)";
          title.insertBefore(dot, title.firstChild);
        }
      });
      
      const infoBadges = document.querySelectorAll(".badge-info");
      infoBadges.forEach(function(badge) {
        badge.style.backgroundColor = "rgba(240, 138, 93, 0.15)";
        badge.style.color = "var(--primary)";
      });
      
      const infoButtons = document.querySelectorAll(".btn-outline-info");
      infoButtons.forEach(function(btn) {
        btn.style.color = "var(--primary)";
        btn.style.borderColor = "var(--primary)";
      });
    });
    
    document.addEventListener("DOMContentLoaded", function() {
      setTimeout(function() {
        const titles = document.querySelectorAll(".notice_item_title");
        titles.forEach(function(title) {
          const existingDot = title.querySelector(".title-dot");
          if (existingDot) {
            existingDot.remove();
          }
          
          const textContent = title.textContent.trim();
          title.innerHTML = '';
          
          const dot = document.createElement("span");
          dot.className = "title-dot";
          dot.style.display = "inline-block";
          dot.style.width = "8px";
          dot.style.height = "8px";
          dot.style.borderRadius = "50%";
          dot.style.backgroundColor = "#f08a5d";
          dot.style.marginRight = "12px";
          dot.style.flexShrink = "0";
          
          const textSpan = document.createElement("span");
          textSpan.textContent = textContent;
          textSpan.style.overflow = "hidden";
          textSpan.style.textOverflow = "ellipsis";
          textSpan.style.whiteSpace = "nowrap";
          textSpan.style.display = "inline-block";
          textSpan.style.maxWidth = "calc(100% - 20px)";
          
          title.appendChild(dot);
          title.appendChild(textSpan);
          
          title.style.display = "flex";
          title.style.alignItems = "center";
          title.style.width = "100%";
          title.style.overflow = "hidden";
        });
      }, 500);
    });
    
    document.addEventListener("DOMContentLoaded", function() {
      setTimeout(function() {
        const titles = document.querySelectorAll(".notice_item_title");
        titles.forEach(function(title) {
          const existingDot = title.querySelector(".title-dot");
          if (existingDot) {
            existingDot.remove();
          }
          
          title.style.display = "block";
          title.style.overflow = "hidden";
          title.style.textOverflow = "ellipsis";
          title.style.whiteSpace = "nowrap";
          title.style.width = "100%";
          title.style.color = "#2d3436";
          title.style.fontSize = "0.95rem";
          title.style.fontWeight = "500";
          title.style.transition = "color 0.3s ease, transform 0.3s ease";
        });
      }, 500);
    });
    </script>
    <script>
    document.addEventListener("DOMContentLoaded", function() {
      function enhancePaginationControls() {
        const paginationControls = document.querySelectorAll('.pagination');
        paginationControls.forEach(function(pagination) {
          pagination.querySelectorAll('.page-item').forEach(function(item) {
            if (!item.classList.contains('active') && !item.classList.contains('disabled')) {
              item.addEventListener('mouseenter', function() {
                const link = this.querySelector('.page-link');
                if (link) {
                  link.style.transform = 'translateY(-2px)';
                  link.style.boxShadow = '0 5px 15px rgba(240, 138, 93, 0.1)';
                }
              });
              
              item.addEventListener('mouseleave', function() {
                const link = this.querySelector('.page-link');
                if (link) {
                  link.style.transform = 'translateY(0)';
                  link.style.boxShadow = '0 2px 5px rgba(240, 138, 93, 0.05)';
                }
              });
            }
          });
        });
        
        const lengthSelects = document.querySelectorAll('.dataTables_length select');
        lengthSelects.forEach(function(select) {
          select.classList.add('custom-styled-select');
          
          select.addEventListener('mouseenter', function() {
            this.style.borderColor = 'var(--primary)';
            this.style.boxShadow = '0 4px 10px rgba(240, 138, 93, 0.15)';
            this.style.transform = 'translateY(-1px)';
          });
          
          select.addEventListener('mouseleave', function() {
            this.style.borderColor = 'rgba(240, 138, 93, 0.2)';
            this.style.boxShadow = '0 2px 5px rgba(240, 138, 93, 0.1)';
            this.style.transform = 'translateY(0)';
          });
        });
        
        const infoElements = document.querySelectorAll('.dataTables_info');
        infoElements.forEach(function(info) {
          const text = info.textContent;
          if (text) {
            const enhancedText = text.replace(/(\d+)/g, '<span style="color: var(--primary); font-weight: 600;">$1</span>');
            info.innerHTML = enhancedText;
          }
        });
      }
      
      const observer = new MutationObserver(function(mutations) {
        mutations.forEach(function(mutation) {
          if (mutation.type === 'childList' && mutation.addedNodes.length > 0) {
            const paginationAdded = Array.from(mutation.addedNodes).some(function(node) {
              return node.nodeType === 1 && (
                node.querySelector('.pagination') || 
                node.querySelector('.dataTables_length') ||
                node.classList.contains('pagination') ||
                node.classList.contains('dataTables_length')
              );
            });
            
            if (paginationAdded) {
              setTimeout(enhancePaginationControls, 100);
            }
          }
        });
      });
      
      const sourceListBox = document.getElementById('sourceListBox');
      if (sourceListBox) {
        observer.observe(sourceListBox, { childList: true, subtree: true });
      }
      
      setTimeout(enhancePaginationControls, 1000);
    });
    </script>
    
    <script>
    // Add this function to ensure the activated instances are visible
    document.addEventListener("DOMContentLoaded", function() {
      // Make sure the product grid is visible
      const productGrid = document.querySelector(".user-center_product_grid");
      if (productGrid) {
        productGrid.style.display = "grid";
        productGrid.style.visibility = "visible";
        productGrid.style.opacity = "1";
        
        // Check if it has any product items
        const productItems = productGrid.querySelectorAll(".user-center_product");
        if (productItems.length > 0) {
          productItems.forEach(item => {
            item.style.display = "flex";
            item.style.visibility = "visible";
            item.style.opacity = "1";
          });
        } else {
          // If no products, ensure the empty state is visible
          const emptyState = productGrid.querySelector("div");
          if (emptyState) {
            emptyState.style.display = "flex";
            emptyState.style.visibility = "visible";
            emptyState.style.opacity = "1";
          }
        }
      }
      
      // Ensure the balance chart doesn't affect other elements
      const balanceChart = document.getElementById("balanceCharts");
      if (balanceChart) {
        balanceChart.style.position = "relative";
        balanceChart.style.zIndex = "1";
      }
    });
    
    // Add this to the existing window resize event
    window.addEventListener("resize", function() {
      // Ensure the product grid remains visible after resize
      const productGrid = document.querySelector(".user-center_product_grid");
      if (productGrid) {
        productGrid.style.display = "grid";
        productGrid.style.visibility = "visible";
        productGrid.style.opacity = "1";
        
        // Check if it has any product items
        const productItems = productGrid.querySelectorAll(".user-center_product");
        if (productItems.length > 0) {
          productItems.forEach(item => {
            item.style.display = "flex";
            item.style.visibility = "visible";
            item.style.opacity = "1";
          });
        }
      }
    });
    </script>
    
    
    
    <div class="row clientarea-dashboard-row">
    <!-- 手机端导航菜单 -->
<div class="mobile-quick-nav">
  <a href="/cart" class="quick-nav-item">
    <i class="bx bx-cart"></i>
    <span>购买产品</span>
  </a>
  <a href="/addfunds" class="quick-nav-item">
    <i class="bx bx-wallet"></i>
    <span>充值</span>
  </a>
  <a href="/supporttickets" class="quick-nav-item">
    <i class="bx bx-support"></i>
    <span>工单</span>
  </a>
  <a href="/service" class="quick-nav-item">
    <i class="bx bx-server"></i>
    <span>我的产品</span>
  </a>
</div>
    
        <section class="col-md-12 col-xl-8">
        

        
          <section>
            <div class="card">
              <div class="card-body">
                <div class="decoration decoration-1"></div>
                <div class="decoration decoration-2"></div>
                <h4 class="card-title instances-title">已激活实例</h4>
                

<div class="user-center_product_grid" id="activeInstancesGrid" style="display: grid; grid-template-columns: repeat(auto-fill, minmax(250px, 1fr)); gap: 15px; width: 100%; margin-top: 15px; padding: 0; overflow: visible;">
  {if $ClientArea.index.host_nav}
  {foreach $ClientArea.index.host_nav as $list}
  <a href="service?groupid={$list.id}" class="user-center_product" style="display: flex; align-items: center; padding: 16px; background-color: rgba(240, 138, 93, 0.03); border-radius: 12px; transition: all 0.3s ease; text-decoration: none; position: relative; overflow: hidden; border: none; box-shadow: 0 2px 8px rgba(240, 138, 93, 0.05); width: 100%; box-sizing: border-box;">
    <div class="product-icon" style="display: flex; align-items: center; justify-content: center; width: 42px; height: 42px; min-width: 42px; min-height: 42px; border-radius: 10px; background-color: rgba(240, 138, 93, 0.1); margin-right: 15px; flex-shrink: 0; position: relative; box-shadow: 0 3px 8px rgba(240, 138, 93, 0.1); border: 1px solid rgba(240, 138, 93, 0.1);">
      <i class="bx bxs-grid-alt" style="font-size: 20px; color: #f08a5d; position: absolute; top: 50%; left: 50%; transform: translate(-50%, -50%);"></i>
    </div>
    <div class="product-info" style="flex: 1; display: flex; flex-direction: column; min-width: 0;">
      <span class="product-name" style="font-size: 15px; font-weight: 600; color: #2d3436; margin-bottom: 8px; transition: color 0.3s ease; white-space: nowrap; overflow: hidden; text-overflow: ellipsis;">{$list.groupname}</span>
      <div style="display: flex; align-items: center;">
        <span class="product-count" style="display: inline-flex; align-items: center; background-color: rgba(240, 138, 93, 0.08); color: #f08a5d; font-size: 12px; font-
weight: 600; padding: 4px 10px; border-radius: 12px; transition: all 0.3s ease; box-shadow: 0 1px 3px rgba(240, 138, 93, 0.1); border: 1px solid rgba(240, 138, 93, 0.1); max-width: fit-content; white-space: nowrap; position: relative; padding-left: 18px;">
          <span style="position: absolute; left: 8px; top: 50%; transform: translateY(-50%); width: 6px; height: 6px; background-color: #f08a5d; border-radius: 50%; box-shadow: 0 0 0 2px rgba(240, 138, 93, 0.1);"></span>
          {$list.count}个实例
        </span>
      </div>
    </div>
    <div class="product-arrow" style="margin-left: 12px; color: #f08a5d; opacity: 0.5; width: 24px; height: 24px; display: flex; align-items: center; justify-content: center; background-color: rgba(240, 138, 93, 0.1); border-radius: 50%; flex-shrink: 0;">
      <i class="bx bx-chevron-right"></i>
    </div>
  </a>
  {/foreach}
  {else}
  <div class="empty-instances" style="grid-column: 1 / -1; background-color: rgba(240, 138, 93, 0.03); border-radius: 12px; padding: 25px; text-align: center; box-shadow: 0 2px 8px rgba(240, 138, 93, 0.05);">
    <div class="empty-instances-content" style="display: flex; align-items: center; justify-content: center; flex-wrap: wrap; gap: 15px;">
      <i class="bx bx-server" style="font-size: 28px; color: #f08a5d; margin-right: 5px;"></i>
      <span style="font-size: 16px; color: #2d3436; font-weight: 500;">暂无已激活实例</span>
      <a href="/cart" class="btn btn-primary" style="margin-left: 15px; padding: 8px 20px; white-space: nowrap; background-color: #f08a5d; border-color: #f08a5d; color: white; border-radius: 50px; font-weight: 600; box-shadow: 0 4px 15px rgba(240, 138, 93, 0.3);">立即选购</a>
    </div>
  </div>
  {/if}
</div>

              </div>
            </div>
          </section>
          
          <section>
            <div class="card">
              <div class="card-body" id="sourceListBox">
                <div class="text-center py-4">
                  <div class="spinner-grow" style="color: var(--primary);" role="status">
                    <span class="sr-only">Loading...</span>
                  </div>
                </div>
              </div>
            </div>
          </section>
          
          
    <section>
  <div class="card">
    <div class="card-body">
      <h4 class="mb-4 card-title d-flex justify-content-between">
        <span>{$Lang.announcement}</span>
        <a href="news" class="fs-12 font-weight-normal" style="font-size: 0.875rem; color: #f08a5d; display: flex; align-items: center;">
          {$Lang.view_more} <i class="bx bx-right-arrow-alt" style="margin-left: 5px;"></i>
        </a>
      </h4>
      <div class="user-center_notice h100p">
        {if $ClientArea.index.news}
        <div class="news-grid" style="display: grid; grid-template-columns: repeat(auto-fill, minmax(280px, 1fr)); gap: 15px;">
          {foreach $ClientArea.index.news as $list}
          {if $foreach.iteration <= 4}
          <a href="newsview?id={$list.id}" class="news-card" style="display: block; text-decoration: none; background-color: rgba(240, 138, 93, 0.03); border-radius: 12px; padding: 15px; transition: all 0.3s ease; border: 1px solid rgba(240, 138, 93, 0.1); position: relative; overflow: hidden;">
            <div class="news-date" style="display: inline-block; background-color: rgba(240, 138, 93, 0.1); color: #f08a5d; font-size: 12px; font-weight: 600; padding: 4px 10px; border-radius: 20px; margin-bottom: 10px;">
              <i class="bx bx-calendar" style="margin-right: 5px;"></i>
              {$list.push_time|date="Y-m-d"}
            </div>
            <div class="news-time" style="position: absolute; top: 15px; right: 15px; font-size: 12px; color: #888;">
              {$list.push_time|date="H:i"}
            </div>
            <h5 class="news-title" style="font-size: 15px; font-weight: 600; color: #2d3436; margin-bottom: 10px; line-height: 1.4; display: -webkit-box; -webkit-line-clamp: 2; -webkit-box-orient: vertical; overflow: hidden; text-overflow: ellipsis; height: 42px;">
              {$list.title}
            </h5>
            <div class="news-footer" style="display: flex; justify-content: space-between; align-items: center; margin-top: 10px;">
              <span class="news-category" style="font-size: 12px; color: #888;">公告</span>
              <span class="news-read-more" style="font-size: 12px; color: #f08a5d; display: flex; align-items: center;">
                阅读详情 <i class="bx bx-right-arrow-alt" style="margin-left: 3px; font-size: 14px;"></i>
              </span>
            </div>
            <div class="news-hover-effect" style="position: absolute; bottom: 0; left: 0; width: 100%; height: 3px; background: linear-gradient(90deg, #f08a5d, transparent); transform: scaleX(0); transform-origin: left; transition: transform 0.3s ease;"></div>
          </a>
          {/if}
{/foreach}
</div>
<div class="view-more-container" style="text-align: center; margin-top: 20px;">
  <a href="/news" class="view-more-link" style="display: inline-flex; align-items: center; padding: 8px 20px; background-color: rgba(240, 138, 93, 0.1); color: #f08a5d; border-radius: 50px; font-size: 14px; font-weight: 500; text-decoration: none; transition: all 0.3s ease;">
    查看更多公告 <i class="bx bx-right-arrow-alt" style="margin-left: 5px; font-size: 16px;"></i>
  </a>
</div>
{else}
        <div class="empty-news" style="background-color: rgba(240, 138, 93, 0.03); border-radius: 12px; padding: 25px; text-align: center; box-shadow: 0 2px 8px rgba(240, 138, 93, 0.05);">
          <div style="display: flex; flex-direction: column; align-items: center; justify-content: center; gap: 15px;">
            <i class="bx bx-news" style="font-size: 28px; color: #f08a5d;"></i>
            <span style="font-size: 16px; color: #2d3436; font-weight: 500;">{$Lang.nothing}</span>
          </div>
        </div>
        {/if}
      </div>
    </div>
  </div>
</section>

<style>
  .news-card:hover {
    transform: translateY(-3px);
    box-shadow: 0 5px 15px rgba(240, 138, 93, 0.1);
    background-color: rgba(240, 138, 93, 0.05);
  }
  
  .news-card:hover .news-title {
    color: #f08a5d;
  }
  
  .news-card:hover .news-hover-effect {
    transform: scaleX(1);
  }
  
  .news-card:hover .news-read-more {
    transform: translateX(3px);
  }
  
  .news-read-more {
    transition: transform 0.3s ease;
  }
  
  @media (max-width: 768px) {
    .news-grid {
      grid-template-columns: repeat(auto-fill, minmax(240px, 1fr)) !important;
      gap: 12px !important;
    }
    
    .news-card {
      padding: 12px !important;
    }
    
    .news-title {
      font-size: 14px !important;
      height: 38px !important;
    }
  }
  
  @media (max-width: 576px) {
    .news-grid {
      grid-template-columns: 1fr !important;
    }
    
    .news-card {
      padding: 12px !important;
    }
    
    .news-date {
      font-size: 11px !important;
      padding: 3px 8px !important;
    }
  }
</style>
        
        </section>
    
        <section class="col-md-12 col-xl-4">
        
        
    <section>
      <div class="card welcome-card">
        <div class="card-body">
          <div style="position: relative; z-index: 2;">
            <h4 style="font-size: 1.25rem; font-weight: 700; color: #2d3436; margin-bottom: 1.25rem;">欢迎回来，喵喵</h4>
            <p style="font-size: 0.9rem; color: #636e72; margin-bottom: 1.5rem;">橘喵云为您提供专业的IDC服务，随时随地管理您的云资源。</p>
          </div>
          
          <div style="margin: 1.5rem 0; position: relative; z-index: 5;">
            <div style="text-align: center; margin-bottom: 1rem;">
  {if $Userinfo.user.qq}
    <img src="https://q1.qlogo.cn/g?b=qq&nk={$Userinfo.user.qq}&s=640" style="width: 62px; height: 62px; border-radius: 50%; object-fit: cover; box-shadow: none; border: 2px solid #fafafa; overflow: hidden;" alt="用户头像">
  {else}
    <div style="width: 62px; height: 62px; border-radius: 50%; background: #fafafa; color: #09090b; display: flex; align-items: center; justify-content: center; font-size: 28px; font-weight: 600; margin: 0 auto; box-shadow: none; border: 2px solid #fafafa;">
      {if preg_match("/^[0-9]*[A-Za-z]+$/is", substr($Userinfo.user.username,0,1))} 
        {$Userinfo.user.username|substr=0,1|upper} 
      {elseif preg_match("/^[\x7f-\xff]*$/", substr($Userinfo.user.username,0,3))} 
        {$Userinfo.user.username|substr=0,3}
      {else}
        {$Userinfo.user.username|substr=0,1|upper} 
      {/if}
    </div>
  {/if}
</div>
            
            <div style="text-align: center;">
              <div style="margin-bottom: 0.5rem;">
                <span style="font-size: 1.2rem; font-weight: 600; color: #2d3436; margin-right: 0.5rem;">{$Userinfo.user.username}</span>
                {if $Userinfo.user.certifi.status!=1}
                  <span class="badge badge-dark">未实名</span>
                {else}
                  <span class="badge badge-success">已实名</span>
                {/if}
              </div>
              <div style="font-size: 0.9rem; color: #636e72; margin-bottom: 0.3rem;">
                账户ID: {$Userinfo.user.id}
              </div>
              <div style="font-size: 0.9rem; color: #636e72;">
                联系电话: {if $Userinfo.user.phonenumber}{$Userinfo.user.phonenumber|substr=0,3}***{$Userinfo.user.phonenumber|substr=7}{else}暂未绑定{/if}
              </div>
            </div>
          </div>
          
          <div style="display: flex; justify-content: space-around; margin: 1.5rem 0; position: relative; z-index: 5;">
            <div style="display: flex; flex-direction: column; align-items: center;">
              <a href="security" style="width: 40px; height: 40px; border-radius: 50%; background-color: {if $Userinfo.user.certifi.status!=1}#aaa{else}#fafafa{/if}; color: {if $Userinfo.user.certifi.status!=1}white{else}#09090b{/if}; display: flex; align-items: center; justify-content: center; font-size: 1.2rem; margin-bottom: 0.5rem;">
                <i class="bx bx-check-shield"></i>
              </a>
              <div style="text-align: center; font-size: 0.75rem; color: #636e72;">实名认证</div>
            </div>
            <div style="display: flex; flex-direction: column; align-items: center;">
              <a href="security" style="width: 40px; height: 40px; border-radius: 50%; background-color: {if !$Userinfo.user.phonenumber}#aaa{else}#fafafa{/if}; color: {if !$Userinfo.user.phonenumber}white{else}#09090b{/if}; display: flex; align-items: center; justify-content: center; font-size: 1.2rem; margin-bottom: 0.5rem;">
                <i class="bx bx-phone-call"></i>
              </a>
              <div style="text-align: center; font-size: 0.75rem; color: #636e72;">手机绑定</div>
            </div>
            <div style="display: flex; flex-direction: column; align-items: center;">
              <a href="security" style="width: 40px; height: 40px; border-radius: 50%; background-color: {if !$Userinfo.user.email}#aaa{else}#fafafa{/if}; color: {if !$Userinfo.user.email}white{else}#09090b{/if}; display: flex; align-items: center; justify-content: center; font-size: 1.2rem; margin-bottom: 0.5rem;">
                <i class="bx bx-mail-send"></i>
              </a>
              <div style="text-align: center; font-size: 0.75rem; color: #636e72;">邮箱绑定</div>
            </div>
          </div>
          
          <hr style="margin: 1rem 0; border-color: rgba(0, 0, 0, 0.05);">
          
          <div style="display: flex; justify-content: space-around; align-items: center; position: relative; z-index: 5; margin-top: 1rem; padding: 1rem 0; background-color: #111113; border: 1px solid #27272a; border-radius: 10px;">
            <a href="supporttickets" style="display: flex; flex-direction: column; align-items: center; text-decoration: none; color: #2d3436; padding: 0.5rem 1rem; transition: all 0.3s;">
              <div style="font-size: 1.5rem; font-weight: 700; margin-bottom: 0.3rem; background-color: #fafafa; color: #09090b; width: 40px; height: 40px; display: flex; align-items: center; justify-content: center; border-radius: 50%; box-shadow: none;">
                {$ClientArea.index.ticket_count}
              </div>
              <span style="font-size: 0.85rem; color: #2d3436; text-align: center; font-weight: 500;">{$Lang.pending_work_order}</span>
            </a>
            <a href="billing" style="display: flex; flex-direction: column; align-items: center; text-decoration: none; color: #2d3436; padding: 0.5rem 1rem; transition: all 0.3s;">
              <div style="font-size: 1.5rem; font-weight: 700; margin-bottom: 0.3rem; background-color: #fafafa; color: #09090b; width: 40px; height: 40px; display: flex; align-items: center; justify-content: center; border-radius: 50%; box-shadow: none;">
                {$ClientArea.index.order_count}
              </div>
              <span style="font-size: 0.85rem; color: #2d3436; text-align: center; font-weight: 500;">{$Lang.unpaid_order}</span>
            </a>
            <a href="service" style="display: flex; flex-direction: column; align-items: center; text-decoration: none; color: #2d3436; padding: 0.5rem 1rem; transition: all 0.3s;">
              <div style="font-size: 1.5rem; font-weight: 700; margin-bottom: 0.3rem; background-color: #fafafa; color: #09090b; width: 40px; height: 40px; display: flex; align-items: center; justify-content: center; border-radius: 50%; box-shadow: none;">
                {$ClientArea.index.host}
              </div>
              <span style="font-size: 0.85rem; color: #2d3436; text-align: center; font-weight: 500;">{$Lang.number_of_products}</span>
            </a>
          </div>
        </div>
      </div>
    </section>
          
          <section>
            <div class="card asset-card">
              <div class="card-body">
                <div class="decoration decoration-2"></div>
                <h4 class="card-title">账户资产</h4>
                <div class="d-flex h100p">
                  <div class="d-flex flex-column align-items-center justify-content-center flex1">
                    <div class="w-100 h-100 d-flex justify-content-center" id="balanceCharts"></div>
                  </div>
                  <div class="d-flex flex-column justify-content-center flex1">
                    <span class="d-inline-flex fz-12 text-black-50 mb-2">{$Lang.records_of_consumption}</span>
                    <span class="d-inline-flex fz-14 text-black-80">{$Lang.consumption_this_month}：{$ClientArea.index.intotal}</span>
                    <span class="d-inline-flex fz-14 text-black-80">30天内新实例：{$ClientArea.product_num_day_30}</span>
                    <span class="d-inline-flex fz-12 text-black-50 mt-4 mb-2">{$Lang.order_records}</span>
                    <span class="d-inline-flex fz-14 text-black-80">{$Lang.unpaid}：{$ClientArea.index.invoice_unpaid}</span>
                    {if $ClientArea.index.allow_recharge == '1'}
                    <a href="/addfunds" class="btn btn-primary mt-5 w-50 pulse">{$Lang.recharge}</a>
                    {/if}
                  </div>
                </div>
              </div>
            </div>
          </section>
          
          <section>
  <div class="card todo-card">
    <div class="card-body">
      <div class="decoration decoration-1"></div>
      <div class="decoration decoration-2"></div>
      <h4 class="card-title">待办事项</h4>
      <div class="todo-items-container">
        {if $ClientArea.index.order_count > 0}
          <a class="todo-item todo-warning" href="/billing?status=Unpaid">
            <div class="todo-icon">
              <i class="bx bx-receipt"></i>
            </div>
            <div class="todo-content">
              <div class="todo-title">未支付订单</div>
              <div class="todo-description">您有 <span class="todo-count">{$ClientArea.index.order_count}</span> 个未支付订单，请及时处理</div>
            </div>
            <div class="todo-arrow">
              <i class="bx bx-chevron-right"></i>
            </div>
          </a>
        {else}
          <div class="todo-item todo-completed">
            <div class="todo-icon">
              <i class="bx bx-receipt"></i>
            </div>
            <div class="todo-content">
              <div class="todo-title">未支付订单</div>
              <div class="todo-description">您已结清所有款项</div>
            </div>
            <div class="todo-check">
              <i class="bx bx-check"></i>
            </div>
          </div>
        {/if}
        
        {if $ClientArea.index.ticket_count > 0}
          <a class="todo-item todo-warning" href="/supporttickets">
            <div class="todo-icon">
              <i class="bx bx-conversation"></i>
            </div>
            <div class="todo-content">
              <div class="todo-title">待处理工单</div>
              <div class="todo-description">您有 <span class="todo-count">{$ClientArea.index.ticket_count}</span> 个待处理工单，请前往工单中心</div>
            </div>
            <div class="todo-arrow">
              <i class="bx bx-chevron-right"></i>
            </div>
          </a>
        {else}
          <div class="todo-item todo-completed">
            <div class="todo-icon">
              <i class="bx bx-conversation"></i>
            </div>
            <div class="todo-content">
              <div class="todo-title">待处理工单</div>
              <div class="todo-description">您暂无待处理工单</div>
            </div>
            <div class="todo-check">
              <i class="bx bx-check"></i>
            </div>
          </div>
        {/if}
        
        {if $Userinfo.user.qq}
          <div class="todo-item todo-completed">
            <div class="todo-icon">
              <i class="bx bx-user-check"></i>
            </div>
            <div class="todo-content">
              <div class="todo-title">QQ账户</div>
              <div class="todo-description">您已成功关联QQ账户</div>
            </div>
            <div class="todo-check">
              <i class="bx bx-check"></i>
            </div>
          </div>
        {else}
          <a class="todo-item todo-warning" href="/details">
            <div class="todo-icon">
              <i class="bx bx-user-plus"></i>
            </div>
            <div class="todo-content">
              <div class="todo-title">QQ账户</div>
              <div class="todo-description">您没有为您的账号关联QQ，请前往填写</div>
            </div>
            <div class="todo-arrow">
              <i class="bx bx-chevron-right"></i>
            </div>
          </a>
        {/if}
        
        {if !$ClientArea.index.host_nav}
          <a class="todo-item todo-warning" href="/cart">
            <div class="todo-icon">
              <i class="bx bx-cart"></i>
            </div>
            <div class="todo-content">
              <div class="todo-title">产品购买</div>
              <div class="todo-description">您还没有购买任何产品，快去选购吧！</div>
            </div>
            <div class="todo-arrow">
              <i class="bx bx-chevron-right"></i>
            </div>
          </a>
        {/if}
      </div>
      
      <div class="todo-status">
        {if !$ClientArea.index.order_count && !$ClientArea.index.ticket_count && $Userinfo.user.qq && $ClientArea.index.host_nav}
          <div class="todo-status-completed">
            <div class="todo-status-icon">
              <i class="bx bx-check-circle"></i>
            </div>
            <div class="todo-status-text">太棒了！您已完成所有待办事项</div>
          </div>
        {elseif $ClientArea.index.order_count || $ClientArea.index.ticket_count || !$Userinfo.user.qq || !$ClientArea.index.host_nav}
          <div class="todo-status-pending">
            <div class="todo-status-icon">
              <i class="bx bx-time"></i>
            </div>
            <div class="todo-status-text">您还有未完成的待办事项，请尽快处理</div>
          </div>
        {/if}
      </div>
    </div>
  </div>
  
  <style>
    .todo-items-container {
      margin-top: 15px;
      display: flex;
      flex-direction: column;
      gap: 10px;
    }
    
    .todo-item {
      display: flex;
      align-items: center;
      padding: 12px 15px;
      border-radius: 10px;
      transition: all 0.3s ease;
      position: relative;
      overflow: hidden;
      text-decoration: none;
    }
    
    .todo-warning {
      background-color: rgba(254, 211, 48, 0.2);
      border: 1px solid rgba(254, 211, 48, 0.3);
    }
    
    .todo-warning:hover {
      background-color: rgba(254, 211, 48, 0.25);
      transform: translateY(-2px);
      box-shadow: 0 4px 12px rgba(254, 211, 48, 0.2);
    }
    
    .todo-completed {
      background-color: rgba(38, 222, 129, 0.1);
      border: 1px solid rgba(38, 222, 129, 0.2);
    }
    
    .todo-icon {
      width: 36px;
      height: 36px;
      min-width: 36px;
      border-radius: 8px;
      display: flex;
      align-items: center;
      justify-content: center;
      margin-right: 12px;
      font-size: 18px;
      flex-shrink: 0;
    }
    
    .todo-warning .todo-icon {
      background-color: rgba(254, 211, 48, 0.35);
      color: #e5a800;
      box-shadow: 0 2px 5px rgba(254, 211, 48, 0.25);
    }
    
    .todo-completed .todo-icon {
      background-color: rgba(38, 222, 129, 0.2);
      color: #1db567;
      box-shadow: 0 2px 5px rgba(38, 222, 129, 0.15);
    }
    
    .todo-content {
      flex: 1;
      min-width: 0;
    }
    
    .todo-title {
      font-weight: 600;
      font-size: 14px;
      color: #2d3436;
      margin-bottom: 4px;
    }
    
    .todo-description {
      font-size: 12px;
      color: #636e72;
      white-space: nowrap;
      overflow: hidden;
      text-overflow: ellipsis;
    }
    
    .todo-count {
      display: inline-block;
      background-color: #e5a800;
      color: white;
      font-weight: 600;
      padding: 1px 6px;
      border-radius: 10px;
      font-size: 11px;
      box-shadow: 0 1px 3px rgba(254, 211, 48, 0.3);
    }
    
    .todo-arrow {
      width: 24px;
      height: 24px;
      min-width: 24px;
      border-radius: 50%;
      background-color: rgba(254, 211, 48, 0.25);
      display: flex;
      align-items: center;
      justify-content: center;
      margin-left: 10px;
      color: #e5a800;
      transition: all 0.3s ease;
      flex-shrink: 0;
    }
    
    .todo-warning:hover .todo-arrow {
      background-color: #e5a800;
      color: white;
      transform: translateX(3px);
      box-shadow: 0 2px 5px rgba(254, 211, 48, 0.3);
    }
    
    .todo-check {
      width: 24px;
      height: 24px;
      min-width: 24px;
      border-radius: 50%;
      background-color: rgba(38, 222, 129, 0.2);
      display: flex;
      align-items: center;
      justify-content: center;
      margin-left: 10px;
      color: #1db567;
      flex-shrink: 0;
      box-shadow: 0 1px 3px rgba(38, 222, 129, 0.2);
    }
    
    .todo-status {
      margin-top: 15px;
      padding: 12px;
      border-radius: 10px;
      text-align: center;
    }
    
    .todo-status-completed {
      display: flex;
      align-items: center;
      justify-content: center;
      background-color: rgba(38, 222, 129, 0.1);
      border: 1px solid rgba(38, 222, 129, 0.2);
      padding: 10px;
      border-radius: 10px;
    }
    
    .todo-status-pending {
      display: flex;
      align-items: center;
      justify-content: center;
      background-color: rgba(254, 211, 48, 0.15);
      border: 1px solid rgba(254, 211, 48, 0.25);
      padding: 10px;
      border-radius: 10px;
    }
    
    .todo-status-icon {
      font-size: 18px;
      margin-right: 8px;
    }
    
    .todo-status-completed .todo-status-icon {
      color: #1db567;
    }
    
    .todo-status-pending .todo-status-icon {
      color: #e5a800;
    }
    
    .todo-status-text {
      font-size: 13px;
      font-weight: 500;
      color: #2d3436;
    }
    
    @media (max-width: 576px) {
      .todo-item {
        padding: 10px 12px;
      }
      
      .todo-icon {
        width: 32px;
        height: 32px;
        min-width: 32px;
        font-size: 16px;
        margin-right: 10px;
      }
      
      .todo-title {
        font-size: 13px;
      }
      
      .todo-description {
        font-size: 11px;
      }
    }
  </style>
</section>
        
        </section>
    
    </div>
    
    <script>
    document.addEventListener("DOMContentLoaded", function() {
      const titles = document.querySelectorAll(".notice_item_title");
      titles.forEach(function(title) {
        title.style.display = "block";
        title.style.overflow = "hidden";
        title.style.textOverflow = "ellipsis";
        title.style.whiteSpace = "nowrap";
        title.style.width = "100%";
        title.style.color = "#2d3436";
        title.style.fontSize = "0.95rem";
        title.style.fontWeight = "500";
        title.style.transition = "color 0.3s ease, transform 0.3s ease";
      });
    });
    </script>

<style>
  .user-center_product:hover {
    transform: translateY(-3px);
    background-color: rgba(240, 138, 93, 0.08);
    box-shadow: 0 5px 15px rgba(240, 138, 93, 0.1);
  }
  
  .user-center_product:hover .product-name {
    color: #f08a5d;
  }
  
  .user-center_product:hover .product-count {
    background-color: rgba(240, 138, 93, 0.15);
    transform: translateX(3px);
    box-shadow: 0 2px 5px rgba(240, 138, 93, 0.15);
  }
  
  .user-center_product:hover .product-arrow {
    opacity: 1;
    background-color: rgba(240, 138, 93, 0.2);
  }
  
  .user-center_product:hover .product-arrow i {
    animation: arrow-bounce 1s infinite;
  }
  
  @keyframes arrow-bounce {
    0%, 100% { transform: translateX(0); }
    50% { transform: translateX(3px); }
  }
  
  @media (max-width: 768px) {
    .user-center_product_grid {
      grid-template-columns: repeat(auto-fill, minmax(220px, 1fr)) !important;
      gap: 12px !important;
    }
    
    .product-icon {
      width: 38px !important;
      height: 38px !important;
      min-width: 38px !important;
      height: 38px !important;
      min-height: 38px !important;
      margin-right: 12px !important;
    }
    
    .product-name {
      font-size: 14px !important;
      margin-bottom: 6px !important;
    }
    
    .product-count {
      font-size: 11px !important;
      padding: 3px 8px 3px 16px !important;
    }
  }
  
  @media (max-width: 576px) {
    .user-center_product_grid {
      grid-template-columns: 1fr !important;
    }
    
    .user-center_product {
      padding: 14px !important;
    }
    
    .product-icon {
      width: 36px !important;
      height: 36px !important;
      min-width: 36px !important;
      height: 36px !important;
      min-height: 36px !important;
      margin-right: 10px !important;
    }
    
    .product-name {
      font-size: 13px !important;
      margin-bottom: 5px !important;
    }
    
    .product-count {
      font-size: 10px !important;
      padding: 2px 7px 2px 16px !important;
    }
    
    .empty-instances-content {
      flex-direction: column !important;
    }
    
    .empty-instances-content .btn {
      margin-left: 0 !important;
      width: 100% !important;
    }
  }
</style>

<script>
// 响应式内容排序只使用 CSS，不移动服务端渲染出的资源 DOM。
(function() {
  // CSS排序方法 - 只应用于移动端
  function applyCssOrder() {
    const style = document.createElement('style');
    style.textContent = `
      @media (max-width: 767px) {
        .clientarea-dashboard-row {
          display: flex !important;
          flex-direction: column !important;
        }
        
        /* 欢迎卡片 */
        .clientarea-dashboard-row > section:nth-of-type(4) {
          order: 1 !important;
          margin-bottom: 15px !important;
        }
        
        /* 已激活实例 */
        .clientarea-dashboard-row > section:nth-of-type(1) {
          order: 2 !important;
          margin-bottom: 15px !important;
        }
        
        /* 待办事项 */
        .clientarea-dashboard-row > section:nth-of-type(6) {
          order: 3 !important;
          margin-bottom: 15px !important;
        }
        
        /* 账户资产 */
        .clientarea-dashboard-row > section:nth-of-type(5) {
          order: 4 !important;
          margin-bottom: 15px !important;
        }
        
        /* 资源列表 */
        .clientarea-dashboard-row > section:nth-of-type(2) {
          order: 5 !important;
          margin-bottom: 15px !important;
        }
        
        /* 公告 */
        .clientarea-dashboard-row > section:nth-of-type(3) {
          order: 6 !important;
          margin-bottom: 15px !important;
        }
        
        /* 确保所有section都是可见的 */
        .clientarea-dashboard-row > section {
          display: block !important;
          width: 100% !important;
          max-width: 100% !important;
          opacity: 1 !important;
          visibility: visible !important;
        }
      }
    `;
    document.head.appendChild(style);
  }
  
  // 性能优化：延迟加载非关键资源
  function optimizePageLoad() {
    // 延迟加载非关键图片
    const lazyImages = document.querySelectorAll('img[data-src]');
    if (lazyImages.length > 0) {
      const lazyLoadImages = () => {
        lazyImages.forEach(img => {
          if (img.dataset.src) {
            img.src = img.dataset.src;
            img.removeAttribute('data-src');
          }
        });
      };
      
      // 使用Intersection Observer API进行懒加载
      if ('IntersectionObserver' in window) {
        const imageObserver = new IntersectionObserver((entries) => {
          entries.forEach(entry => {
            if (entry.isIntersecting) {
              const img = entry.target;
              if (img.dataset.src) {
                img.src = img.dataset.src;
                img.removeAttribute('data-src');
              }
              imageObserver.unobserve(img);
            }
          });
        });
        
        lazyImages.forEach(img => imageObserver.observe(img));
      } else {
        // 回退到setTimeout
        setTimeout(lazyLoadImages, 1000);
      }
    }
    
    // 优化CSS动画
    const style = document.createElement('style');
    style.textContent = `
      @media (max-width: 767px) {
        /* 减少不必要的动画和过渡效果 */
        * {
          transition-duration: 0.2s !important;
        }
        
        /* 使用硬件加速 */
        .card, .user-center_product, .news-card {
          transform: translateZ(0);
          will-change: transform;
        }
      }
    `;
    document.head.appendChild(style);
  }
  
  // 执行优化和排序
  function init() {
    // 只使用 CSS 做移动端排序，避免清空/克隆 DOM 导致服务端变量和资源列表丢失。
    applyCssOrder();
    optimizePageLoad();
  }
  
  // 初始化
  init();
})();

// 优化快捷导航
(function() {
  function initQuickNav() {
    const quickNav = document.querySelector('.mobile-quick-nav');
    if (!quickNav) return;
    
    // 设置初始状态
    quickNav.style.transition = 'transform 0.3s ease, opacity 0.3s ease';
    quickNav.style.transform = 'translateY(100%)';
    quickNav.style.opacity = '0';
    
    // 优化滚动事件处理
    let lastScrollY = window.scrollY;
    let ticking = false;
    
    function handleScroll() {
      lastScrollY = window.scrollY;
      
      if (!ticking) {
        requestAnimationFrame(() => {
          if (lastScrollY > 100) {
            quickNav.style.transform = 'translateY(0)';
            quickNav.style.opacity = '1';
          } else {
            quickNav.style.transform = 'translateY(100%)';
            quickNav.style.opacity = '0';
          }
          ticking = false;
        });
        
        ticking = true;
      }
    }
    
    // 使用passive: true提高滚动性能
    window.addEventListener('scroll', handleScroll, { passive: true });
    
    // 触发一次以设置初始状态
    handleScroll();
  }
  
  // 初始化快捷导航
  if (document.readyState === 'loading') {
    document.addEventListener('DOMContentLoaded', initQuickNav);
  } else {
    initQuickNav();
  }
})();
</script>

<style>
/* 强制排序样式 - 只应用于移动端 */
@media (max-width: 767px) {
  /* 使用!important确保这些样式优先级最高 */
  .clientarea-dashboard-row {
    display: flex !important;
    flex-direction: column !important;
  }
  
  /* 欢迎卡片 */
  .clientarea-dashboard-row > section:nth-of-type(4) {
    order: 1 !important;
    margin-bottom: 15px !important;
  }
  
  /* 已激活实例 */
  .clientarea-dashboard-row > section:nth-of-type(1) {
    order: 2 !important;
    margin-bottom: 15px !important;
  }
  
  /* 待办事项 */
  .clientarea-dashboard-row > section:nth-of-type(6) {
    order: 3 !important;
    margin-bottom: 15px !important;
  }
  
  /* 账户资产 */
  .clientarea-dashboard-row > section:nth-of-type(5) {
    order: 4 !important;
    margin-bottom: 15px !important;
  }
  
  /* 资源列表 */
  .clientarea-dashboard-row > section:nth-of-type(2) {
    order: 5 !important;
    margin-bottom: 15px !important;
  }
  
  /* 公告 */
  .clientarea-dashboard-row > section:nth-of-type(3) {
    order: 6 !important;
    margin-bottom: 15px !important;
  }
  
  /* 确保所有section都是可见的 */
  .clientarea-dashboard-row > section {
    display: block !important;
    width: 100% !important;
    max-width: 100% !important;
    opacity: 1 !important;
    visibility: visible !important;
  }
  
  /* 性能优化 */
  * {
    transition-duration: 0.2s !important;
  }
  
  .card, .user-center_product, .news-card {
    transform: translateZ(0);
    will-change: transform;
    backface-visibility: hidden;
  }
  
  /* 减少不必要的动画效果 */
  .card:hover, .user-center_product:hover, .news-card:hover {
    transform: translateY(-2px) !important;
  }
  
  /* 优化图片加载 */
  img {
    content-visibility: auto;
  }
}

/* 确保快捷导航在底部正确显示 */
.mobile-quick-nav {
  z-index: 1050 !important;
  box-shadow: 0 -2px 10px rgba(0, 0, 0, 0.15) !important;
}

/* 优化暗色模式下的快捷导航 */
.dark .mobile-quick-nav {
  background-color: #1a1a1a !important;
  box-shadow: 0 -2px 10px rgba(0, 0, 0, 0.3) !important;
}

/* shadcn dark content styles */
:root {
  --primary: #fafafa;
  --secondary: #a1a1aa;
  --border: #27272a;
  --muted: #18181b;
  --background: #000;
  --foreground: #fafafa;
}

html,
body,
.main-content,
.page-content,
.container-fluid {
  max-width: 100%;
  overflow-x: hidden;
  background: #000 !important;
  color: #fafafa;
  overscroll-behavior-x: none;
}

.card,
.welcome-card,
.asset-card,
.todo-card,
#sourceListBox .card {
  background: #09090b !important;
  border: 1px solid #27272a !important;
  border-radius: 8px !important;
  box-shadow: none !important;
}

.card:hover {
  transform: none !important;
  box-shadow: none !important;
}

.card-body {
  background: transparent !important;
}

.card-title,
.instances-title,
h4, h5 {
  color: #fafafa !important;
}

.decoration,
.news-hover-effect {
  display: none !important;
}

.user-center_product,
.news-card,
.todo-item,
.todo-status-completed,
.todo-status-pending,
.empty-instances,
.empty-news {
  background: #09090b !important;
  border: 1px solid #27272a !important;
  border-radius: 8px !important;
  box-shadow: none !important;
  color: #fafafa !important;
}

.user-center_product:hover,
.news-card:hover,
.todo-warning:hover {
  transform: none !important;
  box-shadow: none !important;
}

.product-name,
.news-title,
.todo-title,
.todo-status-text {
  color: #fafafa !important;
}

.product-count,
.news-category,
.news-time,
.todo-description {
  color: #a1a1aa !important;
}

.product-icon,
.product-arrow,
.todo-icon,
.todo-arrow,
.todo-check,
.news-date {
  background: #18181b !important;
  border: 1px solid #27272a !important;
  box-shadow: none !important;
  color: #fafafa !important;
}

.active-instance-card {
  display: flex !important;
  align-items: center;
  gap: 14px;
  padding: 16px !important;
  min-width: 0;
  text-decoration: none !important;
}

.active-instance-card .product-icon {
  display: inline-flex;
  align-items: center;
  justify-content: center;
  width: 42px;
  height: 42px;
  flex: 0 0 42px;
  border-radius: 10px;
}

.active-instance-card .product-info {
  display: flex;
  flex: 1 1 auto;
  min-width: 0;
  flex-direction: column;
  gap: 8px;
}

.active-instance-card .product-name {
  overflow: hidden;
  text-overflow: ellipsis;
  white-space: nowrap;
}

.active-instance-card .product-count {
  width: fit-content;
  max-width: 100%;
}

.active-instance-card .active-instance-ip {
  width: auto;
  max-width: 120px;
  padding: 6px 8px;
  border-radius: 9999px;
  overflow: hidden;
  color: #a1a1aa !important;
  font-size: 12px;
  text-overflow: ellipsis;
  white-space: nowrap;
}

.todo-warning .todo-icon,
.todo-warning .todo-arrow,
.todo-status-pending {
  background: rgba(250, 204, 21, 0.10) !important;
  border-color: rgba(250, 204, 21, 0.28) !important;
  color: #fde68a !important;
}

.todo-completed .todo-icon,
.todo-status-completed,
.todo-check {
  background: rgba(34, 197, 94, 0.12) !important;
  border-color: rgba(34, 197, 94, 0.32) !important;
  color: #86efac !important;
}

.todo-count,
.product-count {
  background: #18181b !important;
  border: 1px solid #27272a !important;
  border-radius: 9999px !important;
  color: #fafafa !important;
}

.card .btn-primary,
.asset-card .btn-primary,
.welcome-card .btn-primary,
.empty-instances .btn-primary,
.view-more-link {
  background: #fafafa !important;
  border: 1px solid #fafafa !important;
  border-radius: 6px !important;
  color: #09090b !important;
  font-weight: 500 !important;
}

.card .btn-primary:hover,
.asset-card .btn-primary:hover,
.welcome-card .btn-primary:hover,
.empty-instances .btn-primary:hover,
.view-more-link:hover {
  background: #e5e5e5 !important;
  border-color: #e5e5e5 !important;
}

.welcome-card [style*="#f08a5d"],
.welcome-card [style*="240, 138, 93"] {
  box-shadow: none !important;
}

a {
  color: #fafafa !important;
}

.form-control,
input[type="text"],
input[type="password"],
input[type="email"],
select {
  background: #000 !important;
  border: 1px solid #27272a !important;
  border-radius: 6px !important;
  color: #fafafa !important;
}

.form-control::placeholder {
  color: #71717a !important;
}

.table,
table,
thead,
tbody,
tr,
td,
th {
  background: #09090b !important;
  border-color: #27272a !important;
  color: #fafafa !important;
}

.table thead th,
thead th {
  background: #18181b !important;
  color: #d4d4d8 !important;
}

.table-footer,
.table-tools,
.table-pagination,
.table-pageinfo,
#sourceListBox .table-footer {
  background: #09090b !important;
  border-color: #27272a !important;
  color: #a1a1aa !important;
}

.page-link {
  background: #09090b !important;
  border: 1px solid #27272a !important;
  border-radius: 6px !important;
  color: #fafafa !important;
}

.page-item.active .page-link {
  background: #fafafa !important;
  border-color: #fafafa !important;
  color: #09090b !important;
}

#limitSel {
  background: #000 !important;
  border: 1px solid #27272a !important;
  border-radius: 6px !important;
  color: #fafafa !important;
}

.mobile-quick-nav {
  background: #09090b !important;
  border-top: 1px solid #27272a !important;
  box-shadow: none !important;
}

.quick-nav-item,
.quick-nav-item i,
.quick-nav-item span {
  color: #d4d4d8 !important;
}

#balanceCharts { min-height: 190px; }

/* clientarea dark refinement: remove legacy orange accents from selected modules */
.empty-instances,
.empty-instances.enhanced,
.empty-instances .empty-instances-content {
  background: #09090b !important;
  border-color: #27272a !important;
  box-shadow: none !important;
}

.empty-instances .bx,
.empty-instances .bx-server,
.empty-instances i,
.empty-instances .server-icon {
  color: #fafafa !important;
}

.empty-instances span,
.empty-instances p,
.empty-instances .empty-text,
.empty-instances .text-muted {
  color: #d4d4d8 !important;
}

#sourceListBox,
#sourceListBox .card,
#sourceListBox .card-body,
#sourceListBox .dataTables_wrapper,
#sourceListBox .table-responsive,
#sourceListBox .custom-styled-table,
#sourceListBox .table,
#sourceListBox table {
  background: #09090b !important;
  border-color: #27272a !important;
  box-shadow: none !important;
}

#sourceListBox .custom-styled-table,
#sourceListBox .table,
#sourceListBox table {
  border: 1px solid #27272a !important;
  border-collapse: separate !important;
  border-spacing: 0 !important;
}

#sourceListBox thead,
#sourceListBox thead tr,
#sourceListBox thead th {
  background: #18181b !important;
  border-color: #27272a !important;
  color: #fafafa !important;
  box-shadow: none !important;
}

#sourceListBox tbody,
#sourceListBox tbody tr,
#sourceListBox tbody td,
#sourceListBox .dataTables_empty {
  background: #09090b !important;
  border-color: #27272a !important;
  color: #a1a1aa !important;
}

#sourceListBox .dataTables_wrapper .row,
#sourceListBox .pagination-container,
#sourceListBox .dataTables_info,
#sourceListBox .dataTables_length,
#sourceListBox .dataTables_paginate {
  background: transparent !important;
  border-color: #27272a !important;
  color: #d4d4d8 !important;
  box-shadow: none !important;
}

#sourceListBox .dataTables_info span,
#sourceListBox .dataTables_length span,
#sourceListBox .dataTables_paginate span {
  color: #fafafa !important;
}

#sourceListBox .dataTables_length select,
#sourceListBox select,
#sourceListBox .custom-select,
#resourceSearch {
  background: #000 !important;
  border-color: #27272a !important;
  color: #fafafa !important;
  box-shadow: none !important;
}

#resourceSearch:focus,
#sourceListBox .dataTables_length select:focus,
#sourceListBox select:focus {
  border-color: #fafafa !important;
  box-shadow: 0 0 0 2px rgba(250, 250, 250, 0.12) !important;
}

#resourceSearch::placeholder {
  color: #a1a1aa !important;
}

#sourceListBox .bx-search,
#sourceListBox .fa-search,
#sourceListBox .input-group-text,
#sourceListBox [class*="search"] i {
  color: #fafafa !important;
}

#sourceListBox .view-toggle-btn,
#sourceListBox .view-toggle-btn.active {
  background: #09090b !important;
  border-color: #27272a !important;
  color: #fafafa !important;
  box-shadow: none !important;
}

#sourceListBox .view-toggle-btn.active {
  background: #fafafa !important;
  border-color: #fafafa !important;
  color: #09090b !important;
}

#sourceListBox .scroll-hint,
#sourceListBox .scroll-indicator {
  background: #18181b !important;
  border-color: #27272a !important;
  color: #d4d4d8 !important;
  box-shadow: none !important;
}

#sourceListBox .scroll-indicator-thumb {
  background: #fafafa !important;
  box-shadow: none !important;
}

#sourceListBox .resource-container,
#sourceListBox .resource-container *,
#sourceListBox .table-responsive,
#sourceListBox .table-responsive *,
#sourceListBox .custom-styled-table,
#sourceListBox .custom-styled-table *,
#sourceListBox table,
#sourceListBox table * {
  border-color: #27272a !important;
  box-shadow: none !important;
}

#sourceListBox .card-view,
#sourceListBox .resource-card {
  background: #09090b !important;
  border: 1px solid #27272a !important;
  border-radius: 8px !important;
  box-shadow: none !important;
  color: #fafafa !important;
}

#sourceListBox .resource-card:hover {
  transform: none !important;
  box-shadow: none !important;
}

#sourceListBox .resource-card .card-header {
  background: transparent !important;
  border-bottom: 1px solid #27272a !important;
  color: #fafafa !important;
}

#sourceListBox .resource-card .card-hostname,
#sourceListBox .resource-card .card-status,
#sourceListBox .resource-card .card-detail-value {
  color: #fafafa !important;
}

#sourceListBox .resource-card .card-detail-label,
#sourceListBox .resource-card .ip-badge {
  color: #a1a1aa !important;
}

#sourceListBox .resource-card .ip-badge {
  background: #18181b !important;
  border: 1px solid #27272a !important;
  border-radius: 6px !important;
}

#sourceListBox .resource-card .view-details-btn {
  background: #18181b !important;
  border: 1px solid #27272a !important;
  color: #fafafa !important;
}

#sourceListBox .resource-card .view-details-btn:hover {
  background: #27272a !important;
  border-color: #3f3f46 !important;
  color: #fafafa !important;
}

.news-read-more,
.news-read-more i,
.news-card:hover .news-read-more,
.news-card:hover .news-read-more i,
.card-title a[href="news"],
.card-title a[href="news"] i {
  color: #fafafa !important;
}

.news-date,
.news-card .news-date,
.news-card .news-date i {
  background: #18181b !important;
  border-color: #27272a !important;
  color: #fafafa !important;
}

.news-card .news-hover-effect {
  background: #fafafa !important;
}

.welcome-card a[href="security"] {
  background: #27272a !important;
  border: 1px solid #3f3f46 !important;
  color: #fafafa !important;
  box-shadow: none !important;
}

.welcome-card a[href="security"] i {
  color: #fafafa !important;
}

.welcome-card a[href="security"] + div {
  color: #d4d4d8 !important;
}

@media (max-width: 767px) {
  .page-content { padding: 88px 0 76px !important; }
  .container-fluid { padding-left: 12px !important; padding-right: 12px !important; }
  .user-center_product_grid, .news-grid { grid-template-columns: 1fr !important; gap: 10px !important; }
  .todo-description, .product-name, .news-title { height: auto !important; overflow-wrap: anywhere !important; white-space: normal !important; }
  .card .btn, .card .btn-primary, .view-more-link { width: 100% !important; }

  .instances-title {
    margin-bottom: 12px !important;
  }

  #activeInstancesGrid {
    min-height: 0 !important;
    padding-top: 2px !important;
  }

  #activeInstancesGrid,
  #activeInstancesGrid *,
  #activeInstancesGrid .user-center_product {
    box-sizing: border-box;
  }

  .clientarea-dashboard-row > section:nth-of-type(1) .card,
  .clientarea-dashboard-row > section:nth-of-type(1) .card-body {
    height: auto !important;
    max-height: none !important;
    overflow: visible !important;
  }

  #activeInstancesGrid {
    display: grid !important;
    grid-template-columns: 1fr !important;
    gap: 10px !important;
    height: auto !important;
    max-height: none !important;
    overflow: visible !important;
    margin-top: 12px !important;
  }

  #activeInstancesGrid .active-instance-card {
    display: grid !important;
    grid-template-columns: 38px minmax(0, 1fr);
    grid-template-areas:
      "icon info"
      "meta meta";
    align-items: flex-start !important;
    gap: 10px 12px !important;
    min-height: 0 !important;
    height: auto !important;
    padding: 12px !important;
    overflow: visible !important;
  }

  #activeInstancesGrid > .user-center_product:not(.active-instance-card) {
    align-items: flex-start !important;
    min-height: 0 !important;
    height: auto !important;
    padding: 12px !important;
    overflow: visible !important;
  }

  #activeInstancesGrid > .user-center_product:not(.active-instance-card) .product-info {
    min-width: 0 !important;
  }

  #activeInstancesGrid > .user-center_product:not(.active-instance-card) .product-name {
    display: -webkit-box !important;
    overflow: hidden !important;
    font-size: 14px !important;
    line-height: 1.35 !important;
    text-overflow: ellipsis !important;
    white-space: normal !important;
    overflow-wrap: anywhere !important;
    -webkit-box-orient: vertical;
    -webkit-line-clamp: 2;
  }

  #activeInstancesGrid .active-instance-card .product-icon {
    grid-area: icon;
    width: 38px !important;
    height: 38px !important;
    min-width: 38px !important;
    min-height: 38px !important;
    margin: 0 !important;
  }

  #activeInstancesGrid .active-instance-card .product-info {
    grid-area: info;
    min-width: 0 !important;
    gap: 7px !important;
  }

  #activeInstancesGrid .active-instance-card .product-name {
    display: -webkit-box !important;
    overflow: hidden !important;
    color: #fafafa !important;
    font-size: 14px !important;
    line-height: 1.35 !important;
    text-overflow: ellipsis !important;
    white-space: normal !important;
    overflow-wrap: anywhere !important;
    -webkit-box-orient: vertical;
    -webkit-line-clamp: 2;
  }

  #activeInstancesGrid .active-instance-card .product-count {
    max-width: 100% !important;
    padding: 4px 9px !important;
    font-size: 12px !important;
    line-height: 1 !important;
  }

  #activeInstancesGrid .active-instance-card .active-instance-ip {
    grid-area: meta;
    justify-self: stretch;
    max-width: none !important;
    width: 100% !important;
    height: auto !important;
    padding: 7px 10px !important;
    border-radius: 8px !important;
    text-align: left;
  }
}

</style>
