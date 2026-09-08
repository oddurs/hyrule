---
id: 36
title: 'The TUI: browse, search, preview'
type: feature
status: backlog
milestone: v0.4
created: 2026-09-08
updated: 2026-09-08
priority: p0
area: tui
effort: xl
---

## Problem

Once the library is bigger than memory, `hyrule get` needs a name you no longer
remember. Browsing is what turns a store into a library.

## Proposal

`hyrule` with no arguments opens a full-screen browser: assets on the left,
rendered preview on the right, fuzzy filter as you type. Enter copies or
prints; the TUI is a finder, not an editor.

It must open instantly on a library of a thousand assets, which means the index
is read lazily and previews are rendered on demand.

## Acceptance criteria

- [ ] Opens in under 50ms on a library of 1000 assets
- [ ] Preview shows the rendered result, with the project's variables when in one
- [ ] Keyboard-complete; the mouse is optional everywhere
- [ ] Degrades to an error, not a panic, when the terminal is too small
