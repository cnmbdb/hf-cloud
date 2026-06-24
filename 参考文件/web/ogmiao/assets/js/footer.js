document.addEventListener("DOMContentLoaded", () => {
  // Set page title
  const footer = document.querySelector("footer")
  const observer = new IntersectionObserver(
    (entries) => {
      entries.forEach((entry) => {
        if (entry.isIntersecting) {
          const footerElements = footer.querySelectorAll(".footer-col, .copyright")
          footerElements.forEach((element, index) => {
            setTimeout(() => {
              element.style.opacity = "1"
              element.style.transform = "translateY(0)"
            }, index * 150)
          })
          observer.unobserve(footer)
        }
      })
    },
    {
      threshold: 0.1,
    },
  )

  const footerElements = footer.querySelectorAll(".footer-col, .copyright")
  footerElements.forEach((element) => {
    element.style.opacity = "0"
    element.style.transform = "translateY(20px)"
    element.style.transition = "opacity 0.6s ease-out, transform 0.6s ease-out"
  })

  observer.observe(footer)

  const footerLinks = document.querySelectorAll(".footer-links a")
  footerLinks.forEach((link) => {
    link.addEventListener("mouseenter", function () {
      this.style.paddingLeft = "5px"
    })
    link.addEventListener("mouseleave", function () {
      this.style.paddingLeft = "0"
    })
  })

  initMobileNav()
  initBackToTop()
})

function initMobileNav() {
  const mobileNav = document.getElementById("mobileNav")
  if (!mobileNav) return

  // 移除了根据页面路径生成导航项的逻辑
  // 现在各个页面将自行定义导航内容

  // 为导航项添加点击事件
  document.querySelectorAll(".mobile-nav-item").forEach((item) => {
    item.addEventListener("click", function (e) {
      if (this.getAttribute("href").startsWith("#")) {
        e.preventDefault()
        const targetId = this.getAttribute("href").substring(1)
        const targetElement = document.getElementById(targetId)
        if (targetElement) {
          window.scrollTo({
            top: targetElement.offsetTop - 100,
            behavior: "smooth",
          })

          document.querySelectorAll(".mobile-nav-item").forEach((navItem) => {
            navItem.classList.remove("active")
          })
          this.classList.add("active")
        }
      }
    })
  })

  // 滚动时高亮当前区域对应的导航项
  window.addEventListener("scroll", () => {
    const navItems = Array.from(document.querySelectorAll(".mobile-nav-item"))
    const sectionLinks = navItems.filter(
      (item) => item.getAttribute("href") && item.getAttribute("href").startsWith("#"),
    )

    if (sectionLinks.length > 0) {
      const sections = sectionLinks
        .map((item) => {
          const id = item.getAttribute("href").substring(1)
          return document.getElementById(id)
        })
        .filter((section) => section !== null)

      if (sections.length === 0) return

      const scrollPosition = window.scrollY

      let currentSection = null
      let minDistance = Number.POSITIVE_INFINITY
      sections.forEach((section) => {
        const sectionTop = section.offsetTop
        const distance = Math.abs(sectionTop - scrollPosition)
        if (distance < minDistance) {
          minDistance = distance
          currentSection = section
        }
      })

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
  })
}

function initBackToTop() {
  const backToTopButton = document.getElementById("backToTop")
  if (!backToTopButton) return
  const progressIndicator = backToTopButton.querySelector(".scroll-progress-indicator")
  window.addEventListener("scroll", () => {
    const scrollTop = document.documentElement.scrollTop || document.body.scrollTop
    const scrollHeight = document.documentElement.scrollHeight - document.documentElement.clientHeight
    const scrollPercentage = (scrollTop / scrollHeight) * 100
    if (window.scrollY > 300) {
      backToTopButton.classList.add("visible")
      if (progressIndicator) {
        progressIndicator.style.setProperty("--progress", scrollPercentage + "%")
        document.documentElement.style.setProperty(
          "--scroll-progress",
          `polygon(0% 0%, 100% 0%, 100% ${scrollPercentage}%, 0% ${scrollPercentage}%)`,
        )
      }
    } else {
      backToTopButton.classList.remove("visible")
    }
  })
  backToTopButton.addEventListener("click", function (e) {
    e.preventDefault()
    const ripple = document.createElement("span")
    ripple.classList.add("ripple")
    this.appendChild(ripple)
    const rect = this.getBoundingClientRect()
    const size = Math.max(rect.width, rect.height) * 2.5
    ripple.style.width = ripple.style.height = `${size}px`
    ripple.style.left = `${e.clientX - rect.left - size / 2}px`
    ripple.style.top = `${e.clientY - rect.top - size / 2}px`
    setTimeout(() => {
      ripple.remove()
    }, 800)
    window.scrollTo({
      top: 0,
      behavior: "smooth",
    })
    this.classList.add("clicked")
    setTimeout(() => {
      this.classList.remove("clicked")
    }, 300)
  })
}
