// Activity Page JavaScript

// Function to initialize countdown timers
function initCountdowns() {
  const countdownElements = document.querySelectorAll(".countdown-timer-wrap")

  countdownElements.forEach((element) => {
    const endTime = new Date(element.getAttribute("data-end-time")).getTime()

    // Update the countdown every 100ms for smoother animation
    const interval = setInterval(() => {
      const now = new Date().getTime()
      const distance = endTime - now

      if (distance < 0) {
        // Countdown finished
        element.querySelector(".countdown-days").textContent = "00"
        element.querySelector(".countdown-hours").textContent = "00"
        element.querySelector(".countdown-minutes").textContent = "00"
        element.querySelector(".countdown-seconds").textContent = "00"
        element.querySelector(".countdown-ms").textContent = "000"
        clearInterval(interval)
        return
      }

      // Calculate time units
      const days = Math.floor(distance / (1000 * 60 * 60 * 24))
      const hours = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60))
      const minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60))
      const seconds = Math.floor((distance % (1000 * 60)) / 1000)
      const milliseconds = distance % 1000

      // Update the countdown display
      element.querySelector(".countdown-days").textContent = days.toString().padStart(2, "0")
      element.querySelector(".countdown-hours").textContent = hours.toString().padStart(2, "0")
      element.querySelector(".countdown-minutes").textContent = minutes.toString().padStart(2, "0")
      element.querySelector(".countdown-seconds").textContent = seconds.toString().padStart(2, "0")
      element.querySelector(".countdown-ms").textContent = milliseconds.toString().padStart(3, "0")
    }, 100)
  })
}

// Function to handle activity category filtering
function initCategoryFilters() {
  const navLinks = document.querySelectorAll(".activity-nav a")
  const activityCards = document.querySelectorAll(".activity-card")

  navLinks.forEach((link) => {
    link.addEventListener("click", function (e) {
      e.preventDefault()

      // Update active class
      navLinks.forEach((item) => item.classList.remove("active"))
      this.classList.add("active")

      const category = this.getAttribute("data-category")

      // Filter cards
      if (category === "all") {
        activityCards.forEach((card) => {
          card.style.display = "block"
        })
      } else {
        activityCards.forEach((card) => {
          if (card.getAttribute("data-category") === category) {
            card.style.display = "block"
          } else {
            card.style.display = "none"
          }
        })
      }

      // Scroll to section
      const sectionId = this.getAttribute("href").substring(1)
      const section = document.getElementById(sectionId)
      if (section) {
        section.scrollIntoView({ behavior: "smooth" })
      }
    })
  })
}

// Function to handle mobile navigation
function initMobileNav() {
  const mobileNavItems = document.querySelectorAll(".mobile-nav-item")

  mobileNavItems.forEach((item) => {
    item.addEventListener("click", function (e) {
      if (this.getAttribute("href").startsWith("#")) {
        e.preventDefault()

        // Update active class
        mobileNavItems.forEach((navItem) => navItem.classList.remove("active"))
        this.classList.add("active")

        // Scroll to section
        const sectionId = this.getAttribute("href").substring(1)
        const section = document.getElementById(sectionId)
        if (section) {
          section.scrollIntoView({ behavior: "smooth" })
        }
      }
    })
  })
}

// Initialize everything when DOM is loaded
document.addEventListener("DOMContentLoaded", () => {
  initCountdowns()
  initCategoryFilters()
  initMobileNav()
})
