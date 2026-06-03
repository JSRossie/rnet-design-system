# Shipping Manifest — JR / R—Net Design System

**For:** James Rossie
**Codename:** Charts & Vectors

This is the running shipping log. Each entry below is a numbered release on the manifest's own counter (v1.0, v1.1, …) — a scale distinct from the internal document version of any single file. `SYSTEM.md`, `GLYPHS.md`, and `VOICE.md` each version independently; an entry records which file versions a release shipped (e.g. release v1.4 shipped `SYSTEM.md` v1.6). New work appends to the top; previous entries stay intact.

---

## v1.8 — 2026.06.02 · JR monogram on the CDN

The R—Net pack (release v1.6) published every lockup to the CDN but left the parent JR seal — the mark the whole pack derives from — reachable only as a repo file. This closes that gap: the three monograms now have stable, CORS-open, immutably-cached URLs alongside the lockups. No new asset was drawn; the existing `components/monogram-{light,dark,mono}.svg` are published as-is. They are path-only (no live `<text>`), so unlike the wordmarks there is nothing to outline — the build copies and rasterizes them straight from source.

The naming follows the wordmark's `day/night/mono` surface convention (`light`→`day`, `dark`→`night`) and drops the `r-net-` prefix, since the seal is not an R—Net lockup — exactly as `fpm-mark` stands alone. Canonical name: `jr-monogram-{day,night,mono}`.

### Added

- **CDN: `charts-and-vectors/logos/{svg,png}/jr-monogram-{day,night,mono}`** — the JR seal, published from its canonical `components/monogram-*.svg` source. SVG (path-only, self-contained) + PNG (1024px square). Same immutable + CORS contract as the lockups; `_headers` already matches by glob, so no header rule was added.

### Changed

- **`components/rnet/build-logos.sh`** — after building the 24 lockups from `src/`, it now also publishes the parent monogram from `../monogram-{light,dark,mono}.svg` into `svg/`+`png/` under the `jr-monogram-*` names (path-only, so copied not outlined; rasterized at 1024px). The residual-`<text>` guard still passes. `cdn/build.sh` is unchanged — it already copies the whole `svg/`+`png/` set, so the pack growing 24 → 27 needs no deploy-script edit.
- **`SYSTEM.md`** → v1.13. Extended §5 with the monogram's CDN names and URL table, noted the publication in the §14 file tree, and added the v1.13 row to §13.
- **`components/rnet/README.md`** → pack v1.2. Updated the layout counts (24 → 27), the at-a-glance table, the full URL table, and the regenerate procedure.
- **`components/README.md`**, **`cdn/HOSTING.md`** — recorded that the monograms are now CDN-published and that `build-logos.sh` is their publish path; added a monogram verify command.

### Discipline check

- ✓ No new asset, primitive, color, token, or component. An existing mark gained a URL; nothing was drawn or restyled.
- ✓ No CDN duplication. The published copy is generated from the single canonical source and `.gitignored`, like the `css/v1/` channel and the lockups; the immutable-per-filename contract holds.
- ✓ Naming stays inside the established grammar — `day/night/mono` surface words, `r-net-`-prefix reserved for lockups — so the seal reads as the pack's parent, not a sibling lockup.
- ✓ The source-of-truth relationship is honest: the seal's home stays at `components/monogram-*.svg` (§5), and the docs point there, not at the generated CDN copy.

---

## v1.7 — 2026.05.24 · Table line-break polish

The first adoption from a downstream repo's handoff. Sabrina-Flight-Path validated two table behaviors against 50 real data tables and asked the system to make both defaults: `text-wrap: pretty` on cells, and a content-driven auto-width algorithm. Only the first lands here — it fits the system's declarative, link-one-stylesheet model exactly. The second was declined for this pass, on the record, because it would change what kind of repo this is.

### Changed

- **`markdown.css`** — added `:is(.md, body.vscode-body) :is(td, th) { text-wrap: pretty; }` to the §17 table treatment. A wrapped cell's final lines rebalance so a lone word is never stranded. It changes no column geometry, no-ops on single-line and numeric cells, falls back to today's behavior where unsupported (Chromium + recent Safari yes, Firefox lagging), and is harmless on the §17.5 metadata strip (single-line cells). Propagates through the rolling `css/v1/` channel on the next deploy; pinned consumers are unaffected.
- **`SYSTEM.md`** → v1.12. Noted `text-wrap: pretty` in the §17 tables row, added the v1.12 row to §13, and corrected the stale `Version:` header and footer (both read 1.7 while §13 was already 1.11 — the 1.8–1.11 work never refreshed them).

### Declined, on the record

