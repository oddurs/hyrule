#!/bin/sh
# Shared helpers for scripts/ and .githooks/. Sourced, never executed.
#
# The commit-message and attribution rules live here so the hook that enforces
# them and the agent script that pre-checks them can never disagree.

CONVENTIONAL_TYPES='feat|fix|chore|docs|perf|refactor|test|build|ci|revert'
CONVENTIONAL_SUBJECT_MAX=72

# Patterns that must never reach a git object or the GitHub API.
ATTRIBUTION_PATTERN='co-authored-by:[[:space:]]*(claude|anthropic|ai\b|.*<noreply@anthropic)|claude code|anthropic|generated (with|by) [^[:space:]]*(claude|ai|copilot|assistant)|🤖|as an ai\b'

err() { printf '\033[31merror\033[0m %s\n' "$*" >&2; }
warn() { printf '\033[33mwarn\033[0m  %s\n' "$*" >&2; }
info() { printf '\033[1m==>\033[0m %s\n' "$*"; }
die() {
    err "$*"
    exit 1
}

# The branch the remote considers default. Never hardcoded.
default_branch() {
    branch=$(git symbolic-ref --quiet --short refs/remotes/origin/HEAD 2>/dev/null) || branch=''
    if [ -z "$branch" ]; then
        git remote set-head origin --auto >/dev/null 2>&1 || true
        branch=$(git symbolic-ref --quiet --short refs/remotes/origin/HEAD 2>/dev/null) || branch=''
    fi
    if [ -n "$branch" ]; then
        printf '%s\n' "${branch#origin/}"
        return 0
    fi
    branch=$(git config --get init.defaultBranch 2>/dev/null) || branch=''
    printf '%s\n' "${branch:-main}"
}

# The primary checkout, i.e. the first worktree git lists. Worktrees hang off
# its parent directory, so this resolves correctly from inside any of them.
primary_worktree() {
    git worktree list --porcelain | sed -n '1s/^worktree //p'
}

repo_name() {
    basename "$(primary_worktree)"
}

worktrees_dir() {
    primary=$(primary_worktree)
    printf '%s/.worktrees/%s\n' "$(dirname "$primary")" "$(basename "$primary")"
}

# Rejects text carrying AI or assistant attribution. Prints the offending lines.
contains_attribution() {
    grep -n -i -E "$ATTRIBUTION_PATTERN" "$1"
}

strip_attribution() {
    grep -v -i -E "$ATTRIBUTION_PATTERN" "$1" || true
}

# Validates a commit message file against Conventional Commits.
validate_commit_message() {
    file=$1
    subject=$(grep -v '^#' "$file" | sed -e '/./,$!d' | sed -n '1p')
    status=0

    case "$subject" in
        'Merge '* | 'Revert "'*)
            return 0
            ;;
    esac

    if ! printf '%s' "$subject" | grep -q -E "^($CONVENTIONAL_TYPES)(\([a-z0-9._/-]+\))?!?: .+"; then
        err "commit subject is not a Conventional Commit:"
        err "  $subject"
        err "expected: <type>(<scope>)!: <subject>   types: ${CONVENTIONAL_TYPES}"
        status=1
    fi

    length=$(printf '%s' "$subject" | wc -c | tr -d ' ')
    if [ "$length" -gt "$CONVENTIONAL_SUBJECT_MAX" ]; then
        err "commit subject is $length characters; the limit is $CONVENTIONAL_SUBJECT_MAX"
        status=1
    fi

    case "$subject" in
        *.)
            err "commit subject must not end with a period"
            status=1
            ;;
    esac

    if offenders=$(contains_attribution "$file"); then
        err "commit message carries AI or assistant attribution:"
        printf '%s\n' "$offenders" | sed 's/^/  /' >&2
        err "this repository publishes work under its authors' names only"
        status=1
    fi

    return $status
}
