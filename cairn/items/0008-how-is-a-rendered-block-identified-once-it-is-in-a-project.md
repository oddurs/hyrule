---
id: 8
title: How is a rendered block identified once it is in a project?
type: spike
status: backlog
milestone: v0.1
created: 2026-09-08
updated: 2026-09-08
priority: p0
area: drift
effort: s
---

## Question

When hyrule writes a block into a project's CLAUDE.md, what does it write
alongside it so that a later `apply` can tell "unchanged", "the library moved
on" and "somebody edited this here" apart?

## Why it needs answering first

Every other v0.1 item assumes an answer. The marker format ends up in every
managed file in every project, so it is the hardest thing to change later — a
format mistake here is a migration for every user, forever.

## What would settle it

Two candidates, written out and compared against the awkward cases:

- **Hash in the marker.** `<!-- hyrule:begin git-workflow v2 sha=ab12cd -->`.
  Self-contained; a file carries its own provenance and survives being copied
  between repositories. Costs a visibly noisy marker.
- **A lockfile.** `.hyrule/lock.toml` records asset, version and rendered hash
  per block. Clean markers, one more file to keep in sync, and a file copied
  out of the project loses its provenance.

The awkward cases both must answer: a block edited *and* the library moved on;
a block whose variables changed but whose source did not; a file reformatted
wholesale by an editor.

## Answer

<!-- Filled in when the spike closes. -->
