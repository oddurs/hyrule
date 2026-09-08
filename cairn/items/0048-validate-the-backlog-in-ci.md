---
id: 48
title: Validate the backlog in CI
type: chore
status: backlog
milestone: v1.0
created: 2026-09-08
updated: 2026-09-08
priority: p2
area: meta
effort: s
---

## Problem

`cairn check` runs in `scripts/agent doctor` and therefore only when somebody
remembers to run it. An invalid item can reach `main`.

## Proposal

Add it to `scripts/task check` once cairn is installable in CI — which today it
is not, and inventing a bespoke install step in the workflow would put a
stack-specific command back in CI, which is precisely what the seam exists to
prevent.

Blocked on cairn being published. Recorded here so it is not rediscovered.

## Acceptance criteria

- [ ] `cairn check` runs as part of `scripts/task check`
- [ ] CI installs cairn through its published, supported path
- [ ] A malformed item fails the pull request
