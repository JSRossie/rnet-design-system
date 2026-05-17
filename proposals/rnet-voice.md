# Proposal · Editorial Voice (rnet-voice)

**Status:** Proposal — open decisions resolved 2026.05.17 (§4); ready to graduate into `SYSTEM.md` §18
**Owner:** James Rossie
**Opened:** 2026.05.17
**Targets:** SYSTEM.md (a future minor version)

---

## 0. What this is

A working proposal, not spec. It records the assessment and resolved
decisions for one extension to the JR / R—Net design system: a standard for
the **written voice** — the voice of analytical prose deliverables
(briefings, reports, research documents, memos, status docs).

The standard originates as a skill, `rnet-voice`, authored in a separate
project. This proposal assesses that skill and plans its integration as a
first-class part of the design system.

Nothing here is binding until it is designed, resolved, and folded into
`SYSTEM.md` through the §15 extension procedure. The `proposals/` directory
is the staging area for that work — extensions live here while they are
being figured out, and only graduate into the spec once stable. The source
skill lives in `.staging/rnet-voice/` (gitignored) as the scratch input to
this work.

---

## 1. Editorial voice — viability

**Verdict: viable, and overdue.** The system has always been a *visual*
language. But it ships prose: SYSTEM.md, README.md, runbooks, status docs,
the markdown pattern (§17) that exists specifically to render written
documents. None of that prose has a specified voice.

The `rnet-voice` skill closes that gap. It is a writing-voice standard
built on one premise — **disciplined restraint, with rationed and
meaningful flourish** — and that premise is already the design system's
premise, stated in §1 and §12: prefer restraint over elaboration; when a
choice between adding and removing is even, remove.

So the voice is not a new philosophy bolted on. It is the existing
philosophy applied to a surface the spec had not yet covered. The visual
system and the voice share one root and should be documented as siblings.

### Maps cleanly onto the existing system

| Voice standard | System parallel |
|----------------|-----------------|
| Governing principle: disciplined restraint | §1 premise, §12 "not maximalist" |
| Rationed flourish (two or three per document) | §2 "single accent per context… at most three places" |
| Air carries weight; brevity makes a sentence land | §2 "negative space carries weight" |
| No self-narration of virtue | §12 "no tagline, no mission statement in output" |
| Em-dash effectively eliminated in prose | §11 — the em-dash is reserved as a *visual* mark ("R—Net"), not a prose habit |

The one point needing care is the em-dash. §11 makes the em-dash a
deliberate visual signature in the wordmark "R—Net." The voice standard
effectively eliminates the em-dash *in running prose*. These do not
conflict — one is a fixed mark, the other a sentence-level habit — but §18
should state the distinction so the two rules are not read as contradictory.

### Gap — the word "voice" is already taken

`SYSTEM.md §11` is titled **"Voice & Naming."** Its content is entirely
naming and signing conventions (system codename, JR / R—Net signatures,
date formats). It does not address writer's voice at all. The title
over-claims.

This is the only structural friction, and §4.3 resolves it.

---

## 2. Scope

**In scope.** Graduate the voice standard into the design system as a
canonical reference, reachable and authoritative for any human or AI
authoring prose under the system.

**Out of scope for this branch.** Revising the system's *own* existing
prose — SYSTEM.md, README.md, the proposals — to conform to the new
standard. That is a real and worthwhile pass, but it is a separate body of
work and would inflate this branch. It is noted here as a known follow-up,
the way `markdown-preview.md §4.3` deferred the chrome guidance to its own
later branch. The standard ships first; conforming the back catalogue
follows.

---

## 3. The source skill — assessment

The `rnet-voice` skill is well-built. Eight dimensions (persona, address,
diction, syntax, rhythm, modality, architecture, mechanics), each with
concrete rules; a structural-choices section; a banned-pattern reference; a
before/after set; a ten-step revision checklist. It needs no rework of
substance.

Two things change on the way in:

1. **It is a skill; the spec needs a spec.** The skill carries invocation
   framing ("Invoke as /rnet-voice", "How to use this skill"). The canonical
   document drops that framing and reads as a standard. The skill itself is
   kept — see §3.1 — but the canonical text is the standard.

