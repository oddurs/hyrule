---
id: 45
title: Shell completions and a man page
type: feature
status: backlog
milestone: v1.0
created: 2026-09-08
updated: 2026-09-08
priority: p1
area: packaging
effort: s
---

## Problem

A CLI with many nouns is unpleasant without completion, and asset names are
exactly the thing worth completing.

## Proposal

`hyrule completions <shell>` for bash, zsh and fish, generated from the parser
so they cannot drift. Completion is dynamic where it matters: asset and profile
names come from the library, not a static list.

`hyrule man` generates the page, and the release workflow ships it.

## Acceptance criteria

- [ ] Completions for bash, zsh and fish, generated not hand-written
- [ ] Asset and profile names complete from the real library
- [ ] The man page is shipped in the release artefacts
