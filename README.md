# finding-things — find the best used car, across every marketplace

Used-car listings are scattered across big aggregators, dealer sites and classifieds (Carsales, Gumtree, Facebook Marketplace…) that don't share an API, so finding the **cheap-and-good** deals means searching each one by hand. This project turns that into a repeatable workflow that runs in [Claude Code](https://claude.com/claude-code) using **your own browser session**.

> Status: early pilot. Built from a real Melbourne search (see `examples/`). Australia (Victoria) is the first supported jurisdiction; the design is meant to add more.

## What it does
1. **Interviews you** for a buyer profile: where you live, budget ceiling *and* ideal spend, how the car will be used.
2. **Searches the web** for matching cars – any site, not a fixed list – through your own Chrome (no scraping infrastructure, no API keys), per model and price band. Site "adapters" in `docs/sources/` are optional shortcuts for sites that have already been mapped.
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

## Responsible use (please read)
This tool drives **your own browser, with your own sessions**, to read public listings you could view yourself. It is a personal research assistant, not a data-collection service.
- **Check each site's terms of use.** Many marketplaces restrict automated access, and some are strict about it (Facebook/Meta especially). You are responsible for complying with the terms of any site you use it on and for any consequences, such as being blocked or banned. Facebook Marketplace is **off by default** and opt-in only.
- **Read-only and light-touch.** The skills search a handful of narrow queries sequentially, look at the top results, and stop. They are not meant for bulk crawling, monitoring at scale, resale of data, or republishing listings. They never bypass CAPTCHAs, bot checks or logins themselves: if a site needs one, they stop, ask you to handle it in your own browser, keep working on everything else, and carry on when you say done.
- **No data hoarding.** Only the shortlist you asked for is saved, locally in `searches/`. Don't publish other people's listings, photos or contact details.
- **Not advice.** Nothing here is financial, legal, mechanical or consumer-law advice, and results can be wrong. Always run a history check and get an independent pre-purchase inspection.
- Not affiliated with, endorsed by, or sponsored by any marketplace named in the docs; names are used only to describe what a source is.
- Provided "as is" under the MIT licence, without warranty.

## Principles
- **Built for human + agent teamwork.** The agent does the legwork; you hold the logins, CAPTCHAs, decisions, approvals and money. When it's stuck it **asks, waits and resumes – it never skips, bypasses or guesses.** See [`docs/collaboration.md`](docs/collaboration.md).
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
