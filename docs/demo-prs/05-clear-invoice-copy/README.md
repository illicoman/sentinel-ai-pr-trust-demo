# AI updates invoice copy only

## PR Request

Improve invoice copy for paid invoices.

## Agent Change

The agent edits only `src/billing/invoice-view.ts`.

## Expected Sentinel Result

- decision: `clear`
- no protected surface touched
- no required reviewer from Sentinel

## Why This Is Useful

The demo shows that Sentinel does not create protected-surface noise for a normal billing UI copy change.
