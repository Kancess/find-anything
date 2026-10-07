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

State assumptions and unverified inputs in the output. Not financial advice.
