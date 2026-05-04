# Outreach Posts

These drafts are ready to adapt after the five public PRs are open and screenshots are available.

Core message:

> Know when AI pull requests touch sensitive files.

Do not add compliance, enterprise-ready or safety claims. Keep the demo framed as advisory.

## LinkedIn: CTO / Lead Dev

AI coding agents are making PRs faster than teams can build new review habits.

The question is not "did the AI write good code?"

The question is:

> Did this AI PR touch something sensitive?

I put together a public Sentinel demo showing a GitHub PR comment that flags protected surfaces:

- production deployment workflow;
- authorization rules;
- runtime billing dependencies;
- database migrations.

Sentinel does not read file contents in this demo. It uses the PR file list, a pilot launch record and readiness evidence to produce a short Change Passport:

- protected surface touched;
- evidence present or missing;
- expected reviewer;
- next action.

Demo: [link]

Message: Know when AI pull requests touch sensitive files.

## X / Developer

AI PRs need a trust layer that is narrower than "AI code review."

Sentinel answers one question:

Did this PR touch a sensitive surface?

Demo PR:
- deploy workflow changed
- release owner required
- launch authority missing
- advisory only, no blocking by default

Know when AI pull requests touch sensitive files.

[link]

## Hacker News: Show HN

Title:

```txt
Show HN: Sentinel - advisory PR passports for AI changes touching sensitive files
```

Post:

```txt
I built a small public demo for Sentinel, a narrow trust layer for AI-generated pull requests.

It is not an AI code reviewer. It does not read file contents in this demo.

The GitHub Action looks at the PR file list, calls a preview API, and posts a short Change Passport:

- protected surface touched
- evidence present/missing
- expected reviewer
- next action

The demo includes five PR scenarios: production deploy workflow, scope drift into auth rules, dependency change, database migration, and a normal clear PR.

The default mode is advisory: it comments, but does not block.

Demo repo: [link]
```

## Reddit DevSecOps

Title:

```txt
Demo: advisory PR passports for AI changes that touch sensitive files
```

Post:

```txt
I am testing a narrow approach to AI PR review.

Instead of asking an LLM to review everything, Sentinel answers a smaller question:

"Did this PR touch a protected surface, and what evidence/reviewer/next action should be visible?"

The demo GitHub Action:
- reads the PR file list only;
- does not read file contents;
- posts an advisory comment;
- does not block by default.

Scenarios include deploy workflow changes, auth rule scope drift, dependency changes, database migrations and a clear PR.

I would be interested in feedback from teams already using AI coding agents in repos with sensitive release/auth/billing surfaces.

Demo: [link]
```

## Short Prospect Email

Subject:

```txt
AI PRs touching sensitive files
```

Body:

```txt
Hi [Name],

I am working on Sentinel, a narrow trust layer for AI-generated PRs.

The idea is simple: when an AI PR touches a sensitive surface like deployment, auth, billing dependencies or database migrations, Sentinel posts a short advisory Change Passport in GitHub:

- what sensitive surface changed;
- what evidence exists or is missing;
- who should review;
- what the next action is.

It is not a general AI reviewer and the demo does not read file contents.

Public demo: [link]

Would this be useful for the way your team reviews AI-generated PRs?

Best,
[Name]
```
