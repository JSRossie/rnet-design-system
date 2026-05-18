---
name: rnet-voice
description: Editorial-voice standard for analytical prose in the JR / R—Net design system. Apply when authoring or revising briefings, reports, research documents, memos, status docs, or any prose deliverable. Strips recognizable AI-writing patterns and enforces a researcher-briefer voice built on disciplined restraint. Invoke as /rnet-voice, or apply automatically when writing or editing prose under the design system.
---

# rnet-voice

The writing-voice standard for the JR / R—Net design system. It removes the
default-LLM voice and replaces it with a deliberate one: a researcher
briefing a reader who is making a hard decision.

## Canonical reference

The full standard is **`VOICE.md`** — this skill is its invokable form. It is
canonical in the `rnet-design-system` repository (root, summarized in
`SYSTEM.md` §18); a snapshot travels with this skill at **`reference/VOICE.md`**
so the skill works in any project.

When applying or revising voice, **read `VOICE.md` first** — the repo-root copy
if this skill is running inside `rnet-design-system`, otherwise the bundled
`reference/VOICE.md` — and work from it. If the skill body and `VOICE.md` ever
disagree, `VOICE.md` wins.

## Governing principle

**Disciplined restraint, with rationed and meaningful flourish.**

When adding or cutting is a tie, cut. The one counterweight: do not
over-correct into voiceless prose. Text stripped of every tell but given no
positive voice reads as processed, not written, and that is its own tell.

## How to use this skill

1. Load `VOICE.md`. It specifies the voice across eight dimensions —
   persona, address, diction, syntax, rhythm, modality, architecture,
   mechanics — plus structural choices and a banned-pattern reference.
2. When **authoring**, hold those rules as constraints while drafting.
3. When **revising**, work the `VOICE.md` §6 revision checklist in order:

   1. Grep the AI-vocabulary blocklist and em-dashes. Reduce both.
   2. Cut self-narration of the document's honesty, fairness, or importance.
   3. Demote bold claim-sentence lead-ins into plain prose.
   4. Move hard specifics out of topic sentences into the body.
   5. Rewrite negative parallelism, superficial -ing tails, vague
      attributions, and filler.
   6. Vary sentence length; add short beats where prose has gone uniform.
   7. Headers: content not virtue, Title Case, no em-dash.
   8. Convert any bullet list that carries an argument into prose.
   9. Hold the document to two or three rhythmic flourishes, no more.
   10. Read the result aloud.

The voice does not change the analysis, the argument, or the facts. It
changes how the prose carries them.
