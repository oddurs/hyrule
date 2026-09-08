---
id: 32
title: 'hyrule promote: carry a local fix back to the library'
type: feature
status: backlog
milestone: v0.3
depends_on:
- 31
created: 2026-09-08
updated: 2026-09-08
priority: p0
area: drift
effort: l
---

## Problem

This is the item the whole milestone is for. You fixed a prompt in a project
because it failed you mid-task. Right now that fix dies in that repository.

## Proposal

`hyrule promote <asset>` takes the block as it stands in the project, writes it
back into the library, bumps the version, and marks the project as applied at
the new version — so the block that was dirty is now clean without any file
changing.

It refuses when the project's copy was rendered from variables that would be
baked into the library, because promoting a rendered value would poison the
asset for every other project. The fix in that case is to promote with the
variables re-abstracted, which requires a person, and hyrule should say so
rather than guess.

## Acceptance criteria

- [ ] Promote bumps the version and updates the applied version atomically
- [ ] The block is clean afterwards with no rewrite of the project file
- [ ] A promote that would bake in a resolved variable is refused, and explains
- [ ] `--dry-run` shows the exact library diff before anything is written
