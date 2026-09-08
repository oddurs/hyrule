---
id: 33
title: Apply refuses on drift, with an actionable next step
type: feature
status: backlog
milestone: v0.3
depends_on:
- 32
created: 2026-09-08
updated: 2026-09-08
priority: p0
area: drift
effort: m
---

## Problem

The policy is decided: never silently overwrite, never silently keep. What is
left is making the refusal genuinely useful rather than a wall.

## Proposal

On drift, `apply` stops and prints the diff and the three ways out, in the
order they are usually wanted: `hyrule promote` to keep the edit, `hyrule apply
--force` to discard it, `hyrule diff` to look closer.

A refusal that does not name the way out is just an obstacle.

## Acceptance criteria

- [ ] The failure prints the block, the diff, and all three options
- [ ] `--force` discards local edits and says exactly what it discarded
- [ ] Nothing is written on a refusal, including blocks that were clean
