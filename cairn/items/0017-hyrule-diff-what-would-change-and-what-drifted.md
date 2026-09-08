---
id: 17
title: 'hyrule diff: what would change, and what drifted'
type: feature
status: backlog
milestone: v0.1
depends_on:
- 8
- 15
created: 2026-09-08
updated: 2026-09-08
priority: p0
area: drift
effort: m
---

## Problem

`apply` refusing on drift is only tolerable if seeing the drift is one command
away.

## Proposal

`hyrule diff` reports, per block, one of four states: **clean** (matches the
library), **stale** (the library moved on), **dirty** (edited here), or
**both** (edited here *and* the library moved on — the case that needs a
person). Dirty and both print a unified diff.

Exit codes so it is usable in a hook or CI: 0 clean, 1 changes pending, 2
error.

## Acceptance criteria

- [ ] All four states are distinguished and each is shown differently
- [ ] Diffs are unified, coloured on a tty and plain when piped
- [ ] `--json` emits the same information for scripting
- [ ] Exit codes are documented and covered by tests
