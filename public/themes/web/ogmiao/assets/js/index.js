function debounce(func, delay) {
  let timeout
  return function (...args) {
    clearTimeout(timeout)
    timeout = setTimeout(() => func.apply(this, args), delay)
  }
}

function handleResponsiveLayout() {
  const width = window.innerWidth
  const heroStats = document.querySelector(".hero-stats")
  if (heroStats) {
    if (width <= 480) {
      heroStats.style.gridTemplateColumns = "repeat(2, 1fr)"
      heroStats.style.display = "grid"
    } else if (width <= 768) {
      heroStats.style.gridTemplateColumns = "repeat(2, 1fr)"
      heroStats.style.display = "grid"
    } else {
      heroStats.style.display = "flex"
    }
  }
  const datacenterTabs = document.querySelector(".datacenter-tabs")
  if (datacenterTabs) {
    if (width <= 768) {
      datacenterTabs.style.flexWrap = "nowrap"
      datacenterTabs.style.overflowX = "auto"
      datacenterTabs.style.justifyContent = "flex-start"
      if (datacenterTabs.scrollWidth > datacenterTabs.clientWidth && !document.querySelector(".scroll-indicator")) {
        const scrollIndicator = document.createElement("div")
        scrollIndicator.className = "scroll-indicator"
        scrollIndicator.style.position = "absolute"
        scrollIndicator.style.bottom = "-15px"
        scrollIndicator.style.left = "50%"
        scrollIndicator.style.transform = "translateX(-50%)"
        scrollIndicator.style.fontSize = "0.7rem"
        scrollIndicator.style.color = "#aaa"
        scrollIndicator.style.opacity = "0.7"
        scrollIndicator.textContent = "← 滑动查看更多 →"
        datacenterTabs.style.position = "relative"
        datacenterTabs.appendChild(scrollIndicator)
        setTimeout(() => {
          scrollIndicator.style.transition = "opacity 0.5s ease"
          scrollIndicator.style.opacity = "0"
          setTimeout(() => {
            scrollIndicator.remove()
          }, 500)
        }, 3000)
      }
    } else {
      datacenterTabs.style.flexWrap = "wrap"
      datacenterTabs.style.overflowX = "visible"
      datacenterTabs.style.justifyContent = "center"
    }
  }
  const grids = [
    ".datacenter-grid",
    ".certificates-grid",
    ".clients-grid",
    ".news-grid",
    ".why-us-grid",
    ".contact-info-grid",
  ]
  grids.forEach((selector) => {
    const grid = document.querySelector(selector)
    if (grid) {
      if (width <= 768) {
        grid.style.gridTemplateColumns = "1fr"
      } else if (width <= 992) {
        grid.style.gridTemplateColumns = "repeat(2, 1fr)"
      } else {
        grid.style.gridTemplateColumns =
          selector === ".why-us-grid" || selector === ".contact-info-grid"
            ? "repeat(auto-fill, minmax(250px, 1fr))"
            : "repeat(auto-fill, minmax(350px, 1fr))"
      }
    }
  })
  const footerGrid = document.querySelector(".footer-grid")
  if (footerGrid) {
    if (width <= 768) {
      footerGrid.style.gridTemplateColumns = "1fr"
      document.querySelectorAll(".footer-col").forEach((col) => {
        col.style.textAlign = "center"
      })
      document.querySelectorAll(".footer-social").forEach((social) => {
        social.style.justifyContent = "center"
      })
    } else {
      footerGrid.style.gridTemplateColumns = "repeat(auto-fit, minmax(250px, 1fr))"
      document.querySelectorAll(".footer-col").forEach((col) => {
        col.style.textAlign = ""
      })
      document.querySelectorAll(".footer-social").forEach((social) => {
        social.style.justifyContent = ""
      })
    }
  }
  const beianInfo = document.querySelector(".beian-info")
  if (beianInfo) {
    if (width <= 768) {
      beianInfo.style.display = "flex"
      beianInfo.style.flexDirection = "column"
      beianInfo.style.alignItems = "center"
      beianInfo.style.gap = "0.5rem"
      document.querySelectorAll(".beian-info a").forEach((link) => {
        link.style.margin = "0"
      })
    } else {
      beianInfo.style.display = ""
      beianInfo.style.flexDirection = ""
      beianInfo.style.alignItems = ""
      beianInfo.style.gap = ""
      document.querySelectorAll(".beian-info a").forEach((link) => {
        link.style.margin = "0 10px"
      })
    }
  }
}

handleResponsiveLayout()
window.addEventListener(
  "resize",
  debounce(() => {
    handleResponsiveLayout()
  }, 250),
)

