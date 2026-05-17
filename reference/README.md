# reference/

Visual reference material for the design system.

## Brand reference

- `style-guide.html` — Interactive visual reference for the brand system (palette, type, monogram, industrial grammar, content patterns). Open in any modern browser.
- `style-guide.pdf` — Print-ready PDF. Generate by opening `style-guide.html` in a browser, choosing File → Print → "Save as PDF", US Letter size, default margins. The print stylesheet will produce publication-quality output.
- `glyph-catalog.html` — Browsable catalog of every sanctioned glyph role (companion to `GLYPHS.md`). Filterable; click a role name to copy it. Loads the font from `../fonts/` so it works offline.

## Web-controls reference (v1.1)

Companion to `controls.css` and `SYSTEM.md §16`.

- `controls-showcase.html` — Every component in both modes (`data-mode="day"` / `data-mode="night"`), organized by category, ending with a composed R—Net dashboard example. The fastest way to see the controls in context.
- `controls-compare.html` — Day-vs-night side-by-side reference. Use when verifying that a single component reads correctly in both voices.
- `controls-preview/` — 40 focused single-component cards (one HTML file per component cluster). Useful when you want to lift a specific component into a design or screenshot it in isolation.

Each file `<link>`s `../controls.css` and loads `@font-face` declarations from `cdn.rossie.net`.

## Markdown reference (v1.4)

Companion to `markdown.css` and `SYSTEM.md §17`.

- `markdown-showcase.html` — Rendered markdown in both modes. Carries a live YAML front-matter editor: edit the front matter and the preview chrome (eyebrow, classification stripe, footer) re-renders. Includes a manual day/night toggle. `<link>`s `../markdown.css`.
