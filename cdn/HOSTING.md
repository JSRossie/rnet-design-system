# CDN — cdn.rossie.net

Static asset host for Rossie.net. Content is namespaced by project under the
domain root; the design system lives under `/charts-and-vectors/`, and the root
is reserved for future, unrelated content.

No third-party CDN (`fonts.googleapis.com`, `cdn.jsdelivr.net`) is used at
runtime — fonts, CSS, and tokens are all self-hosted here.

## What's served

```
cdn.rossie.net/
  charts-and-vectors/
    fonts/        woff2 — three faces, see "Fonts" below
    css/v1/       rolling major channel — tracks the latest v1.x
    css/v1.0.0/   pinned release snapshot — frozen, immutable
    tokens/v1/    tokens.json — machine-readable design tokens
    tokens/v1.0.0/
```

### Fonts — `charts-and-vectors/fonts/`

| File | Size | Notes |
|------|------|-------|
| `jetbrains-mono-nerd-{regular,medium}-min.woff2` | ~23 KB each | Minimum subset — ASCII + Latin-1 + common punctuation + the glyphs sanctioned in `GLYPHS.md`. What `style-guide.html` loads. |
| `outfit-latin-var.woff2` / `urbanist-latin-var.woff2` | ~32 / ~28 KB | Variable weight (200–800), Latin subset. Google Fonts' own Latin-subset variable file. |
| `jetbrains-mono-nerd-{regular,medium}.woff2` | ~988 KB each | Full font, all ~9,000 glyphs. Kept as a lazy fallback; not referenced by the style guide. |

Fonts are built by `fonts/build-fonts.sh`, which emits straight into
`cdn/charts-and-vectors/fonts/`. The build toolchain, the subset procedure, and
adding a new family are documented in the `font-subset` skill
(`.claude/skills/font-subset/`).

### CSS — two channels

The CSS layer is published under two parallel paths so a consumer can choose
how tightly to pin:

| Path | Cache policy | Use it when |
|------|--------------|-------------|
| `css/v1/` | 1 h + `stale-while-revalidate` | You want non-breaking fixes for free. Tracks the latest v1.x in place; a breaking change would mint `css/v2/`. |
| `css/v1.0.0/` | immutable, 1 y | You need byte-for-byte reproducibility — e.g. an R—Net tooling dashboard that must not restyle itself on a push. |

`rnet.css` in each channel is the full bundle: `tokens` + `colors_and_type` +
`controls` + `markdown` concatenated in dependency order, with the
intra-bundle `@import` lines stripped. One `<link>`, no import waterfall. The
individual layer files are also served, and their relative `@import`s resolve
within the same directory.

### Tokens — `tokens/v1/tokens.json`

The machine-readable token source, for build tooling. Same channel / pinned
split as the CSS.

## How it's hosted

`cdn.rossie.net` is the **`rossie-cdn`** Cloudflare Pages project — separate
from the main `rossie-site` so asset and site deploys never tangle.

The project is **Git-connected** to `JSRossie/rnet-design-system`:

| Setting | Value |
|---------|-------|
| Production branch | `main` |
| Build command | `bash cdn/build.sh` |
| Build output directory | `cdn` |
| Custom domain | `cdn.rossie.net` → proxied CNAME to `rossie-cdn.pages.dev` |

Because the output directory is scoped to `cdn/`, only that folder is
web-served — the rest of the repo is cloned during the build and discarded.

`cdn/build.sh` runs at deploy time: it regenerates the `css/v1/` and
`tokens/v1/` **channel** from the canonical root files (`tokens.css`,
`colors_and_type.css`, `controls.css`, `markdown.css`, `tokens.json`), so the
CDN carries no hand-copied duplicates that can drift. The channel output is
`.gitignored`. **Pinned snapshots** (`css/v1.N.N/`, `tokens/v1.N.N/`) are
committed, frozen copies — `build.sh` never touches them.

## Deploying a change

**Push to `main`.** Cloudflare Pages auto-builds and publishes on every push —
no upload step, no `wrangler`, no API token in the deploy path.

- **Fonts:** rebuild with `fonts/build-fonts.sh`, commit the changed woff2 under
  `cdn/charts-and-vectors/fonts/`, push.
- **CSS / tokens (channel):** edit the canonical root file. `build.sh`
  regenerates `css/v1/` on the next deploy — nothing to commit under `cdn/`.
- **Cutting a pinned snapshot:** at a release, copy the freshly built channel
  into a new `css/v1.N.N/` (and `tokens/v1.N.N/`), commit those, push. Bump the
  number per the change: patch for fixes, minor for additions, and a new major
  channel (`css/v2/`) for anything breaking.

## Verify it worked

After a deploy:

```
curl -sI https://cdn.rossie.net/charts-and-vectors/fonts/jetbrains-mono-nerd-regular-min.woff2
curl -sI https://cdn.rossie.net/charts-and-vectors/css/v1/rnet.css
curl -sI https://cdn.rossie.net/charts-and-vectors/tokens/v1/tokens.json
```

Expect `HTTP/2 200` and `access-control-allow-origin: *` on each. The font
should report `cache-control: …immutable`; `css/v1/` should report
`max-age=3600, stale-while-revalidate=86400`; a `css/v1.0.0/` path should
report `…immutable`.

Then open `reference/style-guide.html` — Nerd glyphs should render (not boxes),
and headings/body should be Outfit/Urbanist, not a system fallback.

## Why Pages, not R2

Pages was chosen over R2 because it can also serve HTML (the showcase pages)
later if wanted, has a simpler custom-domain flow, and supports the `_headers`
file for CORS + caching without extra config.
