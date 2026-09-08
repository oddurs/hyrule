---
id: 15
title: Managed regions in CLAUDE.md
type: feature
status: backlog
milestone: v0.1
depends_on:
- 8
created: 2026-09-08
updated: 2026-09-08
priority: p0
area: apply
effort: l
---

## Problem

CLAUDE.md is partly house style and partly notes about this project. hyrule
must own its share of the file and be incapable of touching the rest.

## Proposal

Fenced blocks, using the marker format settled by the identification spike:

```
<!-- hyrule:begin git-workflow ... -->
...rendered content...
<!-- hyrule:end git-workflow -->
```

Everything outside a fence is untouched, including whitespace. Blocks render in
manifest order; a block whose asset is dropped from the manifest is removed
along with its fences.

The failure mode that matters is a half-written file after a crash, so writes
go through a temporary file and a rename.

## Acceptance criteria

- [ ] Content outside every fence is byte-identical before and after
- [ ] A file with no fences yet gets them appended, not prepended over a heading
- [ ] Unbalanced or nested fences are a clear error, never a guess
- [ ] Writes are atomic; an interrupted apply leaves the original file
- [ ] Applying twice with no changes is a no-op, with no mtime churn
