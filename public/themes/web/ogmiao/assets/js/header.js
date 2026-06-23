document.addEventListener("DOMContentLoaded", () => {
  const pageTransition = document.querySelector(".page-transition")
  if (pageTransition) {
    requestAnimationFrame(() => {
      setTimeout(() => {
        pageTransition.classList.add("fade-out")
        pageTransition.addEventListener(
          "transitionend",
          () => {
            pageTransition.remove()
          },
          { once: true },
        )
      }, 200)
    })
  }

  const mobileMenuBtn = document.querySelector(".mobile-menu-btn")
  const navContainer = document.querySelector(".nav-container")
  const navLinks = document.querySelector(".nav-links")

  if (mobileMenuBtn) {
    mobileMenuBtn.addEventListener("click", function (e) {
      e.stopPropagation()
      const isExpanded = navContainer.classList.contains("active")
      navContainer.classList.toggle("active")
      navLinks.classList.toggle("active")
      this.classList.toggle("active")
      this.textContent = this.classList.contains("active") ? "×" : "☰"
      this.setAttribute("aria-expanded", !isExpanded)

      if (navContainer.classList.contains("active")) {
        setTimeout(() => {
          document.addEventListener("click", closeMenuOnClickOutside)
        }, 100)
      } else {
        document.removeEventListener("click", closeMenuOnClickOutside)
      }
    })
  }

  function closeMenuOnClickOutside(e) {
    if (!navContainer.contains(e.target) && !mobileMenuBtn.contains(e.target)) {
      navContainer.classList.remove("active")
      navLinks.classList.remove("active")
      mobileMenuBtn.classList.remove("active")
      mobileMenuBtn.textContent = "☰"
      document.removeEventListener("click", closeMenuOnClickOutside)
    }
  }

  const allButtons = document.querySelectorAll("button, .btn, .btn-nav, a[class*='btn-']")
  allButtons.forEach((button) => {
    button.addEventListener("click", function (e) {
      const ripple = document.createElement("span")
      ripple.classList.add("btn-ripple-effect")
      const rect = this.getBoundingClientRect()
      const size = Math.max(rect.width, rect.height)
      const x = e.clientX - rect.left - size / 2
      const y = e.clientY - rect.top - size / 2
      ripple.style.width = ripple.style.height = `${size}px`
      ripple.style.left = `${x}px`
      ripple.style.top = `${y}px`

      if (getComputedStyle(this).position === "static") {
        this.style.position = "relative"
      }
      this.style.overflow = "hidden"
      this.appendChild(ripple)

      setTimeout(() => {
        ripple.remove()
      }, 600)
    })

    button.addEventListener("mousedown", function () {
      this.style.transform = "scale(0.97)"
    })

    button.addEventListener("mouseup", function () {
      this.style.transform = ""
    })

    button.addEventListener("mouseleave", function () {
      if (this.style.transform === "scale(0.97)") {
        this.style.transform = ""
      }
    })
  })

  const scrollProgressBar = document.querySelector(".scroll-progress-bar")
  if (scrollProgressBar) {
    window.addEventListener("scroll", () => {
      const scrollTop = document.documentElement.scrollTop || document.body.scrollTop
      const scrollHeight = document.documentElement.scrollHeight - document.documentElement.clientHeight
      const scrollPercentage = (scrollTop / scrollHeight) * 100
      scrollProgressBar.style.width = scrollPercentage + "%"

      if (scrollPercentage < 1) {
        scrollProgressBar.style.opacity = "0"
      } else {
        scrollProgressBar.style.opacity = "1"
      }
    })
  }

  // 处理更多菜单的点击事件
  const moreMenuBtn = document.querySelector(".more-menu-btn")
  const moreMenu = document.querySelector(".more-menu")

  if (moreMenuBtn) {
    moreMenuBtn.addEventListener("click", function (e) {
      e.stopPropagation()
      moreMenu.classList.toggle("active")
      this.setAttribute("aria-expanded", moreMenu.classList.contains("active"))

      if (moreMenu.classList.contains("active")) {
        document.addEventListener("click", closeMoreMenuOnClickOutside)
      } else {
        document.removeEventListener("click", closeMoreMenuOnClickOutside)
      }
    })

    // 键盘可访问性
    moreMenuBtn.addEventListener("keydown", function (e) {
      if (e.key === "Enter" || e.key === " ") {
        e.preventDefault()
        this.click()
      } else if (e.key === "Escape" && moreMenu.classList.contains("active")) {
        moreMenu.classList.remove("active")
        this.setAttribute("aria-expanded", "false")
        document.removeEventListener("click", closeMoreMenuOnClickOutside)
      }
    })
  }

  function closeMoreMenuOnClickOutside(e) {
    if (!moreMenu.contains(e.target)) {
      moreMenu.classList.remove("active")
      moreMenuBtn.setAttribute("aria-expanded", "false")
      document.removeEventListener("click", closeMoreMenuOnClickOutside)
    }
  }

  function handleResponsiveNav() {
    const width = window.innerWidth
    const navContainer = document.querySelector(".responsive-nav")

    if (width >= 993 && width <= 1250) {
      // 在这个分辨率范围内应用特殊样式
      document.querySelectorAll(".nav-links a").forEach((link) => {
        link.style.padding = "0.4rem 0.6rem"
        link.style.fontSize = "0.85rem"
      })

      document.querySelectorAll(".nav-links li").forEach((item) => {
        item.style.marginLeft = "15px"
      })
    } else {
      // 重置样式
      document.querySelectorAll(".nav-links a").forEach((link) => {
        link.style.padding = ""
        link.style.fontSize = ""
      })

      document.querySelectorAll(".nav-links li").forEach((item) => {
        item.style.marginLeft = ""
      })
    }
  }

  // 初始调用一次
  handleResponsiveNav()

  // 添加窗口大小变化监听
  window.addEventListener(
    "resize",
    debounce(() => {
      handleResponsiveNav()
    }, 250),
  )

  function debounce(func, delay) {
    let timeout
    return function () {
      
      const args = arguments
      clearTimeout(timeout)
      timeout = setTimeout(() => func.apply(this, args), delay)
    }
  }
})
