# Source adapter: Facebook Marketplace

Read-only. Requires the user to be **logged in to Facebook in their own Chrome**. Never log in for them, never message sellers unless explicitly told.

## Search URL
Use the search path (the `/vehicles` path ignores `query`):
`https://www.facebook.com/marketplace/<city>/search?query=<model>&minPrice=4000&maxPrice=10000&sortBy=price_ascend&exact=false&category_id=vehicles`

## Extracting
- Cards show only price / title / suburb (no km, no transmission); ~24 ads load per search. Filter by model + year in JS (`a[href*="/marketplace/item/"]`, id = `pathname.split('/')[3]`).
- Open promising ads (`/marketplace/item/<id>/`) and read "Driven N km", transmission, "N owners", description. `find` ("kilometres driven, transmission, owners") is compact.
- Running JS immediately after `navigate` fails ("different extension"): put a `get_page_text` or `find` step between, or run JS as a separate call.

## Red flags seen
No rego/RWC "sold as is", wrong specs (e.g. "0.3 L" engine), seller names that look like trader/parts businesses, ads 12+ weeks old, implausibly low km for the age.
