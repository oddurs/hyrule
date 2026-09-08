---
id: 44
title: The manual
type: docs
status: backlog
milestone: v1.0
created: 2026-09-08
updated: 2026-09-08
priority: p0
area: docs
effort: l
---

## Problem

By 1.0 the README cannot carry the whole story, and a tool whose concepts are
undocumented gets used at a fraction of its depth.

## Proposal

A manual covering the four concepts in order — asset, profile, manifest, drift
— then a reference for every command. Written as prose that can be read start
to finish, not a wall of generated help.

One page that does not exist yet and should: why the library is versioned prose
rather than a database, so the next person who wants to add a template language
can read the argument rather than relitigate it.

## Acceptance criteria

- [ ] Every command documented with a real example that has been run
- [ ] The four concepts explained before any command reference
- [ ] The design decisions page covers templating, drift policy and versioning
