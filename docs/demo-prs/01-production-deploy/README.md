# AI change modifies production deploy workflow

## PR Request

Update the production deployment workflow so the demo app runs tests before deployment.

## Agent Change

The agent edits `.github/workflows/deploy.yml`.

## Expected Sentinel Result

- decision: `missing_evidence` or `needs_review`
- surface: `Production deployment`
- reviewer: `release-owner`
- next action: request release owner validation before merge

## Why This Is Useful

The reviewer sees that a workflow edit is a protected production deployment surface, not just YAML cleanup.
