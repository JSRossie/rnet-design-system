# Shipping Manifest — JR / R—Net Design System

**For:** James Rossie
**Codename:** Charts & Vectors

This is the running shipping log. Each entry below is a numbered release on the manifest's own counter (v1.0, v1.1, …) — a scale distinct from the internal document version of any single file. `SYSTEM.md`, `GLYPHS.md`, and `VOICE.md` each version independently; an entry records which file versions a release shipped (e.g. release v1.4 shipped `SYSTEM.md` v1.6). New work appends to the top; previous entries stay intact.

---

## v1.5 — 2026.05.17 · Data visualization

The chart layer the codename always promised. Promotes candidate #1 of the v1.6 staging note: a data-visualization standard covering eleven chart types, with the discipline question — how a multi-series chart escapes the single-accent rule — answered in the spec rather than at the call site.

### Added

- **`charts.css`** — the data-visualization layer, a new top-level file parallel to `controls.css` and `markdown.css`. Imports `colors_and_type.css`. Styles eleven chart types (line, area, sparkline, bar / column, stacked & grouped bar, scatter, histogram, heatmap, gauge, meter, big-number stat, network diagram) across two render paths — CSS / HTML for grid-aligned charts, SVG for charts needing arbitrary geometry. No charting library, no runtime JS. Documented as `SYSTEM.md §19`.
- **`reference/charts-showcase.html`** — every §19 chart type in both modes, the day-vs-night compare reference.
- **`proposals/data-visualization.md`** — the promotion record: the gap, the catalog, the palette sourcing, and the open questions.

### Changed

- **`tokens.css` / `tokens.json`** → v1.2. Four new primitives — `terrain-deep` (`#5A6B33`), `terrain-light` (`#9DAE73`), `scope-deep` (`#2F6562`), `scope-light` (`#82AEA9`) — for the two categorical series hues the existing palette could not honestly supply. Added through the §15 palette procedure: honest source (VFR sectional terrain green; radar-scope / EFIS phosphor teal), contrast-verified, named to the `category-modifier` scheme.
- **`colors_and_type.css`** — added the chart roles `--series-1..6` and `--seq-1..5` to both `[data-mode]` blocks. The series ramp aliases four existing tokens and the two new primitives; the sequential ramp aliases existing tokens only — it introduces no new color.
- **`SYSTEM.md`** → v1.7. Added `§19 Data Visualization` (chart palette, the §19.2 single-accent exemption, the eleven-type inventory, render model, discipline). Added a "Chart data" block to the §4.5 contrast matrix, a §19.1 pointer to the §4 layer intro, the v1.7 row to §13, and `charts.css` / `charts-showcase.html` to the §14 file tree.
- **`README.md`** — added bullets for `charts.css` and the charts showcase under "What's in this repository."
- **`reference/README.md`** — added a "Charts reference" section for `charts-showcase.html`.

### Discipline check

- ✓ Four new primitives, no more. The categorical ramp needed two new hues — the system has no honest non-semantic green and no fifth distinguishable hue — and each was sourced the way §2 requires, not reached for off a generic chart palette. The sequential ramp added nothing.
- ✓ Magenta stayed excluded. Its v0.8 exclusion held even under the pressure of a six-color ramp.
- ✓ The single-accent rule was not weakened. §19.2 grants a *scoped* exemption — the ramp is legible inside a chart frame and nowhere else — mirroring how §17.3 exempts link-dense documents.
- ✓ Semantic colors stay semantic. §19.5 forbids using `--series-*` for status or §4.4 colors for series identity.
- ✓ No new motion, radius, or type primitives. `charts.css` reads only `--*` roles.
- ✓ Pie, donut, 3-D, and skeuomorphic-bezel gauges are named and declined in §19.3, so they are not re-raised.

---

## v1.4 — 2026.05.17 · Page chrome guidance

A general account of the chrome regions every template shares — the frame the §10 content patterns were already filling without a documented vocabulary for it. No new file: the work is a restructure of two existing SYSTEM.md sections.

### Changed

