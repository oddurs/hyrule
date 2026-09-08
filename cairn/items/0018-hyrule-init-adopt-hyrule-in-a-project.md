---
id: 18
title: 'hyrule init: adopt hyrule in a project'
type: feature
status: backlog
milestone: v0.1
created: 2026-09-08
updated: 2026-09-08
priority: p1
area: cli
effort: s
---

## Problem

Getting started should not require reading the manifest schema first.

## Proposal

`hyrule init` writes a `hyrule.toml` with the project name filled in and no
assets used yet, so the next step is `hyrule add`. It refuses to overwrite an
existing manifest without `--force`.

If CLAUDE.md already exists and contains text that looks like something in the
library, say so — but do not act on it. Import is a v0.3 problem.

## Acceptance criteria

- [ ] Creates a valid manifest that `hyrule apply` accepts as a no-op
- [ ] Refuses to clobber an existing `hyrule.toml` without `--force`
- [ ] Says what it wrote and what to run next
