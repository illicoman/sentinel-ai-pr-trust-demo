# Demo PR Scenarios

These scenarios are ready to replay manually as public GitHub PRs.

Each scenario contains:

- `README.md`: what the PR asks and why it matters;
- `changes.diff`: patch to apply on a branch;
- `expected-sentinel-comment.md`: screenshotable Sentinel comment.

## 1. AI change modifies production deploy workflow

Request: update the production deployment workflow.

Agent change: edits `.github/workflows/deploy.yml`.

Sentinel signal: production deployment surface touched, release owner review required, launch authority evidence visible.

Why useful: the reviewer sees immediately that a workflow change is not an ordinary code cleanup.

## 2. AI invoice UI fix touches authorization rules

Request: fix invoice display copy.

Agent change: edits `src/billing/invoice-view.ts` and `src/auth/permissions.ts`.

Sentinel signal: possible scope drift plus authorization rules surface touched.

Why useful: the reviewer can ask why an invoice UI change modified authorization logic.

## 3. AI adds billing runtime dependency

Request: add formatting support for billing amounts.

Agent change: edits `package.json` and `package-lock.json`.

Sentinel signal: billing runtime dependencies surface touched, backend owner review expected.

Why useful: dependency changes are visible even when they are small.

## 4. AI migration drops invoice column

Request: simplify invoice schema.

Agent change: edits a SQL migration with a `DROP COLUMN` example.

Sentinel signal: database migration surface touched, data owner review expected.

Important limit: current Sentinel GitHub Action does not read file contents. It detects the migration surface, not the destructive SQL keyword. Destructive SQL detection is a future enhancement.

## 5. AI updates invoice copy only

Request: improve invoice copy.

Agent change: edits only `src/billing/invoice-view.ts`.

Sentinel signal: clear, no protected surface touched.

Why useful: normal PRs do not get noisy protected-surface warnings.