- **`SYSTEM.md`** → v1.6. Restructured §10 "Content Patterns" → "Page Chrome & Content Patterns". Added **§10.1 Chrome regions** — a non-prescriptive, all-template account of the classification stripe, accent stripe, eyebrow, title + metadata block, footer, and corner brackets, framed as orientation rather than a checklist. Gathered the four existing patterns under **§10.2**, aligning their `Header` / `Sender meta` / `Contact block` bullet labels to the §10.1 region names so the patterns read as instances of one frame. §17.4 front-matter table gained a **Feeds** column mapping each field to the §10.1 region it reaches; §17.1 now points to §10.1. Added the v1.6 row to §13.

### Discipline check

- ✓ Editorial only. No colors, tokens, primitives, components, or CSS were touched.
- ✓ §10 was restructured, not renumbered — the section keeps its number, so every existing §10 cross-reference stays valid.
- ✓ §10.1 is orientation, not a checklist: it describes what each region is *for* and leaves placement to the author. The closing rule holds the §15 line — chrome metadata drives content only, never styling.
- ✓ Facet 2 of the open task (the markdown front-matter vocabulary) needed no new work — it already shipped as §17.4 in v1.2 of this manifest; v1.4 only cross-links it to the new region names.
- ✓ `STANDARD.md` and `SHORT.md` unchanged — both carry the industrial-grammar primitives but no content-pattern section, so the chrome account stays a SYSTEM.md-level concern.

---

## v1.3 — 2026.05.17 · Editorial voice

A writing-voice standard for prose deliverables — the editorial voice graduates from `proposals/rnet-voice.md` into the spec. The system's first extension that is editorial rather than visual.

### Added

- **`VOICE.md`** — the editorial-voice standard, a new top-level living reference parallel to `GLYPHS.md` and versioned independently (v1.0). Specifies the written voice across eight dimensions (persona, address, diction, syntax, rhythm, modality, architecture, mechanics), plus structural choices, a banned-pattern reference, before/after examples, and a ten-step revision checklist. Documented as `SYSTEM.md §18`. Originates as a skill authored in a separate project; its examples were genericized to an R—Net infrastructure briefing so the standard carries no outside-project reference.
- **`.claude/skills/rnet-voice/SKILL.md`** — the invokable form of the standard, sibling to the `font-subset` skill. Defers to `VOICE.md` as canonical.

### Changed

- **`SYSTEM.md`** → v1.5. Added `§18 Editorial Voice` (the written voice as the prose sibling of the visual system, the em-dash distinction against §11, a pointer to `VOICE.md`). Retitled `§11` "Voice & Naming" → "Naming & Signing" — the section number is unchanged, so every existing §11 cross-reference stays valid. Added the v1.5 row to §13 and the `VOICE.md` entry to the §14 file tree. Corrected the stale `Version:` header (was 1.3; §13 and the footer were already 1.4).
- **`STANDARD.md`** → v1.1. Added a "Written Voice" section, retitled its "Voice & Naming" heading to "Naming & Signing" to match SYSTEM.md, and refreshed the footer (`derived from SYSTEM.md v1.5`).
- **`prompts/for-claude.md`** → v1.1, **`prompts/for-chatgpt.md`** → v1.1 — added a voice pointer: when the deliverable is prose, attach `VOICE.md`. The two visual-generation prompt files (`for-v0`, `for-design-tools`) are unchanged.
- **`README.md`** — added a `VOICE.md` bullet under "What's in this repository."
- **`proposals/rnet-voice.md`** — opened and decisions resolved this branch; status "ready to graduate."

### Discipline check

- ✓ Editorial only. No colors, tokens, primitives, components, or CSS were touched — the change is entirely in prose documentation.
- ✓ `VOICE.md` is self-contained. Examples genericized off the source project; no outside-project reference remains.
- ✓ §11 was retitled, not renumbered. Cross-references from §17.4 and the date-format rules stay valid.

---

## v1.2 — 2026.05.17 · Rendered markdown

Styling for rendered markdown and markdown previews — the markdown content pattern graduates from `proposals/markdown-preview.md` into the spec.

