---
name: bc-official-source-verification
description: "Use when verifying Business Central AL APIs, symbols, properties, events, object behavior, runtime compatibility, or Microsoft documentation before generating an answer or code."
user-invocable: true
---

# Business Central Official Source Verification

1. Read `app.json` and establish runtime, application version, target, and dependencies.
2. Identify the exact object/API/property/event/signature being discussed.
3. Check current AL symbols when available.
4. Check the matching Microsoft Learn or official provider documentation.
5. Separate verified facts, assumptions, and unavailable evidence.
6. Reject invented APIs, signatures, events, properties, object names, and dependencies.
7. Report compatibility risk when documentation or symbols target a different version.

Output only the decision-critical evidence and source references. If verification cannot be completed, state the limitation and provide a conditional recommendation rather than presenting uncertain code as valid.
