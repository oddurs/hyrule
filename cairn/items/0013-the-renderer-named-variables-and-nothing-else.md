---
id: 13
title: 'The renderer: named variables, and nothing else'
type: feature
status: backlog
milestone: v0.1
created: 2026-09-08
updated: 2026-09-08
priority: p0
area: render
effort: m
---

## Problem

Fragments are read by a person and by a model. Both are worse off if the source
looks like code.

## Proposal

`{{ variable }}` substitution. No loops, no conditionals, no filters, no
partials. Variation across stacks is handled by having different assets and
composing them differently — which is what profiles are for.

This is a deliberate ceiling. When it starts to chafe, the honest fix is
usually a second asset, not a template language.

## Acceptance criteria

- [ ] `{{ name }}` substitutes; `{{name}}` and `{{  name  }}` do too
- [ ] `\{{ name }}` escapes, for prompts that talk about templating
- [ ] An unknown variable is an error naming the asset and the line
- [ ] Rendering is pure: same inputs, byte-identical output, no clock, no env
