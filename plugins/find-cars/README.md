# find-cars: used-car domain pack

Part of [find-anything](../../README.md). Finds the best **cheap-and-good** used car across Carsales, Gumtree and other sites, using your own Chrome, and works out what it will really cost you to own. It also works on its own. Status: **tested on a real Melbourne search**.

## Install
```text
/plugin marketplace add Kancess/find-anything
/plugin install find-cars@find-anything
```
(One step on Claude Code 2.1.275+: `/plugin install find-cars --marketplace Kancess/find-anything`.)

## Use it
> *Use car-hunt to help me find a used car. I'm in Brisbane, up to $12k but happy to spend less, automatic only, mostly city commuting.*

Already have a listing? Paste it: *"Use car-vet-listing on this ad"* or *"Use car-cost to compare these three"*. These need no browser automation.

## What's inside

| Skill | Does |
|---|---|
| `car-hunt` | orchestrator: intake, sweep, vet, cost, ranked shortlist |
| `car-sweep` | searches the marketplaces through your Chrome |
| `car-vet-listing` | red flags, scam patterns, questions to ask, pre-purchase checks |
| `car-cost` | year-1 cost, then the **3-year net cost including resale**, upkeep, fuel, insurance, rego, and a "do you need a car at all" check |

| Data and notes | |
|---|---|
| `docs/sources/` | per-site notes: Carsales, Gumtree, Facebook Marketplace, Autotrader AU |
| `data/jurisdictions/` | registration, duty and consumer rules as data: **Victoria verified, NSW draft** |
| `profiles/`, `examples/` | buyer-profile template, an anonymised sample search |

## Good to know
- **Outside Victoria:** the agent researches official sources, drafts a jurisdiction file marked DRAFT, and asks you to confirm the key numbers (transfer fee, inspection rules, dealer warranty, insurance) before trusting the totals. Verified jurisdictions are the most useful contribution (see `CONTRIBUTING.md`).
- **Facebook Marketplace** is opt-in only (strict terms), needs you logged in, and shows no km or transmission on result cards, so it takes an extra click per ad.
- **Handoff points** where it will ask you: logins, CAPTCHAs, rate limits, novice-driver variant checks, insurance quotes (`docs/collaboration.md`).
- **Always** run a history check (PPSR in Australia) and get an independent pre-purchase inspection. Private sales have no warranty and no cooling-off.
- **Site notes age:** sites change their markup. If results look odd, the notes in `docs/sources/` may need updating; PRs welcome.
