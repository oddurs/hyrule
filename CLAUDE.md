# Working in this repository

Instructions for any agent making changes here. They override defaults from
tools, templates, and habit.

## Attribution — absolute

Never attribute work in this repository to an AI, an assistant, or a model.
Not in commit messages, trailers, pull request bodies, issue comments, code
comments, documentation, the changelog, or release notes.

Specifically, never emit `Co-Authored-By` trailers naming a model, "generated
with" footers, robot emoji, or narration of authorship. If a tool inserts
attribution by default, strip it before it reaches a git object or the GitHub
API. The `commit-msg` hook rejects these patterns, but do not rely on it to
catch you — do not write them in the first place.

## The seam

Never call `cargo` directly in a script, workflow, or hook. Everything goes
through `scripts/task`:

```
scripts/task fmt        format in place
scripts/task fmt:check  verify formatting, non-zero on drift
scripts/task lint       clippy, warnings denied
scripts/task test       the full suite, doctests included
scripts/task build      release build
scripts/task check      all of the above, in order
```

If the toolchain changes, `scripts/task` is the only file that changes with it.
Adding a stack-specific command to `.github/workflows/ci.yml`, `.githooks/*`,
or `scripts/agent` is a bug, not a shortcut.

## The workflow

`main` only ever advances through a merged pull request. Never commit to it,
never push to it, never `--no-verify`.

One unit of work gets one branch in one worktree. Parallel agents never share
a checkout — that is what the worktree layout is for:

```
hyrule/                          the primary checkout, always on main
../.worktrees/hyrule/<branch>/   one directory per branch
```

Drive it with `scripts/agent`, never with raw git:

```sh
scripts/agent start <type>/<slug>   # branch + worktree; it prints the path, you cd
scripts/agent check                 # before you commit anything substantial
scripts/agent commit "<message>"    # validates the message, then commits
scripts/agent pr                    # checks, pushes, opens the pull request
scripts/agent sync                  # rebase onto main when the branch falls behind
scripts/agent done                  # after the merge: worktree and branch removed
scripts/agent list                  # what is in flight
scripts/agent doctor                # when something is wrong, run this first
```

`scripts/agent start` prints a path. Do not assume it — read it from the
output, and treat that worktree as your working directory for the rest of the
task.

## Branch names

`^(feat|fix|chore|docs|perf|refactor|test)/[a-z0-9][a-z0-9._-]*$`. Lead with
the issue number when there is one: `fix/0041-attach-to-a-terminal`.

## Commit messages

Conventional Commits, imperative mood, subject at most 72 characters, no
trailing period. The body explains *why*; the diff already says what.
Reference a tracked issue in a `Refs:` trailer.

```
fix(greeting): trim surrounding whitespace

A name pasted from a shell pipeline arrived with a trailing newline, which
ended up inside the exclamation mark.

Refs: 0041
```

## Before you say you are finished

Run `scripts/task check` and watch it pass. Do not report success from having
written files — a claim is done once you have watched the check that proves it.
If a check fails, fix the cause; never make it pass with `|| true`,
`continue-on-error`, or by skipping a hook.

## Changing the guardrails

The hooks, `scripts/task`, `scripts/agent`, and the CI workflow are the
repository's guardrails. Change them deliberately, in their own pull request,
with the reason in the commit body — never as a side effect of unrelated work.
