---
id: 31
title: Assets are versioned
type: feature
status: backlog
milestone: v0.3
created: 2026-09-08
updated: 2026-09-08
priority: p0
area: library
effort: m
---

## Problem

"The library moved on" is only a meaningful state if an asset has a version to
move on from. Without one, drift detection can say *that* something differs but
never *which side* changed.

## Proposal

An integer `version` in frontmatter, incremented when the content changes in a
way that should reach projects. Projects record the version they applied.
Integers, not semver: an asset is prose, and prose does not have a compatible
minor release.

Bumping is checked, not trusted — `hyrule library check` fails when an asset's
content hash differs from the one recorded for its version.

## Acceptance criteria

- [ ] Version and content hash recorded per asset
- [ ] Editing content without bumping is caught by `hyrule library check`
- [ ] A project records the applied version and can report being behind
