# Contributing

## Add a domain pack (a new category)
After a real hunt for something other than a car, copy `domains/_template.md` to `domains/<thing>.md` and fill it in from your `SOURCES.md` and shortlist: what matters, problem areas, sources with search patterns and **handoff points** (logins, CAPTCHAs, paywalls), vetting red flags, and the all-in cost model, each cited and dated. No personal data. Set the status to DRAFT until it has been tested on a real search.

## Add a jurisdiction
Copy `data/jurisdictions/au-vic.md` to `data/jurisdictions/<country>-<state>.md`. Fill in: duty/stamp duty, transfer fee, registration, roadworthy/inspection rules, dealer warranty and cooling-off rules, interstate/import rules, insurance notes. **Cite an official source for every figure, set `verified:` to today's date, and mark anything unverified.** No personal data.

## Add a marketplace source
Copy a doc in `docs/sources/` and document: access method that works (or doesn't), search URL pattern, how to extract rows (selectors, gotchas), detail-page fields, and red flags specific to that site. Test with real searches. Respect the site's terms of use; read-only, no credential handling, rate-limit yourself. **Document the handoff points** (where the site needs a login, CAPTCHA, 2FA or consent) and what the human must do there, following `docs/collaboration.md`: agents ask, never skip or bypass.

## Improve a skill
Skills live in `skills/<name>/SKILL.md`. Keep them generic (no personal budgets, locations or listings) and keep the hard rules: user approval before any contact/offer/payment, never reveal budget/urgency to sellers, never handle credentials.

## Examples
`examples/` must be anonymised (no names, phone numbers, emails, plates, or seller contact details). Listings are ephemeral – label them as a snapshot.
