# Publication Checklist

Use this checklist when turning the local demo into a public GitHub repository.

## Before Publishing

- [ ] Review the repository for accidental secrets:
  - `SENTINEL_ADP_TOKEN`
  - private ADP URLs
  - personal access tokens
  - customer names
  - real production hostnames
- [ ] Confirm `sentinel-surfaces.yml` is clearly described as a public teaching file, not the canonical ADP runtime format.
- [ ] Confirm the workflow uses advisory mode:
  - `fail_on: never`
- [ ] Confirm the demo does not claim Sentinel makes a PR safe.
- [ ] Confirm the SQL scenario says Sentinel detects the migration file path, not the `DROP COLUMN` content.

## Create The Public Repository

- [ ] Create a public GitHub repository, for example `sentinel-ai-pr-trust-demo`.
- [ ] Push the demo repository to `main`.
- [ ] Confirm the README renders correctly.
- [ ] Confirm the five scenario folders render correctly under `docs/demo-prs/`.
- [ ] Confirm GitHub Actions is enabled for the repository.

## Configure GitHub Variables And Secrets

- [ ] Add repository variable `SENTINEL_ADP_BASE_URL`.
- [ ] Add repository variable `SENTINEL_LAUNCH_RECORD_ID`.
- [ ] Add repository secret `SENTINEL_ADP_TOKEN`.
- [ ] Confirm the token is scoped for advisory preview only.
- [ ] Confirm no token value appears in workflow logs.

See [github-secrets.md](github-secrets.md).

## Verify The Workflow

- [ ] Open a small test PR or use scenario 5 first.
- [ ] Confirm the Action runs on `pull_request`.
- [ ] Confirm the Action posts one Sentinel comment.
- [ ] Confirm the Action updates the existing comment on rerun instead of creating duplicates.
- [ ] Confirm the step summary is present.
- [ ] Confirm `sentinel-change-passport/passport.json` is uploaded if artifact upload is enabled.

## Open The Five Demo PRs

- [ ] PR 1: `AI change modifies production deploy workflow`.
- [ ] PR 2: `AI invoice UI fix touches authorization rules`.
- [ ] PR 3: `AI adds billing runtime dependency`.
- [ ] PR 4: `AI migration drops invoice column`.
- [ ] PR 5: `AI updates invoice copy only`.

See [open-demo-prs.md](open-demo-prs.md).

## Capture Proof

- [ ] Capture Sentinel comment for PR 1.
- [ ] Capture scope drift signal for PR 2.
- [ ] Capture clear result for PR 5.
- [ ] Capture the GitHub Actions step summary.
- [ ] Capture the repository README first viewport.

See [capture-screenshots.md](capture-screenshots.md).

## Publish Outreach

- [ ] Publish the main LinkedIn post.
- [ ] Publish the short developer post.
- [ ] Prepare Show HN draft.
- [ ] Prepare Reddit DevSecOps draft.
- [ ] Send the short prospect email to a small qualified list.

See [outreach-posts.md](outreach-posts.md).

## Feed The Product Plan

- [ ] Record which PR comment produced the clearest reaction.
- [ ] Record which surface type prospects care about first.
- [ ] Record every false positive or confusing label.
- [ ] Record whether prospects ask first for onboarding, history, scope drift or GitHub App installation.
- [ ] Choose the next product lot from [action-plan.md](action-plan.md) using that feedback.

## Final Safety Pass

- [ ] No secrets in the repository.
- [ ] No customer data.
- [ ] No logs containing the ADP token.
- [ ] No claim of blocking enforcement.
- [ ] No claim that Sentinel reads file contents.
- [ ] No claim of compliance certification.
