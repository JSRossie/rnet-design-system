---
name: font-subset
description: >-
  Subset and self-host webfonts for the JR / R—Net design system on
  cdn.rossie.net. Use when adding a new font family, rebuilding the minimized
  JetBrainsMono Nerd Font after GLYPHS.md changes, refreshing Outfit/Urbanist,
  or replacing a third-party font CDN dependency with a self-hosted woff2.
---

# Font subsetting & self-hosting

Every font in this design system is self-hosted on `cdn.rossie.net` (Cloudflare
Pages) — no `fonts.googleapis.com` or `cdn.jsdelivr.net` at runtime. Files are
shipped as small woff2: icon fonts subset to a sanctioned glyph set, text fonts
subset to Latin.

## Layout

| Path | Role |
|------|------|
| `fonts/JetBrainsMonoNerdFont-*.ttf` | Source fonts (in repo, not deployed). |
| `fonts/build-fonts.sh` | The build. Regenerates every production woff2. |
| `cdn/charts-and-vectors/fonts/` | Deployed woff2 — `build-fonts.sh` emits here. |
| `fonts/UNICODE-RANGE.css` | Generated `unicode-range` for the `-min` @font-face. |
| `cdn/HOSTING.md` | CDN structure, deployment, and verification runbook. |

## One-time toolchain setup

`build-fonts.sh` needs `fonttools` + `brotli` in a venv at `fonts/.venv`
(gitignored). Use the macOS system Python — Homebrew's `python@3.14` here has a
broken `pyexpat` and cannot `pip install`:

```
cd fonts
/usr/bin/python3 -m venv .venv && .venv/bin/pip install fonttools brotli
```

## Rebuilding existing fonts

```
bash fonts/build-fonts.sh
```

This subsets the JetBrainsMono `.ttf` (glyph list scraped live from `GLYPHS.md`),
re-downloads the Outfit/Urbanist Latin variable woff2, and regenerates
`UNICODE-RANGE.css`. **Run it whenever `GLYPHS.md` changes** — then paste the new
`UNICODE-RANGE.css` contents into *both* `-min` `@font-face` rules in
`reference/style-guide.html` (see the fallback pattern below).

## Adding a new font family

Two cases. Edit `fonts/build-fonts.sh` to add the family, then follow the
shared deployment steps.

### A. Icon / symbol font (subset to a sanctioned glyph set)

Like the Nerd Font: ship only the glyphs the design system actually sanctions,
never the full library.

1. Put the source `.ttf`/`.otf` in `fonts/`.
2. Decide the sanctioned codepoints. For Nerd Font they are scraped from
   `GLYPHS.md` (`grep -oE 'U\+[0-9A-Fa-f]{4,6}'`); a new icon font needs its own
   curated list — do not subset blind.
3. Add a `pyftsubset` call mirroring the JetBrainsMono loop: pass
   `--unicodes=` with text ranges (`U+0000-00FF,…`) plus the sanctioned glyphs,
   `--layout-features='' --flavor=woff2`.
4. If it carries the same caveat (text could need off-set glyphs), add a full
   woff2 too and use the `unicode-range` fallback pattern.

### B. Text font from Google Fonts (subset to Latin, variable)

Like Outfit/Urbanist: take Google's own Latin-subset variable woff2 as-is.

1. Add the family to the `for fam in …` loop as `slug:Name`.
2. The script fetches `css2?family=Name:wght@200..800` with a desktop UA and
   downloads the `/* latin */` block's woff2 → `slug-latin-var.woff2`.
3. To pin a version (avoid silent metric drift on rebuild), hardcode the
   resolved `https://fonts.gstatic.com/...woff2` URL instead of re-resolving.

### Shared steps for any new font

- Add `@font-face` rules in `reference/style-guide.html` pointing at
  `https://cdn.rossie.net/charts-and-vectors/fonts/<file>.woff2`. Use `font-display: swap`;
  variable fonts use `font-weight: 200 800`.
- List the file in `cdn/index.html`.
- Document it in the table in `cdn/HOSTING.md`.
- The `_headers` glob `/charts-and-vectors/fonts/*` already sets CORS + cache —
  no change needed.
- Push to `main` — Cloudflare Pages auto-deploys (see `cdn/HOSTING.md`).

## The unicode-range fallback pattern (subset + full safety net)

For a subsetted font where off-set characters might still occur, declare **two
`@font-face` rules under one `font-family`**:

1. **Full font first**, no `unicode-range` — covers every glyph.
2. **Subset second**, with an explicit `unicode-range` — declared later, so it
   wins for the catalog range.

Result: catalog-only pages download just the small subset; the full font is
fetched lazily, per-page, only when an off-catalog character appears — a safety
net instead of tofu boxes. Caveat: `unicode-range` is all-or-nothing per page —
one off-catalog character pulls the entire full font for that page.

The subset's `unicode-range` value is generated into `fonts/UNICODE-RANGE.css`
by `build-fonts.sh`; keep it pasted into the `-min` `@font-face` rules in sync.

## Gotchas

- `pyftsubset` warns `PfEd NOT subset` — harmless (FontForge private table).
- Subset coverage: verify with fontTools `getBestCmap()` that every intended
  codepoint survived before deploying.
- Until the rebuilt woff2 under `cdn/charts-and-vectors/fonts/` is committed and
  pushed to `main`, `cdn.rossie.net` serves the old files — the style guide will
  show fallback fonts.
