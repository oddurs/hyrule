---
id: 9
title: An asset is Markdown with YAML frontmatter
type: feature
status: backlog
milestone: v0.1
created: 2026-09-08
updated: 2026-09-08
priority: p0
area: library
effort: m
---

## Problem

Everything downstream — rendering, drift, profiles, the TUI — reads assets. The
on-disk shape is the one decision that everything else inherits.

## Proposal

A file. Markdown body, YAML frontmatter, the same shape a cairn item or a
Claude Code skill already has, so it is editable by hand and readable without
the tool.

```yaml
---
name: git-workflow
kind: claude:memory
title: Branch, worktree and PR workflow
description: One unit of work, one worktree, one branch, one PR.
vars: [default_branch]
tags: [workflow, git]
---
```

`kind` is the target abstraction: `claude:memory`, `claude:command`,
`claude:skill`, `snippet`. Adding `agents:memory` later is a renderer, not a
schema change.

## Acceptance criteria

- [ ] Parse and validate an asset; report the file and line on a bad one
- [ ] `name` is unique within a library and is the identifier everywhere else
- [ ] An unknown `kind` is an error, not a silent skip
- [ ] Round-trips: parse then serialise leaves the file byte-identical
