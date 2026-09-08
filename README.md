# hyrule

[![CI](https://github.com/oddurs/hyrule/actions/workflows/ci.yml/badge.svg)](https://github.com/oddurs/hyrule/actions/workflows/ci.yml)
[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](LICENSE)

A prompt library for agentic coding, rendered into the projects that use it.

## The problem

You write the same instructions to a coding agent over and over. Not because
you enjoy it — because there is nowhere to put them. So each repository gets
its own slightly different `CLAUDE.md`, its own slightly different slash
commands, and six months later you have eight variants of the same house style
and no idea which one is right.

Copying prompts between projects fixes the typing. It does not fix the drift.

## The idea

One library of prompt assets, versioned in git. Projects declare which ones
they use. `hyrule apply` renders them into the files the agent already reads —
managed regions in `CLAUDE.md`, whole files under `.claude/` — and `hyrule
diff` tells you when a project has fallen behind or been edited locally.

And, because the useful edits happen inside a project at the moment a prompt
fails you, the path runs both ways: `hyrule promote` lifts a local fix back
into the library so every other project gets it.

No integration is required. Claude Code reads the files it already reads.

## Status

**Early. None of the above is built yet** — the binary currently prints a
greeting and exits. What is finished is the workflow around it: one command
that runs every check, hooks that refuse a malformed commit or a push to
`main`, a worktree-per-branch setup, and CI running exactly the checks the
hooks do.

The design is settled and written down. See [ROADMAP.md](ROADMAP.md) — 48
items across six milestones, generated from the files in `cairn/items`.

The nearest milestone, **v0.1**, is deliberately narrow: one asset kind carried
all the way through, proven by hyrule managing its own `CLAUDE.md`.

## Build from source

```sh
git clone https://github.com/oddurs/hyrule
cd hyrule
cargo build --release
./target/release/hyrule
```

The pinned toolchain in `rust-toolchain.toml` installs itself on first use.

## Development

Run this once after cloning — it points git at the tracked hooks in
`.githooks`, registers the merge driver for the backlog, and checks your
environment:

```sh
scripts/setup
```

All work goes through `scripts/agent`. It gives every unit of work its own
branch in its own worktree, so two people — or two agents — never share a
checkout:

```sh
scripts/agent start feat/render-managed-regions   # branch + worktree, prints the path
cd ../.worktrees/hyrule/feat/render-managed-regions
# ... edit, then:
scripts/agent check                               # everything CI runs
scripts/agent commit "feat(apply): render managed regions into CLAUDE.md"
scripts/agent pr                                  # checks, pushes, opens the PR
scripts/agent done                                # after the merge: tidy up
```

| Command | What it does |
|---|---|
| `doctor` | Checks tools, auth, toolchain, hooks, backlog and tree state; reports every problem at once |
| `start <type>/<slug>` | Branches from the default branch into `../.worktrees/hyrule/<branch>` |
| `check` | Runs `scripts/task check` |
| `commit <msg>` | Validates the Conventional Commit message, then commits |
| `pr [--draft]` | Runs the checks, pushes, and opens the pull request |
| `sync` | Rebases the branch onto the default branch |
| `done` | Confirms the PR merged, then removes the worktree and branch |
| `list` | Worktrees, their branches, and pull request state |

Every toolchain command lives behind `scripts/task`, which is what CI, the git
hooks, and `scripts/agent` all call — so local checks and CI cannot drift:

```sh
scripts/task fmt        # format in place
scripts/task fmt:check  # verify formatting
scripts/task lint       # clippy, warnings denied
scripts/task test       # the full suite, doctests included
scripts/task build      # release build
scripts/task check      # all of the above, in order
```

The roadmap and issues live in the repository as Markdown, managed with
[cairn](https://github.com/oddurs/cairn):

```sh
cairn next        # what is ready to work on
cairn board       # what is in flight
cairn show 15     # one item in full
```

cairn is optional — the repository builds and tests without it. See
[CONTRIBUTING.md](CONTRIBUTING.md) for branch naming and commit conventions.

## License

[MIT](LICENSE) © Oddur Sigurdsson
