# Domain packs

The workflow (interview, research, find sources, sweep (asking for a login only when a site needs one), vet, cost, shortlist, approved messages) is the same for any category. A **domain pack** captures what is specific to one category so the next person doesn't repeat the research.

| Domain | Status | Entry point |
|---|---|---|
| Used cars (plugin `find-cars`) | mapped, tested on a real search | skill `car-hunt` |
| Anything else | no pack needed to start | skill `find-anything` |

## Looking for something that has no pack?
Just ask: *"Use find-anything to help me buy a washing machine."* The agent will:
1. interview you (what it must do, budget ceiling and ideal spend, new or used, delivery);
2. **research the category** (what matters, price ranges, problem models, hidden costs, local consumer rules) and show you a card to correct;
3. **work out where to look** in your location. Washing machines mean appliance retailers, outlet and ex-display stores, refurbishers, local classifieds and independent test sites, nothing like the car sites;
4. **try each source without a login**, and ask you only when one blocks the search or a step (messaging, bidding) needs an account, saying what to do in your own Chrome. It never types your credentials or creates accounts, and you can waive any source;
5. sweep, vet, work out the all-in cost over the thing's life (price, delivery and installation, running costs, repair risk, minus resale), and give you a ranked shortlist.

*(The washing-machine walk-through above is illustrative: it shows how the flow adapts. It is not a mapped, tested pack.)*

## Turn what you learned into a pack
When a hunt works, copy [`_template.md`](_template.md) into a new plugin folder `plugins/find-<thing>/` (as its `README.md`, next to its skills and any adapter docs), fill it in from your `SOURCES.md` and shortlist, list it in `.claude-plugin/marketplace.json`, and open a PR (see `CONTRIBUTING.md`). Keep it free of personal data (no names, budgets, addresses, listings that identify a seller). A good pack makes the next hunt faster and better: sources with search patterns, what to check, red flags, and the cost model.
