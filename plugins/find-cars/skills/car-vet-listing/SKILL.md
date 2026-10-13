---
name: car-vet-listing
description: Vet a single used-car listing (any marketplace) – read the ad, spot red flags, list the questions to ask the seller and the checks to do before paying. Use when a user shares a listing or a shortlist car needs evaluating.
---

# Vet a listing

Read the listing (see `docs/sources/` for how to read each site). Capture: year/build date, km, owners, seller type (private/dealer), reason for sale, last service + history completeness, roadworthy status, rego expiry, damage disclosures, price tag vs market, location.

## Red flags
- "Incomplete/no service history", vague "minor damage", repainted panels, missing odometer/engine photos.
- Km implausibly low for the age without records (verify via service book, past roadworthy/rego readings, history report).
- Build date and compliance date disagreeing (possible re-compliance after repair/import), wrong specs, copy-pasted generic text.
- No current rego, or no **state-required inspection document** ("as is") – the buyer wears the inspection + repairs + rego. The document differs by state: check `data/jurisdictions/<id>.md` (Vic: roadworthy certificate, RWC; NSW: e-Safety Check "pink slip" with current rego). Marketplace fields like "Roadworthy certificate: No" are Victorian-style and may be normal elsewhere – don't flag blindly.
- Pressure for a deposit, off-platform payment, price far below market, "moving overseas" but no in-person viewing, seller identity that looks like a trader.
- Diesels on short urban trips (particulate filter issues), and transmissions with known problems in that market (verify per model).
- Recent ads 12+ weeks old on Marketplace (stale or sold).

## Good signs
Recent service with receipts, few owners, genuine reason to sell, roadworthy already issued, 6+ months rego, honest cosmetic disclosure, verified seller.

## Always do before paying (private sale)
1. Run the national vehicle history / finance check (Australia: PPSR) on the VIN.
2. Check registration status/history in the state registry.
3. See it in daylight, cold start, test drive incl. highway; check tyres, fluids, AC, warning lights.
4. **Independent pre-purchase inspection** – the real protection. Check the jurisdiction file (`data/jurisdictions/`) for what a dealer must/needn't warrant; cheap older cars usually have no statutory warranty.
5. Confirm the state's inspection document (RWC / e-Safety Check) is current and matches the car; pay only at handover/transfer or via the marketplace's protected payment.
6. **Novice drivers (learner/P-plate):** many states bar high-performance vehicles (NSW: power-to-weight over 130 kW/t and listed models). Hand off to the human to check the exact make/model/variant on the state's official prohibited-vehicle search before they buy.

## Questions to send the seller (neutral – never reveal budget or urgency)
Service history/receipts? Any accident or insurance claim? Roadworthy current/date? Reason for selling? Timing belt vs chain/when done? Tyres/brakes/battery age? Is a pre-purchase inspection okay? Offer messages only after viewing + inspection and only with the user's approval.
