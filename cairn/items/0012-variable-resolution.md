---
id: 12
title: Variable resolution
type: feature
status: backlog
milestone: v0.1
created: 2026-09-08
updated: 2026-09-08
priority: p1
area: config
effort: s
---

## Problem

The same fragment has to serve a Rust CLI and a TypeScript web app. The only
sanctioned variation is a named variable, so resolution has to be predictable.

## Proposal

Layered, later wins: built-ins (`project.name`, `project.root`), then library
defaults, then `[vars]` in `hyrule.toml`.

An asset declares the variables it uses in frontmatter. A declared variable
with no value is an error at plan time, naming the asset and the variable —
never an empty string rendered into a file.

## Acceptance criteria

- [ ] The three layers resolve in order
- [ ] An undeclared variable used in a body is an error
- [ ] A declared variable with no value fails the plan, before anything is written
- [ ] `hyrule vars` lists every variable in play and where its value came from
