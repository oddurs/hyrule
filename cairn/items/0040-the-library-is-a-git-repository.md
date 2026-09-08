---
id: 40
title: The library is a git repository
type: feature
status: backlog
milestone: v0.5
created: 2026-09-08
updated: 2026-09-08
priority: p0
area: sync
effort: m
---

## Problem

The library has been a git repository by convention since v0.1. Every useful
thing that follows — history, sharing, review — needs hyrule to actually know
that.

## Proposal

`hyrule library init` creates the directory and the repository together, with a
sensible `.gitattributes`. `hyrule library log <asset>` shows how a prompt
changed over time, which is the feature that makes a library feel like an asset
rather than a folder.

hyrule shells out to `git` rather than linking a git implementation: the user
already has one, with their credentials and their config.

## Acceptance criteria

- [ ] `library init` produces a valid, committed, empty library
- [ ] `library log` works per asset, including through a rename
- [ ] A library that is not a git repository still works, minus these commands
