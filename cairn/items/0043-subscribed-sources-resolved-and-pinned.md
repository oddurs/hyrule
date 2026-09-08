---
id: 43
title: Subscribed sources, resolved and pinned
type: feature
status: backlog
milestone: v0.5
depends_on:
- 42
created: 2026-09-08
updated: 2026-09-08
priority: p1
area: sync
effort: l
---

## Problem

Adopting somebody else's prompts should not mean copying their files and losing
the thread to their improvements.

## Proposal

Sources declared by git URL in the library config, fetched by an explicit
command, pinned by commit. Assets are addressed `source/name`, with local
assets shadowing remote ones of the same name so you can always override
without forking.

`apply` never touches the network.

## Acceptance criteria

- [ ] Sources fetch only on `hyrule source update`, never during apply
- [ ] Pins are recorded and applying with a stale pin is deterministic
- [ ] A local asset shadows a remote one of the same name, and says so
- [ ] Removing a source cleanly unapplies everything it provided
