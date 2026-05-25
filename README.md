# Charts & Vectors

*The design system for James Rossie and R—Net.*

---

## Read this first

This is a design system built for two things that don't usually share a wardrobe: my personal correspondence and the technical documentation of R—Net, the network and infrastructure stack I run for my family. One is a thank-you note. The other is a fifty-page status report. They should feel like they came from the same person — because they did — without either becoming awkward in the other's company.

That's the whole brief. Everything in this repository serves it.

---

## How it started

I'd been looking at corporate design systems I admired — an employer's was the one that crystallized something — and trying to understand why some technical-looking work feels *considered* and other work feels generic. The answer turned out to be smaller than I expected: a single accent color used with discipline, a typographic hierarchy that doesn't shout, and the willingness to leave space empty.

The system that came out of that thinking borrows from three places. It borrows the **grid and restraint** of Swiss modernism — the Müller-Brockmann lineage that runs through IBM, Vignelli's NYC subway, and the modern Linear-and-Vercel aesthetic. It borrows the **accent-stripe-and-spec-sheet grammar** of industrial-modernist B2B design — Vertiv, Schneider Electric, Siemens. And then, more deliberately than either of those, it borrows from a third source that gave the system its name and its palette: the **aircraft cockpit**.

---

## The attitude indicator

Look at an attitude indicator — the artificial-horizon instrument in any cockpit. You'll see four colors arranged in a single small dial: a calm blue sky on top, a warm earth-brown ground on the bottom, an amber aircraft symbol at center, and a cream-white horizon line dividing them. Four colors that have to coexist legibly under stress, refined over decades of cockpit design, and that work together because they were always meant to.

That instrument is the source of this system's palette. The blue (`sky`, `#6B9BB8`) is the personal accent — the color of my monogram, the eyebrow labels on stationery, the moments that want quiet attention. The brown (`ground`, `#8B5A3C`) is the warm secondary — the second letter of the mark, the borders of callout panels, the anchored weight that keeps the system from floating. The amber (`amber`, `#D49826`, with its `amber-glow` variant for dark contexts) is the night-shift voice — the color that comes alive on R—Net's dark surfaces the way NVIS instrument lighting comes alive in a cockpit at night. The cream is the ink that paints over all of it.

Two more sources fill in the rest. The **surface tints** come from VFR sectional charts — the warm chart paper at low elevation, the soft ochre at populated bands, the quiet greens at sea level. The **structural neutrals** come from the warm panel grays of general aviation cockpits, not the cooler Boeing-blue grays of commercial airliners. Together those sources gave the system everything it needed without inventing a single color from nothing.

This matters because invented colors age. Borrowed ones don't.

---

## Two voices, one system

The system speaks in two voices. They share everything — typefaces, structural grammar, palette layers, icon vocabulary — and differ only in the surface they're written on and the accent they use.

The **ceremonial voice** lives on warm paper. It's where personal letters, formal documents, and gifts happen. Type breathes. The accent is sky-blue. Glyphs are nearly invisible — present only in the meta-information at the corners of a page. This voice signs as *James Rossie* or just *JR*.

The **instrumented voice** lives on warm charcoal. It's where R—Net dashboards, infrastructure documentation, and field reports happen. Type is denser. The accent is amber. Glyphs do real work, carrying status and category meaning the way an instrument panel does. This voice signs as *R—Net*, with an em-dash that visually echoes the horizon line of the attitude indicator.

Same person, same disciplines, different time of day.

---

## The disciplines

Four principles hold the system together. Everything else in SYSTEM.md derives from these.

**Single accent per context.** Sky in the ceremonial mode, amber in the instrumented mode. Never both, never a third. The accent appears in at most three places per page and always signals something specific. When in doubt, fewer.

**Brand colors and semantic colors live in separate layers.** Sky and amber and ground are *identity*. Red, yellow, and green are *status*. A green panel means something is OK, not "I wanted a green panel." Mixing the two layers is how disciplined systems become busy ones.

**Negative space carries weight.** The industrial elements — accent stripes, corner brackets, registration marks, calipers — work because there's air around them. They reveal clutter; they don't hide it. If a page feels noisy, the answer is almost never another mark.

**Sources are honest, not invented.** Every color comes from cockpit instrumentation or sectional charts. Type comes from open foundries with clear lineages. Industrial elements come from drafting tradition. When the system needs to grow, it grows from those sources — not from whatever felt fresh at the moment.

---

## What this system is not

It's not a corporate brand system — there's no tagline, no mission statement. It's not maximalist — when a choice between adding and removing is even, the system removes. It's not skeuomorphic — it *references* the cockpit, it doesn't pretend to be one. It's not a startup deck aesthetic — no gradients, no glass effects, no oversized buttons. And it's not a single-purpose system — it has to serve both a thank-you note and a fifty-page infrastructure review without either feeling forced.

Naming what the system isn't turns out to be as important as naming what it is. The discipline holds because the boundaries are explicit.

