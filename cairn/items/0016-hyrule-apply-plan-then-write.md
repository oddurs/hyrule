---
id: 16
title: 'hyrule apply: plan, then write'
type: feature
status: backlog
milestone: v0.1
depends_on:
- 15
created: 2026-09-08
updated: 2026-09-08
priority: p0
area: apply
effort: l
---

## Problem

The command the whole tool exists for. It must never leave a project half
converted, and it must never surprise anyone.

## Proposal

Two phases. Planning reads the manifest and the library, resolves variables,
renders every block in memory, and produces the full list of intended changes.
Writing happens only if planning succeeded completely.

`--dry-run` prints the plan and stops. Anything that would destroy a local edit
stops the whole run, not just that block — partial application is how a project
ends up in a state nobody can reason about.

## Acceptance criteria

- [ ] Any planning failure means nothing is written at all
- [ ] `--dry-run` output lists every file and block, with a one-line reason
- [ ] Re-running with no changes reports "nothing to do" and exits 0
- [ ] Drift stops the run and points at `hyrule diff`
