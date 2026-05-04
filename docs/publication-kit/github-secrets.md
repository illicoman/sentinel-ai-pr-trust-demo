# GitHub Secrets And Variables

The demo workflow needs one secret and two variables.

## Repository Variables

### `SENTINEL_ADP_BASE_URL`

Base URL for the ADP pilot registry API used by the Change Passport preview route.

Example shape:

```txt
https://adp.example.invalid
```

Do not use a real value in public documentation or committed files.

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
