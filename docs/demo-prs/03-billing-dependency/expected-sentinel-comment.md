<!-- sentinel-change-passport -->
## Sentinel Change Passport

Decision: missing_evidence

This PR touches a protected surface:
- Billing runtime dependencies (`package.json`)
- Billing runtime dependencies (`package-lock.json`)

Evidence:
- Surface profile: present
- Evidence sharing: missing

Required review:
- Billing runtime dependencies: backend-owner

Next action:
Ask backend-owner to validate why this runtime dependency is needed before merge.

Boundary:
Advisory only. Sentinel did not block this PR.
