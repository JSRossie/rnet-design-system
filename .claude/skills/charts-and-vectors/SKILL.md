---
name: charts-and-vectors
description: >-
  Visual design-system standard for the JR / R—Net "Charts & Vectors" system.
  Apply when building UI components, dashboards, pages, document templates, or
  any rendered visual output, and when generating CSS or HTML that should match
  the system. Covers the type, color, layout, industrial-grammar, and glyph
  rules, the two render modes, and the cdn.rossie.net asset URLs. Invoke as
  /charts-and-vectors, or apply automatically when producing visual output
  under the design system.
---

# charts-and-vectors

The visual standard for the JR / R—Net design system. It governs how a page,
component, or document *looks* — the prose counterpart is the `rnet-voice`
skill, and the two are separate: a rendered deliverable usually needs both.

This skill is the portable, invokable form of the system. The canonical
specification is the `rnet-design-system` repository (`SYSTEM.md` and friends);
the `reference/` files bundled here are a snapshot of it, sufficient for
producing output without that repository checked out.

## The one thing to decide first: which mode

The system speaks in two modes. They share everything — typefaces, grammar,
palette layers, glyphs — and differ only in surface and accent. Pick one before
producing anything; mode-ambiguous output drifts.

- **Ceremonial · light** — warm paper surface, `sky-deep` accent. Correspondence,
  formal documents, anything printed. Signs as *JR* / *James Rossie*.
- **Instrumented · dark** — warm-charcoal surface, `amber` accent. Dashboards,
  infrastructure docs, system status, terminal-adjacent contexts. Signs as
  *R—Net* (em-dash intentional).

**R—Net work defaults to instrumented mode.** A status dashboard, an ops doc, a
network diagram — all instrumented, unless the task is explicitly personal or
ceremonial. Set `<html data-mode="night">` and use `amber` as the accent.

## Pulling the system into a build

Fonts, CSS, and tokens are self-hosted on `cdn.rossie.net` under the
`/charts-and-vectors/` namespace. Do not vendor copies and do not use a
third-party font CDN.

For rendered HTML — a dashboard, a previewed doc — link one stylesheet:

```html
<!-- whole system, one request: tokens + colors + controls + markdown -->
<link rel="stylesheet" href="https://cdn.rossie.net/charts-and-vectors/css/v1/rnet.css">
```

Or link individual layers (`tokens.css`, `colors_and_type.css`, `controls.css`,
`markdown.css`) — their `@import`s resolve against the same directory.

Two channels, chosen by how stable the consumer must be:

- `css/v1/…` — rolling channel. Tracks the latest v1.x; non-breaking fixes
  arrive automatically. Use for rendered docs and anything that should stay
  current.
- `css/pinned/1.0.0/…` — frozen snapshot, immutable. Use for a tooling
  dashboard that must not restyle itself on an upstream push.

The CSS carries its own `@font-face` rules pointing at the CDN fonts — linking
the stylesheet is enough; no separate font setup. Switch mode with the
`data-mode` attribute on `<html>` (`day` | `night`).

Machine-readable tokens, if a build step needs them:
`https://cdn.rossie.net/charts-and-vectors/tokens/v1/tokens.json`.

Logos — the R—Net lockups (wordmark, JR-paired, `INFRASTRUCTURE` subtitle, FPM
mark), in day / night / mono:

```
https://cdn.rossie.net/charts-and-vectors/logos/svg/<name>.svg   outlined, self-contained — prefer this
https://cdn.rossie.net/charts-and-vectors/logos/png/<name>.png   raster fallback
```

Names follow `r-net-wordmark-{day,night,mono}`, `r-net-jr-{horizontal,stacked}[-norule][-infrastructure]-{…}`,
and `fpm-mark-{…}`. The SVGs are outlined, so they render without the fonts
loaded — safe as an `<img>`, CSS background, or favicon. Match accent to
surface: `day` on light, `night` on dark. The wordmark's em-dash is drawn as
the flight-path-marker glyph in the logo only — in prose, `R—Net` keeps the
literal em-dash.

## The VS Code markdown preview

The built-in VS Code markdown preview is a supported render target — a
markdown document styled under the system reads correctly in the editor, not
only as exported HTML (`SYSTEM.md §17.5`). Wiring a project to it takes two
`.vscode/` files and one extension; the system itself ships only CSS.

`extensions.json` recommends the single dependency. The preview chrome — the
metadata strip — needs front matter in the page DOM, which the
Microsoft-authored `bierner.markdown-yaml-preamble` extension supplies:

```json
{ "recommendations": ["bierner.markdown-yaml-preamble"] }
```

