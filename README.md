# finding-things — find the best deal on anything, across every site that sells it

The thing you want is usually scattered across marketplaces, retailers, classifieds, outlets and forums that don't share an API, so finding the **good-and-cheap** option means searching each one by hand and then working out what it will really cost you. This project turns that into a repeatable workflow that runs in [Claude Code](https://claude.com/claude-code) using **your own browser session**, with you in the loop for logins, decisions and anything outward-facing.

It works for **any category**: washing machines, bikes, laptops, furniture, camera gear, a used car. The method is the same; only the research, the sources and the cost model change. Say what you're after and it researches the category, works out where to look in your location, and asks you for any logins up front.

> Status: early pilot. It grew out of a real used-car search in Melbourne, so **used cars are the first fully mapped, tested "domain pack"** (see `domains/` and `examples/`). Everything else starts from the generic `find-anything` skill, and a hunt that works can be turned into a new pack. Australia (Victoria) is the first verified jurisdiction for cost rules.

## What it does
1. **Interviews you** for what you need: what it must do, deal-breakers, budget ceiling *and* ideal spend, new or used, where you are.
2. **Researches the category, then finds where to look.** What matters, typical prices, problem models, hidden costs and local consumer rules, with sources, for you to correct. Then it searches for the right sites for *this* thing in *your* place (not a fixed list), and **asks you to log in where needed** before it starts. Searching runs through your own Chrome (no scraping infrastructure, no API keys). Site "adapters" in `docs/sources/` are optional shortcuts for sites already mapped.
3. **Vets** the best options: red flags, scam patterns, independent reviews, questions to ask.
4. **Costs** each one over its whole life, not just the price: delivery, installation, running costs, repairs, minus resale, and whether you need to buy at all. For cars that means duty, transfer, rego, inspection, insurance, fuel, servicing and the **3-year cost including resale** (a cheap car can cost more to own than a pricier one).
5. **Delivers** a ranked shortlist with an honest recommendation, plus neutral seller messages **only after you approve them**.

It is optimised for *value*, not lowest sticker price: a cheap one that's only good for parts is useless, and a budget ceiling is a limit, not a target.

## Layout
```
skills/                 Claude skills (the product)
  find-anything/        orchestrator for ANY category: intake -> research -> sources -> sweep -> vet -> cost -> shortlist
  source-discovery/     researches the category, finds where to look, asks you for logins up front
  car-hunt/             the used-car domain pack's orchestrator: intake -> sweep -> vet -> cost -> shortlist
  car-sweep/            search marketplaces via the user's Chrome
  car-vet-listing/      red flags, questions, pre-purchase checks
  car-cost/             all-in cost + ranking, reads jurisdiction data
domains/                domain packs: what's specific to a category (cars mapped; template for yours)
data/jurisdictions/     rules as data, one file per state/country (au-vic.md…)
docs/                   collaboration protocol, shared browsing rules, per-site adapter docs
docs/sources/           one adapter doc per marketplace (URL patterns, extraction, gotchas)
profiles/example.yml    buyer profile template
examples/               anonymised sample output
searches/               YOUR searches (gitignored – personal data stays local)
```

## Quick start (about 5 minutes to your first shortlist)
**You need:** [Claude Code](https://claude.com/claude-code), the **Claude in Chrome** extension connected to Claude Code, and Chrome. Log in to any marketplace that needs it in your own Chrome (Facebook Marketplace does, and is optional). No API keys, no scraping servers.

1. **Get the skills** (pick one)
   - **As a plugin (works from any folder).** Inside Claude Code:
     ```
     /plugin marketplace add kancess/finding-things
     /plugin install finding-things@finding-things
     ```
   - **Or clone it:**
     ```bash
     git clone https://github.com/kancess/finding-things.git
     cd finding-things
     claude
     ```
     The skills in `skills/` load automatically (`.claude/skills` points at them).
2. **Say what you're after.** For example:
   > *Use find-anything to help me buy a washing machine. I'm in Perth, up to $900, front loader, household of four.*
   > *Use car-hunt to help me find a used car. I'm in Brisbane, budget up to $12k but happy to spend less, automatic only, mostly city commuting.*
3. **Answer a few questions** about what it must do, budget, location and deal-breakers. It proposes defaults so you can just say "yes".
4. **Check the category card and the source plan.** It shows what it learned about the category and where it plans to look, and asks you to **log in to any site that needs it** in your own Chrome (you can waive any source).
5. **Let it search**, then review the ranked shortlist, the all-in costs and the honest recommendation. If it hits a login, CAPTCHA or a decision only you can make, it stops, tells you exactly what it needs, keeps working on the rest, and resumes when you say done.
6. **Approve any seller message** word for word before it is sent. Nothing is sent without that.

Already have a listing or product page? Paste the link or text: *"Use car-vet-listing on this ad"* (cars: red flags and questions to ask) or *"Use car-cost to compare these three"*. This works without any browser automation.

### Different category? It still works
The generic flow does the research and finds the right sites for whatever you're buying and wherever you live. If you end up with a good process for a category, [turn it into a domain pack](domains/README.md) so the next person starts faster.

### Works outside Australia?
The search and vetting steps work anywhere. For cars, cost rules live in `data/jurisdictions/`; Victoria is verified, NSW is a draft. For any other place the agent researches official sources, drafts a file marked DRAFT with unverified figures flagged, and asks you to confirm the key numbers before trusting the totals. Contributions of verified jurisdictions are the most useful thing you can add (see `CONTRIBUTING.md`).

### What you get
A shortlist saved locally under `searches/` (gitignored, so personal data never gets committed): ranked cars with links, km, asking price, suggested opening offer, **all-in cost, 3-year net cost with resale, a car-or-no-car check**, red flags and next steps. Ask for the optional visual one-page HTML report if you want something shareable-looking, and keep it private if it contains your finances. See `examples/` for a sample.

### Updating
- **Plugin:** `/plugin marketplace update finding-things`, then update `finding-things` from the `/plugin` menu (or toggle auto-update there). Restart Claude Code if the new skills don't show up.
- **Clone:** `git pull` in the folder.
- Your searches in `searches/` are never touched by updates. After updating, re-check the `verified` date in your jurisdiction file, since fees change each financial year.

### Troubleshooting
- **"Can't see the browser" / tools missing:** install the Claude in Chrome extension, make sure Chrome is open and connected, then re-run.
- **A site shows a CAPTCHA, login or block page:** that's expected. Handle it in your own Chrome and tell the agent "done". It will not try to bypass it.
- **Few or odd results:** say which models or price band you expected; it can re-run narrower queries. Sites change their markup, so adapters in `docs/sources/` may need updating (PRs welcome).
- **Costs look off for your state/country:** check `data/jurisdictions/` and its `verified` date. Fees change each financial year.

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
- More domain packs (appliances, bikes, laptops, furniture, rentals…) contributed from real hunts.
- More jurisdictions (NSW, QLD, WA, SA, NZ, UK…) and sources (Autotrader, CarsGuide, dealer groups, auctions).
- Saved searches + alerts for new below-market listings.
- Per-model reliability notes with cited sources.
- A lightweight web UI on top of the same skills.
