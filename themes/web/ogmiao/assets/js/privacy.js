document.addEventListener("DOMContentLoaded", () => {
  // Initialize any interactive elements
  const privacySections = document.querySelectorAll(".privacy-section")

  // Add smooth scrolling for anchor links
  document.querySelectorAll('a[href^="#"]').forEach((anchor) => {
    anchor.addEventListener("click", function (e) {
      e.preventDefault()
      const targetId = this.getAttribute("href")
      const targetElement = document.querySelector(targetId)

      if (targetElement) {
        window.scrollTo({
          top: targetElement.offsetTop - 100,
          behavior: "smooth",
        })
      }
    })
  })

  // Add animation for sections when they come into view
  if ("IntersectionObserver" in window) {
    const observer = new IntersectionObserver(
      (entries) => {
        entries.forEach((entry) => {
          if (entry.isIntersecting) {
            entry.target.classList.add("visible")
            observer.unobserve(entry.target)
          }
        })
      },
      {
        threshold: 0.1,
      },
    )

    privacySections.forEach((section) => {
      observer.observe(section)
    })
  } else {
    // Fallback for browsers that don't support IntersectionObserver
    privacySections.forEach((section) => {
      section.classList.add("visible")
    })
  }

  // Add back-to-top functionality
  const backToTop = document.createElement("button")
  backToTop.innerHTML = "↑"
  backToTop.className = "back-to-top"
  backToTop.title = "返回顶部"
  backToTop.style.position = "fixed"
  backToTop.style.bottom = "20px"
  backToTop.style.right = "20px"
  backToTop.style.width = "40px"
  backToTop.style.height = "40px"
  backToTop.style.borderRadius = "50%"
  backToTop.style.backgroundColor = "var(--primary)"
  backToTop.style.color = "white"
  backToTop.style.border = "none"
  backToTop.style.fontSize = "20px"
  backToTop.style.cursor = "pointer"
  backToTop.style.display = "none"
  backToTop.style.zIndex = "100"
  backToTop.style.boxShadow = "0 2px 10px rgba(0, 0, 0, 0.1)"

  document.body.appendChild(backToTop)

  backToTop.addEventListener("click", () => {
    window.scrollTo({
      top: 0,
      behavior: "smooth",
    })
  })

  window.addEventListener("scroll", () => {
    if (window.pageYOffset > 300) {
      backToTop.style.display = "block"
    } else {
      backToTop.style.display = "none"
    }
  })
})
