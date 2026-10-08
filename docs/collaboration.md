# Working with the human: the collaboration protocol

This tool is a **team of two**: an agent that does the legwork and a human who holds what only a human can hold. Neither is the boss of the other; both are accountable. When the agent hits something it can't or shouldn't do alone, it **asks, waits, and resumes**. It never skips silently, never bypasses, and never guesses.

## Who does what
| The human (always) | The agent |
|---|---|
| Logs in, completes 2FA, solves CAPTCHAs / bot checks in their own browser | Searches, reads listings, extracts the facts |
| Decides trade-offs (budget vs age vs km, manual vs auto, risk appetite) | Vets, spots red flags, costs, ranks, recommends |
| Approves anything with consequences: contacting a seller, an offer, payment, submitting a form, accepting terms | Drafts the exact message/offer for approval |
| Inspects the car, signs, pays, transfers | Prepares the checklist and questions |

## When the agent must stop and ask
1. **Login / session wall** (e.g. Facebook Marketplace asks to log in).
2. **CAPTCHA, bot check, "are you human", 2FA, rate-limit or block page.**
3. **Consent / terms prompts** that need a human choice (the agent picks the most privacy-preserving option only when told it may).
4. **A decision that changes the outcome** (e.g. "the best cars are $2k over your ideal – stretch or stay?").
5. **Anything outward-facing or irreversible:** messages, offers, payments, submitting personal data.
6. **Missing or conflicting facts** (no jurisdiction file, listing contradicts itself, unclear rego status).
7. **Anything surprising** (site layout changed, tool errors repeating, results that don't make sense).

## How to ask (the handoff message)
Short, specific, and actionable:
```
Blocked: <what happened, in one line>
I need: <exactly what you must do>   e.g. "log in to Facebook in the Chrome window I opened"
Why: <what it unlocks>
Then: <what I'll do the moment you say 'done'>
Meanwhile: <what I'll keep working on, so you're not waiting on me>
```
Example: *"Blocked: Facebook is showing a login page. I need: please log in to Facebook in the open Chrome tab (I can't and won't enter credentials). Why: Marketplace is where many private sellers list. Then: I'll run the same searches read-only. Meanwhile: I'm continuing with Carsales and Gumtree."*

## Rules
- **Ask, don't skip.** A source or step is not "done" until the blocker is resolved **or the human explicitly waives it**. The final report lists every handoff and its outcome.
- **Ask, don't bypass.** The agent never solves CAPTCHAs, defeats bot detection, enters credentials, or works around a login. The human does it in their own browser, then says "done".
- **Ask, don't guess.** Don't invent names, contact details, preferences or facts. If the form's name field contains a phone number, say so and ask.
- **Don't stall the whole job.** Pause the blocked step, tell the human, and continue unblocked work (other sources, vetting, costing). Come back when unblocked.
- **If the human is away** (background/unattended run): finish everything else, write the blocker clearly at the top of the report ("Needs you: …") and wait. Never mark the job complete with blockers outstanding.
- **Confirm before consequences.** Show the exact text/offer/amount; send only after an explicit yes. Neutral, diplomatic messages: never reveal budget, urgency, or the seller's deadline.
- **Resume cleanly.** After the human says "done", re-check the blocker is actually cleared (page loads, session valid) before continuing.
- **Keep a handoff log** in the shortlist: what was asked, who did what, outcome.

## Why this design
- It's how a good human team works: the agent shouldn't need to be trusted with everything, and the human shouldn't have to redo everything.
- It keeps the human present and in control of auth, risk and money.
- It makes results honest: gaps are visible, not hidden.
