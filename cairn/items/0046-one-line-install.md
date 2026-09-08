---
id: 46
title: One-line install
type: chore
status: backlog
milestone: v1.0
created: 2026-09-08
updated: 2026-09-08
priority: p0
area: packaging
effort: m
---

## Problem

`cargo install --git` is fine for the author and a barrier for everybody else.

## Proposal

Publish to crates.io, and build release binaries for macOS and Linux on both
architectures in the tag workflow. A Homebrew tap if the demand appears —
not before, because an unused tap is a thing that silently breaks.

## Acceptance criteria

- [ ] `cargo install hyrule` works from a clean machine
- [ ] Tagged releases carry binaries for macOS and Linux, arm64 and x86_64
- [ ] Checksums published alongside the binaries
- [ ] The README install section is what a new user actually runs
