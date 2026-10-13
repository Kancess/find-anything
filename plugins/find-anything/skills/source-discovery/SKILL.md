---
name: source-discovery
description: Work out WHERE to look for a thing (any product, used or new) by researching the category first, then ask the human for any logins or access before searching. Use at the start of any find-anything hunt, or whenever the sources for a category aren't already mapped (washing machines, bikes, laptops, furniture, camera gear, anything).
---

# Source discovery: research first, then ask for access

Nothing is assumed about *where* a thing is sold. Cars have Carsales and Gumtree; washing machines have appliance retailers, outlet and refurbished stores, local classifieds, and review sites; a vintage guitar has none of those. So before any sweep, find out.

## 1. Research the category (briefly, with sources)
Use web search. Produce a short **category card** for the human to confirm:
- **What matters** for this thing: the specs and features that actually predict satisfaction or reliability (not marketing numbers), and which ones are deal-breakers for *this* buyer. Include **efficiency or running-cost ratings** and **compatibility and installation** (fit, plumbing, power, software, standards) where they apply.
- **Can it be tested before buying?** For used items, what the buyer should check in person or on a video call (power it on, run a cycle, check wear), and what can't be checked.
- **Typical price ranges**: new vs used vs refurbished vs ex-display, and what extra money buys.
- **Known problem areas**: models, brands, ages or failure modes to avoid; recalls. Cite where each claim came from, and mark thin evidence as thin.
- **Hidden costs**: delivery, installation, consumables, running costs (energy, water, fuel), warranty, disposal of the old one, resale.
- **Local rules**: consumer guarantees, warranty and return rights, safety or registration requirements, import limits.
**Weigh the evidence.** Independent tests and regulators count most, then manufacturer data, then large review sites with many owners; a single blog or forum post is an anecdote. Mark each claim with its source and whether it is thin, and never present search snippets as verified.
Ask the human to correct the card before spending effort searching.

## 2. Find the sources
Search for where this category is actually bought **in the buyer's location**. Cast wide, then rank:
- Classifieds and marketplaces (general and category-specific)
- Retailers and manufacturers' outlet, refurbished or "ex-display" stores
- Auctions, liquidators, trade-in and certified-used programs
- Specialist forums, clubs, community groups, review sites, price-comparison sites
- Local shops and dealers (note phone or visit only; don't contact without approval)
Say which sources came from this session's research and which from general knowledge; the latter must be **confirmed** (does the site exist in the buyer's country, does it sell this) before use. For each candidate source record: what it sells, how to search it (filters, URL pattern), whether results are visible without logging in, and any restrictions in its terms. If a domain pack with site adapter docs is installed (for example `find-cars`), read its adapter for a site you're about to search and use it as a shortcut.

## 3. Access check: ask for logins before the sweep, not in the middle of it
Show the human a short plan and **ask**:

| Source | Why it's worth it | Login / access needed? | What I need from you |
|---|---|---|---|
| (example) Large marketplace | most private sellers list here | login wall | log in in your own Chrome, then say "done" |
| (example) Review site | independent test results | paywall / subscription | log in if you have an account, or tell me to skip it |

Rules:
- The human logs in, does 2FA, and solves CAPTCHAs in **their own Chrome**. The agent never types credentials, **never creates accounts**, never accepts terms or consent prompts for them, and never works around a paywall or block.
- Sites with strict terms of automated access (social networks especially) are **opt-in**: ask, don't assume.
- Let the human **waive** a source explicitly ("skip that one"); record it. A source is never silently skipped.
- Start on the sources that need nothing while the human sorts out the others. Resume the blocked ones when they say "done", after re-checking the page really loads logged in.
- Follow `docs/collaboration.md` for the handoff format and `docs/browsing-rules.md` for polite use.

**Unattended or non-interactive run** (nobody to answer): don't stall and don't guess. Fill the access table with status **`needs you`** (not "pending"), put a **"Needs you:"** list at the top of `SOURCES.md`, carry on with every source that needs nothing, and stop short of anything that requires the human's answer. Use the statuses `not asked`, `needs you`, `done`, `waived`, `blocked`.

## 4. Output
Write `searches/<YYYY-MM>-<thing>/SOURCES.md`: the category card, the ranked source list with how each is searched, the access table with outcomes (done / waived / blocked), and what was **not** covered and why. If a new source worked, note its URL pattern and gotchas so it can become an adapter doc in a domain pack.
