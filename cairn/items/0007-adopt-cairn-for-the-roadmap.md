---
id: 7
title: Adopt cairn for the roadmap
type: chore
status: done
milestone: v0.1
created: 2026-09-08
updated: 2026-09-08
priority: p1
area: meta
effort: s
---

The roadmap lives in the repository, as Markdown, under a schema in
`cairn.toml` — so it is reviewable in a pull request and writable by an agent
without inventing a second place to put things.

`.githooks/post-merge` renumbers colliding ids and re-renders `ROADMAP.md`
after a merge, and `scripts/setup` registers the merge driver, because the
driver is local configuration that git will not clone.

## Acceptance criteria

- [x] `cairn.toml` describes the areas and milestones this project actually has
- [x] `cairn check` passes
- [x] `ROADMAP.md` is generated and linked from the README
- [x] The post-merge hook is tracked in `.githooks`, not `.git/hooks`
