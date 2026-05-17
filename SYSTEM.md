# JR / R—Net Design System

**Version:** 1.6
**Codename:** Charts & Vectors
**Owner:** James Rossie
**Status:** Stable
**Last updated:** 2026.05.17

---

## 0. How to Use This Document

This is the canonical specification for the JR / R—Net design system. It exists in three layers of detail (`SHORT.md`, `STANDARD.md`, and this file) so you can paste the right amount of context into any AI tool.

**For humans:** read it like a manual. The "why" is in §1 and §2; the "what" is in §3 onward; the "how to extend" is in §15.

**For AI systems:** treat every rule in §3–§10 as a constraint. When in doubt, prefer restraint over elaboration. The system favors negative space, single-accent discipline, and aviation-instrument precedent. Never invent colors, fonts, or elements outside this spec without explicit permission. When asked to extend the system, consult §15 first. When using glyphs from `GLYPHS.md`, respect the confidence tags — entries marked `[MDI-v3.x-claim]` or `[unfilled]` should be surfaced as uncertain rather than used silently. When building UI controls, use the classes specified in §16 (and the `colors_and_type.css` semantic layer they read from) rather than re-deriving styling from primitives.

---

## 1. Premise

A single visual language that reads **ceremonial** at one density (personal stationery, monograms, gifts) and **instrumented** at another (R—Net dashboards, system documentation, network diagrams). The vocabulary stays constant: Swiss-grid negative space, drafting and aviation construction marks, geometric sans typography, monospace as a primary voice, and a palette sourced from aircraft cockpit instrumentation.

Only the information density and the surface temperature change between contexts.

## 2. Source & Philosophy

Every color in this system is pulled from aviation instrumentation or VFR sectional charts. Every typographic and structural choice is pulled from technical communication design — Swiss modernism, drafting tradition, and the corporate-engineering modernism of companies like Vertiv, IBM, and Siemens. The system inherits decades of visual harmony designed for legibility under stress.

Three disciplines hold the system together:

1. **Single-source palette.** Brand colors come from the cockpit. Semantic colors come from the universal status vocabulary (red/yellow/green). The two layers never compete because they do different jobs.
2. **Single accent per context.** Sky for personal/ceremonial. Amber for R—Net/instrumented. The accent appears in at most three places per page and always signals something specific.
3. **Negative space carries weight.** Industrial elements (corner brackets, registration marks, accent stripes, calipers) work because there's air around them. They reveal clutter rather than hide it.

---

## 3. Type System

### Faces

| Role | Face | Weight | Source |
|------|------|--------|--------|
| Display (bold) | Outfit | 600 | Google Fonts (OFL) |
| Heading | Outfit | 500 | Google Fonts (OFL) |
| Body | Urbanist | 400 | Google Fonts (OFL) |
| Body emphasis | Urbanist | 600 | Google Fonts (OFL) |
| Label / Eyebrow | JetBrainsMono Nerd Font | 500 | nerdfonts.com |
| Metadata / Data | JetBrainsMono Nerd Font | 400 | nerdfonts.com |

**Why three faces:** Outfit's geometric construction (single-story `a`) gives it a drawn-with-compass feel that fits the instrumentation aesthetic but lacks reading rhythm at length. Urbanist is its sibling — same geometric DNA, easier on the eye for body text. JetBrains Mono carries every technical voice: labels, eyebrows, metadata, status, inline code. The Nerd Font variant adds 9,000+ glyphs without breaking the monospace grid.

### Type Roles (with specifications)

| Role | Face | Size | Weight | Tracking | Line height | Case |
|------|------|------|--------|----------|-------------|------|
| Display | Outfit | 36–56px | 600 | -1.5px | 1.05 | Title |
| H1 | Outfit | 28–36px | 500 | -0.5px | 1.15 | Title |
| H2 (eyebrow / label) | JetBrainsMono Nerd | 11–12px | 500 | 2.5px | 1 | UPPERCASE |
| Body | Urbanist | 14–16px | 400 | 0 | 1.65–1.75 | Sentence |
| Body emphasis | Urbanist | 14–16px | 600 | 0 | 1.65 | Sentence |
| Metadata | JetBrainsMono Nerd | 9–11px | 400 | 1–1.5px | 1.6 | UPPERCASE |
| Inline accent | JetBrainsMono Nerd | inherit | 400 | 0.5px | inherit | Code |

### Rules

- **No italics on the name "James Rossie" or any primary headlines.** Accent comes from color and label, never slanting.
- **Mono is a primary voice, not a fallback.** It carries section labels, eyebrows, metadata, status, coordinates. Used inline within prose for technical terms, file paths, IDs.
- **Generous line height for body** (1.65 minimum). The system never feels crowded.
- **Tracking matters on uppercase labels** — at least 2px on all-caps mono labels. They read as drafting callouts, not screaming.

### Web-control type additions (v1.1, see §16)

The seven roles above are the system's canonical type vocabulary. UI components in §16 introduce four additional sizes — `subhead` (20px), `h3` (16px), `body-sm` (13px), `code` (13px) — exposed by `colors_and_type.css` as `--type-h2 / --type-h3 / --type-body-sm / --type-code` and in `tokens.json` under `font.size.{subhead,h3,bodySmall,code}`. These are web-control affordances, not new editorial roles; documents still draw from the seven canonical roles only. Rendered markdown (§17) adds a further prose-scoped heading ramp (`--type-md-h1/h2/h3`); it too is scoped to its context and leaves the seven canonical roles unchanged.

---

## 4. Color System

The palette is organized in **four conceptual layers**. They never mix roles. All values below have been verified for WCAG 2.1 contrast compliance — see §4.5 for the contrast matrix.

### 4.1 Layer 1: Surfaces

| Token | Hex | Role |
|-------|-----|------|
| `paper-true` | `#FAF6EC` | Ceremonial surface — personal letters, formal docs, fine stationery |
| `paper-chart` | `#FCF4DF` | Technical default — R—Net light docs, field notes, status reports |
| `urban` | `#F8E4AE` | Callout tint **only** — never a full-page background |
| `night` | `#1C1E1C` | Dark mode base — warm charcoal, not pure black |
| `night-2` | `#252824` | Dark elevated panel |
| `night-3` | `#2F322D` | Dark secondary elevated (note callouts) |
| `night-4` | `#3A3D37` | Dark tertiary (inline code, chips) |
| `cream` | `#EDE8D8` | Dark mode primary ink — instrument paint color |

