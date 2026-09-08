---
id: 37
title: Fuzzy search over names, bodies and tags
type: feature
status: backlog
milestone: v0.4
depends_on:
- 36
created: 2026-09-08
updated: 2026-09-08
priority: p1
area: tui
effort: m
---

## Problem

Filtering by name is not enough. The asset you want is usually remembered by a
phrase inside it.

## Proposal

One ranked index over name, title, description, tags and body, with matches
highlighted in the list and the preview. Also available headless as `hyrule
search <query>` for use from a shell or by an agent.

## Acceptance criteria

- [ ] Body matches rank below name and title matches
- [ ] Matched spans are highlighted in both panes
- [ ] `hyrule search --json` returns the same ranking
