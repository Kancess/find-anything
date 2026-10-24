# Browsing rules (apply to every domain, every site)

## Tooling (learned the hard way)
- Many marketplaces and shops block plain HTTP fetch (403) and headless browsers. Use **Claude in Chrome** (the user's own Chrome). Load the tools in one ToolSearch: `tabs_context_mcp, navigate, get_page_text, find, javascript_tool, browser_batch`. Work in a new tab; close it when done.
- `javascript_tool` blocks output that looks like query-string or cookie data: never return `document.title`, full URLs with `?`/`&`, or raw hrefs; return compact lines.
- JS right after `navigate` can fail on some sites ("different extension"): insert `get_page_text` or `find`, or run it as a separate call.
- If a page loads but shows no results, try `get_page_text` before concluding it is empty. Filters in the URL often need a different syntax from what the UI shows; read the site's own filter UI to learn it.
- **Some listing descriptions are hidden from text extraction** (eBay puts the seller's description in an iframe). `get_page_text` shows the title, price and item specifics but not the description, which is where "screen cracked", "powers on" or "locked" appears. Scroll the description into view (`document.querySelector('#desc_ifr').scrollIntoView()`), wait a moment, and read it from a screenshot or zoom. Check this before shortlisting a used or faulty item.
- Auctions: note the end time and the bid count when you record a candidate; the current price is not the final price.
- Paging by URL parameter sometimes does nothing; click the site's "Next" control instead.
- **Don't guess a site's URLs: not category, filter or search-results URLs either.** A wrong category code can silently return another category (a pram search once landed in "phone accessories"), and an invented search URL can land on a 404 page that looks like "no results". Type the query into the site's own search box, then use its "suggested categories" or filter links, and check the page's breadcrumb or heading says what you meant. Once you have seen a working results URL, reuse its pattern.
- **Look before you conclude.** Never report a source as empty, unreadable or blocked from page text alone. Take a screenshot first, and try the site's own search box. A 404 or error page is your mistake to fix, not a block, and a block is only a block when the page says so.
- **Long output gets truncated (about 1,000 characters).** Parse the page into compact lines in JavaScript (title | price | condition | place | age), filter to what matters, and read in chunks. You can read numeric listing IDs from links (but not full URLs with query strings) and open detail pages directly by ID.
- `navigate` with "back" can fail after a script-driven click; navigate to the URL again instead.
- Search results sorted by lowest price are mostly accessories and junk. Use the right category, a sensible price floor, and relevance order.
- A source found through web search may be stale: open its domain and note if it redirects somewhere unrelated or looks abandoned, and mark it `unconfirmed` or defunct.

## Polite use
- **Sequential and light:** one page at a time with natural pauses; a handful of narrow queries per source and the top results only (roughly at most 10 search pages and 15 detail pages per source per run). Prefer tighter filters over crawling more pages.
- **No bulk collection:** don't enumerate whole categories, loop over thousands of items, or store data beyond the user's shortlist and a few notes.
- **Read-only:** never log in, post, message, add to cart, or submit forms unless the user approves the exact action.
- **Terms awareness:** sites may restrict automated access; the user is responsible for that choice. Sites with strict terms (for example social networks) are **opt-in only**: use them only if the user explicitly asks.

## Login, CAPTCHA, blocks: ask when needed, never skip, never bypass
**Try without a login first.** Many sites show everything you need to a signed-out visitor. Ask for a login only when the site actually blocks the search, or when a later step needs one (sending a message, bidding, making an offer, seeing a hidden price). Don't ask in advance for logins you may never need. When you do ask, say which site, why, and what you tried first.

If a site shows a login wall, CAPTCHA, bot check, 2FA, rate limit, block page, paywall or consent prompt, stop that source and hand off to the human using `docs/collaboration.md` (Blocked / I need / Why / Then / Meanwhile). The agent never enters credentials, creates accounts, solves CAPTCHAs, or works around a block. It keeps working on other sources, and the source is not "done" until the blocker is cleared or the user explicitly waives it. Every handoff goes in the final report.
