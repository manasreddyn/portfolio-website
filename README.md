# Personal Engineering Portfolio — Venkata Sai Manas Reddy Naguru

Fast, lightweight, dark-only personal portfolio website for **Venkata Sai Manas Reddy Naguru**, an Electrical and Electronics Engineering student focused on Embedded Systems, Electric Vehicles, Powertrain Engineering, and Power Systems.

## Design Architecture & Tokens

Implements the Raycast-inspired design specification from `design.md` combined with `/make-interfaces-feel-better` design engineering principles:

- **Monochrome Dark Palette**:
  - Canvas: `#07080a`
  - Surface: `#0d0d0d`
  - Elevated Surface: `#101111`
  - Card Surface: `#121212`
  - Hairlines: `#242728`
  - Hairline Strong: `rgba(255, 255, 255, 0.16)`
  - Primary CTA: `#ffffff` pill with `#000000` text
  - Signature Red Stripe Band: `linear-gradient(90deg, #ff5757 0%, #d4222b 50%, #8a0f16 100%)`
- **Typography Polish**:
  - Font: `Inter` with system-native fallback stack
  - Feature Settings: `font-feature-settings: "calt", "kern", "liga", "ss03"` (signature alternate `g`)
  - Rendering: `-webkit-font-smoothing: antialiased; -moz-osx-font-smoothing: grayscale;`
  - Text Wrapping: `text-wrap: balance` on headings, `text-wrap: pretty` on paragraphs
  - Numbers: `font-variant-numeric: tabular-nums` on all metrics and dates
- **Surface & Interaction Polish**:
  - Concentric border radii: `outerRadius = innerRadius + padding`
  - Shadows for elevation, hairlines for structure (0 drop shadows, crisp dark-mode ring)
  - Scale on press: tactile `scale(0.96)` with interruptible CSS transitions
  - Optical alignment: text-side padding vs icon-side padding (`padding-right: 14px; padding-left: 16px;`)
  - Hit areas: Guaranteed minimum 44×44px touch targets on mobile
  - Accessibility: Semantic landmarks (`<header>`, `<nav>`, `<main>`, `<section>`, `<article>`, `<footer>`), `:focus-visible` ring, skip navigation link, and `prefers-reduced-motion` support.

## Project Structure

```
portfolio/
├── index.html              # Semantic HTML5 single-page structure
├── css/
│   └── style.css           # Pure modern CSS design system tokens and responsive styles
├── js/
│   └── main.js             # Lightweight accessible interactions (menu, clipboard)
├── assets/
│   ├── favicon.svg         # SVG monogram favicon
│   └── resume-manas.pdf    # Downloadable verified resume PDF
├── robots.txt              # Search engine crawling rules
├── sitemap.xml             # Static sitemap definition
└── README.md               # Documentation and deployment
```

## Running & Previewing Locally

Because this is a pure static website with 0 external runtime dependencies:

1. **Directly in Browser**:
   Open `index.html` in any modern web browser (Chrome, Edge, Firefox, Safari).

2. **Using Python local HTTP server**:
   ```bash
   python -m http.server 8000
   ```
   Open `http://localhost:8000`.

3. **Using Node / npx serve**:
   ```bash
   npx serve .
   ```

## Deployment Options

### GitHub Pages (Recommended)
1. Push this directory to a GitHub repository named `manasreddyn.github.io` (or your preferred repo name).
2. Go to **Settings > Pages**.
3. Under **Branch**, select `main` (or `master`) and folder `/ (root)`.
4. Click **Save**. The website will be live at `https://manasreddyn.github.io/`.

### Cloudflare Pages / Vercel / Netlify
- Build command: *(leave empty)*
- Output directory: `.` (root)
- Deploy automatically on push.