### 4.2 Layer 2: Structure

| Token | Hex | Role |
|-------|-----|------|
| `ink` | `#1F1D18` | Primary text on light surfaces |
| `ink-2` | `#3A3730` | Secondary deep ink |
| `graphite` | `#6B675C` | Labels, metadata, secondary text |
| `soft` | `#989486` | Tertiary text, faded labels (decorative only — fails WCAG body) |
| `panel-light` | `#D4CEBC` | Borders, rules, dividers (light) |
| `panel` | `#8E8B80` | Strong rules, panel mid-tone |
| `panel-deep` | `#5A5750` | Strong borders, shadows |
| `night-rule` | `#3D403A` | Borders in dark mode |
| `night-rule-soft` | `#2A2D28` | Soft dividers in dark mode |
| `night-graphite` | `#8A8470` | Secondary text in dark mode (AA Large only) |
| `night-soft` | `#5E5B50` | Tertiary text in dark mode (decorative only) |

### 4.3 Layer 3: Brand (Cockpit-sourced)

| Token | Hex | Source | Role |
|-------|-----|--------|------|
| `sky` | `#6B9BB8` | Attitude indicator sky | Personal accent — light-mode highlights |
| `sky-deep` | `#4A7A96` | AI sky, darker band | Eyebrow labels, light-mode accent stripe |
| `sky-light` | `#A8C5D8` | AI sky, higher band | Dark-mode notes, sky borders |
| `ground` | `#8B5A3C` | AI ground, terracotta | Secondary warm accent, warm callout borders |
| `ground-deep` | `#6B4226` | AI ground, mahogany | Borders, document classification stripes, anchored use |
| `ground-light` | `#B08362` | AI ground, lighter | Dark-mode location tags |
| `amber` | `#D49826` | NVIS night cockpit lighting | R—Net accent — dark mode only |
| `amber-glow` | `#F0B84A` | NVIS amber, brighter | Dark-mode glow on amber elements |
| `amber-deep` | `#8C6018` | NVIS amber, muted | Light-mode amber when needed (rare) |

