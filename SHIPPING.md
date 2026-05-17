# Shipping Manifest — JR / R—Net Design System

**For:** James Rossie
**Codename:** Charts & Vectors

This is the running shipping log. Each entry below corresponds to a released version of the system. New work appends to the top; previous entries stay intact.

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
