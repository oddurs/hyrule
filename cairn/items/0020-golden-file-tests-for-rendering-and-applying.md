---
id: 20
title: Golden-file tests for rendering and applying
type: chore
status: backlog
milestone: v0.1
created: 2026-09-08
updated: 2026-09-08
priority: p1
area: render
effort: m
---

## Problem

Rendering bugs are silent: the file is written, it just says the wrong thing.
Nobody notices until a model behaves oddly weeks later.

## Proposal

A fixtures directory of small libraries and project trees, each with the
expected output committed beside it. Tests apply and compare byte for byte.
`UPDATE_GOLDEN=1` rewrites them, so a deliberate change is a reviewable diff in
the pull request rather than an argument.

Idempotence is a property test: apply twice, assert the second run is a no-op.

## Acceptance criteria

- [ ] Fixtures cover: fresh file, existing file, block removed, variables
- [ ] Golden files update via an environment variable, never by hand
- [ ] Applying twice is proven to be a no-op
