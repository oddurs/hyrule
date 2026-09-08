---
id: 10
title: Where the library lives, and how hyrule finds it
type: feature
status: backlog
milestone: v0.1
created: 2026-09-08
updated: 2026-09-08
priority: p0
area: config
effort: s
---

## Problem

Before anything can be read, hyrule has to agree with itself about where the
library is — and let a user override it without editing config.

## Proposal

Resolution order, first hit wins: `--library`, then `HYRULE_LIBRARY`, then
`library` in the user config, then the XDG default
(`~/.config/hyrule/library`, honouring `XDG_CONFIG_HOME`).

`hyrule library path` prints the resolved location and why it was chosen, so
"which library am I even editing" is never a guess.

## Acceptance criteria

- [ ] All four sources resolve, in that order
- [ ] A missing library is a clear error naming the path and how to create one
- [ ] `hyrule library path` reports the source of the answer, not just the path