document.addEventListener("DOMContentLoaded", () => {
  const notificationBar = document.querySelector(".top-notification-bar")
  const closeButton = document.querySelector(".notification-close")
  if (notificationBar && closeButton) {
    const currentActivityId = "activity-2025-04-15"
    const notificationMessage = "开通预存折扣享低价高折扣"
    const closedActivityId = localStorage.getItem("closedActivityId")
    if (closedActivityId !== currentActivityId) {
      notificationBar.style.display = "block"
      const messageElement = notificationBar.querySelector(".notification-message")
      if (messageElement) {
        messageElement.textContent = notificationMessage
      }
    } else {
      notificationBar.style.display = "none"
    }
    closeButton.addEventListener("click", () => {
      notificationBar.style.height = notificationBar.offsetHeight + "px"
      void notificationBar.offsetHeight
      notificationBar.style.transition = "all 0.3s ease"
      notificationBar.style.height = "0"
      notificationBar.style.padding = "0"
      notificationBar.style.opacity = "0"
      setTimeout(() => {
        notificationBar.style.display = "none"
        localStorage.setItem("closedActivityId", currentActivityId)
      }, 300)
    })
  }
})

document.addEventListener("DOMContentLoaded", () => {
  // Initialize FAQ accordion effect
  const faqQuestions = document.querySelectorAll(".faq-question")

  // Product toggle functionality for datacenter sections - FIXED to work independently
  const productToggleButtons = document.querySelectorAll(".product-toggle-btn")
  productToggleButtons.forEach((button) => {
    button.addEventListener("click", function () {
      const isExpanded = this.getAttribute("aria-expanded") === "true"
      const productsList = this.nextElementSibling

      // Toggle only this specific product section
      if (isExpanded) {
        this.setAttribute("aria-expanded", "false")
        productsList.classList.add("collapsed")
        this.querySelector(".toggle-text").textContent = "查看产品配置"
        this.querySelector(".toggle-icon").textContent = "+"
      } else {
        this.setAttribute("aria-expanded", "true")
        productsList.classList.remove("collapsed")
        this.querySelector(".toggle-text").textContent = "收起产品配置"
        this.querySelector(".toggle-icon").textContent = "×"
      }
    })
  })
})

document.addEventListener("DOMContentLoaded", () => {
  function simpleLazyLoad() {
    const lazyImages = document.querySelectorAll("[data-bg], [data-src]")
    if ("IntersectionObserver" in window) {
      const imageObserver = new IntersectionObserver((entries) => {
        entries.forEach((entry) => {
          if (entry.isIntersecting) {
            const lazyImage = entry.target
            if (lazyImage.hasAttribute("data-src")) {
              lazyImage.src = lazyImage.dataset.src
              lazyImage.classList.add("loaded")
            }
            if (lazyImage.hasAttribute("data-bg")) {
              lazyImage.style.backgroundImage = `url('${lazyImage.dataset.bg}')`
              lazyImage.classList.add("loaded")
            }
            imageObserver.unobserve(lazyImage)
          }
        })
      })
      lazyImages.forEach((image) => imageObserver.observe(image))
    } else {
      lazyImages.forEach((image) => {
        if (image.hasAttribute("data-src")) {
          image.src = image.dataset.src
        }
        if (image.hasAttribute("data-bg")) {
          image.style.backgroundImage = `url('${image.dataset.bg}')`
        }
      })
    }
  }
  simpleLazyLoad()
})
;(() => {
  function initDatacenterTabs() {
    const tabs = document.querySelectorAll(".datacenter-tab")
    if (!tabs || tabs.length === 0) return
    tabs.forEach((tab) => {
      tab.removeEventListener("click", handleTabClick)
      tab.addEventListener("click", handleTabClick)
    })
  }

  function handleTabClick() {
    const region = this.getAttribute("data-region")
    if (!region) return
    document.querySelectorAll(".datacenter-tab").forEach((tab) => {
      tab.classList.remove("active")
      tab.setAttribute("aria-selected", "false")
    })
    this.classList.add("active")
    this.setAttribute("aria-selected", "true")
    document.querySelectorAll(".datacenter-content").forEach((content) => {
      content.classList.remove("active")
      content.setAttribute("hidden", "")
    })
    const targetContent = document.getElementById(region + "-content")
    if (targetContent) {
      targetContent.classList.add("active")
      targetContent.removeAttribute("hidden")
    }
  }

  if (document.readyState === "loading") {
    document.addEventListener("DOMContentLoaded", initDatacenterTabs)
  } else {
    initDatacenterTabs()
  }

  window.addEventListener("load", () => {
    setTimeout(initDatacenterTabs, 100)
  })
})()

