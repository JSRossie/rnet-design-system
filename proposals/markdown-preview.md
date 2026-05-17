# Proposal · Markdown Preview Styling & Template Chrome

**Status:** Proposal — not yet part of the spec
**Owner:** James Rossie
**Opened:** 2026.05.17
**Targets:** SYSTEM.md (a future minor version)

---

## 0. What this is

A working proposal, not spec. It records the assessment and open design
decisions for two related extensions to the JR / R—Net design system:

1. Styling for **rendered markdown** and markdown previews.
2. General, non-prescriptive guidance for the **chrome regions** of every
   template (header, eyebrow, footer, classification stripe).

Nothing here is binding until it is designed, resolved, and folded into
`SYSTEM.md` through the §15 extension procedure. The `proposals/` directory
is the staging area for that work — extensions live here while they are
being figured out, and only graduate into the spec once stable.

A non-tracked, exploratory HTML sample backs this proposal. It is kept in
`.temp/` (gitignored) because it is a scratch artifact, not a deliverable.

---

## 1. Markdown preview — viability

**Verdict: viable, and a natural fit.** Markdown's constrained vocabulary
suits a system whose first instinct is restraint. The system already
specifies the things a markdown stylesheet needs; the friction is narrow.

### Maps cleanly to existing primitives

| Markdown element | System primitive |
|------------------|------------------|
| Body paragraphs  | Body role (Urbanist 14–16, line-height 1.65–1.75), `--content-max-prose` 720px |
| `> blockquote`   | Note-callout panel — `urban` + `ground` border (light) / `night-3` + `sky` border (dark) |
| `` `inline code` `` | "Inline accent" type role, `night-4` chip |
| Tables           | R—Net sites-table pattern — mono uppercase headers, hairline rules, no fills |
| `---` horizontal rule | Hair rule (`--border-rule-hair`) |
| Light / dark     | The Two Modes (§9), 1:1 with a preview theme toggle |

### Gap 1 — heading hierarchy (needs a design decision)

The spec defines only **Display, H1, and H2**, and its H2 is an
*eyebrow/label* (11–12px uppercase mono) — not a section title. Markdown
routinely uses `#`–`####`, where `##` is a genuine section title. A markdown
`h2` cannot map onto the system's eyebrow H2.

**Proposed heading ramp** (a §15 type extension, to be confirmed):

| Markdown | Face | Size | Weight | Treatment |
|----------|------|------|--------|-----------|
| `h1` | Outfit | ~38px | 600 | Display-adjacent |
| `h2` | Outfit | ~26px | 500 | Heading + hairline underline |
| `h3` | Outfit | ~18px | 500 | Sub-heading |
| `h4` | JetBrainsMono | ~12px | 500 | Mono uppercase eyebrow, accent color |
| `h5`/`h6` | — | — | — | Fall back to bold inline; no new ramp step |

Markdown cannot author the full §8 numbered-section header (`NUM ▸ TITLE —
rule — META`), so the ramp leans on type weight and case, per §8's
"hierarchy via type, not decoration."

### Gap 2 — industrial grammar lives in the wrapper, not the content

Markdown has no syntax for monograms, accent stripes, corner brackets, or
numbered section headers. The system's grammar (§6) therefore belongs to the
**preview wrapper / chrome**, not the rendered body. The wrapper supplies
stripe, padding, max-width, and header/footer; the markdown content stays
disciplined plain prose underneath.

### Discipline note — links

A markdown document with many links would exceed §4.6's "accent in at most
three places." Resolve as §7 resolves glyphs: links *carry meaning*, so they
are exempt like functional glyphs — not decorative accent. This should be
written down explicitly when the pattern enters the spec.

---

## 2. Template chrome — general guidance (open task)

Separate from markdown, and broader. The system has no general account of
its **chrome regions** — only ad-hoc per-pattern mentions scattered through
§10. This task adds one.

### The regions

- **Classification stripe** — `ground-deep`, top of page; formal documents only.
- **Accent stripe** — the system's most visible single mark (§6).
- **Eyebrow** — left: wordmark + mono-uppercase label; right: meta.
- **Title + metadata block** — the document's name and its identifying line.
- **Footer** — left: wordmark / sign-off; right: locating metadata.

### The task

Add a SYSTEM.md section that gives guidance on how these regions tend to be
used **given the nature of the content** — across *all* template types
(stationery, covers, dashboards, status docs, field notes, markdown).

**It must not be prescriptive.** No "the footer must contain X" rules. The
goal is to orient an AI or human user: what each region is *for*, where
content naturally sits — then let them place it. The section should also
reconcile the per-pattern header/footer descriptions already in §10 so they
read as instances of one consistent idea rather than separate inventions.

The same regions are filled differently by content type — a personal
letter's footer is a contact block; a dashboard's is a location tag plus
timestamp; a formal cover's is `REV · COPY · AUTHOR`. The guidance's job is
to make that variation feel coherent, not to legislate it.

---

## 3. Front-matter vocabulary (markdown-specific)

Front matter is **markdown's mechanism** for feeding the chrome regions.
Other template types feed the same regions by other means (template
parameters, direct authoring). So this vocabulary belongs with the markdown
work, not the general chrome guidance.

It is **not a closed set.** It is a documented *superset* a markdown author
draws from, and the AI using the system may augment it with new fields when
a document genuinely needs one — reuse before inventing, per §15. A previewer
should handle unknown keys gracefully (ignore, or render into a generic meta
slot), not reject them.

### Known superset (starting point, open-ended)

| Field | Notes |
|-------|-------|
| `doc-id` | Document identifier number, e.g. `RNET-RB-0042`. Numbering scheme TBD. |
| `title` | Drives the `h1`. |
| `context` | `rnet` or `personal` — selects accent + surface (§9). |
| `mode` | Optional override of the context's default day/night. |
| `eyebrow` | Mono-uppercase label beside the wordmark. |
| `node` / `site` | Infrastructure node or site identifier (rnet). |
| `owner` / `author` | Responsible person. |
| `rev` / `version` | Semantic version (§11). |
| `created`, `reviewed`, `next-review`, `effective` | Dates; formatted per §11. |
| `class` | Classification — Internal / Confidential / Public / Draft. Draws the classification stripe. |
| `status` | Draft / Stable / Active / Deprecated. |
| `supersedes` / `superseded-by` | Cross-document references. |
| `copy` | Copy number for controlled distribution (§10 cover: `REV · COPY · AUTHOR`). |
| `recipient`, contact-block fields (email, location) | Ceremonial documents. |

### Discipline

Front matter — and chrome metadata generally — drives chrome **content**
only. It is never a styling escape hatch: no `accent-color`, no font fields.
Metadata selects from system primitives; it does not add new ones.

---

## 4. Open decisions

Resolve these before any of this graduates into `SYSTEM.md`:

1. **Heading ramp** — confirm the §2 ramp, especially whether `h4` keeps the
   mono-uppercase eyebrow treatment or all headings stay in Outfit.
2. **`doc-id` numbering scheme** — format and allocation method.
3. **Sequencing** — the chrome guidance (general) should likely land before
   or alongside the markdown pattern, since markdown's front matter feeds it.
4. **Spec placement** — which new section numbers, and the version bump.

---

## 5. Sequencing

The §2 chrome guidance is the durable, all-template piece. The markdown
preview styling (§1) and its front-matter vocabulary (§3) depend on it but
are narrower. Recommended order: resolve chrome guidance → resolve heading
ramp → ship the markdown pattern + front-matter superset together.

---

*Proposal · markdown-preview · opened 2026.05.17 · not yet spec*
