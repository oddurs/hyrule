---
id: 22
title: Slash commands rendered as whole files
type: feature
status: backlog
milestone: v0.2
created: 2026-09-08
updated: 2026-09-08
priority: p0
area: render
effort: m
---

## Problem

A slash command is a file under `.claude/commands/`, not a region inside a
shared one. That is a second write strategy, and it brings a question regions
never had: what happens to a file hyrule wrote but no longer manages?

## Proposal

A `claude:command` renderer that owns whole files. Ownership is recorded, so
`apply` can remove a file it previously wrote when the asset leaves the
manifest — and will refuse to touch a file at that path that it did not write.

## Acceptance criteria

- [ ] Renders `.claude/commands/<name>.md` with the asset's frontmatter intact
- [ ] A file at the target path that hyrule did not write is never overwritten
- [ ] Dropping the asset removes the file; unrelated files are left alone
- [ ] Drift on a whole file is detected the same way as on a region
