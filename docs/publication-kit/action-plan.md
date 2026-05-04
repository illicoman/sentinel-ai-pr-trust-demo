# Sentinel Demo Action Plan

This action plan starts after `sentinel-demo-publication-kit-v1`.

Current proven state:

- the Sentinel Change Passport preview exists in ADP;
- the GitHub Action exists under `tools/github-pr-passport-action`;
- the local demo repository exists under `docs/demo-repos/sentinel-ai-pr-trust-demo`;
- the publication kit is ready;
- the public action repository exists at `https://github.com/illicoman/sentinel-github-pr-passport-action`;
- the demo workflow is intended to use `illicoman/sentinel-github-pr-passport-action@v1`;
- the publication from Codex is blocked until GitHub credentials are available;
- no public PR has been opened yet;
- no real secret or token is documented here.

## Manual Actions Remaining

These actions are intentionally manual. They create the public proof needed before building more product surface.

### 1. Choose The Public Action Distribution

Pick one path before opening public demo PRs.

Chosen path for the public demo:

- publish the GitHub Action as `illicoman/sentinel-github-pr-passport-action`;
- tag it as `v1`;
- keep the demo workflow using:

```yaml
uses: illicoman/sentinel-github-pr-passport-action@v1
```

Fallback path if publication is blocked:

- vendor the action into the demo repository;
- switch the demo workflow to a local action path;
- document that this is a demo-only setup.

```yaml
uses: ./.github/actions/sentinel-pr-passport
```

Do not leave the public demo workflow pointing to an action reference that does not exist.

### 2. Publish The Demo Repository

- Create the public GitHub repository, for example `sentinel-ai-pr-trust-demo`.
- Push the demo repository to `main`.
- Confirm the README, scenario docs and publication kit render correctly.
- Confirm GitHub Actions is enabled.

### 3. Prepare The Demo ADP Record

- Create or select a demo `pilot_launch_record`.
- Ensure the linked surface profile matches the demo surfaces closely enough for the five PRs.
- Keep the record in a launch-ready or intentionally blocked advisory state, depending on the story shown.
- Do not use a real customer name, real hospital, real financial institution or production repo.

### 4. Create The Advisory Preview Token

- Create an ADP token scoped to Change Passport preview only.
- Do not reuse an operator or admin-wide token.
- Do not paste the token into docs, commits, screenshots or shell history meant for publication.

### 5. Configure GitHub Variables And Secrets

Add:

- `SENTINEL_ADP_BASE_URL` as a repository variable;
- `SENTINEL_LAUNCH_RECORD_ID` as a repository variable;
- `SENTINEL_ADP_TOKEN` as a repository secret.

Then run one test PR and confirm the token is not printed in logs.

### 6. Open Scenario 5 First

Open the clear scenario first:

- branch: `demo/05-clear-invoice-copy`;
- title: `AI updates invoice copy only`.

This verifies that the workflow, token, ADP route and comment update flow work before showing sensitive-surface cases.

### 7. Open The Five Public PRs

Open all scenario PRs:

1. `AI change modifies production deploy workflow`
2. `AI invoice UI fix touches authorization rules`
3. `AI adds billing runtime dependency`
4. `AI migration drops invoice column`
5. `AI updates invoice copy only`

Confirm each PR has one Sentinel comment and one Action step summary.

### 8. Capture Screenshots

Capture at minimum:

- PR 1 Sentinel comment;
- PR 2 scope drift signal;
- PR 5 clear decision;
- GitHub Actions step summary;
- repository README first viewport.

Use the captions in `capture-screenshots.md`.

### 9. Replace Outreach Placeholders

Replace every `[link]` placeholder in `outreach-posts.md` with the real public demo link or PR links.

Do not add claims about compliance, safety certification, broad enforcement or file-content analysis.

### 10. Run Founder-Led Outreach

Use a small qualified batch first:

- 10 to 20 CTOs, lead developers, DevSecOps profiles or AI-heavy product teams;
- 3 to 5 teams already using Claude, Codex, Copilot or Cursor on GitHub;
- 1 to 2 vertical teams with sensitive workflows, such as healthcare voice agents or regulated SaaS.

Ask for feedback on the PR comment, not for broad platform validation.

### 11. Capture Feedback

Track feedback in a simple table:

- prospect;
- repo type;
- sensitive surfaces;
- confusing wording;
- missing evidence;
- false positive;
- pricing signal;
- pilot interest;
- next action.

This feedback decides whether to prioritize onboarding, history, scope drift or GitHub App work.

## Next Product Lots

These lots are ordered to move from public proof to paid pilots, then to a private GitHub App.

### B0.32 - `sentinel-demo-live-publication-v1`

