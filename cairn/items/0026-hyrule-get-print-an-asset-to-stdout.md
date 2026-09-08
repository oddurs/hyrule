---
id: 26
title: 'hyrule get: print an asset to stdout'
type: feature
status: backlog
milestone: v0.2
depends_on:
- 25
created: 2026-09-08
updated: 2026-09-08
priority: p1
area: cli
effort: s
---

## Problem

The cheapest possible surface, and the one that works inside Claude Code today:
`!hyrule get review-checklist` puts the text straight into the conversation.

## Proposal

`hyrule get <name>` renders the asset with the current project's variables and
prints it. `--raw` skips variable substitution. `--copy` puts it on the
clipboard instead, when a clipboard exists.

Works outside a hyrule project, with only built-in variables resolved.

## Acceptance criteria

- [ ] Prints exactly the rendered body, no banner, no trailing blank line
- [ ] Works with no `hyrule.toml` present
- [ ] An unknown name exits 2 and suggests near matches
