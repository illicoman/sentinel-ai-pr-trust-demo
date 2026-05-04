<!-- sentinel-change-passport -->
## Sentinel Change Passport

Decision: missing_evidence

This PR touches a protected surface:
- Database migrations (`migrations/2026-05-02-add-invoice-status.sql`)

Evidence:
- Surface profile: present
- Launch authority: missing
- J0 scheduled: missing

Required review:
- Database migrations: data-owner

Next action:
Request data-owner review and a rollback plan before merge. Sentinel matched the migration surface; it does not inspect SQL contents in this preview.

Boundary:
Advisory only. Sentinel did not block this PR.

Note:
This demo comment is based on the changed file path. The current action does not read SQL contents and does not detect `DROP COLUMN` directly.
