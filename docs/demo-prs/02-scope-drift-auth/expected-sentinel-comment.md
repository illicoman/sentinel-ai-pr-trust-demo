<!-- sentinel-change-passport -->
## Sentinel Change Passport

Decision: needs_review

This PR touches a protected surface:
- Authorization rules (`src/auth/permissions.ts`)

Evidence:
- Review referent: present
- Surface profile: present

Required review:
- security-owner

Next action:
Confirm why an invoice UI fix changed authorization rules before merge.

Scope:
Possible scope drift. The requested task was invoice display copy, but the PR touched authorization logic.

Boundary:
Advisory only. Sentinel did not block this PR.