---

## What's in this repository

- **`SYSTEM.md`** — the complete specification. Read this when you need the rules: type roles, color tokens with verified contrast ratios, content patterns, the discipline rules, the procedure for extending the system.
- **`GLYPHS.md`** — the curated icon vocabulary. Role-based registry of 90 sanctioned glyphs across 9 categories from JetBrainsMono Nerd Font, with confidence tags and an audit procedure for keeping codepoints accurate across font versions. The `content-*` class (§5) marks typed content in a layered document corpus.
- **`VOICE.md`** — the editorial-voice standard. How prose deliverables read: a researcher-briefer voice across eight dimensions, a banned-pattern reference for the default-LLM tells, and a revision checklist. The written counterpart to the visual spec. See `SYSTEM.md §18`.
- **`SHORT.md`** and **`STANDARD.md`** — concise versions of the spec at different fidelity, sized to drop into AI system prompts.
- **`tokens.json`, `tokens.css`, `tailwind.config.js`** — machine-readable design tokens for use in any modern tool.
- **`colors_and_type.css`, `controls.css`** — drop-in web layer: semantic role aliases, `@font-face` declarations, and the first cohort of UI controls (buttons, fields, navigation, feedback, tables, modal). Switch modes with `<html data-mode="day | night">`. See `SYSTEM.md §4.7` and `§16`.
- **`glyphs.css`** — generated name-based glyph classes (`<span class="glyph glyph-content-briefing">`), one per `GLYPHS.md` role. Reference a glyph by role name instead of pasting a raw PUA codepoint; rebuilt from `GLYPHS.md` by `fonts/build-fonts.sh`.
- **`markdown.css`** — drop-in styling for rendered markdown: a prose-scoped heading ramp, code, callouts, and tables, plus preview chrome. Styles bare rendered output with no class hooks, and reaches the VS Code built-in markdown preview as a named target. See `SYSTEM.md §17`.
- **`charts.css`** — drop-in data-visualization layer: eleven chart types (line, bar, heatmap, gauge, network diagram, and more) across a CSS and an SVG render path, with a categorical series ramp and a sequential ramp. No charting library, no runtime JS. See `SYSTEM.md §19`.
- **`/prompts`** — prompts tuned for Claude, ChatGPT, v0, and design tools. The shortest path to consistent AI output.
- **`/components`** — the monogram in its three variants (light, dark, monochrome), plus document templates as they're built.
- **`/reference/style-guide.html`** — an interactive visual reference that shows the system in use. Also available as a print-ready PDF.
- **`/reference/controls-showcase.html`** — every control in both modes, plus a composed R—Net dashboard example. The fastest way to see the controls in context.
- **`/reference/markdown-showcase.html`** — rendered markdown in both modes, with a live front-matter previewer that drives the document chrome.
- **`/reference/markdown-vscode-preview.html`** — the VS Code preview target (`§17.5`): the metadata strip, stripe, and footer as `markdown.css` draws them under `body.vscode-body`, with a day/night toggle.
- **`/reference/charts-showcase.html`** — every chart type in both modes, day and night side by side.

If you're starting from zero: read this file, then SYSTEM.md, then open the style guide. If you're building a web UI, open the controls showcase next. That's enough to use the system competently for almost any task.

---

## Working with this system

A few small practices that help:

The system rewards restraint. If a design feels like it needs one more thing, try removing one thing instead. The space you leave is what makes the marks that remain meaningful.

When extending the system — a new component, a new role, a new tint — follow the procedures in SYSTEM.md §15 rather than improvising. The procedures exist precisely to keep extensions from accumulating into drift.

When an AI is producing output in this system, give it the spec and trust it less than you trust the spec. AI tools are excellent at honoring constraints they can see and indifferent to constraints they can't. Paste the right document for the job, then verify against the rules.

The system's documents read best in the system. This repository carries a `.vscode/` configuration that styles its own markdown in the VS Code preview — the same treatment is available to any project by pointing `markdown.styles` at `markdown.css` and installing the one recommended extension. See `SYSTEM.md §17.5`.

---

## A closing line

The whole system is an argument that *the way you write a thank-you note* and *the way you document a network* can come from the same hand without either being diminished by the company of the other. If it works — if a letter to a friend and a status report on a backup job both feel like they were authored deliberately, by the same person — then the system has done its job.

The cockpit runs through everything here, but it isn't the subject, and aviation isn't the whole of who I am — it's one instrument on a wider panel, one vector among many. What I crave is larger than flight: well-made systems of every kind — an instrument, a building, a piece of infrastructure — where elegance isn't applied to the thing but falls out of it working exactly as it should. Design that optimizes function until the two can't be told apart. The attitude indicator is only the cleanest small example I know. This system is the next one I built.

The rest is just paper, ink, and air.

— JR

---

*Last updated 2026.05.17. The README tracks the system rather than carrying its own version — see `SHIPPING.md` for the release log.*