document.addEventListener("DOMContentLoaded", () => {
  // 初始化FAQ手风琴效果
  const faqQuestions = document.querySelectorAll(".faq-question")
  faqQuestions.forEach((question) => {
    const newQuestion = question.cloneNode(true)
    question.parentNode.replaceChild(newQuestion, question)
    newQuestion.setAttribute("aria-expanded", "false")
    newQuestion.classList.add("collapsed")
    const targetId = newQuestion.getAttribute("data-target")
    if (targetId) {
      const targetCollapse = document.querySelector(targetId)
      if (targetCollapse) {
        targetCollapse.classList.remove("show")
        targetCollapse.style.maxHeight = "0"
      }
    }
    newQuestion.addEventListener("click", function (e) {
      e.preventDefault()
      const targetId = this.getAttribute("data-target")
      if (!targetId) return
      const targetCollapse = document.querySelector(targetId)
      if (!targetCollapse) return
      const isExpanded = this.getAttribute("aria-expanded") === "true"
      if (isExpanded) {
        this.setAttribute("aria-expanded", "false")
        this.classList.add("collapsed")
        targetCollapse.classList.remove("show")
        targetCollapse.style.maxHeight = "0"
      } else {
        faqQuestions.forEach((q) => {
          if (q !== this) {
            q.setAttribute("aria-expanded", "false")
            q.classList.add("collapsed")
            const qTargetId = q.getAttribute("data-target")
            if (qTargetId) {
              const qCollapse = document.querySelector(qTargetId)
              if (qCollapse) {
                qCollapse.classList.remove("show")
                qCollapse.style.maxHeight = "0"
              }
            }
          }
        })
        this.setAttribute("aria-expanded", "true")
        this.classList.remove("collapsed")
        targetCollapse.classList.add("show")
        targetCollapse.style.maxHeight = targetCollapse.scrollHeight + "px"
      }
    })
  })

  // 初始化底部导航栏滚动监听
  function updateActiveNavItem() {
    const sections = [
      document.getElementById("main-content"),
      document.getElementById("certificates"),
      document.getElementById("datacenter"),
      document.getElementById("why-us"),
      document.getElementById("clients"),
      document.getElementById("news"),
      document.getElementById("faq"),
      document.getElementById("contact"),
    ]

    const scrollPosition = window.scrollY + 100 // 添加偏移量以提前激活导航项

    // 找到当前滚动位置所在的区域
    let currentSection = null
    for (let i = sections.length - 1; i >= 0; i--) {
      const section = sections[i]
      if (section && scrollPosition >= section.offsetTop) {
        currentSection = section
        break
      }
    }

    if (currentSection) {
      const sectionId = currentSection.id
      document.querySelectorAll(".mobile-nav-item").forEach((item) => {
        item.classList.remove("active")
      })
      const activeItem = document.querySelector(`.mobile-nav-item[href="#${sectionId}"]`)
      if (activeItem) {
        activeItem.classList.add("active")
      }
    }
  }

  // 添加滚动事件监听
  window.addEventListener("scroll", updateActiveNavItem)

  // 初始化时执行一次
  updateActiveNavItem()

  // 点击导航项平滑滚动到对应区域
  document.querySelectorAll(".mobile-nav-item").forEach((item) => {
    item.addEventListener("click", function (e) {
      const targetId = this.getAttribute("href")
      if (targetId.startsWith("#")) {
        e.preventDefault()
        const targetElement = document.querySelector(targetId)
        if (targetElement) {
          window.scrollTo({
            top: targetElement.offsetTop,
            behavior: "smooth",
          })
        }
      }
    })
  })
})

// 证书图片灯箱效果
document.addEventListener("DOMContentLoaded", () => {
  const lightbox = document.getElementById("certificateLightbox")
  const lightboxImage = document.getElementById("lightboxImage")
  const lightboxCaption = document.getElementById("lightboxCaption")
  const lightboxClose = document.getElementById("lightboxClose")
  const certificateImages = document.querySelectorAll(".certificate-img")

  certificateImages.forEach((img) => {
    img.addEventListener("click", function () {
      const fullImg = this.getAttribute("data-full-img")
      const caption = this.getAttribute("data-caption")
      if (fullImg) {
        lightboxImage.src = fullImg
        lightboxImage.alt = caption || ""
        lightboxCaption.textContent = caption || ""
        lightbox.classList.add("active")
        document.body.style.overflow = "hidden"
        setTimeout(() => lightboxClose.focus(), 100)
      }
    })

    img.addEventListener("keydown", function (e) {
      if (e.key === "Enter" || e.key === " ") {
        e.preventDefault()
        this.click()
      }
    })
  })

  lightboxClose.addEventListener("click", closeLightbox)

  lightbox.addEventListener("click", (e) => {
    if (e.target === lightbox) {
      closeLightbox()
    }
  })

  document.addEventListener("keydown", (e) => {
    if (e.key === "Escape" && lightbox.classList.contains("active")) {
      closeLightbox()
    }
  })

  function closeLightbox() {
    lightbox.classList.remove("active")
    document.body.style.overflow = ""
    setTimeout(() => {
      if (!lightbox.classList.contains("active")) {
        lightboxImage.src = ""
      }
    }, 300)
    const activeImage = document.querySelector(".certificate-img.last-active")
    if (activeImage) {
      activeImage.focus()
    }
  }

  certificateImages.forEach((img) => {
    img.addEventListener("click", function () {
      document.querySelectorAll(".certificate-img.last-active").forEach((el) => {
        el.classList.remove("last-active")
      })
      this.classList.add("last-active")
    })
  })
})
