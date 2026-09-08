---
id: 25
title: 'Snippets: assets that are fetched, not rendered'
type: feature
status: backlog
milestone: v0.2
created: 2026-09-08
updated: 2026-09-08
priority: p1
area: library
effort: s
---

## Problem

Not every reusable prompt belongs in a file in a project. Some are things you
paste into a conversation once and do not want committed anywhere.

## Proposal

`kind: snippet` — an asset with no target and no renderer. It never appears in
`apply`. It exists to be searched, previewed and printed, which makes it the
one asset kind the TUI is really for.

## Acceptance criteria

- [ ] A snippet in the manifest is an error, with a message saying why
- [ ] Snippets are searchable and previewable alongside everything else
- [ ] Variables still resolve when a snippet is printed