### Added

- **`markdown.css`** — rendered-markdown stylesheet, a new top-level file parallel to `controls.css`. Imports `colors_and_type.css` and styles the bare elements a markdown renderer emits (`h1`–`h6`, `p`, lists, `pre`, `code`, `blockquote`, `hr`, `table`) with no class hooks on the rendered output. Code blocks and callouts re-derive the `.codeblock` / `.alert--note` treatment from the §4.7 layer — no forked role variables. Includes the `.doc` preview-chrome classes. Documented as `SYSTEM.md §17`.
- **`reference/markdown-showcase.html`** — rendered markdown in both modes, with a live YAML front-matter previewer and a manual day/night toggle.

### Changed

- **`colors_and_type.css`** — added the prose-scoped heading-ramp tokens `--type-md-h1` (38px), `--type-md-h2` (26px), `--type-md-h3` (18px). A §15 type extension; deliberately distinct from the §16 UI ramp.
- **`SYSTEM.md`** → v1.4. Added `§17 Rendered Markdown` (content vs. chrome, heading ramp, element mapping, front-matter vocabulary), added the v1.4 row to §13, listed `markdown.css` and `markdown-showcase.html` in §14, and added a §17 pointer to the §3 type-additions note.
- **`README.md`** — added bullets for `markdown.css` and the markdown showcase under "What's in this repository."
- **`reference/README.md`** — added a "Markdown reference" section for `markdown-showcase.html`.
- **`proposals/markdown-preview.md`** — open decisions (§4) resolved; status updated to "ready to graduate."

### Discipline check

- ✓ No new colors. `markdown.css` reads only `--*` aliases from `colors_and_type.css`.
- ✓ No new primitives. The only new tokens are the three `--type-md-*` sizes, added per the §15 type-extension procedure and scoped to the prose context.
- ✓ Code blocks and callouts reuse existing component treatments rather than forking them.

---

## v1.1 — 2026.05.17 · First UI-control cohort

The system's first cohort of UI controls, plus the third monogram variant and a semantic-role layer that decouples components from the raw palette.

### Added

- **`colors_and_type.css`** — semantic role layer (`--bg`, `--fg-1`, `--accent`, `--rule`, `--focus-ring`, the `--field-*` family) plus `@font-face` declarations for Outfit, Urbanist, and JetBrainsMono. Imports `tokens.css`. Switches automatically on `<html data-mode="day | night">`. Documented as `SYSTEM.md §4.7`.
- **`controls.css`** — first production cohort: `.btn`, `.input`, `.field`, `.check`, `.radio`, `.switch`, `.range`, `.stepper`, `.combobox`, `.tag-input`, `.dropzone`, `.inline-edit`, `.badge`, `.alert`, `.banner`, `.toast`, `.tooltip`, `.card`, `.modal`, `.drawer`, `.accordion`, `.empty`, `.spinner`, `.skel`, `.tabs`, `.segmented`, `.crumbs`, `.pagination`, `.progress`, `.menu`, `.cmdk`, `.table`, `.stat`, `.topbar`, `.sidenav`, `.dot`, `.codeblock`, `.kbd`, `.avatar`. Documented as `SYSTEM.md §16`.
- **`components/monogram-mono.svg`** — third monogram variant (fax, emboss, single-color print). Fulfills the v1.0 "pending production" item.
- **`reference/controls-showcase.html`** — every control in both modes, plus a composed R—Net dashboard example.
- **`reference/controls-compare.html`** — day-vs-night side-by-side reference.
- **`reference/controls-preview/`** — 40 focused single-control preview cards.

### Changed

