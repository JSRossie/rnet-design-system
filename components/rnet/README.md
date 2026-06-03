# components/rnet/ — R—Net logo pack

Logo lockups for the R—Net infrastructure brand, paired against James Rossie's
heraldic JR monogram. Composed entirely from existing `SYSTEM.md` primitives —
the cockpit palette and Outfit / JetBrains Mono type. See **§5** for the spec.

## Layout

```
components/rnet/
├── src/              24 editable source SVGs — wordmark text is live <text>
│                     (Outfit 600 / JetBrains Mono 500). Edit these.
├── svg/              27 distributable SVGs — the 24 outlined lockups (text baked
│                     to <path>) plus the 3 published JR monograms. Self-contained;
│                     render identically anywhere.
├── png/              27 rasters of the svg/ set.
├── outline-text.py   <text> → <path> outliner (uses the self-hosted woff2).
├── build-logos.sh    src/ → svg/ + png/. Run after editing src/.
└── render-pngs.html  Browser PNG renderer (fallback; see "Regenerating").
```

`svg/` and `png/` are generated — don't hand-edit them. The 24 lockups come from
`src/`; the 3 `jr-monogram-*` files are published from the parent seal at
`../monogram-{light,dark,mono}.svg` (its canonical home, `SYSTEM.md §5`). Both
flow through `build-logos.sh`, and `cdn/build.sh` copies the result to
`cdn.rossie.net/charts-and-vectors/logos/`.

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
| `jr-monogram-{…}` | The parent JR seal alone (not a lockup) | James's personal mark, standalone — favicon, signature, letterhead |

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

Match accent to surface: `-day` on light (`paper-true`, `rgb(250,246,236)` /
`#FAF6EC`), `-night` on dark (`night`, `rgb(28,30,28)` / `#1C1E1C`), `-mono`
for single-ink. The SVGs are transparent, so the host background is the
backdrop — never pair a `-day` mark with pure white.

### Full URL table

Every variant, ready to copy. Swap `svg` ↔ `png` in the path for the other form.

