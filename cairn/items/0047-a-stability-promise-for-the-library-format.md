---
id: 47
title: A stability promise for the library format
type: chore
status: backlog
milestone: v1.0
created: 2026-09-08
updated: 2026-09-08
priority: p0
area: library
effort: m
---

## Problem

By 1.0 people have libraries they have spent real time on. Breaking the format
after that is the one unrecoverable mistake this project can make.

## Proposal

A `format` version in the library config, the way cairn does it: hyrule refuses
to open a library written in a format it does not know rather than misreading
it. `hyrule migrate` moves a library forward, and only forward.

Written down in the manual: what is covered by the promise (the on-disk format
and the marker syntax) and what is not (exact output formatting, exit-code
detail beyond the documented three).

## Acceptance criteria

- [ ] A future format version is refused with a clear message, never misread
- [ ] `hyrule migrate` covers every format the tool has ever written
- [ ] The promise is stated in the manual, with its boundaries
