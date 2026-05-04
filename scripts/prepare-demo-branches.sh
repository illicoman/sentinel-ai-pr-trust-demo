#!/usr/bin/env bash
set -euo pipefail

MODE="dry-run"
BASE_BRANCH="main"

usage() {
  cat <<'USAGE'
Usage:
  ./scripts/prepare-demo-branches.sh [--apply] [--base BRANCH]

Default mode is dry-run. It prints the local branches and PR commands.

Options:
  --apply        Create local branches and local commits. Never pushes.
  --base BRANCH Base branch for demo branches. Default: main.
  -h, --help    Show this help.
USAGE
}

while [[ $# -gt 0 ]]; do
  case "$1" in
    --apply)
      MODE="apply"
      shift
      ;;
    --base)
      BASE_BRANCH="${2:-}"
      if [[ -z "$BASE_BRANCH" ]]; then
        echo "Missing value for --base" >&2
        exit 2
      fi
      shift 2
      ;;
    -h|--help)
      usage
      exit 0
      ;;
    *)
      echo "Unknown argument: $1" >&2
      usage
      exit 2
      ;;
  esac
done

if ! git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
  echo "This script must run inside the demo git repository." >&2
  exit 1
fi

if [[ ! -f "sentinel-surfaces.yml" || ! -d "docs/demo-prs" ]]; then
  echo "Run this script from the demo repository root." >&2
  exit 1
fi

if [[ -n "$(git status --porcelain)" ]]; then
  echo "Refusing to run with a dirty worktree." >&2
  echo "Commit, stash or discard local changes first." >&2
  exit 1
fi

if ! git rev-parse --verify "$BASE_BRANCH" >/dev/null 2>&1; then
  echo "Base branch does not exist locally: $BASE_BRANCH" >&2
  exit 1
fi

branches=(
  "demo/01-production-deploy"
  "demo/02-scope-drift-auth"
  "demo/03-billing-dependency"
  "demo/04-destructive-migration"
  "demo/05-clear-invoice-copy"
)

folders=(
  "docs/demo-prs/01-production-deploy"
  "docs/demo-prs/02-scope-drift-auth"
  "docs/demo-prs/03-billing-dependency"
  "docs/demo-prs/04-destructive-migration"
  "docs/demo-prs/05-clear-invoice-copy"
)

titles=(
  "AI change modifies production deploy workflow"
  "AI invoice UI fix touches authorization rules"
  "AI adds billing runtime dependency"
  "AI migration drops invoice column"
  "AI updates invoice copy only"
)

print_pr_commands() {
  echo
  echo "Manual publish commands. Review before running:"
  echo
  for index in "${!branches[@]}"; do
    echo "git push -u origin ${branches[$index]}"
    echo "gh pr create --base ${BASE_BRANCH} --head ${branches[$index]} --title \"${titles[$index]}\" --body-file ${folders[$index]}/README.md"
    echo
  done
}

if [[ "$MODE" == "dry-run" ]]; then
  echo "Dry-run only. No branch, commit, push or PR will be created."
  echo
  for index in "${!branches[@]}"; do
    echo "Would create local branch: ${branches[$index]}"
    echo "Would apply patch: ${folders[$index]}/changes.diff"
    echo "Would commit: Demo: ${titles[$index]}"
    echo
  done
  print_pr_commands
  exit 0
fi

current_branch="$(git symbolic-ref --quiet --short HEAD || true)"
if [[ -z "$current_branch" ]]; then
  echo "Refusing to run from a detached HEAD." >&2
  exit 1
fi

for index in "${!branches[@]}"; do
  branch="${branches[$index]}"
  folder="${folders[$index]}"
  title="${titles[$index]}"

  if git rev-parse --verify "$branch" >/dev/null 2>&1; then
    echo "Branch already exists, refusing to overwrite: $branch" >&2
    exit 1
  fi

  git checkout "$BASE_BRANCH"
  git checkout -b "$branch"
  git apply --unidiff-zero "$folder/changes.diff"
  git add .
  git commit -m "Demo: $title"
done

git checkout "$current_branch"

echo "Created local demo branches and commits."
echo "No push was executed."
print_pr_commands
