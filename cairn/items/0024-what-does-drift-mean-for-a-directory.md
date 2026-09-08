---
id: 24
title: What does drift mean for a directory?
type: spike
status: backlog
milestone: v0.2
created: 2026-09-08
updated: 2026-09-08
priority: p0
area: drift
effort: s
---

## Question

A region has one hash. A skill is a tree: files can be edited, added, deleted
or renamed. What is the smallest definition of "this skill drifted" that is
still honest?

## Why it needs answering first

It decides whether skills can share the drift machinery with regions or need
their own, and that is the difference between a small feature and a large one.

## What would settle it

Writing out the four cases against two candidate models — a manifest of
per-file hashes, versus a single hash over a canonical serialisation of the
tree — and seeing which produces a message a person can act on. "The skill
changed" is not actionable; "you edited `scripts/check.sh`" is.

## Answer

<!-- Filled in when the spike closes. -->
