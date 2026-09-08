---
id: 39
title: Insert from the TUI
type: feature
status: backlog
milestone: v0.4
depends_on:
- 36
created: 2026-09-08
updated: 2026-09-08
priority: p2
area: tui
effort: s
---

## Problem

Finding the asset is most of the work, but the last step — getting it into the
conversation — should not send you back to the shell.

## Proposal

From the preview: copy to clipboard, or print to stdout and exit so the TUI can
be used inside a command substitution. On a headless machine with no clipboard,
say so once and fall back to stdout.

## Acceptance criteria

- [ ] Copy works on macOS and on Linux under both Wayland and X11
- [ ] Print-and-exit writes only the asset body to stdout
- [ ] No clipboard is a clear message, not a silent no-op