2. **Its examples come from an unrelated project.** The before/after pairs
   and the frequency table are drawn from a "Purdue briefing" document set.
   A design-system spec should be self-contained. §4.2 resolves this.

### 3.1 The skill is kept, alongside the standard

The standard (`VOICE.md`) is the canonical, readable reference. The skill
(`.claude/skills/rnet-voice/SKILL.md`) is the *invokable* form — what an AI
loads when asked to apply or revise voice. Both are kept; the skill names
`VOICE.md` as canonical so the two cannot drift in intent. This mirrors the
relationship between `GLYPHS.md` (the reference) and `reference/glyph-catalog.html`
(the working tool): one document, two surfaces.

---

## 4. Resolved decisions

Resolved 2026.05.17 on branch `03-rnet-voice`.

### 4.1 Placement — a separate top-level `VOICE.md`

The standard is ~160 lines of editorial detail. SYSTEM.md is a visual spec;
folding the full standard inline would unbalance it.

**Resolution:** the standard lives in a new top-level **`VOICE.md`**,
parallel to `GLYPHS.md` — a large living reference that SYSTEM.md points to
rather than contains. `VOICE.md` carries its own version (v1.0 at
graduation), as `GLYPHS.md` does. `SYSTEM.md` gets a short new section
(§4.4) that states the principle and points to `VOICE.md`, exactly as §7
points to `GLYPHS.md`.

### 4.2 Examples — genericized

The skill's before/after pairs and its frequency table reference an
outside "Purdue briefing" project.

**Resolution:** genericize. The before/after pairs are rewritten with
neutral subject matter — an R—Net status document, a generic infrastructure
briefing — so `VOICE.md` is self-contained and carries no outside-project
reference. The teaching value of before/after is kept; only the subject
changes. The Purdue-specific frequency counts are replaced with a general
characterization of how dense these patterns run when unchecked.

### 4.3 The §11 naming collision — rename §11's title

`SYSTEM.md §11` is titled "Voice & Naming" but contains only naming and
signing conventions.

**Resolution:** rename §11's *title* to **"Naming & Signing."** The section
number is unchanged, so every existing `§11` cross-reference (the §17.4
front-matter table, date-format references) stays valid. This frees the
word "voice" for the new editorial section.

### 4.4 Spec placement — new §18, version → 1.5

The voice graduates as a single new section **§18 Editorial Voice**,
appended after §17 (no renumbering). §18 is short by design: it states the
governing principle, frames the written voice as the prose sibling of the
visual system, notes the em-dash distinction against §11, and points to
`VOICE.md` for the full standard. `SYSTEM.md` bumps **1.4 → 1.5** (minor;
additions only — a new section, a new file, one section-title rename).

### 4.5 Reach — STANDARD.md and the prompt files

The voice should reach the tools that author prose.

**Resolution:** add a brief voice paragraph to `STANDARD.md` and a voice
pointer to `prompts/for-claude.md` and `prompts/for-chatgpt.md` (both cover
"drafting documents"). `prompts/for-v0.md` and `prompts/for-design-tools.md`
are visual-generation tools and are left unchanged. `SHORT.md` is left
unchanged, as the markdown branch left it — it is a tight visual-budget
paragraph.

No `reference/` artifact is added. The markdown branch shipped an HTML
showcase because markdown is rendered; voice is prose, and its showcase is
the before/after section already inside `VOICE.md`.

---

## 5. Sequencing

1. Resolve decisions (§4 — done).
2. `VOICE.md` (genericized standard) + `.claude/skills/rnet-voice/SKILL.md`.
3. Graduate into `SYSTEM.md` §18 — rename §11 title, bump to v1.5, update
   §13 and §14; add the voice notes to `STANDARD.md` and the two prompt
   files.
4. `SHIPPING.md` entry, `README.md` bullet.

Conforming the system's own back-catalogue prose to the standard (§2) is a
separate later branch.

---

*Proposal · rnet-voice · opened 2026.05.17 · decisions resolved 2026.05.17 · branch 03-rnet-voice*
