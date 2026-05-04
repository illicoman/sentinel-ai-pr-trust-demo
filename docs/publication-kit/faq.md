# FAQ

## GitHub already has CODEOWNERS. Why use Sentinel?

CODEOWNERS maps paths to reviewers. Sentinel adds context around why the path matters for a pilot:

- protected surface touched;
- evidence present, missing, stale or invalid;
- expected reviewer;
- next action;
- advisory boundary.

They are complementary. CODEOWNERS can request review; Sentinel explains the trust question.

## CodeRabbit, Qodo and similar tools already review code. How is this different?

Those tools focus on code review. Sentinel is narrower.

This demo does not read file contents. It looks at the PR file list and the pilot evidence model to answer:

> Did this PR touch a protected surface, and what should the reviewer know?

It is not trying to be a general reviewer.

## Why not just configure Claude, Codex or another coding agent correctly?

Agent instructions help, but they live inside the agent workflow.

Sentinel sits outside the agent. It checks the PR against protected surfaces and readiness evidence, then writes an advisory Change Passport for the reviewer. That gives the team a review signal even when the agent followed the wrong path or the requested task drifted.

## Does Sentinel read my code?

In this GitHub Action demo, no.

The Action collects the PR file list from GitHub and sends only paths and statuses to ADP. It does not send file contents.

The database migration scenario is intentionally honest: Sentinel detects that a migration file changed. It does not detect `DROP COLUMN` by reading SQL content in this demo.

## Is Sentinel blocking?

Not by default.

The recommended pilot setting is:

```yaml
fail_on: never
```

That mode publishes or updates a PR comment and writes a step summary, but does not block the PR.

## Is Sentinel adapted to health, finance or regulated teams?

Sentinel can be relevant to teams with sensitive review surfaces, but this demo is not a compliance product and does not prove regulatory readiness.

For health, finance or regulated teams, use this demo as a review conversation starter. Legal, security and compliance validation remain external to the demo.

## Does Sentinel make a PR safe?

No.

Sentinel makes protected surface touches and evidence gaps visible. It does not guarantee that a PR is safe.

## What data reaches ADP?

The Action sends:

- launch record ID;
- agent host label;
- requested task;
- changed file paths;
- changed file statuses.

It does not send:

- file contents;
- GitHub secrets;
- customer data;
- repository tokens in the payload.

## How do I remove the Action?

To remove the demo Action:

1. Delete `.github/workflows/sentinel-passport.yml`.
2. Delete the repository secret `SENTINEL_ADP_TOKEN`.
3. Delete repository variables `SENTINEL_ADP_BASE_URL` and `SENTINEL_LAUNCH_RECORD_ID`.
4. Revoke or rotate the ADP token.
5. Delete old PR comments if you do not want them visible.

No GitHub App is installed in this demo.
