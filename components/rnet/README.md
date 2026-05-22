# components/rnet/ — R—Net logo pack

Logo lockups for the R—Net infrastructure brand, paired against James Rossie's
heraldic JR monogram. Composed entirely from existing `SYSTEM.md` primitives —
the cockpit palette and Outfit / JetBrains Mono type. See **§5** for the spec.

## Layout

```
components/rnet/
├── src/              24 editable source SVGs — wordmark text is live <text>
│                     (Outfit 600 / JetBrains Mono 500). Edit these.
├── svg/              24 outlined SVGs — text baked to <path>. Self-contained;
│                     render identically anywhere. The distributable form.
├── png/              24 rasters of the outlined SVGs.
├── outline-text.py   <text> → <path> outliner (uses the self-hosted woff2).
├── build-logos.sh    src/ → svg/ + png/. Run after editing src/.
└── render-pngs.html  Browser PNG renderer (fallback; see "Regenerating").
```

`svg/` and `png/` are generated from `src/` — don't hand-edit them. They are
also what `cdn/build.sh` copies to `cdn.rossie.net/charts-and-vectors/logos/`.

## At a glance

| File pattern | What it is | When to use |
|---|---|---|
| `r-net-wordmark-{day,night,mono}` | Primary wordmark, no JR | Default everywhere R—Net stands alone |
| `r-net-wordmark-infrastructure-{…}` | Wordmark + INFRASTRUCTURE subtitle | Auth pages, document covers, formal contexts |
| `r-net-jr-horizontal-{…}` | JR + R—Net side-by-side, hairline rule | Pairing James's tools with the infra |
| `r-net-jr-horizontal-norule-{…}` | Same, no rule | Where the rule feels heavy (small chrome) |
| `r-net-jr-horizontal-infrastructure-{…}` | Horizontal + subtitle | Auth/cover when both identities are present |
| `r-net-jr-stacked-{…}` | JR above R—Net, centered | Ceremonial: auth pages, covers, signatures |
| `r-net-jr-stacked-infrastructure-{…}` | Stacked + subtitle | Full ceremonial form |
| `fpm-mark-{…}` | The velocity-vector glyph alone | Favicon, status indicator, splash |

Each lockup ships in three modes:
- **day** — sky-deep accent (`#4A7A96`) on `paper-true`. Ink `#1F1D18`.
- **night** — amber accent (`#D49826`) on `night`. Ink cream (`#EDE8D8`).
- **mono** — all ink (`#1F1D18`). Fax, emboss, single-color print, watermark.

## The FPM glyph

The wordmark replaces the canonical em-dash in `R—Net` with a **flight path
marker** — the velocity-vector symbol from aircraft HUDs (ring, two wings, a
short vertical stub). It echoes the same instrumentation lineage as the palette.

**This treatment is logo-only.** In body text, metadata, and any prose
reference, `R—Net` still spells with a canonical em-dash (—), per `SYSTEM.md
§11`. Never substitute the glyph inline.

## Why outlined SVGs

The `src/` wordmarks render "R NET" / "INFRASTRUCTURE" as live `<text>`. That
is correct *inline on a page that loads Outfit / JBM*, but as an `<img>`, a CSS
background, an email asset, or a design-tool import, external fonts are blocked
and the text falls back to a system font — wrong tracking, broken FPM
alignment. The `svg/` files bake the glyphs to `<path>`, so they are
self-contained and portable everywhere. That is the form served by the CDN.

## Usage rules

**Do**
- Use the **wordmark alone** by default wherever R—Net stands on its own.
- Add **INFRASTRUCTURE** only when the network identity must be made literal.
- Use a **JR lockup** when pairing James's personal work with the infra.
- Match accent to surface: sky-deep on light, amber on dark — never both.
- Keep clear space ≥ 0.5× the wordmark cap-height on all sides.

**Don't**
- Don't substitute the FPM glyph for the em-dash in prose (`§11`).
- Don't apply gradients, glows, or shadows. The mark is flat (`§12`).
- Don't recolor the FPM independently of the wordmark — shared accent slot.
- Don't compress the wordmark below 80px, or outline/italicize the letters.

## Clear space & minimum sizes

| Variant | Minimum width | Clear space |
|---|---|---|
| Wordmark alone | 80px | 0.5× cap-height |
| Wordmark + INFRASTRUCTURE | 120px | 0.5× cap-height |
| JR + R—Net horizontal | 200px | 0.4× JR-mark height |
| JR + R—Net stacked | 96px | 0.4× JR-mark height |
| FPM mark | 16px | 0.25× mark height |

## On the CDN

Published under `https://cdn.rossie.net/charts-and-vectors/logos/`:

```
logos/svg/<name>.svg     outlined, self-contained — preferred for the web
logos/png/<name>.png     raster — email, docs, anywhere vector won't load
```

CORS-enabled and immutably cached. Content is frozen per filename: a revision
adds a *new* name, it never mutates an existing one (same contract as fonts).

## Regenerating

Edit `src/`, then rebuild:

```bash
components/rnet/build-logos.sh        # src/ → svg/ + png/
```

One-time toolchain setup (the venv is git-ignored, like `fonts/.venv`):

```bash
cd components/rnet
/usr/bin/python3 -m venv .venv && .venv/bin/pip install fonttools brotli
brew install librsvg                  # provides rsvg-convert
```

`build-logos.sh` outlines with the **self-hosted** woff2 in
`cdn/charts-and-vectors/fonts/` and rasterizes with `rsvg-convert` — no
third-party font CDN, fully reproducible offline. `render-pngs.html` is a
browser fallback for ad-hoc PNG sizes; it now loads the same self-hosted fonts.

## Versioning

- **v1.0** — initial pack (font-referenced SVGs + PNGs).
- **v1.1** — integrated: text outlined to `<path>`, self-hosted build pipeline,
  CDN publication. Locked proportions unchanged.

Future revisions extend; they don't replace. A new lockup adds a new file
pattern; existing files stay byte-identical under their name.