**Important contrast note:** `amber` (#D49826) fails WCAG contrast on light surfaces (2.34:1). It is **a dark-mode color**. For amber-coded elements on light surfaces, use `amber-deep` (#8C6018) which passes AA at 5.12:1.

### 4.4 Layer 4: Semantic (Universal R/Y/G)

These never overlap with brand colors. They only appear when literal status is being signaled. A green panel means "this is OK," never "decorative green panel."

| Token | Hex | Role |
|-------|-----|------|
| `ok-fg` | `#4A7A3A` | Foreground for OK / nominal status |
| `ok-bg` | `#D8E0C8` | Background tint for OK callout panels |
| `ok-glow` | `#8DB072` | Dark-mode glow for OK indicators |
| `warn-fg` | `#7A5A10` | Foreground for warning / caution status |
| `warn-bg` | `#F5E4A8` | Background tint for warning callout panels |
| `warn-glow` | `#E6B84A` | Dark-mode glow for warning indicators |
| `alert-fg` | `#A8362A` | Foreground for alert / critical status |
| `alert-bg` | `#ECC8C0` | Background tint for alert callout panels |
| `alert-glow` | `#D4604E` | Dark-mode glow for alert indicators |

### 4.5 Verified Contrast Matrix

All ratios computed per WCAG 2.1. AA Body requires 4.5:1; AA Large (18pt+ or 14pt bold) requires 3.0:1; AAA requires 7.0:1.

**Light mode — primary text:**

| Pairing | Ratio | AA Body | AAA |
|---------|------:|:-------:|:---:|
| `ink` on `paper-true` | 15.60 | ✓ | ✓ |
| `ink` on `paper-chart` | 15.35 | ✓ | ✓ |
| `ink` on `urban` | 13.39 | ✓ | ✓ |
| `graphite` on `paper-true` | 5.23 | ✓ | — |
| `graphite` on `paper-chart` | 5.15 | ✓ | — |

**Light mode — brand accents:**

| Pairing | Ratio | AA Body | AA Large |
|---------|------:|:-------:|:--------:|
| `ground-deep` on `paper-true` | 8.00 | ✓ | ✓ |
| `ground-deep` on `paper-chart` | 7.87 | ✓ | ✓ |
| `ground` on `paper-true` | 5.37 | ✓ | ✓ |
| `amber-deep` on `paper-true` | 5.12 | ✓ | ✓ |
| `sky-deep` on `paper-true` | 4.31 | — | ✓ |
| `sky-deep` on `paper-chart` | 4.24 | — | ✓ |
| ⚠ `amber` on `paper-true` | 2.34 | ✗ | ✗ |

**Light mode — semantic:**

| Pairing | Ratio | AA Body | AA Large |
|---------|------:|:-------:|:--------:|
| `ok-fg` on `paper-true` | 4.70 | ✓ | ✓ |
| `ok-fg` on `ok-bg` | 3.73 | — | ✓ |
| `warn-fg` on `paper-true` | 5.90 | ✓ | ✓ |
| `warn-fg` on `warn-bg` | 5.02 | ✓ | ✓ |
| `alert-fg` on `paper-true` | 6.03 | ✓ | ✓ |
| `alert-fg` on `alert-bg` | 4.21 | — | ✓ |

**Dark mode — primary text:**

| Pairing | Ratio | AA Body | AAA |
|---------|------:|:-------:|:---:|
| `cream` on `night` | 13.69 | ✓ | ✓ |
| `cream` on `night-2` | 12.17 | ✓ | ✓ |
| `cream` on `night-3` | 10.61 | ✓ | ✓ |

**Dark mode — brand accents:**

| Pairing | Ratio | AA Body | AAA |
|---------|------:|:-------:|:---:|
| `amber-glow` on `night` | 9.31 | ✓ | ✓ |
| `amber-glow` on `night-2` | 8.28 | ✓ | ✓ |
| `sky-light` on `night` | 9.30 | ✓ | ✓ |
| `sky-light` on `night-3` | 7.21 | ✓ | ✓ |
| `amber` on `night` | 6.65 | ✓ | — |
| `ground-light` on `night` | 5.01 | ✓ | — |

**Dark mode — semantic glows:**

| Pairing | Ratio | AA Body | AA Large |
|---------|------:|:-------:|:--------:|
| `warn-glow` on `night` | 9.04 | ✓ | ✓ |
| `ok-glow` on `night` | 6.86 | ✓ | ✓ |
| `alert-glow` on `night` | 4.46 | — | ✓ |

**Body text rule:** any character glyph used at body size must achieve AA Body (4.5:1) on its actual surface. Labels, eyebrows, and decorative metadata may use AA Large pairings (3.0:1).

### 4.6 Palette Discipline (the rules that keep it tasteful)

**DO:**
- Use the brand accent in at most three places per page: top stripe, one or two meaningful highlights, inline within mono callouts.
- Keep semantic colors completely separate from brand colors. They appear only in status contexts.
- Let negative space carry weight. Industrial elements work because there's air around them.

**DON'T:**
- Color body text with the brand accent. Color whole headlines. Use the accent for decoration that carries no meaning.
- Use semantic colors decoratively. If the meaning isn't literally "this is healthy" or "this is broken," don't reach for them.
- Pile every industrial element into one document. Pick 2–3 per document maximum.
- Use `amber` on light surfaces. It fails contrast. Use `amber-deep` instead, or reserve amber for dark mode.

### 4.7 Semantic Web-Control Roles (v1.1)

The primitives in §4.1–§4.4 are the **palette**. UI controls cannot encode "use amber on dark, sky-deep on light" in every component — they need to read from a mode-aware role like "accent." The semantic layer in `colors_and_type.css` provides that, exposing the following named roles. Each one is an alias (`var(--token)`) — no new colors are introduced.

| Role | Day (default) | Night | Used by |
|------|---------------|-------|---------|
| `--bg` | `paper-true` | `night` | Page background |
| `--bg-elev-1` | `paper-true` | `night-2` | Cards, popovers, toolbar |
| `--bg-elev-2` | `paper-chart` | `night-3` | Code blocks, range tracks |
| `--bg-callout` | `urban` | `night-3` | Inline callouts |
| `--fg-1` | `ink` | `cream` | Primary text |
| `--fg-2` | `ink-2` | `cream` | Secondary text |
| `--fg-3` | `graphite` | `night-graphite` | Tertiary, metadata |
| `--fg-mute` | `soft` | `night-soft` | Decorative only |
| `--fg-on-accent` | `paper-true` | `night` | Text on accent fills |
| `--rule` | `panel-light` | `night-rule` | Hairline borders |
| `--rule-strong` | `panel` | `panel` | Emphasized rules |
| `--rule-anchor` | `panel-deep` | `night-rule` | Anchored borders |
| `--accent` | `sky-deep` | `amber` | Brand accent |
| `--accent-soft` | `sky` | `amber-glow` | Accent hover, glow |
| `--accent-edge` | `sky-light` | `amber-deep` | Accent edges |
| `--accent-warm` | `ground-deep` | `ground-light` | Warm secondary |
| `--ok / --warn / --alert` | semantic FGs | semantic glows | Status text |
| `--ok-bg-tint / -warn / -alert` | semantic BGs | `night-3` | Status panels |
| `--focus-ring` | `sky-deep` | `amber` | `:focus-visible` outline |
| `--field-*` | composed | composed | Inputs, selects, textareas |
| `--scrim / --scrim-soft` | `ink`-mix | `night`-mix | Modal / drawer / cmdk overlays |
| `--bg-inverse / --fg-inverse` | `ink` / `paper-true` | `cream` / `night` | Tooltip (inverted surface) |

The day/night flip is controlled by the document-level attribute `<html data-mode="day | night">`. All roles update automatically. Components in §16 read from this layer exclusively.

Web-control affordances that did not exist as primitives — radii (`--radius-1` 2px / `--radius-2` 4px / `--radius-3` 6px / `--radius-pill`), motion (`--ease-instrument`, `--dur-fast/base/slow`), floating-surface shadows (`--shadow-popover`, `--shadow-modal`), overlay scrims (`--scrim`, `--scrim-soft`), and the inverted tooltip surface (`--bg-inverse`, `--fg-inverse`) — are added here under §4.7's authority. The radii and motion are catalogued in `tokens.json` under `radius` and `motion`; the shadows, scrims, and inverted surface are CSS-only, since they are mode-dependent compositions rather than flat primitives. None introduce a new color — scrims are `color-mix` of an existing ink with transparency, and the inverted surface swaps two existing primitives.

---

## 5. The Monogram

The JR mark is a **heraldic seal**, not a wordmark. Its construction, letterforms, and arrow vector are defined by the SVG assets shipped with this system (`/components/monogram-*.svg`). The wordmark that appears below the mark uses **Outfit 600** with 4–5px tracking — that's the bridge from the heraldic monogram into the rest of the type system.

### Placement & sizing

- **Primary placement:** top-left of the document, vertically aligned with the eyebrow label or accent stripe.
- **Minimum width:** 32px (mark only) or 80px (mark + wordmark lockup).
- **Clear space:** at least 0.5× the mark's height on all sides; no other element may intrude.
- **Maximum density:** the mark appears once per document by default. Repeated use (footer, watermark) is permitted only if each instance serves a distinct function.

### Variants (provided as SVGs)

| Variant | Surface context | Filename |
|---------|-----------------|----------|
| Primary · light | `paper-true` or `paper-chart` | `monogram-light.svg` |
| Primary · dark | `night` and elevations | `monogram-dark.svg` |
| Monochrome | Fax, emboss, single-color print | `monogram-mono.svg` |

The light and dark variants use brand-palette colors appropriate to their context. The monochrome version uses ink only. **The SVG is the spec** — visual choices like color-per-letter, arrow color, and construction-line treatment are defined by the asset, not this document.

### Wordmark accompaniment

When the mark appears with the wordmark below:

- **Personal:** `JAMES ROSSIE` in Outfit 600, 4–5px tracking, color = `ink` (light) or `cream` (dark).
- **R—Net:** `R—NET INFRASTRUCTURE` in Outfit 600, 4–5px tracking, color = `cream` (dark) with `amber` for `R—NET`.

The em-dash in `R—Net` is intentional. It visually echoes the horizon line of the attitude indicator — the artifact from which the rest of the palette is sourced. Always an em-dash (`—`), never a hyphen (`-`).

---

## 6. Industrial Elements (System Grammar)

A small set of recurring marks that give documents a consistent feel without veering into pastiche. Each has a clear job. Use them when the job applies, not for decoration.

### Core Six

1. **Accent stripe** — 3–4px bar of accent color across the top of a page, panel, or section. The system's most visible single mark. Use once per document.
2. **Corner brackets** — Thin L-shaped registration marks at the corners of specimens, cards, or framed content. Reads as drafting / photographic crop marks. Use on cards and quote blocks.
3. **Numbered section header** — Section number + title (in mono uppercase) + flexible rule + meta. The structural workhorse of every document. Use for every major section.
4. **Registration mark** — A small crosshair-in-circle from the printing tradition. Use as a section divider or logo companion. Rare.
5. **Dotted rule** — Finely dotted line for secondary dividers, TOC leaders, field separators. Use sparingly.
6. **Data caliper** — Engineering-drawing measurement span used to label dimensions, ranges, or scopes. Use for total-count statements ("4 SITES · 12 SVCS").

### Recommended default kit per document

Most documents need only: **accent stripe + numbered section headers + occasional data caliper**. Add corners and registration marks for special documents (covers, formal correspondence). Use dotted rule only in tables of contents or field-style separators.

---

## 7. Iconography

The system uses **JetBrainsMono Nerd Font** as its icon vocabulary, providing access to ~9,000 glyphs while preserving monospace alignment.

This document does not enumerate approved glyphs — that vocabulary lives in **`GLYPHS.md`**, which is structured as a **role-based registry** (e.g., `status-ok`, `infra-server`, `loc-aviation`). Roles are stable; the specific glyphs assigned to them may evolve as Nerd Fonts versions shift codepoints. Every entry carries a confidence tag indicating reliability of the assignment.

That separation lets the icon set grow without revising the core spec.

### Discipline (applies regardless of which specific glyphs are sanctioned)

- **Ceremonial documents** use glyphs sparingly — typically only in metadata blocks (location, contact, date). Never in body prose.
- **Instrumented documents** use glyphs to carry meaning, never decoration. If a glyph can be removed without losing information, remove it.
- **Color follows function.** Status glyphs use semantic R/Y/G. Brand-context glyphs use the appropriate accent. Section glyphs use the dominant accent for that mode (sky in light, amber in dark).
- **Sanctioned set only.** Restrict to roles defined in `GLYPHS.md`. New roles are added through the process in `GLYPHS.md §10` — not invented ad hoc.
- **Respect confidence tags.** `[FA-stable]` entries can be used directly. `[MDI-v3.x-claim]` and `[unfilled]` entries should be verified against the live `glyphnames.json` before relying on them.

### Where to find glyph codepoints

- The system's curated role-based set with usage notes: `GLYPHS.md`
- Full searchable reference for extensions: [nerdfonts.com/cheat-sheet](https://www.nerdfonts.com/cheat-sheet)
- Authoritative codepoint registry: [glyphnames.json](https://github.com/ryanoasis/nerd-fonts/blob/master/glyphnames.json)

---

## 8. Layout & Composition

### Grid

- **Page padding:** 32–48px on desktop surfaces
- **Section spacing:** 56–80px between major sections
- **Element spacing:** 14–28px within sections
- **Content max-width:** 1280px for technical documents, 720px for body prose

### Section header pattern

Every section uses this pattern:

```
[NUM ▸]   [TITLE IN MONO UPPERCASE]   ──────────────────   [META]
```

Where:
- `NUM` is the section number in mono (e.g., "04.2 ▸")
- `TITLE` is in mono, uppercase, 2.5px tracking
- The rule fills remaining space
- `META` is right-aligned mono metadata (e.g., "4 ACTIVE")

### Hierarchy via type, not decoration

The system establishes hierarchy through type weight, case, and color — not through boxes, gradients, or shadows. A heading is a heading because it's bigger and bolder, not because it's in a colored box.

---

## 9. The Two Modes

### Light · Ceremonial / Daylight

**Default surface:** `paper-true` (ceremonial) or `paper-chart` (technical).
**Primary accent:** `sky-deep` for stripes and labels.
**Secondary accent:** `ground` or `ground-deep` for monogram J and warm callout borders.
**Ink:** `ink` for body, `graphite` for secondary, `soft` for tertiary (decorative only).
**Callout panels:** `urban` for highlighted notes; semantic backgrounds (`ok-bg`, `warn-bg`, `alert-bg`) for status callouts.

Use light mode for: personal correspondence, formal documents, field notes, technical documents during daylight workflow, anything that will be printed.

### Dark · Instrumented / Night Cockpit

**Default surface:** `night` (warm charcoal, not pure black).
**Elevation:** `night-2` for panels, `night-3` for note callouts, `night-4` for inline chips.
**Primary accent:** `amber` for stripes, glyphs, unit suffixes; `amber-glow` for inline emphasis.
**Secondary accent:** `sky-light` for observation notes and info callouts; `ground-light` for location tags.
**Ink:** `cream` for primary text, `night-graphite` for secondary (AA Large only), `night-soft` for tertiary (decorative only).

Use dark mode for: R—Net dashboards, system documentation, infrastructure status reports, terminal-adjacent contexts, anything viewed primarily on screen at night.

---

## 10. Page Chrome & Content Patterns

Every template the system produces — stationery, a document cover, a dashboard, a status doc, field notes, a rendered-markdown page — frames its content the same way. The frame is a small, fixed set of **chrome regions**: the stripes and metadata bands that surround the content without being the content. §10.1 describes those regions and what each is for. The patterns in §10.2 are not separate inventions; each is one document type's way of filling the same regions.

### 10.1 Chrome regions

The chrome is the frame, not the content. It carries identification, status, and provenance — what the document *is*, not what it *says*. Read this section as orientation, not a checklist: each region has a natural gravity, a kind of information that settles there on its own. Place metadata by that gravity rather than by rule, and leave a region empty when the document has nothing for it. An empty region is normal; filler to occupy one is not.

The regions, from the top edge inward:

- **Classification stripe.** The topmost edge, drawn in `ground-deep` (§4.4). It appears only when the document is classified — its presence *is* the signal, and its absence means unclassified or public. Anchored weight, not decoration. Formal and controlled documents raise it; most documents have no stripe at all.

- **Accent stripe.** The single mode-accent edge: `sky-deep` on light surfaces, `amber` on night (§9). It is the one place the brand accent touches the page frame, and it honors §4.6 — one stripe, one accent, never two. Nearly every template carries it; it is the system's quietest signature.

- **Eyebrow.** The identification band below the stripes. Its left holds the monogram or the R—Net wordmark plus a short mono-uppercase label naming the document or its section. Its right holds the meta cluster — the few facts that identify the document at a glance: node or site, revision, status, date. The eyebrow answers *what am I looking at, and is it current* before the reader reaches the title.

- **Title + metadata block.** The document's own name, set in Outfit, with a metadata block carrying the fuller provenance the eyebrow abbreviates — author or owner, the dates (§11), the document identifier, a copy number. On a formal cover this block is centered beneath the monogram and reads `REV · COPY · AUTHOR`; elsewhere it sits left, under the eyebrow.

- **Footer.** The closing band, and the document's record of where and when it was made. Its left tends toward place and provenance — a location tag, a site, a contact block, a signing initial. Its right tends toward time and state — a timestamp, a revision echo, a page mark. A ceremonial letter puts a contact block here; an instrumented dashboard puts a location tag and timestamp; a formal cover often omits the footer entirely.

- **Corner brackets.** Registration marks at the four corners (§6). Not a metadata region but a framing device, reserved for documents that present themselves formally — covers and formal correspondence. Most templates omit them.

One discipline runs through all of it: chrome metadata drives chrome *content* only — what a region says, never how it looks. There is no chrome field for color, font, or spacing; form is fixed by the system (§15).

### 10.2 Content patterns

Each pattern below fills the §10.1 regions in the manner its document type calls for. They are reference points, not the full range — a document type the system has not yet met fills the same regions by the same logic.

#### Personal correspondence (ceremonial)

- Surface: `paper-true`
- Accent stripe: `sky-deep`
- Eyebrow: monogram top-left (light primary lockup); sender meta top-right, mono, with sky-accent location glyph
- Body: Urbanist 16px, line-height 1.75, max-width 540px
- Sign-off: mono uppercase with sky-accent date highlight
- Footer: contact block (if present), mono, 4 fields with sky-accent glyphs

#### R—Net status document (instrumented)

- Surface: `night`
- Accent stripe: `amber`
- Eyebrow: monogram + R—NET wordmark left; status pill + revision right
- Tag chips: amber/sky/ground/ok variants for scannable metadata
- Stats grid: 2 or 4 columns on `night-2` panels, Outfit 500 values with amber units
- Note callout: `night-3` panel, `sky` border, `sky-light` label
- Sites table: full-width on `night`, amber-glyph node labels, semantic-colored status
- Activity log: `night-2` panel with timestamps in amber, status entries in semantic glows
- Footer: muted graphite with ground-light location tag

#### Technical field notes (light, instrumented density)

- Surface: `paper-chart`
- Accent stripe: `sky-deep`
- Eyebrow: site identifier and date in mono, sectional style
- Body: Urbanist 14px, normal density
- Callouts: `urban` for notes, `ok-bg` for nominal observations
- Footer: mono with location, time, and JR initial

#### Document cover / formal

- Surface: `paper-true` or `paper-chart`
- Classification stripe at top: `ground-deep`
- Corner brackets at all four corners
- Title + metadata block: centered monogram + title in Outfit; mono metadata block reads `REV · COPY · AUTHOR`

---

## 11. Naming & Signing

The system is named **"Charts & Vectors."** Personal contexts sign with **"JR"** or **"James Rossie"** in full. Technical contexts sign as **"R—Net"** (with em-dash, not hyphen). The em-dash is intentional — it visually echoes the AI horizon line.

This section governs *names and signatures*. The system's **written voice** — how prose deliverables read — is a separate concern, specified in §18 and `VOICE.md`.

Document revision numbers use semantic versioning (0.1, 0.2, 1.0). Dates in metadata use `YYYY.MM.DD` for technical contexts (`2026.05.14`) and "14 · MAY · 2026" for ceremonial contexts.

---

## 12. What This System Is Not

To stay disciplined, name what it isn't:

- **It is not a corporate brand system.** No tagline, no value proposition, no mission statement appears in design output.
- **It is not maximalist.** If a choice between adding and removing is even, remove.
- **It is not skeuomorphic.** No textures simulating leather, paper grain, brushed metal, or instrument bezels in actual UI. The system references those traditions; it doesn't imitate them.
- **It is not a startup deck aesthetic.** No gradients, no glass effects, no large emoji, no rounded fully-bubble buttons.
- **It is not a single-purpose system.** It must serve both a thank-you note and a 50-page infrastructure review without either feeling awkward.

---

## 13. Versioning

| Version | Date | Notes |
|---------|------|-------|
| 0.1–0.7 | 2026.05.14 | Iterative exploration (typography, palette, surfaces, dark mode refinement) |
| 0.8 | 2026.05.14 | Locked palette: 3 surfaces, R/Y/G semantics, magenta excluded |
| 1.0 | 2026.05.14 | First stable spec |
| 1.1 | 2026.05.14 | Verified contrast ratios; corrected `warn-fg` to #7A5A10; clarified monogram as SVG-defined; separated `GLYPHS.md` as living reference; added §15 extending guidance |
| 1.2 | 2026.05.14 | Aligned with `GLYPHS.md` v2.0 role-based architecture. §0 now instructs AI to respect glyph confidence tags. §7 documents the role-based registry and confidence-tag model. §15 glyph extension procedure points to `GLYPHS.md §10` audit workflow. |
| 1.3 | 2026.05.17 | First UI-control cohort shipped. Added §4.7 (semantic web-control roles) and §16 (Components). `tokens.json` and `tailwind.config.js` extended to v1.1 with new radii, motion, extended spacing, and web-control type sizes. `colors_and_type.css` and `controls.css` added as new top-level files. Third monogram variant (`monogram-mono.svg`) shipped. §15 UI-extension procedure updated to point at §16. No primitive changes — all additions compose from v1.2 tokens. |
| 1.4 | 2026.05.17 | Added §17 (Rendered Markdown) and `markdown.css`. New prose-scoped heading-ramp tokens `--type-md-h1/h2/h3` in `colors_and_type.css` (§15 type extension, distinct from the §16 UI ramp). Added `reference/markdown-showcase.html` with a live front-matter previewer. No primitive changes. |
| 1.5 | 2026.05.17 | Added §18 (Editorial Voice) and `VOICE.md` — the writing-voice standard for prose deliverables, graduated from `proposals/rnet-voice.md`. Retitled §11 "Voice & Naming" → "Naming & Signing" so §18 owns the written voice (section number unchanged; cross-references intact). Added the `rnet-voice` skill as the invokable form. Editorial only — no primitive, color, token, component, or CSS changes. |
| **1.6** | 2026.05.17 | **Current.** Restructured §10 "Content Patterns" → "Page Chrome & Content Patterns": added §10.1 (Chrome regions), a non-prescriptive all-template account of the classification stripe, accent stripe, eyebrow, title + metadata block, footer, and corner brackets, and gathered the four existing patterns under §10.2 with their header/footer terminology aligned to the §10.1 region names. §17.4 front-matter fields now map to the §10.1 region each feeds (new **Feeds** column). §10 keeps its section number; cross-references intact. Editorial only — no primitive, color, token, component, or CSS changes. |

Future versions extend; they don't replace. Anything added must justify itself against §10–§12 discipline rules.

---

## 14. Files in This System

```
jr-design-system/
├── README.md                     The story. Read first.
├── SYSTEM.md                     This document. The complete spec.
├── SHORT.md                      Concise version (one paragraph).
├── STANDARD.md                   Page-or-two version for system prompts.
├── GLYPHS.md                     Curated Nerd Font glyph reference (role-based, versioned).
├── VOICE.md                      Editorial-voice standard for prose (versioned). See §18.
├── SHIPPING.md                   Versioned shipping manifest.
├── tokens.json                   Machine-readable design tokens.
├── tokens.css                    CSS custom properties — primitives (drop-in).
├── colors_and_type.css           CSS semantic layer + @font-face. Imports tokens.css. (v1.1)
├── controls.css                  Web-control implementation. Imports colors_and_type.css. (v1.1)
├── markdown.css                  Rendered-markdown styling. Imports colors_and_type.css. (v1.4)
├── tailwind.config.js            Tailwind preset (drop-in).
├── prompts/
│   ├── for-claude.md             Optimized for Claude.
│   ├── for-chatgpt.md            Optimized for ChatGPT.
│   ├── for-v0.md                 Optimized for v0 / Cursor / UI generation.
│   └── for-design-tools.md       Figma / Adobe Firefly prompts.
├── components/
│   ├── monogram-light.svg        Primary mark, light mode.
│   ├── monogram-dark.svg         Primary mark, dark mode.
│   ├── monogram-mono.svg         Monochrome mark.
│   └── templates/                Stationery, document covers, dashboards.
└── reference/
    ├── style-guide.html          Interactive brand reference.
    ├── style-guide.pdf           Print-ready style guide.
    ├── glyph-catalog.html        Browsable glyph catalog (companion to GLYPHS.md).
    ├── controls-showcase.html    Interactive controls showcase. (v1.1)
    ├── controls-compare.html     Day-vs-night side-by-side reference. (v1.1)
    ├── controls-preview/         Focused single-control preview cards. (v1.1)
    └── markdown-showcase.html    Rendered markdown + front-matter previewer. (v1.4)
```

---

## 15. Extending the System

The system is designed to grow. When you (or an AI) needs something the spec doesn't cover, follow this procedure rather than improvising:

### When extending the palette

1. **Verify the need.** Is the new color genuinely required, or is an existing token close enough? Default to existing.
2. **Source it.** New colors should derive from the same sources (aviation instrumentation, sectional charts, panel grays). Don't invent from nowhere.
3. **Verify contrast.** Compute WCAG ratios against every surface it will touch. Add to the §4.5 matrix.
4. **Name it.** Follow the existing scheme: `category-modifier` (e.g., `sky-deep`, `night-3`, `ok-glow`).
5. **Document the role.** What job does it do? What job does it NOT do? Add to the appropriate layer in §4.
6. **Bump the version.** Minor version (1.1 → 1.2) for additions; major version (1.x → 2.0) for breaking changes.

### When extending UI components

The system's first cohort of UI controls shipped in v1.3. See **§16 Components** for the complete inventory and the discipline rules they honor. The procedure below applies to components beyond that cohort.

1. **Build for a specific use case first.** Don't design generic patterns; design for the specific tool, app, or document you're working on.
2. **Derive from primitives.** Every component must compose from existing tokens in `tokens.css` and the semantic layer in `colors_and_type.css` (§4.7). No new colors, no new spacing values, no new type sizes unless the §15.palette procedure is followed.
3. **Earn the spec slot.** A new component enters §16 after it has been used in **two distinct contexts**. One-off uses don't earn spec inclusion — they live in the calling project until the second use proves the pattern.
4. **Honor the discipline.** The rules in §12 ("what this is not") and §16's discipline checklist apply to every component. No gradients, no glass, no decorative-only styling, no pills on buttons.
5. **Land everywhere at once.** A new component adds (a) a class block in `controls.css`, (b) a section in `reference/controls-showcase.html`, (c) a focused card in `reference/controls-preview/`, and (d) a row in §16's component inventory. Anything less leaves the spec out of sync with the implementation.

### When extending the glyph vocabulary

The glyph registry in `GLYPHS.md` is **role-based**: each role (e.g., `status-ok`, `infra-server`) gets one assigned glyph. When you need a glyph the registry doesn't cover, you're adding a new role, not just a new glyph.

Follow `GLYPHS.md §10` ("How to Extend") for the full procedure. The short version:

1. Verify the role doesn't already exist — default to reusing.
2. Name the role following `category-purpose` convention.
3. Find a glyph at [nerdfonts.com/cheat-sheet](https://www.nerdfonts.com/cheat-sheet); prefer Font Awesome (stable codepoints) over Material Design Icons (shifts between versions).
4. Tag appropriately: `[FA-stable]` for Font Awesome, `[MDI-v3.x-claim]` for MDI pending verification, `[unfilled]` for placeholders.
5. Run through the test harness (`GLYPHS.md §8`) on your machine to verify rendering.
6. Log in `GLYPHS.md §11` audit log.

Codepoint changes between Nerd Font versions are tracked in the audit log, not the spec — so the spec stays stable while the registry evolves.

### When in doubt

Re-read §1 (premise) and §12 (what it's not). Most extension decisions resolve themselves against those two sections.

---

## 16. Components (v1.1)

The system's first UI-control cohort, implemented in `controls.css`. Every component reads from `colors_and_type.css` (§4.7's semantic role layer) and switches automatically when `<html data-mode="day | night">` flips.

**See:** `reference/controls-showcase.html` (every component in both modes), `reference/controls-compare.html` (day vs night side-by-side), `reference/controls-preview/` (focused single-control cards).

### 16.1 Inventory

| Class | Role | Variants |
|-------|------|----------|
| `.btn` | Buttons | `--primary`, `--secondary`, `--ghost`, `--destructive`, `--icon`, `--sm`, `--lg`, `:disabled`, loading |
| `.btn-group` | Adjacent button row | — |
| `.field` / `.input` / `.textarea` / `.select` | Form fields | `.input--mono`, sizes, error/help states |
| `.check` / `.radio` / `.switch` | Toggleable controls | — |
| `.range` | Slider input | — |
| `.number-input` | Numeric stepper input | `__btn--minus`, `__btn--plus` |
| `.stepper` | Process / step indicator | `.is-complete`, `.is-current` states |
| `.tag-input` | Multi-token input | — |
| `.combobox` | Filter-search input | — |
| `.dropzone` | File-drop region | — |
| `.inline-edit` | In-place text edit | — |
| `.badge` | Status / count chip | `--pill`, semantic variants |
| `.icon-badge` | Count / status badge on an icon | `--accent`, `--ok`, `--warn`, `--dot`; anchor with `.has-icon-badge` |
| `.alert` | Inline alert block | `--ok`, `--warn`, `--alert`, `--note` |
| `.banner` | Top-of-page banner | semantic variants |
| `.toast` | Floating notification | semantic variants |
| `.tooltip` | Hover tooltip | directional |
| `.popover` | Floating info surface | — |
| `.card` | Surface container | `--stripe`, `--brackets`, with `__head`, `__body`, `__foot` |
| `.modal` | Centered modal | with `__head`, `__body`, `__foot` |
| `.drawer` | Edge-anchored drawer | `--left`, `--right` |
| `.accordion` | Disclosure list | — |
| `.empty` | Empty-state slate | — |
| `.spinner` / `.skel` | Loading affordances | — |
| `.tabs` | Tab navigation | with `__count` |
| `.segmented` | Segmented control | — |
| `.crumbs` | Breadcrumb trail | — |
| `.pagination` | Page navigation | — |
| `.progress` | Linear progress | semantic variants |
| `.menu` | Dropdown menu | — |
| `.cmdk` | Command palette | — |
| `.table` | Data table | sortable, with `__head`, `__row`, `__cell` |
| `.stat` | KPI display | with `__value`, `__label`, trend |
| `.topbar` | App header | — |
| `.sidenav` | Side navigation | — |
| `.dot` | Status indicator | semantic + `--pulse` |
| `.codeblock` | Code display | inline `<code>`, block `<pre>` |
| `.kbd` | Keystroke display | — |
| `.section-rule` | Labeled section divider | — |
| `.avatar` / `.avatar-group` | User avatar | sizes, `--ai`, group stack |

### 16.2 Discipline

Components inherit §12 ("what this is not") and add component-specific rules:

- **Single brand accent per context.** `sky-deep` in day, `amber` in night. Never both. Never a third.
- **Semantic colors carry status only.** A `.btn--destructive` is destructive; a `.badge--ok` is nominal. Don't use semantic variants for decoration.
- **Hierarchy from type, weight, case, and color** — not boxes, gradients, or shadows.
- **Borders, not drop-shadows.** A drop-shadow is permitted only on a surface that *floats above the page* — menus, popovers, tooltips, toasts, modals, drawers, the combobox list, and the command palette. Flat, in-flow surfaces (cards, alerts, banners, tables, fields) use hairline `--rule` borders, never shadow.
- **Architectural radii.** `--radius-1` (2px) on fields and buttons; `--radius-2` (4px) on chips and tags; `--radius-3` (6px) max on cards, modals, and drawers. `--radius-pill` is reserved for switch tracks, progress bars, and the `.badge--pill` chip variant. **No pills on buttons.**
- **Mono-uppercase labels** at 2.5px tracking. Sentence-case web labels break the system's feel.
- **No gradients, no glassmorphism, no decorative shadows, no italicized names, no emoji.** These are out by §12.
- **Focus visible always.** Every interactive element exposes a 2px `--focus-ring` outline on `:focus-visible`. Don't suppress.

### 16.3 Usage

```html
<html data-mode="day">                <!-- or "night" -->
<link rel="stylesheet" href="controls.css">

<button class="btn btn--primary">Save changes</button>

<label class="field">
  <span class="field__label">NODE ID</span>
  <input class="input input--mono" value="edge-dr-01">
</label>

<div class="alert alert--ok">
  <span class="alert__icon"></span>
  <div class="alert__text">Backup completed at 03:14 UTC.</div>
</div>
```

The `data-mode` attribute is the only switch: every variable in §4.7 tracks it. There is no JS theming layer; CSS does the entire job.

---

## 17. Rendered Markdown (v1.4)

Markdown's constrained vocabulary suits a system whose first instinct is restraint. `markdown.css` styles the bare elements a markdown renderer emits — no class hooks on the rendered output — and reads from the §4.7 semantic layer, so it switches with `<html data-mode>` like everything else.

**See:** `reference/markdown-showcase.html` (rendered markdown in both modes, with a live front-matter previewer).

### 17.1 Content vs. chrome

The system's industrial grammar (§6) — monograms, accent stripes, corner brackets, numbered section headers — has no markdown syntax. It therefore belongs to the **preview wrapper**, never the rendered body:

- **`.md`** — the rendered markdown. Disciplined plain prose at the 720px prose measure. Form comes from the system; the author writes only markdown.
- **`.doc`** — the chrome around it: the §10.1 regions — accent stripe, eyebrow, classification stripe, footer. Its *content* comes from front matter (§17.4); its *form* is fixed by the system. No styling escape hatches.

### 17.2 Heading ramp

Markdown uses `#`–`####` as a genuine title hierarchy. The §3 type table defines only Display, H1, and an "H2" that is a mono-uppercase label — no mid-document title rung. The markdown ramp is **prose-scoped**: sized for a 720px measure, distinct from the §3 web-control ramp by design.

| Markdown | Face | Token | Size | Treatment |
|----------|------|-------|------|-----------|
| `h1` | Outfit 600 | `--type-md-h1` | 38px | Display-adjacent |
| `h2` | Outfit 500 | `--type-md-h2` | 26px | Heading + hairline underline |
| `h3` | Outfit 500 | `--type-md-h3` | 18px | Sub-heading |
| `h4` | JetBrainsMono 500 | `--type-label` | 12px | Mono-uppercase eyebrow (reused rung) |
| `h5`/`h6` | Urbanist 600 | `--type-body` | 15px | Bold inline fallback — no new rung |

`h4` reuses the system's existing eyebrow label rather than inventing a rung; `h5`/`h6` fall back to bold body text. Per §8, hierarchy comes from type weight and case, not decoration.

### 17.3 Element mapping

Every markdown element maps onto an existing primitive — no new ones:

| Element | Maps to |
|---------|---------|
| Body paragraphs | Body role, 720px `--content-max-prose` measure |
| `> blockquote` | The note callout — `bg-callout` + `accent-warm` border; matches `.alert--note` |
| `> ` with `.ok`/`.warn`/`.alert` | The §4.4 semantic layer; status only, separate from the brand accent |
| `` `inline code` `` | Inline-accent role on a subtle `bg-elev-2` chip |
| Fenced code block | The `.codeblock` surface — `bg-elev-2`, hairline border, `--radius-3` |
| Tables | The R—Net sites-table pattern — mono uppercase headers, hairline rules |
| `---` | Hair rule (`--bw-hair`) |

Links carry meaning, so a link-dense document is exempt from §4.6's "accent in at most three places" — resolved as §7 exempts functional glyphs.

### 17.4 Front-matter vocabulary

Front matter is markdown's mechanism for feeding the §10.1 chrome regions — the channel by which a markdown author supplies what other template types supply through template params or direct authoring. It drives chrome **content only** — never styling. It is an open *superset*, not a closed set: a previewer handles unknown keys gracefully, and an author may add a field when a document genuinely needs one (reuse before inventing, §15). The **Feeds** column names the §10.1 region each field reaches.

| Field | Feeds | Role |
|-------|-------|------|
| `doc-id` | Title + metadata block | Document identifier, `CONTEXT-TYPE-SEQ` (e.g. `RNET-RB-0042`). Optional. |
| `title` | Title + metadata block | Drives the `h1`. |
| `context` | — | `rnet` or `personal` — selects accent + surface (§9); not chrome content. |
| `mode` | — | Optional override of the context's default day/night; not chrome content. |
| `eyebrow` | Eyebrow | Mono-uppercase label beside the wordmark. |
| `node` / `site` | Eyebrow | Infrastructure identifier (rnet). |
| `owner` / `author` | Title + metadata block | Responsible person. |
| `rev` / `version` | Eyebrow + metadata block | Semantic version (§11). |
| `created`, `reviewed`, `next-review`, `effective` | Title + metadata block | Dates; formatted per §11. |
| `class` | Classification stripe | Classification — draws the `ground-deep` stripe. |
| `status` | Eyebrow | Draft / Stable / Active / Deprecated. |
| `supersedes` / `superseded-by` | Title + metadata block | Cross-document references. |
| `copy` | Title + metadata block | Copy number for controlled distribution. |
| `recipient`, contact-block fields | Footer | Ceremonial documents. |

`doc-id` uses `CONTEXT` (`RNET` or `JR`), a two-letter `TYPE` (`RB` runbook, `SD` status doc, `FN` field note, `CV` cover, `LT` letter, `MD` memo), and a four-digit `SEQ`. Allocation is manual; a registry can follow without changing the format.

---

## 18. Editorial Voice (v1.5)

The system has always been a visual language, but it ships prose: this spec, the README, runbooks, status docs, the documents the §17 markdown pattern exists to render. That prose has a specified voice.

The written voice is the prose sibling of the visual system. Both rest on the §1 premise and the §12 discipline: prefer restraint over elaboration; when a choice between adding and removing is even, remove. Its governing sentence is **disciplined restraint, with rationed and meaningful flourish** — the §2 single-accent rule applied to the sentence rather than the page.

The voice is a writer's standard, not a styling layer. It removes the recognizable default-LLM voice (self-narration of virtue, AI-vocabulary, negative parallelism, reflexive em-dashes, bold claim-sentences) and replaces it with a deliberate one: a researcher briefing a reader who is making a hard decision. It governs prose deliverables — briefings, reports, research documents, memos, status docs — and does not change the analysis, the argument, or the facts, only how the prose carries them.

**Em-dash, two rules that do not conflict.** §11 keeps the em-dash as a fixed visual mark in the wordmark "R—Net." The voice standard effectively eliminates the em-dash in *running prose*, where it has become a recognized AI tell. One is a name; the other is a sentence-level habit. Removing the habit leaves the name untouched.

**See:** `VOICE.md` — the full standard. Eight voice dimensions (persona, address, diction, syntax, rhythm, modality, architecture, mechanics), structural choices, a banned-pattern reference, before/after examples, and a ten-step revision checklist. `VOICE.md` is a living reference versioned independently of this spec, the way `GLYPHS.md` is. The invokable form is the `rnet-voice` skill, which defers to `VOICE.md` as canonical.

---

*End of SYSTEM.md · v1.6 · 2026.05.17*
