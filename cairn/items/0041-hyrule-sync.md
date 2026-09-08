---
id: 41
title: hyrule sync
type: feature
status: backlog
milestone: v0.5
depends_on:
- 40
created: 2026-09-08
updated: 2026-09-08
priority: p0
area: sync
effort: m
---

## Problem

A library on one machine is a library you cannot use from your laptop.

## Proposal

`hyrule sync` commits pending library changes with a generated message, pulls
with rebase, and pushes. A conflict stops it and hands over to git rather than
inventing a resolution — merging prose badly is worse than merging it manually.

## Acceptance criteria

- [ ] Pending changes are committed with a message naming the assets touched
- [ ] A conflict leaves the repository in a state git can finish
- [ ] Nothing to sync reports so and exits 0
