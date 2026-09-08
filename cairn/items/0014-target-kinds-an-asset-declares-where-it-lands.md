---
id: 14
title: 'Target kinds: an asset declares where it lands'
type: feature
status: backlog
milestone: v0.1
created: 2026-09-08
updated: 2026-09-08
priority: p0
area: render
effort: m
---

## Problem

Claude Code is the only target today. Hardcoding that means rewriting the write
path the first time AGENTS.md matters.

## Proposal

A renderer is chosen by the asset's `kind` and answers three questions: which
path in the project, whole file or managed region, and how the region is
fenced. v0.1 ships exactly one renderer, `claude:memory` → a region in
CLAUDE.md.

The abstraction earns its keep only if it is not gold-plated: one trait, three
methods, no registry, no plugins.

## Acceptance criteria

- [ ] Adding a renderer touches the renderer and a match arm, nothing else
- [ ] An asset kind with no renderer fails at plan time with a clear message
- [ ] No path under `.claude/` or `CLAUDE.md` is constructed outside a renderer
