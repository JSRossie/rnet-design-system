# Charts & Vectors in the VS Code Markdown Preview — Implementation Plan

**Status:** Graduated 2026.05.18 into `SYSTEM.md` §17.5, `markdown.css`, and `colors_and_type.css`. Retained for design-rationale history; not a live proposal.
**Branch:** `11-markdown-preview-vscode`
**Supersedes the approach in:** `proposals/superseded/cv-markdown-preview-extension-proposal.md`
**Drafted:** 2026.05.18
**Shipped in:** SYSTEM.md v1.8

---

## 0. What changed since the extension proposal

The extension proposal concluded a first-party VS Code extension was
necessary, on the premise that `markdown.styles` injects CSS and nothing else,
so per-document chrome content can never reach the preview DOM.

That premise is wrong. `bierner.markdown-yaml-preamble` — a Microsoft-authored
extension by the engineer who owns the built-in preview — already contributes a
`markdownItPlugin` that renders YAML front matter into the preview DOM as a
`<table>`. The front-matter values are therefore in the DOM as text, and plain
CSS can restyle that table into chrome.

The objective is reachable with **no extension we author or maintain**. The
design system keeps shipping CSS, exactly as it does today. The §4 packages
restructure is not needed and is not part of this plan.

## 1. Decisions, against the proposal's §7

| Proposal §7 question | Decision |
|---|---|
| Widen `colors_and_type.css` mode selectors | **Yes.** Phase 1. |
| Restructure the repo into packages | **No.** No build toolchain is introduced; the rationale is gone. |
| Is a markdown-preview extension in scope | **Moot.** No extension is built. The system depends on one external extension and ships only CSS. |
| Confirm the §3 scope boundary as a standing rule | **Yes**, adopt it regardless — recorded in SYSTEM.md §17. |

## 2. Approach

Three pieces, all CSS and prose:

1. **Semantic layer** recognizes VS Code's theme body classes, so the token
   set activates in the preview.
2. **`markdown.css`** widens its element selectors to also match the preview's
   `body.vscode-body`, and gains one new section that restyles the
   front-matter table and draws the stripe and footer.
3. **Spec, README, and a dogfood `.vscode/settings.json`** record the new
   target and the one-line install.

One stylesheet, one source. No `markdown-vscode.css` fork, no build transform:
the existing `markdown.css` carries both scopes through `:is()`.

## 3. Phase 1 — Semantic layer recognizes the VS Code themes

`colors_and_type.css`, three edits, no new tokens — the existing token blocks
gain selectors:

```css
:root,
[data-mode="day"],
body.vscode-light                                 { /* day tokens   */ }

[data-mode="night"],
body.vscode-dark,
body.vscode-high-contrast,
body.vscode-high-contrast-light                    { /* night tokens */ }
```

High-contrast routes to the night set as a **placeholder** — see §6.

## 4. Phase 2 — `markdown.css`

### 4.1 Widen the element rules to both scopes

Every `.md`-scoped rule becomes `:is(.md, body.vscode-body)`-scoped. In a
standalone page the `body.vscode-body` arm never matches; in the preview the
`.md` arm never matches. One file, no duplication, no fork. `:is()` is
baseline-supported in every engine VS Code's webview uses.

The file header's "Two scopes" note is updated to name the third target.

### 4.2 New section — VS Code preview chrome

A clearly-delimited block of `body.vscode-body`-only rules. These are genuinely
new rules, not rescoped ones, because the preview has no `.doc` wrapper:

- **Accent stripe** — `body.vscode-body::before`, full-width, `--accent`.
  Mirrors `.doc-stripe`.
- **Metadata strip** — `body.vscode-body > table:first-child`, the front-matter
  table from `markdown-yaml-preamble`, restyled into the §10.1 title +
  metadata block: compact mono, `thead` keys as tracked micro-labels above
  their `tbody` values. The table is already a key/value grid; we are styling
  it, not rebuilding it. No front-matter key-order rule is needed.
- **Classification stripe** — a thin `--ground-deep` rule under the strip,
  drawn unconditionally for the preview target.
- **Footer** — `body.vscode-body::after`, hairline top border plus a
  wordmark. Text, not an image — no wordmark asset is published to the CDN.
  The text is a `--doc-footer` custom property with the system wordmark as
  fallback, so a consumer project can set one footer for the repository
  (§17.5); `none` drops it.

### 4.3 What this target delivers, stated honestly

Delivered: full type and color, both modes following the editor theme, the
heading ramp, callouts, tables, code, the accent stripe, the metadata-strip
eyebrow, the classification stripe, and a fixed-wordmark footer.

Not delivered, and deferred (§6): a footer that echoes variable metadata,
`mode:` front-matter pinning against the editor theme, and typed `:::` callout
containers. These are refinements; none blocks the objective.

## 5. Phase 3 — Spec, docs, dogfood

- **SYSTEM.md §17** — add §17.5 "VS Code preview target": the three-target
  account, the `markdown-yaml-preamble` dependency, and the §3 scope boundary
  adopted as a standing rule. Changelog → v1.8. No primitive or token change.
- **`proposals/superseded/cv-markdown-preview-extension-proposal.md`** — add a resolution
  header pointing at this plan; retain for rationale history.
- **README** — a "Reading docs in VS Code" section: install
  `bierner.markdown-yaml-preamble`, point `markdown.styles` at the CDN
  `rnet.css` bundle.
- **`reference/`** — extend `markdown-showcase.html`, or add a focused sample,
  showing the preview treatment.
- **`.vscode/settings.json`** (new, committed) — sets `markdown.styles` for
  this repo so the system's own docs render in-house. Dogfood.

## 6. Open questions and known limits

- **High-contrast** has no real answer yet. Routing the high-contrast body
  classes to the night set is a placeholder. A correct answer may mean
  defining a high-contrast variant — out of scope here, flagged in §17.5.
- **`table:first-child` is positional.** When a document has front matter, the
  preamble table is always first and the selector is correct. The one failure
  case is a document with *no* front matter whose body opens with a real
  table — that table would be styled as a metadata strip. System docs carry
  front matter, so this is rare; documented as a known limit. A one-line
  upstream PR adding a `className` pass-through to `markdown-yaml-preamble`
  would remove the fragility; worth offering, not worth blocking on.
- **Third-party dependency.** `markdown-yaml-preamble` is an eight-line shim
  over `markdown-it-github-preamble`, by a VS Code core engineer. If it ever
  lapses it is trivially forkable, but it is not ours to maintain today.

## 7. Sequencing

Phase 1 is independent and reversible — it can land and ship on its own.
Phases 2 and 3 land together; the chrome section is meaningless without the
README install note. The CDN picks all of it up with no `cdn/build.sh` change,
since `markdown.css` is already in its source set.

| Step | File(s) | Gates the next? |
|---|---|---|
| 1 | `colors_and_type.css` | No — shippable alone |
| 2 | `markdown.css` | Needs step 1 |
| 3 | `SYSTEM.md`, `README.md`, `reference/`, `.vscode/settings.json`, proposal | Needs step 2 |
