# GitHub Secrets And Variables

The demo workflow needs two secrets and two variables.

## Repository Variables

### `SENTINEL_ADP_BASE_URL`

Base URL for the ADP pilot registry API used by the Change Passport preview route.

Example shape:

```txt
https://adp.example.invalid
```

Do not use a real value in public documentation or committed files.

For the FrenchLink public demo proxy, use:

```txt
https://frenchlink.fr/agent-decision-plane-testeurs
```

The Action appends `/admin/change-passports/preview`, so this resolves to the bounded public proxy:

```txt
https://frenchlink.fr/agent-decision-plane-testeurs/admin/change-passports/preview
```

### `SENTINEL_LAUNCH_RECORD_ID`

Launch record ID for the demo pilot.

The launch record must already exist in ADP and be linked to the protected surface profile used by the demo.

Do not commit the real value if it exposes internal account identifiers.

## Repository Secret

### `SENTINEL_ADP_TOKEN`

Bearer token used by the GitHub Action to call the ADP preview endpoint.

Rules:

- Store it as a GitHub Secret, not as a repository variable.
- Never commit it.
- Never paste it into PR comments, issues or screenshots.
- Scope it to advisory Change Passport preview only.
- Rotate it after public demos if it was shared with a temporary environment.

### `SENTINEL_GITHUB_COMMENT_TOKEN`

Fine-grained GitHub token used only to read PR files metadata and publish the Sentinel PR comment.

Use this when the default `github.token` fails with:

```txt
Resource not accessible by integration
```

Recommended scope:

- resource owner: the repository owner;
- repository access: only this demo repository;
- repository permissions:
  - `Issues`: read and write;
  - `Pull requests`: read and write;
  - `Contents`: read-only.

The workflow falls back to `github.token` when this secret is not configured.

## What The Action Sends To ADP

The Action sends:

- launch record ID;
- agent host label;
- requested task, usually the PR title;
- changed file paths and statuses.

The Action does not send:

- file contents;
- GitHub secrets;
- customer data;
- tokens other than the ADP bearer token in the authorization header.

The Action also uses a GitHub token locally inside the workflow to read PR file metadata and write the PR comment. That token is not sent to ADP.

## Recommended Pilot Mode

Use:

```yaml
fail_on: never
```

This keeps the demo advisory. Sentinel posts or updates a PR comment but does not block the PR.

## Screenshot Hygiene

Before sharing screenshots, check that they do not reveal:

- secret names with values;
- private URLs;
- internal account IDs;
- private branch names;
- customer or prospect names.
