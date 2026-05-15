# Shipping Manifest — JR / R—Net Design System v1.0

**Released:** 2026.05.14
**Codename:** Charts & Vectors
**For:** James Rossie

This is the complete v1.0 delivery. Everything below is ready to upload to a GitHub repository or use immediately.

---

## What's in the box

### Core documentation
- **`README.md`** (v1.0) — The story. Read first. ~1,341 words. Hand-editable for voice.
- **`SYSTEM.md`** (v1.2) — Complete specification with verified WCAG contrast ratios, all four color layers, type system, content patterns, and extension procedure.
- **`GLYPHS.md`** (v2.0) — Role-based glyph registry. ~30 sanctioned roles with confidence tags. Includes test harness and audit procedure.

### AI-prompt-ready spec versions
- **`SHORT.md`** — One paragraph. For tight context budgets.
- **`STANDARD.md`** — Page-or-two. For most system prompts.
- *(`SYSTEM.md` and `GLYPHS.md` serve as the full-fidelity versions)*

### Machine-readable tokens (drop-in)
- **`tokens.json`** — Style Dictionary / W3C Design Tokens format. Universal.
- **`tokens.css`** — CSS custom properties. Drop into any web project.
- **`tailwind.config.js`** — Tailwind preset. Drop into any Tailwind project.

### AI prompts (one per tool)
- **`prompts/for-claude.md`** — Three fidelity levels for Claude.
- **`prompts/for-chatgpt.md`** — Three fidelity levels for ChatGPT, with anti-patterns specific to GPT's quirks.
- **`prompts/for-v0.md`** — Path-A (token-first) and Path-B (prompt-only) for v0, Cursor, Lovable, Bolt.
- **`prompts/for-design-tools.md`** — Figma, Adobe Firefly, Illustrator, Midjourney, Photoshop.

### Visual reference
- **`reference/style-guide.html`** (v1.0) — Interactive visual reference, ~1,928 lines. Designed for both screen and print (US Letter, 0.75in margins). 7 sections + quick reference card.
- *(`reference/style-guide.pdf`)* — Generate by opening the HTML in a browser and printing to PDF.

### Components (pending your production work)
- **`components/monogram-light.svg`** — *Replace stand-in with your final SVG.*
- **`components/monogram-dark.svg`** — *Replace stand-in with your final SVG.*
- **`components/monogram-mono.svg`** — *Replace stand-in with your final SVG.*
- **`components/templates/`** — *Empty. Add document templates as you build them.*

---

## What to do next

### Immediate (this week)

1. **Read README.md** end-to-end and hand-edit your voice in.
2. **Verify GLYPHS.md codepoints** — run the test harness in §10 against your installed JetBrainsMono Nerd Font on macOS. Update tags from `[MDI-v3.x-claim]` to `[verified-2026.05]` where they render correctly, or to `[updated-...]` if you change codepoints. The Font Awesome (`[FA-stable]`) entries should all render correctly without intervention.
3. **Open style-guide.html in your browser** — scroll through to validate the visual reference. Print to PDF to verify the print version. Save the PDF to `reference/style-guide.pdf`.

### Short-term (this month)

4. **Produce the final monogram SVG.** Use the prompts in `prompts/for-design-tools.md` with Adobe Illustrator AI or Adobe Firefly to refine your existing JR monogram into the three production variants. Drop them into `components/`.
5. **Create the GitHub repository.** Public if you want AIs to fetch by URL; private if you prefer to paste files manually. Upload the entire structure.
6. **First test prompt.** Pick a small real task (a thank-you note, a simple R—Net status page) and prompt Claude or ChatGPT using the relevant prompt file. See how the output holds up. Note any drift and refine the prompts.

### Ongoing (as needed)

7. **Add document templates** to `components/templates/` as you build them — stationery, business cards, R—Net dashboard skeletons, etc.
8. **Extend the system** following the procedures in `SYSTEM.md §15` and `GLYPHS.md §10` rather than improvising.
9. **Audit GLYPHS.md** every 6–12 months against current Nerd Fonts releases. Log changes in `GLYPHS.md §13`.

---

## Repository structure (final)

```
jr-design-system/
├── README.md                           ✓ Ready (hand-edit voice)
├── SYSTEM.md                           ✓ Ready
├── SHORT.md                            ✓ Ready
├── STANDARD.md                         ✓ Ready
├── GLYPHS.md                           ✓ Ready (run test harness to verify)
├── SHIPPING.md                         ✓ This file
├── tokens.json                         ✓ Ready
├── tokens.css                          ✓ Ready
├── tailwind.config.js                  ✓ Ready
├── prompts/
│   ├── for-claude.md                   ✓ Ready
│   ├── for-chatgpt.md                  ✓ Ready
│   ├── for-v0.md                       ✓ Ready
│   └── for-design-tools.md             ✓ Ready
├── components/
│   ├── monogram-light.svg              ⊘ Pending your production
│   ├── monogram-dark.svg               ⊘ Pending your production
│   ├── monogram-mono.svg               ⊘ Pending your production
│   └── templates/                      ⊘ Build as needed
└── reference/
    ├── style-guide.html                ✓ Ready
    └── style-guide.pdf                 ⊘ Generate from HTML (print to PDF)
```

---

## Versions

| File | Version | Status |
|------|---------|--------|
| `SYSTEM.md` | 1.2 | Stable |
| `GLYPHS.md` | 2.0 | Stable, pending verification pass |
| `README.md` | 1.0 | Stable, pending your voice edits |
| `style-guide.html` | 1.0 | Stable |
| `tokens.json` | 1.0 | Stable |
| `tokens.css` | 1.0 | Stable |
| `tailwind.config.js` | 1.0 | Stable |
| Prompt files | 1.0 | Stable |

All files are aligned with `SYSTEM.md v1.2`.

---

## A note on this version

This is **v1.0** — the first stable release of a complete, internally-consistent system. It will need iteration as you use it. The most likely places for v1.1 are:

- **GLYPHS.md** after you do the verification pass — some MDI codepoints may change
- **Content patterns in SYSTEM.md §10** as you discover new document types worth codifying
- **The README** as your voice settles in and you refine the story
- **UI components** when you start building specific interfaces that need spec'd controls

The architecture is designed for these changes. Follow the procedures in `SYSTEM.md §15` and `GLYPHS.md §10`, log changes in the version tables, and the system stays coherent as it grows.

---

*Shipping manifest · v1.0 · 2026.05.14*
*Owner: James Rossie · System: Charts & Vectors*
