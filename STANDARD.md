# JR / R—Net Design System — Standard Spec

*A page-or-two version for AI system prompts when you have room for more detail. For the full reference, see SYSTEM.md.*

---

## Premise

A single visual language that reads **ceremonial** at one density (personal stationery, monograms, correspondence) and **instrumented** at another (R—Net dashboards, system documentation, network status). Same vocabulary throughout — only the density and surface temperature change between contexts.

## Type

Three faces serve every role:

- **Outfit** (geometric sans) — display and headings, weight 500–600, negative letter-spacing (-0.5 to -1.5px), tight line-height (1.05–1.15). No italics on names or primary headlines.
- **Urbanist** (Outfit's reading-friendly sibling) — body text, weight 400 or 600 emphasis, 14–16px, generous line-height (1.65 minimum).
- **JetBrainsMono Nerd Font** — labels, eyebrows, metadata, status indicators, inline technical terms, and all glyphs. Uppercase mono labels track at 2.5px. Mono is a primary voice, not a fallback.

## Color (four layers, never mixed)

### Layer 1: Surfaces

Light: `paper-true` (#FAF6EC, ceremonial), `paper-chart` (#FCF4DF, technical default), `urban` (#F8E4AE, callout tint ONLY — never a full-page background).

Dark: `night` (#1C1E1C, warm charcoal base), `night-2` (#252824, panels), `night-3` (#2F322D, note callouts), `night-4` (#3A3D37, chips). Dark-mode ink is `cream` (#EDE8D8).

### Layer 2: Structure

`ink` (#1F1D18, primary text on light), `graphite` (#6B675C, labels/metadata), `panel-light` (#D4CEBC, borders), `panel` (#8E8B80, strong rules). Dark mode: `night-rule` (#3D403A) for borders, `night-graphite` (#8A8470) for secondary text (AA Large only).

### Layer 3: Brand (cockpit-sourced)

- `sky` (#6B9BB8) / `sky-deep` (#4A7A96) / `sky-light` (#A8C5D8) — personal accent. Use `sky-deep` for light-mode stripes and eyebrow labels; `sky-light` for dark-mode notes and info callouts.
- `ground` (#8B5A3C) / `ground-deep` (#6B4226) / `ground-light` (#B08362) — warm secondary. Use `ground-deep` for classification stripes and document covers.
- `amber` (#D49826) / `amber-glow` (#F0B84A) / `amber-deep` (#8C6018) — R—Net accent. **`amber` fails WCAG on light surfaces and is dark-mode only.** Use `amber-deep` if you need amber on a light surface.

### Layer 4: Semantic (universal R/Y/G)

Status indicators only — never decorative. Each has foreground, background, and dark-mode glow:
- OK / nominal: `ok-fg` (#4A7A3A) / `ok-bg` (#D8E0C8) / `ok-glow` (#8DB072)
- Warn / caution: `warn-fg` (#7A5A10) / `warn-bg` (#F5E4A8) / `warn-glow` (#E6B84A)
- Alert / critical: `alert-fg` (#A8362A) / `alert-bg` (#ECC8C0) / `alert-glow` (#D4604E)

## The Two Modes

**Ceremonial · Light.** Surface `paper-true` or `paper-chart`. Accent `sky-deep`. For correspondence, formal docs, field notes, anything printed. Signs as "JR" or "James Rossie."

**Instrumented · Dark.** Surface `night`. Accent `amber`. For R—Net dashboards, infrastructure docs, system status, terminal-adjacent contexts. Signs as "R—Net" (em-dash intentional — echoes the attitude indicator horizon line).

## Industrial Grammar

Six primitives, used sparingly (2–3 per document max):

1. **Accent stripe** — 4px bar across top of pages or panels. Once per document.
2. **Corner brackets** — Thin L-shaped registration marks at card corners.
3. **Numbered section header** — Pattern: `[NUM ▸] [MONO UPPERCASE TITLE] [── rule ──] [META]`
4. **Registration mark** — Crosshair-in-circle. Rare, for dividers or formal docs.
5. **Dotted rule** — TOC leaders and field separators only.
6. **Data caliper** — Engineering-drawing measurement span for total counts ("4 SITES · 12 SVCS").

Default kit for most documents: accent stripe + numbered section headers + occasional caliper.

## Glyphs (Nerd Font Vocabulary)

JetBrainsMono Nerd Font provides ~9,000 glyphs. The system sanctions 83 roles across 9 categories in a role-based registry (`GLYPHS.md`). Each role has one assigned glyph with a confidence tag. Prefer Font Awesome codepoints (stable across versions) over Material Design Icons (codepoints shift between major Nerd Fonts releases).

Common roles: `status-ok` (U+F00C), `status-fail` (U+F00D), `status-warn` (U+F071), `infra-server` (U+F233), `infra-database` (U+F1C0), `loc-home-primary` (U+F015), `loc-aviation` (U+F072, the JR signature glyph), `comms-mail` (U+F0E0), `dev-terminal` (U+F120).

Glyph rules: ceremonial docs use glyphs sparingly (metadata only, never body prose). Instrumented docs use glyphs to carry meaning, never decoration. Color follows function: status glyphs use semantic R/Y/G; brand-context glyphs use the appropriate accent.

## Layout

- Page padding: 48px (desktop)
- Section spacing: 72px between major sections
- Element spacing: 20px within sections
- Content max-width: 1280px (technical), 720px (prose)
- Hierarchy comes from type weight, case, and color — never from boxes, gradients, or shadows.

## The Disciplines (most important rules)

1. **Single accent per context.** Sky in light, amber in dark. Never both. At most three places per page.
2. **Brand and semantic colors are separate layers.** A green panel means "OK," not "decorative panel." Don't mix.
3. **Negative space carries weight.** Industrial elements reveal clutter; they don't hide it. When in doubt, remove.
4. **Sources are honest, not invented.** Colors come from cockpit instrumentation and sectional charts; type from open foundries with clear lineages; industrial elements from drafting tradition.

## What This System Is NOT

- Not a corporate brand system (no tagline, no mission statement)
- Not maximalist (when adding vs. removing is even, remove)
- Not skeuomorphic (references the cockpit, doesn't imitate it — no textures, no instrument-bezel UI)
- Not a startup deck aesthetic (no gradients, no glass effects, no large emoji, no rounded fully-bubble buttons)
- Not a single-purpose system (must serve both a thank-you note and a 50-page infrastructure report)

## Voice & Naming

System name: **"Charts & Vectors."** Personal contexts sign as "JR" or "James Rossie." Technical contexts sign as **"R—Net"** with em-dash (never hyphen). Dates: `YYYY.MM.DD` for technical, "14 · MAY · 2026" for ceremonial.

## When generating output in this system

- Default to restraint. If a design feels like it needs one more thing, try removing one thing instead.
- Never invent colors, fonts, or grammar primitives outside this spec.
- Respect WCAG contrast: never use `amber` on light surfaces; never use `soft` or `night-soft` for body text.
- If a glyph role has uncertain codepoint (MDI entries in particular), surface the uncertainty rather than using silently.
- When in doubt, re-read the disciplines (above) — most decisions resolve themselves against those four principles.

---

*Standard spec v1.0 · 2026.05.14 · derived from SYSTEM.md v1.2*
