# Charts & Vectors Markdown Rendering in VS Code

**Status:** superseded 2026.05.18. Retained for design-rationale history.
**Target repository:** `rnet-design-system`
**Drafted:** 2026.05.17, from an R—Net working session

---

> **Resolution.** This proposal's core premise — that per-document chrome
> content can reach the preview only through a first-party extension — does
> not hold. The Microsoft-authored `bierner.markdown-yaml-preamble` extension
> already renders YAML front matter into the preview DOM, so plain CSS can
> draw the chrome. The system reaches the VS Code preview by shipping CSS
> only; no extension is authored, and the §4 packages restructure is not
> needed. The implemented approach is `proposals/markdown-preview-vscode-plan.md`,
> graduated into `SYSTEM.md §17.5`. The §3 scope boundary is adopted as a
> standing rule. Sections below are kept for the cost analysis and the
> rejected-path record.

---

## 1. Problem

The system renders markdown well as standalone HTML. `markdown.css` styles the
bare elements a renderer emits, scoped to a `.md` body, with `.doc` chrome
supplied by the previewer. A page built that way needs no class hooks on the
content and switches mode on `<html data-mode>`.

VS Code's built-in markdown preview cannot consume that stylesheet as
published. Two mismatches block it. The CSS scopes every rule to `.md`, and the
preview renders markdown into `<body class="vscode-body">` with no `.md`
element anywhere, so every selector misses. The CSS switches mode on the
`data-mode` attribute, and the preview never sets that attribute. It carries
its theme as a body class instead: `vscode-dark`, `vscode-light`,
`vscode-high-contrast`.

The result is that the most common surface where these documents are read,
the editor itself, is the one surface the system does not reach. This proposal
makes VS Code a recognized rendering target rather than an unsupported one.

## 2. Three Rendering Targets

The system should name three targets and state plainly what each delivers. The
distinction that matters is whether wrapper HTML can be injected, because the
`.doc` chrome (accent stripe, eyebrow, footer) needs wrapper elements and
per-document metadata that a stylesheet alone cannot supply.

| Target | Mechanism | Mode | Chrome |
|---|---|---|---|
| Standalone HTML | `rnet.css`, author supplies `.md` + `.doc` markup | `data-mode` | Full |
| VS Code, no extension | `markdown.styles` points at `markdown-vscode.css` | Follows editor theme | Body only |
| VS Code, extension | First-party extension injects wrapper and chrome | Editor theme or front matter | Full |

The first target is the system as it stands today. The second and third are
what this proposal adds, and they are complementary. The no-extension target
is the zero-install fallback for anyone who only wants correct type and color
in the preview. The extension is the high-fidelity path for people who want
the document to read in the editor the way it reads on the page.

### 2.1 Change to the semantic layer

Both new targets depend on one upstream change. `colors_and_type.css` switches
mode on `html[data-mode]` only. It should also recognize the body classes VS
Code sets, so the same token set activates on either trigger:

```css
html[data-mode="night"], body.vscode-dark          { /* night tokens */ }
html[data-mode="day"],   body.vscode-light          { /* day tokens  */ }
html[data-mode="night"], body.vscode-high-contrast  { /* see §6      */ }
```

This is one edit, and it composes from the existing token definitions rather
than forking them. It is the formal act of declaring VS Code a surface the
system supports.

### 2.2 The no-extension stylesheet

`markdown-vscode.css` carries the same element rules as `markdown.css`, scoped
to `body.vscode-body` instead of `.md`. It must not be hand-copied. A
maintained copy is a fork, and `markdown.css` already forbids that in its own
header.

The fix is to author the markdown element rules once, in a scope-agnostic
source, and have the build emit two artifacts: `markdown.css` scoped to `.md`,
`markdown-vscode.css` scoped to `body.vscode-body`. The build step that already
generates `tokens.json` is where this belongs. One source means the two files
cannot drift.

This target cannot draw the `.doc` chrome. The `markdown.styles` setting
injects CSS and nothing else, and the eyebrow and footer need wrapper elements
carrying per-document content. A pure-CSS accent stripe via `body::before` is
the one chrome element this target can manage. Eyebrow and footer wait for the
extension.

## 3. The Extension and Its Scope Boundary

The extension renders the design system. It carries no knowledge of any repo
that consumes the system. This boundary is the single most important decision
in the proposal, because the obvious failure mode is letting the extension
accumulate domain logic from whichever project drove its creation.

