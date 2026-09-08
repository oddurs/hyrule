---
id: 23
title: Skills rendered as directories
type: feature
status: backlog
milestone: v0.2
depends_on:
- 24
created: 2026-09-08
updated: 2026-09-08
priority: p0
area: render
effort: l
---

## Problem

A skill is a directory: `SKILL.md` plus scripts, references and assets. It is
the first asset that is not one file, and it stresses every assumption in the
library format.

## Proposal

A `claude:skill` asset is a directory in the library, copied into
`.claude/skills/<name>/` with `SKILL.md` rendered and everything else copied
byte for byte. Binary files are copied, never templated.

## Acceptance criteria

- [ ] Nested directories and binary files survive a round trip intact
- [ ] Only `SKILL.md` and files marked as templated get variable substitution
- [ ] Executable bits are preserved
- [ ] Removing the asset removes the whole directory, and nothing above it
