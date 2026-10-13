# Source adapter: Carsales (carsales.com.au)

Best source in Australia: many private sellers, price-vs-market tags, stable detail URLs.

**Access:** plain HTTP fetch and headless browsers get blocked (403). Works through the user's own Chrome (Claude in Chrome extension) with `get_page_text` / `javascript_tool`.

## Search URL
```
https://www.carsales.com.au/cars/?q=(And.Service.Carsales._.State.<State>._.Make.<Make>._.Model.<Model>._.Price.range(<min>..<max>)._.Odometer.range(..<maxKm>).)&sort=~Price
```
- `State.Victoria`, `State.New%20South%20Wales` (URL-encode spaces).
- Model tokens are not always the marketing name: Mazda `2`/`3`, Toyota `Yaris`/`Corolla`, Hyundai `i30`, Suzuki `Swift`, Honda `Jazz`.
- `Odometer.range(..N)` works on its own. Adding `Transmission.Automatic` returned 0 results – filter transmission after extraction (or use `GenericGearType.Automatic`, which works).
- Price-vs-market filter: `PriceIndicator.Low` (the "GREAT PRICE" tag). It only means cheap *for that model*; combine with km/age filters.
- Page size 24; `&offset=` does **not** paginate. **Paging is in-page and stateful:** clicking "Next" via a real click (or `button.click()` in `javascript_tool`, then wait ~3 s) works; the URL gains a session id. Extraction functions defined on the page persist across pages, so you can loop 2–3 pages per query. Keep to the polite-use caps.
- **Use it to avoid missing cars.** Sorting cheapest-first only shows the cheapest 24 per query. Narrow with more filters instead of widening pages: `Make.<Make>`, `Year.range(2015..)` (works), `Odometer.range(..70000)`, `PriceIndicator.Low` (the "GREAT PRICE" tag), `GenericGearType.Automatic`. Check the "Page 1 of N" counter to see how many results exist (e.g. 557 automatics under 150k km at $5–9k in Victoria).
- Seller-supplied "Warranty" text (e.g. "7yr", "5yr") is the make's warranty from first registration, not necessarily still valid or transferable – check dates.
- A registration expiry shown as a bare past month (e.g. "June 2026") means it has **expired**; live ones show "N months/Month YYYY".
- `GenericGearType.Automatic` is a working transmission filter (0 manuals returned) – prefer it over `Transmission.Automatic`.
- **Results can exceed your price/km cap.** With few exact matches the page appended listings above the cap (e.g. a $6,000 cap showed cars up to $9,250). Always re-filter extracted rows by your own price/km limits.
- The "Roadworthy certificate" field is a Victorian-style field; "No" can be normal for other states (see the jurisdiction file).

## Extracting rows
Walk up from each `a[href*="/cars/details/"]` until the text contains " km"; parse year, price, km, `Private|Dealer`, price tag (GREAT/GOOD/FAIR/HIGH), transmission, ID. Return compact lines (the JS tool blocks output that looks like query strings: avoid `&`, `?`, full hrefs, `document.title`).

## Detail page
`https://www.carsales.com.au/cars/details/x/<ID>/` (private IDs `SSE-AD-…`, dealer IDs `OAG-AD-…`) works with any slug. Read: "Comments from the seller", Odometer, Registration expiry, Build date, Compliance date (watch mismatches), Roadworthy certificate, price tag, Private/Dealer. The `find` tool is a compact way to read these.

## Contacting a seller (only with explicit user approval)
The page's "Get in touch" form pre-fills from the user's Carsales account. Expand "Edit your contact details" and check the name field (it can contain the phone number). Untick optional survey boxes. Never include offers or urgency unless the user asks.
