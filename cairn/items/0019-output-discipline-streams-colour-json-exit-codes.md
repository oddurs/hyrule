---
id: 19
title: 'Output discipline: streams, colour, --json, exit codes'
type: chore
status: backlog
milestone: v0.1
created: 2026-09-08
updated: 2026-09-08
priority: p2
area: cli
effort: s
---

## Problem

A tool an agent drives is a tool whose output is an API. Deciding this once, at
the start, is much cheaper than retrofitting it.

## Proposal

Results on stdout, diagnostics on stderr. Colour only on a tty, and never when
`NO_COLOR` is set. Every command that reports state takes `--json`, and the
JSON shape is covered by a test so it cannot drift silently.

Exit codes: 0 success, 1 the answer is "no" (drift found, changes pending), 2
misuse or failure.

## Acceptance criteria

- [ ] Piping any command produces no escape sequences
- [ ] `NO_COLOR` is honoured
- [ ] `--json` on every reporting command, each with a shape test
- [ ] Exit codes documented in the man page and asserted in tests
