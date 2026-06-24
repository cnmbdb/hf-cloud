document.addEventListener("DOMContentLoaded", () => {
  // Ensure the first navigation item is active
  const firstNavLink = document.querySelector(".industry-nav a")
  if (firstNavLink && !document.querySelector(".industry-nav a.active")) {
    firstNavLink.classList.add("active")
  }

  // Industry navigation functionality
  const navLinks = document.querySelectorAll(".industry-nav a")
  const sections = document.querySelectorAll(".industry-section")

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
        top: targetElement.offsetTop - 150,
        behavior: "smooth",
      })
    })
  })

  // Mobile navigation
  const mobileNavItems = document.querySelectorAll("#mobileNav .mobile-nav-item")
  const moreIndustriesBtn = document.querySelector('#mobileNav .mobile-nav-item[href="#more-industries"]')

  // Handle "More" button click
  if (moreIndustriesBtn) {
    moreIndustriesBtn.addEventListener("click", (e) => {
      e.preventDefault()
      const modal = document.getElementById("more-industries-modal")
      const modalBackdrop = document.querySelector(".modal-backdrop")

      if (modal && modalBackdrop) {
        modal.classList.add("show")
        modalBackdrop.classList.add("show")
        document.body.style.overflow = "hidden"
      }
    })
  }

  // Handle modal close button
  const modalClose = document.querySelector(".modal-close")
  if (modalClose) {
    modalClose.addEventListener("click", closeModal)
  }

  // Handle modal backdrop click
  const modalBackdrop = document.querySelector(".modal-backdrop")
  if (modalBackdrop) {
    modalBackdrop.addEventListener("click", closeModal)
  }

  function closeModal() {
    const modal = document.getElementById("more-industries-modal")
    const modalBackdrop = document.querySelector(".modal-backdrop")

    if (modal && modalBackdrop) {
      modal.classList.remove("show")
      modalBackdrop.classList.remove("show")
      document.body.style.overflow = ""
    }
  }

  // Handle modal item clicks
  const modalItems = document.querySelectorAll(".modal-item")
  modalItems.forEach((item) => {
    item.addEventListener("click", function (e) {
      e.preventDefault()
      const targetId = this.getAttribute("href").substring(1)
      const targetElement = document.getElementById(targetId)

      closeModal()

      if (targetElement) {
        window.scrollTo({
          top: targetElement.offsetTop - 150,
          behavior: "smooth",
        })
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

  // Mobile nav item click handling
  mobileNavItems.forEach((item) => {
    item.addEventListener("click", function (e) {
      if (this.getAttribute("href") === "#more-industries") {
        return // Handled by the more industries button click handler
      }

      e.preventDefault()
      const href = this.getAttribute("href")

      if (href === "#") {
        // Scroll to top
        window.scrollTo({
          top: 0,
          behavior: "smooth",
        })
      } else {
        // Scroll to section
        const targetId = href.substring(1)
        const targetElement = document.getElementById(targetId)

        if (targetElement) {
          window.scrollTo({
            top: targetElement.offsetTop - 150,
            behavior: "smooth",
          })
        }
      }
    })
  })

  // Button ripple effect
  const allButtons = document.querySelectorAll("button, .contact-btn")
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
  })
})

// Add ripple effect class
document.head.insertAdjacentHTML(
  "beforeend",
  `
<style>
.btn-ripple-effect {
    position: absolute;
    border-radius: 50%;
    background-color: rgba(255, 255, 255, 0.3);
    transform: scale(0);
    animation: ripple 0.6s linear;
    pointer-events: none;
}

@keyframes ripple {
    0% {
        transform: scale(0);
        opacity: 0.5;
    }
    100% {
        transform: scale(2);
        opacity: 0;
    }
}
</style>
`,
)
