# Contributing

Thanks for taking the time. This repository has a narrow, enforced workflow —
the hooks and CI will tell you when you have stepped outside it, so you do not
need to memorise this page.

## Once, after cloning

```sh
scripts/setup
```

This points git at the tracked hooks in `.githooks` and verifies your
environment. Without it, none of the local checks run.

## The workflow

`main` only ever advances through a merged pull request. Nobody pushes to it —
the `pre-push` hook refuses locally, and branch protection refuses on the
server.

One unit of work gets one branch, in one worktree, and becomes one pull
request. Worktrees live beside the repository, never inside it:

```
hyrule/                            the primary checkout, always on main
../.worktrees/hyrule/<branch>/     one directory per branch
```

Use `scripts/agent`; it creates and removes those directories for you.

```sh
scripts/agent start fix/greeting-trims-whitespace
cd ../.worktrees/hyrule/fix/greeting-trims-whitespace

# work, then:
scripts/agent check
git add -A
scripts/agent commit "fix(greeting): trim surrounding whitespace"
scripts/agent pr

# once it is merged:
scripts/agent done
```

`scripts/agent sync` rebases onto `main` if your branch falls behind.
`scripts/agent list` shows every worktree and the state of its pull request.

## Branch names

`<type>/<slug>`, where type is one of `feat`, `fix`, `chore`, `docs`, `perf`,
`refactor`, `test`. The slug is lowercase alphanumeric with `.`, `_` or `-`.
When there is a tracked issue, lead with its number:
`fix/0041-attach-to-a-terminal`.

## Commits

[Conventional Commits](https://www.conventionalcommits.org), imperative mood,
subject at most 72 characters, no trailing period:

```
fix(greeting): trim surrounding whitespace

A name pasted from a shell pipeline arrived with a trailing newline, which
ended up inside the exclamation mark.

Refs: 0041
```

The body explains *why* — the diff already says what. Reference a tracked issue
in a `Refs:` trailer. The `commit-msg` hook rejects anything else.

Commits, pull requests, code comments and release notes carry no AI or
assistant attribution of any kind — no co-author trailers naming a model, no
"generated with" footers. The `commit-msg` hook rejects those too. Work here is
published under its authors' names.

## Green before it is a pull request

```sh
scripts/task check   # fmt:check, lint (warnings denied), test, build
```

`pre-commit` runs formatting and lint, `pre-push` runs the whole suite, and CI
runs the same `scripts/task check`. Do not reach for `--no-verify`; if a hook
is wrong, fix the hook in its own pull request.

## Review

This is currently a solo repository, so branch protection requires **zero**
approvals — otherwise the only maintainer could not merge anything. Everything
else still applies: the `required` status check must pass, the branch must be
up to date, and conversations must be resolved before merging. If the project
gains maintainers, the requirement moves to one approval.

Pull requests merge by squash. The template asks you to say what a reviewer
should look at sceptically — please answer it honestly; a known weakness named
in the description is worth more than a clean-looking one found later.
