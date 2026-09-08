---
id: 30
title: Removal is clean
type: feature
status: backlog
milestone: v0.2
depends_on:
- 22
created: 2026-09-08
updated: 2026-09-08
priority: p0
area: apply
effort: m
---

## Problem

A tool that can add but not fully remove is a tool people stop trusting with
their files. Leftover fences and orphaned files are worse than never having
applied.

## Proposal

Dropping an asset from the manifest removes its region, its fences and the
surrounding blank line, or deletes the whole file or directory it owned.
`hyrule unapply` removes everything hyrule manages, leaving a project as if it
had never been applied — which is also the honest way to uninstall.

## Acceptance criteria

- [ ] After `unapply`, no `hyrule:` marker remains anywhere in the project
- [ ] Files hyrule did not write are untouched
- [ ] The manifest is left in place; `apply` restores the previous state exactly
- [ ] A round trip of apply, unapply, apply is byte-identical