- **The auto-width algorithm (handoff D2)** — not adopted. The system is a declarative CSS/asset/docs repo with no JS toolchain; D2 is a build-time, font-coupled JavaScript dependency that only consumers with a build step can run (the §17.5 VS Code preview target cannot), and its baked `glyph-metrics.json` goes silently stale on any font re-subset. It needs its own scoped project answering *where it runs* and *how the metrics stay in sync with the fonts* before it can be a default. The downstream repo keeps its local implementation meanwhile.
- **The "Token / asset checklist" (handoff)** — declined as framed. It is presented as table geometry to be "replicated, not reinvented," but it describes the downstream repo's richer `tables.css` (13.5px body, 1.2px header tracking, 2px header rule, `tabular-nums`, zebra rows, a 46ch first-column cap), not this system's current treatment. Adopting it wholesale is a visual redesign of the shipped v1 table — it would retroactively restyle every existing v1 document on the rolling channel — not a replication. `tabular-nums` on numeric columns may be lifted later on its own merit; zebra and the first-column cap are on hold pending a deliberate discipline check.

### Discipline check

- ✓ CSS-only, no new primitive, color, token, or component. The rule reads no new role and adds no geometry.
- ✓ Negative-space discipline intact. The orphan fix removes a visual blemish; it adds no mark. The decorative parts of the downstream checklist (zebra striping) were *not* adopted by reflex — they were set aside for a discipline check, which is the §0 "when adding and removing are even, remove" instinct working as intended.
- ✓ Honest about scope. D2 and the geometry checklist are recorded as declined with reasons, not silently dropped — a downstream repo reading this manifest learns the system does **not** yet compute column widths, so it won't propagate that claim onward.
- ✓ Pinned consumers are stable; only the rolling channel moves, as the channel contract intends.

---

## v1.6 — 2026.05.22 · R—Net logo pack

The R—Net brand ships as a real lockup pack, integrated and published rather than left in staging. Eight lockups (wordmark; wordmark + `INFRASTRUCTURE`; JR-horizontal ±rule; JR-horizontal + subtitle; JR-stacked; JR-stacked + subtitle; the FPM mark alone), each in day / night / mono — every one composed from the JR seal, the cockpit palette, and Outfit / JBM. No new primitive. The integration's real work was making the marks portable: the incoming wordmarks rendered their letters as live `<text>`, which silently falls back to a system font anywhere the page isn't already loading the fonts — i.e. exactly the CDN-hotlink case — so the distributable form is outlined to `<path>`.

### Added

- **`components/rnet/`** — the pack. `src/` (editable, font-referenced SVGs), `svg/` (outlined, self-contained — the distributable), `png/` (rasters of the outlined form), all 24 variants each.
- **`components/rnet/outline-text.py`** — bakes `<text>` to `<path>` using the **self-hosted** Outfit (instanced at wght 600) and JetBrains Mono 500 woff2. Resolves inherited font properties and `text-anchor`, preserves enclosing transforms.
- **`components/rnet/build-logos.sh`** — `src/` → `svg/` + `png/` (outline, then rasterize via `rsvg-convert`). Reproducible offline; no third-party font CDN.
- **`components/rnet/README.md`** — pack usage rules, clear-space, minimum sizes, the FPM-glyph note, and the regenerate procedure.
- **CDN: `charts-and-vectors/logos/{svg,png}/`** — published from the canonical source by `cdn/build.sh`. CORS-open, immutably cached, `image/svg+xml` / `image/png`.

### Changed

- **`SYSTEM.md`** → v1.11. Extended §5 with the R—Net logo pack (the two forms, the CDN URLs) and recorded the logo-only **FPM glyph** — the HUD velocity-vector standing in for the wordmark em-dash, scoped against the §11 prose rule and excluded from the §6 element kit. Added the v1.11 row to §13 and the `components/rnet/` subtree to the §14 file tree.
- **`components/rnet/render-pngs.html`** — reworked off Google Fonts onto the self-hosted woff2 from `cdn.rossie.net`; demoted to an ad-hoc-sizes fallback behind `build-logos.sh`.
- **`cdn/build.sh`** — publishes `logos/` from `components/rnet/{svg,png}` at deploy. **`cdn/_headers`** — added disjoint immutable + CORS rules for `logos/*.svg` and `logos/*.png`. **`cdn/HOSTING.md`** — documented the namespace, the source-of-truth relationship, and a verify command. **`.gitignore`** — ignores the generated `cdn/.../logos/` and the logo toolchain venv.
- **`components/README.md`** — added the `rnet/` pack to the directory's contents.

### Discipline check

- ✓ No new color, type, token, radius, or motion primitive. The pack composes entirely from existing roles; the §4.5 matrix is untouched.
- ✓ The FPM glyph is the only new geometry, and it is fenced: logo-only, never inline, not added to the §6 kit. The §11 em-dash rule for prose `R—Net` is unchanged.
- ✓ Self-hosting discipline held. The build and the reworked harness read the system's own woff2 — `fonts.googleapis.com` is gone from the pipeline, matching `HOSTING.md`.
- ✓ No CDN duplication. `logos/` is generated from the canonical source and `.gitignored`, like the `css/v1/` channel; the immutable-per-filename contract matches the fonts.

---

## v1.5 — 2026.05.17 · Data visualization

The chart layer the codename always promised. Promotes candidate #1 of the v1.6 staging note: a data-visualization standard covering eleven chart types, with the discipline question — how a multi-series chart escapes the single-accent rule — answered in the spec rather than at the call site.

