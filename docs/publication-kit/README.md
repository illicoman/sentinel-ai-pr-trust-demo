# Sentinel Demo Publication Kit

This kit turns the local demo repo into a public GitHub demo that can support screenshots, outreach and founder-led sales.

Use it after the demo repository has been copied or published as its own GitHub repository. Nothing in this kit pushes to GitHub automatically and no real secret value belongs in the repository.

## Goal

Publish a simple, public demo around one message:

> Know when AI pull requests touch sensitive files.

The demo should show a reviewer what Sentinel adds in less than 30 seconds:

- a protected surface was touched;
- the evidence state is visible;
- the expected reviewer is named;
- the next action is clear;
- the boundary remains advisory.

## Files

- [publication-checklist.md](publication-checklist.md): end-to-end public launch checklist.
- [github-secrets.md](github-secrets.md): required variables/secrets and handling rules.
- [open-demo-prs.md](open-demo-prs.md): manual flow for the five scenario branches and PRs.
- [capture-screenshots.md](capture-screenshots.md): exact screenshots and short captions.
- [outreach-posts.md](outreach-posts.md): posts and email copy to adapt.
- [faq.md](faq.md): objection handling for product, developer and buyer questions.
- [action-plan.md](action-plan.md): manual actions remaining and next product lots.

Optional helper:

- [../../scripts/prepare-demo-branches.sh](../../scripts/prepare-demo-branches.sh): dry-run by default; with `--apply`, creates local branches and commits only. It never pushes and never opens PRs.

## Publication Flow

1. Publish the demo repository manually.
2. Configure GitHub variables and secrets.
3. Open the five PRs from the scenario diffs.
4. Wait for Sentinel comments and step summaries.
5. Capture screenshots.
6. Publish outreach using the screenshots as proof.
7. Use [action-plan.md](action-plan.md) to choose the next product lot after feedback.

## Boundaries

- No GitHub App in this demo.
- No blocking check by default.
- No file content reading by the Action.
- No customer data or real secrets.
- No claim that Sentinel makes a PR safe.
- No compliance, medical or financial certification claim.
