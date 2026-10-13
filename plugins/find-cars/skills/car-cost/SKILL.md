---
name: car-cost
description: Compute the true all-in cost to buy and run a used car for the buyer's jurisdiction (duty, transfer, rego, inspection, insurance, fuel, servicing) and rank listings by it. Use when comparing cars by real cost rather than sticker price.
---

# All-in cost

Read the buyer's jurisdiction file `data/jurisdictions/<id>.md` (e.g. `au-vic.md`) for duty, transfer, rego, inspection, warranty and process rules. If none exists, research official sources, say figures are unverified, and offer to create the file. **Re-verify fees each financial year.**

## Formula
```
year1 = price + duty + transfer + inspection + history_check
      + rego(12 mo) + insurance + fuel(km/yr × L/100km × price/L) + servicing + contingency
```
- Contingency ≈ 5–7% of price or ≥ $500 for 10+ year-old cars (tyres, battery, brakes).
- Adjust for **rego/roadworthy left**: remaining rego is value inherited; no roadworthy or expired rego adds those costs.
- "Excl. govt charges" prices exclude duty/transfer; "drive away" prices include them (dealers).
- Fuel uses the claimed combined L/100km (real-world is higher) and the current local price.
- Insurance: get actual quotes; older cars are usually insured on market value; third party options are cheaper.

## Rank by
1. year-1 all-in cost,  2. km and age (remaining life),  3. condition/service evidence,  4. seller risk and scam flags.
A cheaper car that needs roadworthy + repairs can cost more than a pricier clean one. A dealer premium is only worth it for a **real** warranty – check the jurisdiction file for when the statutory warranty applies.

## Go beyond year 1: the 3-year cost of owning (do this for the final shortlist)
Year-1 cost hides the biggest item: **what the car loses in value**. A $5k car and a $15k car can cost about the same to own once resale is counted, and the cheap one is often *worse* (high km, more repairs, little resale). Always show both.

```
net_3yr = price + fees                       # duty, transfer, inspection, any overdue servicing
        + 3 × (fuel + insurance + upkeep + residual_rides)
        + rego_not_already_paid
        − resale_after_3_years  (minus selling costs)
per_month = net_3yr / 36
```
- **Resale (measure it, don't guess).** From the listings you already collected, estimate the yearly loss per model: fit `ln(price)` on age, km (per 10k) and a dealer flag, or use the **twin method** (same model 3 years older with ~30k more km; the price gap is 3 years of loss). Prefer a valuation tool or a published guide as a cross-check. If a model has fewer than ~10 listings, assume 10–12% a year, **say it is thin**, and show what 15% and 20% would do.
- **Upkeep** (servicing, tyres, brakes, battery, small repairs): about $650–1,000 a year for ordinary cars, $1,200–1,500+ for 12-year-old or high-km cars. It does **not** cover a gearbox or engine failure; say so. Treat CVT and dual-clutch gearboxes as a risk unless there is fluid-service history.
- **Fuel** from claimed L/100km × ~1.10 real-world × local price. **Insurance**: use real quotes; until then ≈ a base plus ~2.5% of the car's price a year, flagged as an estimate.
- **Residual rides**: taxi/rideshare/car-share you'd still use even with a car.
- **Uncertainty**: give a range. Estimates usually carry about ±$1,500–2,000 over 3 years, so if candidates differ by less than that, **say condition and service history decide it, not the model**.

## Do they need a car at all? (ask before recommending one)
Compare the car's all-in monthly cost with their real alternative: rideshare + car-share + transit for daily use, plus a rental or car-share for occasional trips. Use their actual spending if they share it (summaries only; never copy account details). Compute the **break-even number of trips a month**. Include **parking** at home and work: it can exceed all other running costs, and it is the most often forgotten line. Mention what the numbers leave out (convenience, a child, mobility).

## Cash vs car
If the buyer would otherwise keep the money in savings, show the opportunity cost: the amount not tied up in a car earns interest at their rate (for example $1,000 at 5.5% ≈ $174 over 3 years, before tax). Never let a cheap car's low price hide a high running cost, or the reverse.

State assumptions and unverified inputs in the output. Not financial advice.
