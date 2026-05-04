# Open The Demo PRs

This page explains how to create the five public PRs for the demo.

The recommended path is manual and explicit. No command in this page pushes automatically unless you run it yourself.

## Preparation

Start from a clean local clone of the public demo repository:

```bash
git status --short
```

Expected output: nothing.

Confirm the remote points to the public demo repository:

```bash
git remote -v
```

Confirm the workflow secrets and variables are configured before opening PRs:

- `SENTINEL_ADP_BASE_URL`
- `SENTINEL_LAUNCH_RECORD_ID`
- `SENTINEL_ADP_TOKEN`
- `SENTINEL_GITHUB_COMMENT_TOKEN` if the default GitHub token cannot write PR comments

Confirm the public action has been pushed and tagged as `v1`, then confirm the workflow uses:

```yaml
uses: illicoman/sentinel-github-pr-passport-action@v1
```

## Option A: Manual Branches

For each scenario:

```bash
git checkout main
git pull --ff-only
git checkout -b demo/01-production-deploy
git apply --unidiff-zero docs/demo-prs/01-production-deploy/changes.diff
git add .
git commit -m "Demo: AI change modifies production deploy workflow"
```

Then push and open the PR manually:

```bash
git push -u origin demo/01-production-deploy
gh pr create \
  --base main \
  --head demo/01-production-deploy \
  --title "AI change modifies production deploy workflow" \
  --body-file docs/demo-prs/01-production-deploy/README.md
```

Repeat with the scenario table below.

## Scenario Table

| PR | Branch | Scenario Folder | Title |
| --- | --- | --- | --- |
| 1 | `demo/01-production-deploy` | `docs/demo-prs/01-production-deploy` | `AI change modifies production deploy workflow` |
| 2 | `demo/02-scope-drift-auth` | `docs/demo-prs/02-scope-drift-auth` | `AI invoice UI fix touches authorization rules` |
| 3 | `demo/03-billing-dependency` | `docs/demo-prs/03-billing-dependency` | `AI adds billing runtime dependency` |
| 4 | `demo/04-destructive-migration` | `docs/demo-prs/04-destructive-migration` | `AI migration drops invoice column` |
| 5 | `demo/05-clear-invoice-copy` | `docs/demo-prs/05-clear-invoice-copy` | `AI updates invoice copy only` |

## Option B: Local Branch Helper

The helper script is dry-run by default:

```bash
./scripts/prepare-demo-branches.sh
```

To create local branches and local commits:

```bash
./scripts/prepare-demo-branches.sh --apply
```

The script:

- refuses to run if the worktree is dirty;
- applies the scenario diffs with `git apply --unidiff-zero`;
- creates local branches only;
- does not push;
- does not run `gh pr create`;
- prints the `git push` and `gh pr create` commands to run manually.

## Expected Sentinel Signals

- PR 1: protected production deployment surface, release owner next action.
- PR 2: possible scope drift and authorization rules surface.
- PR 3: billing runtime dependency surface.
- PR 4: database migration surface. Current Sentinel does not read SQL content and does not directly detect `DROP COLUMN`.
- PR 5: clear, no protected surface touched.

## After Opening Each PR

- Wait for the Action to finish.
- Confirm there is one Sentinel comment.
- Confirm the comment includes the marker `<!-- sentinel-change-passport -->` in the source.
- Rerun the workflow once if needed and confirm the comment is updated, not duplicated.
- Capture screenshots listed in [capture-screenshots.md](capture-screenshots.md).
