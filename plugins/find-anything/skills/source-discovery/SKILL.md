---
name: source-discovery
description: Work out WHERE to look for a thing (any product, used or new) by researching the category first, then ask the human for any logins or access before searching. Use at the start of any find-anything hunt, or whenever the sources for a category aren't already mapped (washing machines, bikes, laptops, furniture, camera gear, anything).
---

# Source discovery: research first, then ask for access

Nothing is assumed about *where* a thing is sold. Cars have Carsales and Gumtree; washing machines have appliance retailers, outlet and refurbished stores, local classifieds and review sites; a second-hand bike has community workshops and local shops; a vintage guitar has none of those. So before any sweep, find out.

## 1. Research the category (briefly, with sources)
Use web search. Produce a short **category card** for the human to confirm. Don't use a fixed checklist: derive each item *for this category* by asking what experts, testers and owners say, and what typically goes wrong or surprises buyers.
- **What matters**: the features that actually predict satisfaction or reliability (not marketing numbers), and which are deal-breakers for *this* buyer.
- **What depends on the buyer's own situation** (their home or setup, existing equipment, space, body size or skills, budget for running costs, local standards, how long they'll keep it, whether they can inspect in person). These become **questions for the interview**, not assumptions.
- **Where the risk sits.** Sometimes it is the model (known faults, recalls); sometimes the individual item (wear, damage, stolen goods, hidden history); sometimes the seller or the fit. Say which applies, so vetting looks in the right place.
- **How a used or remote purchase can be verified**: what can be checked before paying (in person, on video, from records or registers) and what can't. This list is carried into the vetting step.
- **Typical prices**: new vs used vs refurbished vs ex-display, and what extra money buys. If no used-price guide exists, say so, use new prices and a typical discount, and mark the used range **unverified until the sweep**.
- **Hidden costs**: delivery, installation, consumables, running costs, repairs or warranty, accessories, disposal of the old one, resale.
- **Local rules**: consumer guarantees and return rights (**these often depend on seller type: business vs private**, so say which sources carry them and which don't), safety, registration or import limits.

**Weigh the evidence.** Independent tests and regulators count most, then manufacturer data, then large review sites with many owners; a single blog or forum post is an anecdote. Mark each claim with its source and whether it is thin, and never present search snippets as verified. Search tools can be thin or skewed to other regions for local queries: when results are poor, say so and list what is still unconfirmed.

**Close the loop with the human:** turn the card's "depends on your situation" items into a few concrete questions (only the ones that would change the shortlist), fold the answers into `profile.yml`, and let them correct the card before spending effort searching.

## 2. Find the sources
Search for where this category is actually bought **in the buyer's location**. Cast wide, then rank *provisionally* (expected pool size, relevance, access, trust), and say the ranking is provisional until a sweep proves it:
- Classifieds and marketplaces (general and category-specific)
- Retailers and manufacturers' outlet, refurbished or "ex-display" stores
- Auctions, liquidators, trade-in and certified-used programs
- Specialist forums, clubs, community groups, review sites, price-comparison sites
- Local shops, dealers and community workshops (phone or visit only; don't contact without approval)
Separately list **verification aids that aren't sources**: recall databases, stolen-goods or ownership registers, history checks, price guides. For each, say whether it covers the buyer's region.

Before listing an in-person or small source as usable, **open its domain** to check it still exists (a market's site that now redirects to a news site is stale). Say which sources came from this session's research and which from general knowledge; the latter must be **confirmed** (does it still exist, serve the buyer's country, sell this) and are marked `unconfirmed`. For each candidate record: what it sells, **its role** (seller, information only, or verification), how to search it (filters, URL pattern), whether results are visible without logging in, and any restrictions in its terms. If a domain pack with site adapter docs is installed (for example `find-cars`), read its adapter for a site you're about to search and use it as a shortcut.

## 3. Access check: ask for logins before the sweep, not in the middle of it
Show the human a short plan and **ask**:

| Source | Role | Why it's worth it | Access needed | What I need from you | Status |
|---|---|---|---|---|---|
| (example) Large marketplace | seller | most private sellers list here | login wall | log in in your own Chrome, then say "done" | needs you |
| (example) Review site | information | independent test results | paywall | log in if you have an account, or tell me to skip it | needs you |
| (example) Local shop | seller | tested stock with a warranty | none; phone or visit | approve a call or visit, or make it yourself | needs you |

"Access needed" covers logins, paywalls, **and your approval to contact someone**. Statuses: `not asked`, `needs you`, `done`, `waived`, `blocked`, `unconfirmed` (may not exist or serve the region).

Rules:
- The human logs in, does 2FA, and solves CAPTCHAs in **their own Chrome**. The agent never types credentials, **never creates accounts**, never accepts terms or consent prompts for them, and never works around a paywall or block.
- Sites with strict terms of automated access (social networks especially) are **opt-in**: ask, don't assume.
- Let the human **waive** a source explicitly ("skip that one"); record it. A source is never silently skipped.
- Start on the sources that need nothing while the human sorts out the others. Resume the blocked ones when they say "done", after re-checking the page really loads logged in.
- Follow `docs/collaboration.md` for the handoff format and `docs/browsing-rules.md` for polite use.

**Unattended or non-interactive run** (nobody to answer): don't stall and don't invent answers. Do this instead:
1. Proceed on **explicit assumptions** only where the request itself implies them or a reasonable default exists (for example a size from a stated height, or ex-display counts as "new"). Write each assumption down next to the open question it stands in for, and label it as an assumption.
2. Mark everything that needs the human `needs you`, and put a **"Needs you:"** list at the top of `SOURCES.md`.
3. Carry on with every source that needs nothing, and stop short of anything that requires the human's answer (contacting anyone, logins, opt-ins, purchases).
4. Never report the hunt as complete with open questions.

## 4. Output
Write `searches/<YYYY-MM>-<thing>/SOURCES.md` (relative to where the user is working; the folder is gitignored if it is inside this repo): the category card, **the verification checklist for used or remote purchases**, the ranked source list with roles and how each is searched, the verification aids, the access table with statuses, and what was **not** covered and why. If a new source worked, note its URL pattern and gotchas so it can become an adapter doc in a domain pack.
