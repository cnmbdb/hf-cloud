document.addEventListener("DOMContentLoaded", () => {
  // Partner tabs functionality
  const partnerTabs = document.querySelectorAll(".partner-tab")
  const agentContent = document.querySelector(".agent-content")
  const affiliateContent = document.querySelector(".affiliate-content")
  const agentNav = document.querySelector(".agent-nav")
  const affiliateNav = document.querySelector(".affiliate-nav")
  const agentShowcase = document.getElementById("agent-showcase")
  const affiliateShowcase = document.getElementById("affiliate-showcase")

  partnerTabs.forEach((tab) => {
    tab.addEventListener("click", function () {
      partnerTabs.forEach((t) => t.classList.remove("active"))
      this.classList.add("active")

      const tabType = this.getAttribute("data-tab")
      if (tabType === "agent") {
        agentContent.style.display = "block"
        affiliateContent.style.display = "none"
        agentNav.classList.add("active")
        affiliateNav.classList.remove("active")
        agentShowcase.style.display = "block"
        affiliateShowcase.style.display = "none"
      } else if (tabType === "affiliate") {
        agentContent.style.display = "none"
        affiliateContent.style.display = "block"
        agentNav.classList.remove("active")
        affiliateNav.classList.add("active")
        agentShowcase.style.display = "none"
        affiliateShowcase.style.display = "block"
      }
    })
  })

  // FAQ accordion functionality
  function toggleFAQ(element) {
    const answer = element.nextElementSibling
    const icon = element.querySelector("span")
    const isOpen = element.getAttribute("data-open") === "true"

    if (!isOpen) {
      element.setAttribute("data-open", "true")
      element.style.color = "var(--partner-primary)"
      answer.style.maxHeight = "1000px"
      answer.style.opacity = "1"
      answer.style.paddingBottom = "1.5rem"
      icon.textContent = "×"
      icon.style.transform = "rotate(45deg)"
    } else {
      element.setAttribute("data-open", "false")
      element.style.color = "var(--dark)"
      answer.style.maxHeight = "0"
      answer.style.opacity = "0"
      answer.style.paddingBottom = "0"
      icon.textContent = "+"
      icon.style.transform = "rotate(0deg)"
    }
  }

  // Initialize FAQ items
  const faqQuestions = document.querySelectorAll(".faq-question")
  faqQuestions.forEach((question) => {
    question.setAttribute("data-open", "false")
    const answer = question.nextElementSibling
    answer.style.maxHeight = "0"
    answer.style.opacity = "0"
    answer.style.paddingBottom = "0"

    question.addEventListener("click", function () {
      toggleFAQ(this)
    })
  })

  // Smooth scrolling for navigation links
  const sections = document.querySelectorAll(".partner-section")
  const navLinks = document.querySelectorAll(".partner-nav-link")

  window.addEventListener("scroll", () => {
    let current = ""
    sections.forEach((section) => {
      const sectionTop = section.offsetTop
      const sectionHeight = section.clientHeight
      if (pageYOffset >= sectionTop - 200) {
        current = section.getAttribute("id")
      }
    })

    navLinks.forEach((link) => {
      link.classList.remove("active")
      if (link.getAttribute("href").substring(1) === current) {
        link.classList.add("active")
      }
    })
  })

  navLinks.forEach((link) => {
    link.addEventListener("click", function (e) {
      e.preventDefault()
      const targetId = this.getAttribute("href").substring(1)
      const targetElement = document.getElementById(targetId)
      window.scrollTo({
        top: targetElement.offsetTop - 120,
        behavior: "smooth",
      })
    })
  })

  // Handle URL hash for direct section access
  if (window.location.hash) {
    const targetId = window.location.hash.substring(1)
    const targetElement = document.getElementById(targetId)
    if (targetElement) {
      setTimeout(() => {
        window.scrollTo({
          top: targetElement.offsetTop - 120,
          behavior: "smooth",
        })

        // Activate the correct tab if needed
        if (targetId.includes("affiliate")) {
          const affiliateTab = document.querySelector('.partner-tab[data-tab="affiliate"]')
          if (affiliateTab) {
            affiliateTab.click()
          }
        }
      }, 300)
    }
  }

  // Button ripple effect
  const allButtons = document.querySelectorAll("button, .btn-partner")
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

  // Mobile navigation
  const mobileNavItems = document.querySelectorAll("#mobileNav .mobile-nav-item")

  mobileNavItems.forEach((item) => {
    item.addEventListener("click", function (e) {
      const href = this.getAttribute("href")

      if (href.startsWith("#")) {
        e.preventDefault()

        mobileNavItems.forEach((navItem) => {
          navItem.classList.remove("active")
        })

        this.classList.add("active")

        const targetId = href.substring(1)
        const targetElement = document.getElementById(targetId)

        if (targetElement) {
          window.scrollTo({
            top: targetElement.offsetTop - 80,
            behavior: "smooth",
          })
        }
      }
    })
  })

  // Update active mobile nav item on scroll
  window.addEventListener("scroll", () => {
    const scrollPosition = window.scrollY

    let activeSection = null
    sections.forEach((section) => {
      const sectionTop = section.offsetTop - 100
      const sectionBottom = sectionTop + section.offsetHeight

      if (scrollPosition >= sectionTop && scrollPosition < sectionBottom) {
        activeSection = section.id
      }
    })

    if (activeSection) {
      mobileNavItems.forEach((item) => {
        const href = item.getAttribute("href")

        if (href === `#${activeSection}`) {
          item.classList.add("active")
        } else if (href.startsWith("#")) {
          item.classList.remove("active")
        }
      })
    }
  })
})