Purpose:

- document the real public repo URL;
- document the five public PR URLs;
- capture screenshots and link them from the docs;
- verify that public comments match the expected Sentinel story.

Done when:

- the public demo is reachable;
- five PRs are open;
- screenshots exist;
- the report lists what worked and what failed.

Boundary:

- no GitHub App;
- no blocking check;
- no claim that Sentinel makes a PR safe.

### B0.33 - `sentinel-landing-github-pr-trust-v1`

Purpose:

- create a focused landing page around:

> Know when AI pull requests touch sensitive files.

Done when:

- the page shows 2 to 3 real PR screenshots;
- the first screen explains the value in under 10 seconds;
- the call to action points to the demo or a pilot request.

Boundary:

- no generic AI governance wording;
- no enterprise-ready claim.

### B0.34 - `github-action-pilot-onboarding-v1`

Purpose:

- make the GitHub Action easy to install for one pilot repo;
- document the 10-minute setup;
- reduce founder support during the first pilots.

Done when:

- a new team can copy the workflow;
- define 3 to 5 protected surfaces;
- configure secrets safely;
- open a PR and get a Change Passport comment.

Boundary:

- advisory by default;
- no self-serve billing;
- no broad enforcement.

### B0.35 - `sentinel-surfaces-public-config-v1`

Purpose:

- formalize the public teaching format for protected surfaces;
- map it cleanly to ADP surface profiles without making it the runtime source of truth.

Done when:

- `sentinel-surfaces.yml` has documented fields;
- examples cover CI/CD, auth, dependencies and database migrations;
- the docs explain what ADP owns versus what the public file teaches.

Boundary:

- no Policy Studio;
- no client DSL promise;
- no automatic runtime policy activation.

### B0.36 - `partner-pilot-status-portal-v1`

Purpose:

- let a client follow the pilot without the operator cockpit.

Done when the client can see:

- protected surfaces;
- PRs analyzed;
- Change Passports generated;
- missing evidence;
- J0/J14 timeline;
- next actions.

Boundary:

- read-only except feedback;
- no launch button;
- no secrets;
- no raw internal ADP controls.

### B0.37 - `github-pr-passport-history-v1`

Purpose:

- persist PR passport metadata for reports and client follow-up.

Store only:

- repo;
- PR number;
- decision;
- touched surfaces;
- evidence summary;
- timestamps;
- links.

Do not store:

- file contents;
- secrets;
- full patches by default.

Done when:

- the cockpit and client portal can show PR passport history.

### B0.38 - `scope-drift-detection-v1`

Purpose:

- improve the signal that an AI PR changed files outside the requested task.

Done when:

- the passport can mark `possible_scope_drift`;
- examples explain why invoice work touching auth rules needs review;
- reviewers can mark the signal useful or noisy.

Boundary:

- advisory signal only;
- no claim of semantic certainty.

### B0.39 - `github-app-private-pilot-v1`

Purpose:

- create a private installable GitHub App for pilots.

Done when:

- the App receives `pull_request` webhooks;
- verifies GitHub signatures;
- maps installation/repo to a launch record;
- creates an advisory Check Run or PR comment;
- supports uninstall/revoke boundaries.

Boundary:

- private pilot only;
- no Marketplace;
- no required check by default.

### B0.40 - `change-passport-reviewer-feedback-v1`

Purpose:

- collect reviewer feedback from real PRs.

Feedback options:

- useful;
- noisy;
- wrong surface;
- wrong reviewer;
- missing evidence wrong;
- action resolved.

Done when:

- feedback is tied to passport IDs;
- reports can show false positives and useful signals.

### B0.41 - `sentinel-monthly-pilot-report-v1`

Purpose:

- turn pilot activity into a buyer-facing report.

Report includes:

- PRs analyzed;
- protected surfaces touched;
- decisions;
- missing evidence;
- scope drift signals;
- reviewer feedback;
- recommended next surfaces.

Done when:

- a J14/J30 report can be shared with a design partner without exposing secrets or source code.

## Later Lots

Keep these after the first paid pilots unless a customer explicitly pulls them forward:

- `github-app-marketplace-readiness-v1`;
- `required-sentinel-check-v1`;
- `cicd-workflow-content-passport-v1`;
- `dependency-lockfile-passport-v1`;
- `database-migration-content-passport-v1`;
- `auth-permission-change-passport-v1`;
- `multi-agent-comparison-report-v1`.

## Current Recommendation

Do not start the GitHub App before the public demo has real PR links and screenshots.

Best next move:

1. publish the public demo;
2. open the five PRs;
3. capture proof;
4. run a small outreach batch;
5. choose the next lot using real feedback.
