---
id: 27
title: 'Profiles: bundles are the unit you apply'
type: feature
status: backlog
milestone: v0.2
created: 2026-09-08
updated: 2026-09-08
priority: p0
area: profile
effort: m
---

## Problem

Naming twelve assets to set up a new repository is the kind of friction that
means you do not bother, and then the repository drifts — which is the whole
thing hyrule exists to stop.

## Proposal

A profile is a named list of assets, defined in the library:

```yaml
---
name: rust-cli
title: House style for a Rust command-line tool
includes: [git-workflow, commit-convention, rust-testing, review-checklist]
---
```

`hyrule.toml` names profiles as well as individual assets. Profiles may include
other profiles, so a `base` profile can be shared by every stack profile.

## Acceptance criteria

- [ ] A profile can include assets and other profiles
- [ ] Cycles are detected and reported with the path that forms them
- [ ] The resolved asset list is stable and order-preserving
- [ ] `hyrule profile show <name>` prints what it resolves to