| Variant | SVG URL | PNG URL |
|---|---|---|
| r-net-wordmark-day | https://cdn.rossie.net/charts-and-vectors/logos/svg/r-net-wordmark-day.svg | https://cdn.rossie.net/charts-and-vectors/logos/png/r-net-wordmark-day.png |
| r-net-wordmark-night | https://cdn.rossie.net/charts-and-vectors/logos/svg/r-net-wordmark-night.svg | https://cdn.rossie.net/charts-and-vectors/logos/png/r-net-wordmark-night.png |
| r-net-wordmark-mono | https://cdn.rossie.net/charts-and-vectors/logos/svg/r-net-wordmark-mono.svg | https://cdn.rossie.net/charts-and-vectors/logos/png/r-net-wordmark-mono.png |
| r-net-wordmark-infrastructure-day | https://cdn.rossie.net/charts-and-vectors/logos/svg/r-net-wordmark-infrastructure-day.svg | https://cdn.rossie.net/charts-and-vectors/logos/png/r-net-wordmark-infrastructure-day.png |
| r-net-wordmark-infrastructure-night | https://cdn.rossie.net/charts-and-vectors/logos/svg/r-net-wordmark-infrastructure-night.svg | https://cdn.rossie.net/charts-and-vectors/logos/png/r-net-wordmark-infrastructure-night.png |
| r-net-wordmark-infrastructure-mono | https://cdn.rossie.net/charts-and-vectors/logos/svg/r-net-wordmark-infrastructure-mono.svg | https://cdn.rossie.net/charts-and-vectors/logos/png/r-net-wordmark-infrastructure-mono.png |
| r-net-jr-horizontal-day | https://cdn.rossie.net/charts-and-vectors/logos/svg/r-net-jr-horizontal-day.svg | https://cdn.rossie.net/charts-and-vectors/logos/png/r-net-jr-horizontal-day.png |
| r-net-jr-horizontal-night | https://cdn.rossie.net/charts-and-vectors/logos/svg/r-net-jr-horizontal-night.svg | https://cdn.rossie.net/charts-and-vectors/logos/png/r-net-jr-horizontal-night.png |
| r-net-jr-horizontal-mono | https://cdn.rossie.net/charts-and-vectors/logos/svg/r-net-jr-horizontal-mono.svg | https://cdn.rossie.net/charts-and-vectors/logos/png/r-net-jr-horizontal-mono.png |
| r-net-jr-horizontal-norule-day | https://cdn.rossie.net/charts-and-vectors/logos/svg/r-net-jr-horizontal-norule-day.svg | https://cdn.rossie.net/charts-and-vectors/logos/png/r-net-jr-horizontal-norule-day.png |
| r-net-jr-horizontal-norule-night | https://cdn.rossie.net/charts-and-vectors/logos/svg/r-net-jr-horizontal-norule-night.svg | https://cdn.rossie.net/charts-and-vectors/logos/png/r-net-jr-horizontal-norule-night.png |
| r-net-jr-horizontal-norule-mono | https://cdn.rossie.net/charts-and-vectors/logos/svg/r-net-jr-horizontal-norule-mono.svg | https://cdn.rossie.net/charts-and-vectors/logos/png/r-net-jr-horizontal-norule-mono.png |
| r-net-jr-horizontal-infrastructure-day | https://cdn.rossie.net/charts-and-vectors/logos/svg/r-net-jr-horizontal-infrastructure-day.svg | https://cdn.rossie.net/charts-and-vectors/logos/png/r-net-jr-horizontal-infrastructure-day.png |
| r-net-jr-horizontal-infrastructure-night | https://cdn.rossie.net/charts-and-vectors/logos/svg/r-net-jr-horizontal-infrastructure-night.svg | https://cdn.rossie.net/charts-and-vectors/logos/png/r-net-jr-horizontal-infrastructure-night.png |
| r-net-jr-horizontal-infrastructure-mono | https://cdn.rossie.net/charts-and-vectors/logos/svg/r-net-jr-horizontal-infrastructure-mono.svg | https://cdn.rossie.net/charts-and-vectors/logos/png/r-net-jr-horizontal-infrastructure-mono.png |
| r-net-jr-stacked-day | https://cdn.rossie.net/charts-and-vectors/logos/svg/r-net-jr-stacked-day.svg | https://cdn.rossie.net/charts-and-vectors/logos/png/r-net-jr-stacked-day.png |
| r-net-jr-stacked-night | https://cdn.rossie.net/charts-and-vectors/logos/svg/r-net-jr-stacked-night.svg | https://cdn.rossie.net/charts-and-vectors/logos/png/r-net-jr-stacked-night.png |
| r-net-jr-stacked-mono | https://cdn.rossie.net/charts-and-vectors/logos/svg/r-net-jr-stacked-mono.svg | https://cdn.rossie.net/charts-and-vectors/logos/png/r-net-jr-stacked-mono.png |
| r-net-jr-stacked-infrastructure-day | https://cdn.rossie.net/charts-and-vectors/logos/svg/r-net-jr-stacked-infrastructure-day.svg | https://cdn.rossie.net/charts-and-vectors/logos/png/r-net-jr-stacked-infrastructure-day.png |
| r-net-jr-stacked-infrastructure-night | https://cdn.rossie.net/charts-and-vectors/logos/svg/r-net-jr-stacked-infrastructure-night.svg | https://cdn.rossie.net/charts-and-vectors/logos/png/r-net-jr-stacked-infrastructure-night.png |
| r-net-jr-stacked-infrastructure-mono | https://cdn.rossie.net/charts-and-vectors/logos/svg/r-net-jr-stacked-infrastructure-mono.svg | https://cdn.rossie.net/charts-and-vectors/logos/png/r-net-jr-stacked-infrastructure-mono.png |
| fpm-mark-day | https://cdn.rossie.net/charts-and-vectors/logos/svg/fpm-mark-day.svg | https://cdn.rossie.net/charts-and-vectors/logos/png/fpm-mark-day.png |
| fpm-mark-night | https://cdn.rossie.net/charts-and-vectors/logos/svg/fpm-mark-night.svg | https://cdn.rossie.net/charts-and-vectors/logos/png/fpm-mark-night.png |
| fpm-mark-mono | https://cdn.rossie.net/charts-and-vectors/logos/svg/fpm-mark-mono.svg | https://cdn.rossie.net/charts-and-vectors/logos/png/fpm-mark-mono.png |
| jr-monogram-day | https://cdn.rossie.net/charts-and-vectors/logos/svg/jr-monogram-day.svg | https://cdn.rossie.net/charts-and-vectors/logos/png/jr-monogram-day.png |
| jr-monogram-night | https://cdn.rossie.net/charts-and-vectors/logos/svg/jr-monogram-night.svg | https://cdn.rossie.net/charts-and-vectors/logos/png/jr-monogram-night.png |
| jr-monogram-mono | https://cdn.rossie.net/charts-and-vectors/logos/svg/jr-monogram-mono.svg | https://cdn.rossie.net/charts-and-vectors/logos/png/jr-monogram-mono.png |

## Regenerating

Edit `src/` (lockups) or `../monogram-*.svg` (the JR seal), then rebuild:

```bash
components/rnet/build-logos.sh        # src/ + ../monogram-* → svg/ + png/
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
- **v1.2** — `build-logos.sh` now also publishes the parent JR monogram from
  `../monogram-{light,dark,mono}.svg` as `jr-monogram-{day,night,mono}` (path-only,
  no outlining). Pack grows 24 → 27 distributables; no lockup changed
  (`SYSTEM.md` v1.13).

Future revisions extend; they don't replace. A new lockup adds a new file
pattern; existing files stay byte-identical under their name.
