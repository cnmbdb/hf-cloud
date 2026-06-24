function initLandingMotion() {
  if (!window.gsap) return

  const reduceMotion = window.matchMedia("(prefers-reduced-motion: reduce)").matches
  if (reduceMotion) return

  gsap.defaults({ duration: 0.62, ease: "power2.out" })

  gsap
    .timeline()
    .from(".vc-kicker", { y: 8, duration: 0.38 })
    .from(".vc-hero h1", { y: 18 }, "-=0.18")
    .from(".vc-lead", { y: 12 }, "-=0.34")
    .from(".vc-actions .vc-btn", { y: 10, stagger: 0.06 }, "-=0.28")
    .from(".vc-prism-stage", { scale: 0.96, duration: 0.78 }, "-=0.22")

  gsap.to(".vc-prism-wash", {
    rotation: 18,
    scale: 1.08,
    x: 10,
    y: -8,
    transformOrigin: "50% 58%",
    duration: 8.5,
    yoyo: true,
    repeat: -1,
    ease: "sine.inOut",
  })

  gsap
    .timeline({ repeat: -1, yoyo: true, defaults: { ease: "sine.inOut" } })
    .to(
      ".vc-prism-wash",
      {
        "--hero-light-x": "56%",
        "--hero-light-y": "58%",
        "--hero-light-opacity": 0.82,
        "--floor-light-x": "8%",
        "--floor-light-y": "-3%",
        "--floor-light-scale-x": 1.14,
        "--floor-light-scale-y": 1.04,
        "--floor-light-opacity": 0.9,
        duration: 4.8,
      },
      0
    )
    .to(
      ".vc-prism-wash",
      {
        "--hero-light-x": "45%",
        "--hero-light-y": "52%",
        "--hero-light-opacity": 0.66,
        "--floor-light-x": "-12%",
        "--floor-light-y": "2%",
        "--floor-light-scale-x": 0.86,
        "--floor-light-scale-y": 0.94,
        "--floor-light-opacity": 0.58,
        duration: 4.8,
      },
      4.8
    )

  gsap
    .timeline({ repeat: -1, yoyo: true, defaults: { ease: "sine.inOut" } })
    .to(
      ".vc-prism-mark",
      {
        "--edge-light-opacity": 1,
        "--edge-light-blur": "11px",
        "--edge-light-spread": "5.4px",
        "--edge-light-x": "6px",
        "--edge-light-y": "-2px",
        duration: 3.6,
      },
      0
    )
    .to(
      ".vc-prism-mark",
      {
        "--edge-light-opacity": 0.72,
        "--edge-light-blur": "7px",
        "--edge-light-spread": "3.5px",
        "--edge-light-x": "-5px",
        "--edge-light-y": "3px",
        duration: 4.4,
      },
      3.6
    )

  gsap.to(".wf-node, .wf-orb", {
    y: -4,
    duration: 2.4,
    stagger: { each: 0.12, from: "center" },
    yoyo: true,
    repeat: -1,
    ease: "sine.inOut",
  })

  gsap.to(".architecture-board .arch-card", {
    y: (index) => (index % 2 === 0 ? -7 : 6),
    scale: (index) => (index === 1 ? 1.018 : 1.01),
    duration: 3.4,
    stagger: { each: 0.16, from: "center" },
    yoyo: true,
    repeat: -1,
    ease: "sine.inOut",
  })

  gsap.to(".architecture-board .arch-icon", {
    y: -3,
    autoAlpha: 0.82,
    duration: 2.2,
    stagger: { each: 0.1, from: "random" },
    yoyo: true,
    repeat: -1,
    ease: "sine.inOut",
  })

  gsap.to(".architecture-board .arch-cloud-stack", {
    y: -8,
    scale: 1.04,
    duration: 3.8,
    yoyo: true,
    repeat: -1,
    ease: "sine.inOut",
  })

  if (!window.ScrollTrigger) return
  gsap.registerPlugin(ScrollTrigger)

  gsap.from(".brand-head, .brand-carousel", {
    y: 18,
    stagger: 0.08,
    scrollTrigger: {
      trigger: ".brand-section",
      start: "top 78%",
    },
  })

  gsap.from(".system-head, .workflow-board", {
    y: 24,
    stagger: 0.1,
    scrollTrigger: {
      trigger: ".system-section",
      start: "top 72%",
    },
  })
}

document.addEventListener("DOMContentLoaded", () => {
  initLandingMotion()
})
