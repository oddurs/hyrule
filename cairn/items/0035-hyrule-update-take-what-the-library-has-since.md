---
id: 35
title: 'hyrule update: take what the library has since'
type: feature
status: backlog
milestone: v0.3
depends_on:
- 31
created: 2026-09-08
updated: 2026-09-08
priority: p1
area: apply
effort: m
---

## Problem

Once assets have versions, a project can be behind. Catching up should be one
command and should show its work.

## Proposal

`hyrule update` re-plans against the current library, shows what would change
per block with the version transition, and applies. `--asset` narrows it to
one. Drift still stops it, for the reasons already settled.

## Acceptance criteria

- [ ] Shows the version transition per block before applying
- [ ] `--asset` limits scope; everything else stays untouched
- [ ] Nothing to update reports so and exits 0
