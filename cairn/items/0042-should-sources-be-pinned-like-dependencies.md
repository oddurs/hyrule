---
id: 42
title: Should sources be pinned like dependencies?
type: spike
status: backlog
milestone: v0.5
created: 2026-09-08
updated: 2026-09-08
priority: p1
area: sync
effort: s
---

## Question

Subscribing to somebody else's library — a team's house style, a good public
set — needs a resolution model. Is it a lockfile with pinned commits, or a
vendored copy, or a plain remote read at apply time?

## Why it needs answering first

It determines whether `apply` can ever touch the network, and that is a
property people need to be able to rely on. A tool that reaches out during a
build is a different tool.

## What would settle it

Deciding the offline story first. If `apply` must work on a plane — and it
must — then sources are fetched by an explicit command and pinned, and the
question reduces to where the pin lives.

## Answer

<!-- Filled in when the spike closes. -->
