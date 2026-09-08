# hyrule

[![CI](https://github.com/oddurs/hyrule/actions/workflows/ci.yml/badge.svg)](https://github.com/oddurs/hyrule/actions/workflows/ci.yml)
[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](LICENSE)

A command-line tool, written in Rust.

## What it does today

`hyrule` is early. The binary takes an optional name and prints a greeting:

```console
$ hyrule
Hello, world!

$ hyrule Link
Hello, Link!
```

That is the whole of the current behaviour. What is finished is everything
*around* the binary: a single command that runs every check, git hooks that
refuse a bad commit or a push to `main`, a worktree-per-branch workflow, and CI
that runs exactly the same checks the hooks do. The tool grows from there.

## Why it exists

Small tools accumulate ceremony — a formatter configured one way locally and
another way in CI, a test suite that only some contributors remember to run, a
`main` branch that anyone can push to on a bad day. This repository puts all of
that behind one seam, `scripts/task`, and makes the wrong move fail rather than
merely be discouraged.

## Install

From source, with a Rust toolchain (the pinned version installs automatically
via `rust-toolchain.toml`):

```sh
cargo install --git https://github.com/oddurs/hyrule
```

Or clone and build:

```sh
git clone https://github.com/oddurs/hyrule
cd hyrule
cargo build --release
./target/release/hyrule
```

## Quickstart

```console
$ hyrule --help
A command-line tool

Usage: hyrule [NAME]

Arguments:
  [NAME]  Who to greet [default: world]

Options:
  -h, --help     Print help
  -V, --version  Print version
```

## Development

Run this once after cloning — it points git at the tracked hooks in `.githooks`
and checks your environment:

```sh
scripts/setup
```

All work goes through `scripts/agent`. It gives every unit of work its own
branch in its own worktree, so two people (or two agents) never share a
checkout:

```sh
scripts/agent start fix/greeting-trims-whitespace   # branch + worktree, prints the path
cd ../.worktrees/hyrule/fix/greeting-trims-whitespace
# ... edit, then:
scripts/agent check                                 # everything CI runs
scripts/agent commit "fix(greeting): trim surrounding whitespace"
scripts/agent pr                                    # checks, pushes, opens the PR
scripts/agent done                                  # after the merge: tidy up
```

| Command | What it does |
|---|---|
| `doctor` | Checks tools, auth, toolchain, hooks and tree state; reports every problem at once |
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

See [CONTRIBUTING.md](CONTRIBUTING.md) for the branch naming and commit
conventions the hooks enforce.

## License

[MIT](LICENSE) © Oddur Sigurdsson
