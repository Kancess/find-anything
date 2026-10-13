# Source adapter: Autotrader Australia (autotrader.com.au) – lightly tested

Found by web search during a test run (no prior adapter); read with the user's Chrome via `get_page_text`. No block or CAPTCHA seen on one page.

- URL pattern: `https://www.autotrader.com.au/for-sale/used/<state>/<city>/under-$<price>` (e.g. `/nsw/sydney/under-$6000`).
- Output: ~25 listing blocks per page with price, km, year/model, dealer/private, suburb, transmission, body – **but no filter for transmission/body in this URL**, mostly dealer stock, and wordy (~5k tokens/page). Filter extracted rows yourself and keep to the polite-use caps.
- Prices are "Excl. Gov. Charges" or "Drive Away"; watch struck-through old prices (e.g. "$3,995 $4,995").
- Not yet tested: filters, pagination, detail pages, extraction by JS.
