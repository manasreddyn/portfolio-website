/**
 * Portfolio Client Script — Venkata Sai Manas Reddy Naguru
 * Minimal, zero-dependency, accessible vanilla JavaScript
 * Follows /make-interfaces-feel-better engineering guidelines
 */

document.addEventListener("DOMContentLoaded", () => {
  // 1. Mobile Navigation Toggle with ARIA state & Escape key handling
  const navToggle = document.querySelector(".mobile-nav-toggle");
  const navLinks = document.querySelector(".nav-links");

  if (navToggle && navLinks) {
    navToggle.addEventListener("click", () => {
      const isExpanded = navToggle.getAttribute("aria-expanded") === "true";
      navToggle.setAttribute("aria-expanded", !isExpanded);
      navLinks.classList.toggle("nav-open");
    });

    // Close menu when clicking any nav link
    navLinks.querySelectorAll(".nav-link").forEach((link) => {
      link.addEventListener("click", () => {
        navToggle.setAttribute("aria-expanded", "false");
        navLinks.classList.remove("nav-open");
      });
    });

    // Close on Escape key
    document.addEventListener("keydown", (e) => {
      if (e.key === "Escape" && navLinks.classList.contains("nav-open")) {
        navToggle.setAttribute("aria-expanded", "false");
        navLinks.classList.remove("nav-open");
        navToggle.focus();
      }
    });
  }

  // 2. Copy Email Helper with Accessible Feedback
  const copyBtn = document.getElementById("copy-email-btn");
  if (copyBtn) {
    copyBtn.addEventListener("click", async () => {
      const email = "manasreddynaguru@outlook.com";
      try {
        await navigator.clipboard.writeText(email);
        const originalText = copyBtn.getAttribute("data-original-text") || "Copy Email";
        copyBtn.textContent = "Copied to Clipboard!";
        copyBtn.setAttribute("aria-live", "polite");

        setTimeout(() => {
          copyBtn.textContent = originalText;
        }, 2000);
      } catch (err) {
        // Fallback for non-HTTPS or denied permissions
        window.location.href = `mailto:${email}`;
      }
    });
  }
});
