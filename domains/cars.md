# Domain pack: used cars   (status: tested on a real Melbourne search)

The first mapped domain, and the one the project grew out of. Entry point: skill **`car-hunt`**, which uses `car-sweep`, `car-vet-listing` and `car-cost`.

- **Sources:** Carsales, Gumtree, Facebook Marketplace (opt-in), Autotrader AU. Adapters in `docs/sources/`; any other site works generically.
- **Cost model:** year-1 all-in cost, then 3-year net cost including measured resale, upkeep, and a "do you need a car at all" check (`car-cost`).
- **Jurisdiction rules as data:** `data/jurisdictions/` (Victoria verified, NSW draft). Other places get a drafted file that the human confirms.
- **Vetting:** `car-vet-listing`: red flags, scam patterns, questions, history check (PPSR in Australia) and independent inspection.
- **Handoff points:** Facebook login, CAPTCHAs and rate limits, novice-driver variant checks, insurance quotes. See `docs/collaboration.md`.
- **Example:** `examples/melbourne-2026-10.md`.
