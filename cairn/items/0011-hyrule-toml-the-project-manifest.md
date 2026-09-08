---
id: 11
title: hyrule.toml, the project manifest
type: feature
status: backlog
milestone: v0.1
created: 2026-09-08
updated: 2026-09-08
priority: p0
area: config
effort: m
---

## Problem

A project needs to record which assets it uses and what its variables are —
committed, so the next clone and the next agent render the same thing.

## Proposal

`hyrule.toml` at the project root:

```toml
[project]
name = "hyrule"

[vars]
default_branch = "main"
test_command = "scripts/task test"

[[use]]
asset = "git-workflow"
version = 2
```

Committed to the repository. It is the reason two people applying the same
library to the same project get the same files.

## Acceptance criteria

- [ ] Parse, validate, and report unknown keys rather than ignoring them
- [ ] An asset named here but missing from the library is a clear error
- [ ] Order in the file is the order blocks are rendered, and is stable
