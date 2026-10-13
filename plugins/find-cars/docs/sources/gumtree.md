# Source adapter: Gumtree (gumtree.com.au)

Mostly dealer stock (~85–90% in cars); private ads are fewer but include real finds.

**Access:** 403 to plain fetch; headless Playwright hangs. Use the user's Chrome.

## Search URL
`https://www.gumtree.com.au/s-cars-vans-utes/<city>/<make-model>/k0c18320l3001317?price=3000.00__10000.00&sort=price_asc`
(`l3001317` is Melbourne – other cities have other location codes; take it from the site's own URL.) "Cheapest" sort is unreliable, so search per model.

## Extracting rows (links work!)
Ad anchors are `a[href*="/web/listing/cars-vans-utes/"]` (not `/s-ad/`); card text is the anchor's `innerText`. Private ads are those without a "Dealer used / new / demo" line. Don't skip private sellers just because `get_page_text` shows no links.

## Detail page
`https://www.gumtree.com.au/web/listing/cars-vans-utes/<id>`; read the text after "Description", plus seller type, odometer, transmission, suburb.
Price labels: "Drive Away" includes government charges; "Excl. Gov. Charges" does not.
