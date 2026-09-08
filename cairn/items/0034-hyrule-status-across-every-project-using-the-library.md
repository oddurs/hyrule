---
id: 34
title: hyrule status across every project using the library
type: feature
status: backlog
milestone: v0.3
depends_on:
- 31
created: 2026-09-08
updated: 2026-09-08
priority: p1
area: cli
effort: m
---

## Problem

The consistency question is not "is this project current" but "which of my
repositories have fallen behind". Answering it by visiting each one is how
drift goes unnoticed.

## Proposal

The library records the projects that have applied it. `hyrule status` walks
them and prints one line each: current, behind by N, or drifted.

Registration happens on `apply`, and a project that has moved or been deleted
is pruned rather than reported forever.

## Acceptance criteria

- [ ] Projects register on apply and prune when the path is gone
- [ ] One line per project; `--json` for scripting
- [ ] A missing or unreadable project degrades to a warning, not a crash