### Added

- **`charts.css`** — the data-visualization layer, a new top-level file parallel to `controls.css` and `markdown.css`. Imports `colors_and_type.css`. Styles eleven chart types (line, area, sparkline, bar / column, stacked & grouped bar, scatter, histogram, heatmap, gauge, meter, big-number stat, network diagram) across two render paths — CSS / HTML for grid-aligned charts, SVG for charts needing arbitrary geometry. No charting library, no runtime JS. Documented as `SYSTEM.md §19`.
- **`reference/charts-showcase.html`** — every §19 chart type in both modes, the day-vs-night compare reference.
- **`proposals/graduated/data-visualization.md`** — the promotion record: the gap, the catalog, the palette sourcing, and the open questions.

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

A writing-voice standard for prose deliverables — the editorial voice graduates from `proposals/graduated/rnet-voice.md` into the spec. The system's first extension that is editorial rather than visual.

### Added

- **`VOICE.md`** — the editorial-voice standard, a new top-level living reference parallel to `GLYPHS.md` and versioned independently (v1.0). Specifies the written voice across eight dimensions (persona, address, diction, syntax, rhythm, modality, architecture, mechanics), plus structural choices, a banned-pattern reference, before/after examples, and a ten-step revision checklist. Documented as `SYSTEM.md §18`. Originates as a skill authored in a separate project; its examples were genericized to an R—Net infrastructure briefing so the standard carries no outside-project reference.
- **`.claude/skills/rnet-voice/SKILL.md`** — the invokable form of the standard, sibling to the `font-subset` skill. Defers to `VOICE.md` as canonical.

### Changed

- **`SYSTEM.md`** → v1.5. Added `§18 Editorial Voice` (the written voice as the prose sibling of the visual system, the em-dash distinction against §11, a pointer to `VOICE.md`). Retitled `§11` "Voice & Naming" → "Naming & Signing" — the section number is unchanged, so every existing §11 cross-reference stays valid. Added the v1.5 row to §13 and the `VOICE.md` entry to the §14 file tree. Corrected the stale `Version:` header (was 1.3; §13 and the footer were already 1.4).
- **`STANDARD.md`** → v1.1. Added a "Written Voice" section, retitled its "Voice & Naming" heading to "Naming & Signing" to match SYSTEM.md, and refreshed the footer (`derived from SYSTEM.md v1.5`).
- **`prompts/for-claude.md`** → v1.1, **`prompts/for-chatgpt.md`** → v1.1 — added a voice pointer: when the deliverable is prose, attach `VOICE.md`. The two visual-generation prompt files (`for-v0`, `for-design-tools`) are unchanged.
- **`README.md`** — added a `VOICE.md` bullet under "What's in this repository."
- **`proposals/graduated/rnet-voice.md`** — opened and decisions resolved this branch; status "ready to graduate."

### Discipline check

- ✓ Editorial only. No colors, tokens, primitives, components, or CSS were touched — the change is entirely in prose documentation.
- ✓ `VOICE.md` is self-contained. Examples genericized off the source project; no outside-project reference remains.
- ✓ §11 was retitled, not renumbered. Cross-references from §17.4 and the date-format rules stay valid.

---

## v1.2 — 2026.05.17 · Rendered markdown

Styling for rendered markdown and markdown previews — the markdown content pattern graduates from `proposals/graduated/markdown-preview.md` into the spec.

### Added

- **`markdown.css`** — rendered-markdown stylesheet, a new top-level file parallel to `controls.css`. Imports `colors_and_type.css` and styles the bare elements a markdown renderer emits (`h1`–`h6`, `p`, lists, `pre`, `code`, `blockquote`, `hr`, `table`) with no class hooks on the rendered output. Code blocks and callouts re-derive the `.codeblock` / `.alert--note` treatment from the §4.7 layer — no forked role variables. Includes the `.doc` preview-chrome classes. Documented as `SYSTEM.md §17`.
- **`reference/markdown-showcase.html`** — rendered markdown in both modes, with a live YAML front-matter previewer and a manual day/night toggle.

### Changed

- **`colors_and_type.css`** — added the prose-scoped heading-ramp tokens `--type-md-h1` (38px), `--type-md-h2` (26px), `--type-md-h3` (18px). A §15 type extension; deliberately distinct from the §16 UI ramp.
- **`SYSTEM.md`** → v1.4. Added `§17 Rendered Markdown` (content vs. chrome, heading ramp, element mapping, front-matter vocabulary), added the v1.4 row to §13, listed `markdown.css` and `markdown-showcase.html` in §14, and added a §17 pointer to the §3 type-additions note.
- **`README.md`** — added bullets for `markdown.css` and the markdown showcase under "What's in this repository."
- **`reference/README.md`** — added a "Markdown reference" section for `markdown-showcase.html`.
- **`proposals/graduated/markdown-preview.md`** — open decisions (§4) resolved; status updated to "ready to graduate."

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
