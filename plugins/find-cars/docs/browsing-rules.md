# Browsing rules (apply to every domain, every site)

## Tooling (learned the hard way)
- Many marketplaces and shops block plain HTTP fetch (403) and headless browsers. Use **Claude in Chrome** (the user's own Chrome). Load the tools in one ToolSearch: `tabs_context_mcp, navigate, get_page_text, find, javascript_tool, browser_batch`. Work in a new tab; close it when done.
- `javascript_tool` blocks output that looks like query-string or cookie data: never return `document.title`, full URLs with `?`/`&`, or raw hrefs; return compact lines.
- JS right after `navigate` can fail on some sites ("different extension"): insert `get_page_text` or `find`, or run it as a separate call.
- If a page loads but shows no results, try `get_page_text` before concluding it is empty. Filters in the URL often need a different syntax from what the UI shows; read the site's own filter UI to learn it.
- Paging by URL parameter sometimes does nothing; click the site's "Next" control instead.

## Polite use
- **Sequential and light:** one page at a time with natural pauses; a handful of narrow queries per source and the top results only (roughly at most 10 search pages and 15 detail pages per source per run). Prefer tighter filters over crawling more pages.
- **No bulk collection:** don't enumerate whole categories, loop over thousands of items, or store data beyond the user's shortlist and a few notes.
- **Read-only:** never log in, post, message, add to cart, or submit forms unless the user approves the exact action.
- **Terms awareness:** sites may restrict automated access; the user is responsible for that choice. Sites with strict terms (for example social networks) are **opt-in only**: use them only if the user explicitly asks.

## Login, CAPTCHA, blocks: ask, never skip, never bypass
If a site shows a login wall, CAPTCHA, bot check, 2FA, rate limit, block page, paywall or consent prompt, stop that source and hand off to the human using `docs/collaboration.md` (Blocked / I need / Why / Then / Meanwhile). The agent never enters credentials, creates accounts, solves CAPTCHAs, or works around a block. It keeps working on other sources, and the source is not "done" until the blocker is cleared or the user explicitly waives it. Every handoff goes in the final report.
