---
id: 38
title: hyrule new and hyrule edit
type: feature
status: backlog
milestone: v0.4
created: 2026-09-08
updated: 2026-09-08
priority: p1
area: cli
effort: s
---

## Problem

Adding to the library has to be cheaper than not adding to it. If capturing a
good prompt takes more than a few seconds, it does not get captured.

## Proposal

`hyrule new <name> --kind claude:command` writes a stub with valid frontmatter
and opens `$EDITOR`. `hyrule edit <name>` opens an existing one and bumps the
version on save if the content changed.

`hyrule new --stdin` takes the body from a pipe, so capturing something from a
terminal is one line.

## Acceptance criteria

- [ ] New assets validate immediately with no hand-editing of frontmatter
- [ ] Editing bumps the version only when content actually changed
- [ ] `--stdin` works with no editor and no tty
