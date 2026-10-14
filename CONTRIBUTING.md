# Contributing

By contributing you agree that your contribution is licensed under the project's [MIT licence](LICENSE) and that you have the right to submit it (no copied text or data you don't have the right to share, no personal data).

## Add a domain pack (a new category)
Layout: the core is `plugins/find-anything`; each category is its own plugin (`plugins/find-<thing>/`, listed in `.claude-plugin/marketplace.json`) so people install only what they need. A plugin is installed as a self-contained copy, so it carries its own `docs/` including copies of the shared docs: edit them in `plugins/find-anything/docs/` and run `scripts/sync-shared-docs.sh` (add your plugin to that script).

After a real hunt for something other than a car, copy `plugins/find-anything/domains/_template.md` to `plugins/find-<thing>/README.md` and fill it in from your `SOURCES.md` and shortlist: what matters, problem areas, sources with search patterns and **handoff points** (logins, CAPTCHAs, paywalls), vetting red flags, and the all-in cost model, each cited and dated. No personal data. Set the status to DRAFT until it has been tested on a real search.

## Add a jurisdiction
(Cars.) Copy `plugins/find-cars/data/jurisdictions/au-vic.md` to `<country>-<state>.md` in the same folder. Fill in: duty/stamp duty, transfer fee, registration, roadworthy/inspection rules, dealer warranty and cooling-off rules, interstate/import rules, insurance notes. **Cite an official source for every figure, set `verified:` to today's date, and mark anything unverified.** No personal data.

## Add a marketplace source
Copy a doc in a plugin's `docs/sources/` (for example `plugins/find-cars/docs/sources/`) and document: access method that works (or doesn't), search URL pattern, how to extract rows (selectors, gotchas), detail-page fields, and red flags specific to that site. Test with real searches. Respect the site's terms of use; read-only, no credential handling, rate-limit yourself. **Document the handoff points** (where the site needs a login, CAPTCHA, 2FA or consent) and what the human must do there, following `docs/collaboration.md`: agents ask, never skip or bypass.

## Improve a skill
Skills live in `plugins/<plugin>/skills/<name>/SKILL.md` (and are linked from `.claude/skills/` for people who clone the repo; add a link for any new skill). Bump the plugin's `version` in its `plugin.json` when you change it so installed copies update. Keep them generic (no personal budgets, locations or listings) and keep the hard rules: user approval before any contact/offer/payment, never reveal budget/urgency to sellers, never handle credentials.

## Examples
Anything under an `examples/` folder must be anonymised (no names, phone numbers, emails, plates, or seller contact details). Listings are ephemeral – label them as a snapshot.
