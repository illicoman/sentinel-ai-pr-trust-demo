# Sentinel AI PR Trust Demo

Know when an AI pull request touches a sensitive surface.

This demo shows how Sentinel produces a Change Passport for AI-generated pull requests.

## What To Screenshot

```md
## Sentinel Change Passport

Decision: missing_evidence

This PR touches a protected surface:
- Production deployment (`.github/workflows/deploy.yml`)

Evidence:
- Surface profile: present
- Launch authority: missing

Required review:
- Production deployment: release-owner

Next action:
Request release-owner validation before merge.

Boundary:
Advisory only. Sentinel did not block this PR.
```

## Demo App

This repository is intentionally small. It is not a complete SaaS product. It exists to show how Sentinel explains sensitive AI PRs in the natural developer workflow: GitHub pull requests.

The app includes:

- a production deployment workflow;
- authorization rules;
- billing UI/runtime files;
- production config;
- database migrations.

## Protected Surfaces

The public teaching file is `sentinel-surfaces.yml`.

It is deliberately simple and readable. It is not yet the canonical ADP runtime format. In a real pilot, ADP remains the source of truth for launch records, readiness evidence and protected surface profiles.

## GitHub Action

The demo workflow is `.github/workflows/sentinel-passport.yml`.

Published action form:

```yaml
- uses: illicoman/sentinel-github-pr-passport-action@v1
```

Local development fallback before publication:

```yaml
- uses: ./.github/actions/sentinel-pr-passport
```

Minimum permissions:

```yaml
permissions:
  contents: read
  pull-requests: read
  issues: write
  actions: read
```

The pilot recommendation is:

```yaml
fail_on: never
```

This makes Sentinel advisory. It publishes a comment and does not block the PR.

## How To Replay The Demo

1. Publish this repository to GitHub.
2. Configure:
   - `SENTINEL_ADP_BASE_URL` as a repository variable;
   - `SENTINEL_LAUNCH_RECORD_ID` as a repository variable;
   - `SENTINEL_ADP_TOKEN` as a repository secret;
   - `SENTINEL_GITHUB_COMMENT_TOKEN` as a repository secret if the default GitHub token cannot write PR comments.
3. Create one branch per scenario from `docs/demo-prs/`.
4. Apply the scenario diff.
5. Open a PR and wait for the Sentinel Change Passport comment.
6. Capture the PR comment and the changed files panel.

No scenario requires real customer data, real secrets or file content analysis.

## Publication Kit

Use `docs/publication-kit/` before publishing the public demo. It includes the checklist, GitHub secret handling, PR opening flow, screenshot plan, outreach drafts and FAQ.

The next-lot action plan lives in `docs/publication-kit/action-plan.md`. It lists the manual actions still required before public proof, then the product lots to run after the first demo feedback.

## Demo PRs

See `docs/demo-prs/README.md`.

The five scenarios are:

1. AI change modifies production deploy workflow.
2. AI invoice UI fix touches authorization rules.
3. AI adds billing runtime dependency.
4. AI migration drops invoice column.
5. AI updates invoice copy only.

## Current Limits

- Sentinel does not read file contents in this GitHub Action.
- The destructive SQL scenario is detected as a migration surface touch, not because the action parses `DROP COLUMN`.
- The action is advisory by default.
- The demo does not create a GitHub App.
- The demo does not claim a PR is safe.
- The demo does not prove compliance, AppSec coverage or medical safety.

## Where This Goes Next

The current demo is the observe/advisory version of Sentinel.

The product direction is a Required Passport path:

1. keep the GitHub Action as the easiest public demo;
2. add a private GitHub App for pilots;
3. publish a Sentinel Check Run in warn mode;
4. read a simple repo config such as `.sentinel/surfaces.yml`;
5. support local `sentinel pr preview` before CI;
6. let teams make `Sentinel Change Passport` a required GitHub Ruleset check on selected critical surfaces.

Required mode is not enabled in this demo. It should come after clean screenshots, low-noise surfaces, reviewer feedback and an audited bypass path.