- **`tokens.json`** → v1.1. Added `radius` (none/field/chip/card/pill), `motion.easing.instrument` + `motion.duration.{fast,base,slow}`, `space.scale.1`–`10`, `border.ruleStrong`, and web-control `font.size.{subhead,h3,bodySmall,code}` + matching tracking + lineHeight entries. No primitives renamed or removed.
- **`tailwind.config.js`** → v1.1. Mirrored the tokens.json additions as Tailwind utilities (`rounded-field/chip/card/pill`, `ease-instrument`, `duration-fast/base/slow`, `spacing-1`–`10`, `border-hair/rule-strong`, `text-subhead/h3/body-sm/code`, `shadow-popover/modal`).
- **`SYSTEM.md`** → v1.3. Added `§4.7 Semantic Web-Control Roles`, added `§16 Components`, rewrote the "When extending UI components" subsection of §15 to reference §16, updated §14 file tree, added v1.3 row to §13 version table, added a note on web-control type additions to §3.
- **`README.md`** → v1.1. Added bullets for `colors_and_type.css`, `controls.css`, and the controls showcase under "What's in this repository."
- **`components/README.md`** → all three monograms now marked shipped.
- **`reference/README.md`** → entries added for `controls-showcase.html`, `controls-compare.html`, `controls-preview/`.

### Naming note (worth a future cleanup)

`colors_and_type.css` exposes the 20px web sub-section heading as `--type-h2`, while `SYSTEM.md §3`'s canonical "H2" is the 12px mono uppercase label. To avoid renaming an established CSS variable in active use, `tokens.json` distinguishes them as `font.size.h2` (12px, the label) and `font.size.subhead` (20px, the web sub-head). A future v1.2 of `colors_and_type.css` may add a `--type-subhead` alias and deprecate `--type-h2`.

### Discipline check

- ✓ No new colors. All `controls.css` rules read from `--*` aliases in `colors_and_type.css`, which read from primitives in `tokens.css`.
- ✓ No new motion or radius primitives at the JSON layer beyond the additions catalogued in §4.7.
- ✓ Every shipped class is exercised in both `controls-showcase.html` and `controls-compare.html` — verifying the two-distinct-contexts rule in §15.

---

## v1.0 — 2026.05.14 · First stable release

### What was in the box

#### Core documentation
- **`README.md`** (v1.0) — The story. Read first. ~1,341 words. Hand-editable for voice.
- **`SYSTEM.md`** (v1.2) — Complete specification with verified WCAG contrast ratios, all four color layers, type system, content patterns, and extension procedure.
- **`GLYPHS.md`** (v2.0) — Role-based glyph registry. ~30 sanctioned roles with confidence tags. Includes test harness and audit procedure.

#### AI-prompt-ready spec versions
- **`SHORT.md`** — One paragraph. For tight context budgets.
- **`STANDARD.md`** — Page-or-two. For most system prompts.

#### Machine-readable tokens (drop-in)
- **`tokens.json`** (v1.0) — Style Dictionary / W3C Design Tokens format.
- **`tokens.css`** (v1.0) — CSS custom properties.
- **`tailwind.config.js`** (v1.0) — Tailwind preset.

#### AI prompts (one per tool)
- **`prompts/for-claude.md`** — Three fidelity levels for Claude.
- **`prompts/for-chatgpt.md`** — Three fidelity levels for ChatGPT, with anti-patterns specific to GPT's quirks.
- **`prompts/for-v0.md`** — Path-A (token-first) and Path-B (prompt-only) for v0, Cursor, Lovable, Bolt.
- **`prompts/for-design-tools.md`** — Figma, Adobe Firefly, Illustrator, Midjourney, Photoshop.

#### Visual reference
- **`reference/style-guide.html`** (v1.0) — Interactive visual reference. Designed for both screen and print (US Letter, 0.75in margins). 7 sections + quick reference card.

#### Components (partial)
- **`components/monogram-light.svg`** — Shipped.
- **`components/monogram-dark.svg`** — Shipped.
- **`components/monogram-mono.svg`** — *Pending* (shipped in v1.1).
- **`components/templates/`** — Empty. Add document templates as built.

### Status at v1.0

All files aligned with `SYSTEM.md v1.2`. Spec was stable; controls intentionally deferred per §15 ("UI controls are deferred to point of need") until a real use case arrived. v1.1 is the realization of that promise.

---

*Manifest is append-only. New releases add a new section above; old sections are not edited except for typo fixes.*
