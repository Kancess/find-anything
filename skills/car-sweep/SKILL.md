---
name: car-sweep
description: Sweep used-car marketplaces (Carsales, Gumtree, Facebook Marketplace, more via adapters) through the user's real Chrome for cars matching a buyer profile. Use when asked to search, refresh, or re-run a car hunt.
---

# Car sweep

Input: a buyer profile (`searches/<…>/profile.yml` or the conversation). Output: a compact candidate list (year, model, price, km, seller type, price tag, listing ID/link) per source.

## Tooling rules (learned the hard way)
- Marketplaces block plain HTTP fetch (403) and headless browsers. Use **Claude in Chrome** (the user's own Chrome). Load tools in one ToolSearch: `tabs_context_mcp, navigate, get_page_text, find, javascript_tool, browser_batch`. Work in a new tab; close it when done.
- `javascript_tool` blocks output that looks like query-string/cookie data: never return `document.title`, full URLs with `?`/`&`, or raw hrefs; return compact lines.
- JS right after `navigate` can fail on some sites ("different extension"): insert `get_page_text`/`find`, or run it as a separate call.
- Never log in, type passwords, or send messages. If a site shows a login wall, ask the user to log in in Chrome.

## Polite-use rules (always)
- **Sequential and light:** one page at a time, with natural pauses; no parallel hammering; a handful of narrow queries per source, top results only (roughly ≤ 10 search pages and ≤ 15 detail pages per source per run). Prefer tighter filters over crawling more pages.
- **No bulk collection:** don't enumerate whole categories, don't loop over thousands of listings, don't store listing data beyond the user's shortlist and a few notes.
- **Stop when pushed back:** if you hit a CAPTCHA, bot check, rate limit, block page, or login wall, stop that source, tell the user, and don't try to bypass it.
- **Read-only:** never log in, post, message sellers, or submit forms unless the user approves the exact action (see `car-hunt` hard rules).
- **Terms awareness:** sites may restrict automated access; the user is responsible for that choice. Facebook Marketplace is opt-in only – use it only if the user explicitly asks.

## Sources: any site, adapters optional
The sweep is **not limited to a fixed list of sites**. Default flow: use web search to find where cars matching the profile are listed (classifieds, aggregators, dealer groups, auction/fleet sellers, manufacturer certified-used programs, forums), then read those pages through the user's Chrome. Site adapters in `docs/sources/` are only *shortcuts* for sites we've already mapped (URL patterns, extraction, gotchas); for any other site, read the page generically (`get_page_text` / `find`), work out its search filters, and note what worked so it can become a new adapter. Respect the polite-use rules on every site and say which sources were and weren't covered.

## Known adapters
One adapter doc per marketplace in `docs/sources/` (URL patterns, extraction snippets, gotchas): `carsales.md`, `gumtree.md`, `facebook-marketplace.md`. Read the adapter before searching that site. To add a source, copy an adapter doc and fill it in.

## Method
1. Pick models: reliable, cheap to run, plentiful (e.g. Mazda 2/3, Toyota Yaris/Corolla, Hyundai i30, Suzuki Swift, Honda Jazz, Kia, Holden Barina…), adjusted to the buyer's use and market. Don't anchor on one brand – include alternatives and say which makes were not covered.
2. Search each model per source with price, km and state filters. If a page returns the full page (24), narrow price bands rather than paginating.
3. Look at **two price bands**: the ideal-spend band and the full-budget band, so the buyer sees what extra money buys.
4. Use "below market" tags as a lens, not a verdict – they mean cheap *for that model*.
5. Avoid known problem transmissions/engines for the market (verify per model before excluding or including).
6. Return candidates; hand the top ones to `car-vet-listing`.
