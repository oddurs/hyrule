---
id: 28
title: Composition rules when two profiles disagree
type: feature
status: backlog
milestone: v0.2
depends_on:
- 27
created: 2026-09-08
updated: 2026-09-08
priority: p1
area: profile
effort: m
---

## Problem

Two profiles include the same asset at different versions, or a project pins an
asset a profile also supplies. Silence here produces a file nobody can explain.

## Proposal

One rule, stated once: more specific wins, and every override is reported.
Project pin beats profile; a later profile beats an earlier one; equal
specificity at different versions is an error, not a coin toss.

`hyrule explain <asset>` says which rule produced the version in effect.

## Acceptance criteria

- [ ] The precedence order is documented and tested case by case
- [ ] An unresolvable conflict fails the plan with both sources named
- [ ] `hyrule explain` names the winning source and what it beat
