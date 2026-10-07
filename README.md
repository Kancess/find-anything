# finding-things — find the best used car, across every marketplace

Used-car listings are scattered across big aggregators, dealer sites and classifieds (Carsales, Gumtree, Facebook Marketplace…) that don't share an API, so finding the **cheap-and-good** deals means searching each one by hand. This project turns that into a repeatable workflow that runs in [Claude Code](https://claude.com/claude-code) using **your own browser session**.

> Status: early pilot. Built from a real Melbourne search (see `examples/`). Australia (Victoria) is the first supported jurisdiction; the design is meant to add more.

## What it does
1. **Interviews you** for a buyer profile: where you live, budget ceiling *and* ideal spend, how the car will be used.
2. **Sweeps** marketplaces through your logged-in Chrome (no scraping infrastructure, no API keys), per model and price band.
3. **Vets** the best listings: red flags, scam patterns, questions to ask.
4. **Costs** each car for your state/country: duty, transfer, rego, inspection, insurance, fuel, servicing and what's left on rego.
5. **Delivers** a ranked shortlist with an honest recommendation, plus neutral seller messages **only after you approve them**.

It is optimised for *value*, not lowest sticker price: a $3k car that's only good for parts is useless, and a $15k ceiling is a limit, not a target.

## Layout
```
skills/                 Claude skills (the product)
  car-hunt/             orchestrator: intake -> sweep -> vet -> cost -> shortlist
  car-sweep/            search marketplaces via the user's Chrome
  car-vet-listing/      red flags, questions, pre-purchase checks
  car-cost/             all-in cost + ranking, reads jurisdiction data
data/jurisdictions/     rules as data, one file per state/country (au-vic.md…)
docs/sources/           one adapter doc per marketplace (URL patterns, extraction, gotchas)
profiles/example.yml    buyer profile template
examples/               anonymised sample output
searches/               YOUR searches (gitignored – personal data stays local)
```

## Use it
Requirements: Claude Code, the **Claude in Chrome** extension, and Chrome logged in to the marketplaces you want searched (Facebook Marketplace requires it).

```bash
git clone <this repo> && cd finding-things
claude            # skills in ./skills are available via .claude/skills
```
Then ask: *"Use car-hunt to help me find a car."*
Or install as a plugin (`.claude-plugin/plugin.json` is included).

## Principles
- **You stay in control.** It never logs in for you, never pays, and never contacts a seller or makes an offer without your approval of the exact message.
- **Diplomatic, not desperate.** Seller messages don't reveal your budget, urgency or the seller's deadline.
- **Honest about uncertainty.** Nothing is inspected; always run a history check (PPSR in Australia) and get an independent pre-purchase inspection.
- **Rules are data.** Costs and consumer protections live in `data/jurisdictions/*.md` with sources and a `verified` date. Fees change each financial year – re-verify.
- Not financial, legal or mechanical advice.

## Limits (known)
- Marketplaces change their markup and block automation; adapters need maintenance. Respect each site's terms of use and rate limits.
- Facebook Marketplace shows no km/transmission on result cards, so it needs an extra click per ad.
- Only Victoria (AU) is verified so far. Contributions for other states/countries welcome – see `CONTRIBUTING.md`.

## Roadmap ideas
- More jurisdictions (NSW, QLD, WA, SA, NZ, UK…) and sources (Autotrader, CarsGuide, dealer groups, auctions).
- Saved searches + alerts for new below-market listings.
- Per-model reliability notes with cited sources.
- A lightweight web UI on top of the same skills.