`settings.json` points the preview at the system CSS. The CDN `rnet.css`
bundle already carries the markdown layer and its preview-chrome rules:

```json
{
  "markdown.styles": [
    "https://cdn.rossie.net/charts-and-vectors/css/v1/rnet.css"
  ]
}
```

The footer wordmark is the one project-level knob. To override it, add a CSS
file setting `--doc-footer` and list it *after* the bundle — a quoted string
sets the text, `none` drops the footer, unset uses the system wordmark. It is
one footer per repository, not per document:

```css
/* .vscode/cv-preview.css */
body.vscode-body { --doc-footer: "ACME ◇ INTERNAL"; }
```

```json
"markdown.styles": [
  "https://cdn.rossie.net/charts-and-vectors/css/v1/rnet.css",
  ".vscode/cv-preview.css"
]
```

To have Claude set this up, paste this prompt:

> Configure this project's VS Code markdown preview to use the Charts &
> Vectors design system. Create `.vscode/extensions.json` recommending the
> `bierner.markdown-yaml-preamble` extension, and `.vscode/settings.json`
> with `markdown.styles` pointing at
> `https://cdn.rossie.net/charts-and-vectors/css/v1/rnet.css`. If I give you
> a footer wordmark string, also create `.vscode/cv-preview.css` setting
> `body.vscode-body { --doc-footer: "…"; }` and append that file to
> `markdown.styles`. Then tell me to install the recommended extension and
> reload.

## The disciplines — the rules that carry the most weight

If you compress everything else, keep these four. Most design decisions resolve
against them.

1. **Single accent per context.** `sky` in light, `amber` in dark — never both,
   never a third. The accent appears in at most three places per page.
2. **Brand and semantic colors are separate layers.** `sky` / `amber` / `ground`
   are identity; red / yellow / green are *status*. A green panel means
   something is OK, not that green was wanted. Never mix the layers.
3. **Negative space carries weight.** The industrial marks — accent stripe,
   corner brackets, calipers — work because there is air around them. If a page
   feels noisy, remove a mark; do not add one.
4. **Sources are honest, not invented.** Colors come from cockpit
   instrumentation and sectional charts; type from open foundries; industrial
   marks from drafting tradition. Never invent a color, face, or primitive
   outside the spec.

## What the system is not

Not corporate (no tagline, no mission statement). Not maximalist — when adding
and removing are even, remove. Not skeuomorphic — it references the cockpit,
it does not imitate one; no textures, no instrument-bezel UI. Not a startup
deck — no gradients, no glass effects, no oversized rounded buttons. When asked
to make something "more visually interesting," resist: this system rewards
restraint, and that instinct usually breaks the discipline that makes it work.

## How to use the reference files

Work from the bundled `reference/` files; read the slice the task needs rather
than all of it.

- **`reference/STANDARD.md`** — the working spec. Type roles, the four color
  layers with hex values, the two modes, the six industrial-grammar primitives,
  layout metrics, the disciplines. Read this for almost any visual task.
- **`reference/GLYPHS.md`** — the role-based glyph registry: 90 sanctioned
  roles across 9 categories from JetBrainsMono Nerd Font, each with a codepoint
  and a confidence tag (includes the §5 `content-*` content-type class). Consult
  it whenever output uses a glyph — reference a role by name, do not pick a glyph
  freely, do not load a third-party icon font, and do not repurpose an unrelated
  role. Prefer Font Awesome codepoints over Material Design Icons (MDI codepoints
  shift between Nerd Font releases); if a role's codepoint is uncertain, surface
  that rather than using it silently. In HTML/CSS output, consume glyphs through
  the generated name-based classes in `glyphs.css`
  (`<span class="glyph glyph-content-briefing" aria-hidden="true"></span>`) —
  never paste raw PUA codepoints into source, which editors and copy-paste
  mangle. The class is decorative; pair it with an accessible text label.
- **`reference/tokens.json`** — machine-readable tokens, for generating code or
  a build config. Cite tokens by name (`sky-deep`, `night-2`), not by hex.

## Producing output

- State the mode at the top of the work, and hold it.
- Use 2–3 industrial-grammar primitives per document at most — the default kit
  is an accent stripe plus numbered section headers.
- Respect contrast: `amber` fails WCAG on light surfaces — it is dark-mode only;
  use `amber-deep` if amber is needed on light.
- If the task genuinely needs a departure from the spec, flag it explicitly
  rather than improvising silently.
- When the deliverable also contains prose — a briefing, a report, a status
  doc — apply the `rnet-voice` skill to the writing. This skill governs the
  page; `rnet-voice` governs the sentences.