R—Net has a separate planned extension, the status-dashboard substrate, which
understands lanes, a data contract, and a dashboard. That extension belongs in
R—Net and graduates with the `status-dashboard` tooling. It would consume the
design system, and it may even reuse this extension's renderer, but it is not a
design-system artifact.

The test for what goes in the markdown-preview extension is whether the feature
is true for any markdown document rendered under Charts & Vectors. Type, color,
the two modes, the six grammar primitives, callout containers: in scope.
Anything that knows what a lane is: out.

Naming, for discussion: `charts-and-vectors-markdown`, published under a JR or
R—Net publisher id.

## 4. Repository Structure

The design system today is a near-immutable asset repository. It defines the
language and publishes static files to a CDN. An extension changes that. It
brings a TypeScript toolchain, a Marketplace release cadence, and a dependency
on the VS Code API, which moves. Section 6 returns to that cost.

The structure that absorbs it without disturbing the existing CDN-publish path
is a workspace with packages:

```
rnet-design-system/
  SYSTEM.md, VOICE.md, GLYPHS.md      # the spec, unchanged
  proposals/
  packages/
    css/                             # tokens.css, colors_and_type.css,
                                     #   controls.css, markdown.css,
                                     #   markdown-vscode.css, rnet.css
    tokens/                          # tokens.json build
    extension-markdown/              # the VS Code extension
  build/                             # shared build, emits the scoped CSS pair
```

The CSS package keeps its current job and its current publish path. The
extension package has its own release lane and does not gate a CSS push.

## 5. Extension Contribution Surface

VS Code lets an extension extend the built-in preview through three
contribution points in `package.json`. The extension should use all three.

```json
"contributes": {
  "markdown": {
    "previewStyles":  ["./media/cv-preview.css"],
    "previewScripts": ["./media/cv-preview.js"],
    "markdownItPlugins": true
  }
}
```

`previewStyles` loads the design-system CSS into the preview webview.
`previewScripts` runs a script inside that webview, and that script does the
work `markdown.styles` cannot: it wraps the rendered body in the `.doc` and
`.md` structure, sets `data-mode` from the editor theme, and draws the eyebrow
and footer. `markdownItPlugins` lets the extension's entry point export
`extendMarkdownIt` and add container syntax, so a `:::note` block maps onto the
system's callout treatment and a fenced block maps onto `.codeblock`.

The chrome needs per-document content. The wordmark is fixed, but the
classification tag, the revision, and the date vary. The extension should read
these from YAML front matter, which fits documents that already carry front
matter for other reasons. A document with no front matter gets the body, the
stripe, and a generic eyebrow, and skips the footer.

Mode resolves in a fixed order: a `mode:` key in front matter wins if present,
the editor theme decides otherwise. An infrastructure document can therefore
pin itself to instrumented mode even while the author edits in a light theme.

## 6. Costs and Open Questions

The real cost is the repository's character. A static asset repo with a CDN
push is simple to keep correct. An extension adds a build, a test surface
against a moving API, and a Marketplace release process. The packages layout
in Section 4 contains the change rather than removing it. This is a machine-
level maintenance cost and it is worth stating before the work starts.

Four questions are open.

High-contrast mode has no obvious answer. Routing `vscode-high-contrast` to the
night token set is the placeholder above. The system has no high-contrast
variant today, and a correct answer may mean defining one.

The extension can deliver chrome that the no-extension stylesheet cannot, so
the two targets render the same document differently. That is acceptable if it
is documented as the deliberate floor-and-ceiling it is, and a problem if it
surprises someone.

Front matter for chrome needs a small defined schema: which keys, and the
fallback when a key is absent. It should match whatever `markdown.css`'s
companion proposal already assumes about the previewer-supplied chrome.

The extension also needs a position on non-system markdown. A plausible default
is to render every markdown file in the workspace once the extension is
installed, with an opt-out, since the system is the house style.

## 7. Decisions Requested

Four decisions unblock the work.

Whether to widen the `colors_and_type.css` mode selectors to recognize VS
Code's body classes. Section 2.1. This is small and unblocks both new targets.

Whether to restructure the repository into packages. Section 4. This is the
larger commitment, and the extension cannot land cleanly without it.

Whether the markdown-preview extension is in scope for `rnet-design-system` at
all, against the cost in Section 6.

Whether to confirm the scope boundary in Section 3 as a standing rule, so the
extension never takes on consumer-project domain logic.
