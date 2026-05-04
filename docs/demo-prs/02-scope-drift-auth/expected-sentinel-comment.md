<!-- sentinel-change-passport -->
## Sentinel Change Passport

Decision: needs_review

This PR touches a protected surface:
- Authorization rules (`src/auth/permissions.ts`)

Evidence:
- Surface profile: present
- Review referent: present

Required review:
- Authorization rules: security-owner

Next action:
Confirm why the requested task touches authorization rules before merge, then request review from security-owner.

Scope:
Possible scope drift. Requested task: Fix invoice display copy.

Boundary:
Advisory only. Sentinel did not block this PR.
