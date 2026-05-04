<!-- sentinel-change-passport -->
## Sentinel Change Passport

Decision: missing_evidence

This PR touches a protected surface:
- Billing runtime dependencies (`package.json`, `package-lock.json`)

Evidence:
- Evidence sharing: missing
- Surface profile: present

Required review:
- backend-owner

Next action:
Validate why the new runtime dependency is needed before merge.

Boundary:
Advisory only. Sentinel did not block this PR.
