---
id: 29
title: hyrule add and hyrule remove
type: feature
status: backlog
milestone: v0.2
depends_on:
- 27
created: 2026-09-08
updated: 2026-09-08
priority: p1
area: cli
effort: s
---

## Problem

Editing `hyrule.toml` by hand to add an asset is fine once and tedious after
that, and hand-editing is how manifests end up malformed.

## Proposal

`hyrule add <asset|profile>` appends to the manifest and applies. `hyrule
remove` takes it out and unapplies. Both refuse if the project has drift,
pointing at `hyrule diff` — the tool should never quietly bulldoze an edit while
doing something the user thought was unrelated.

## Acceptance criteria

- [ ] Manifest edits preserve comments and formatting
- [ ] Adding something already present is a no-op that says so
- [ ] Both refuse to run against a project with unresolved drift
