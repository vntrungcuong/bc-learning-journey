# Business Central Custom Agents

## Current agents

```text
Functional Consultant - Solution Analysis
Solution Architect - Solution Design
Technical Architect - Technical Design
Technical Architect - Implementation Planning
Technical Consultant - AL Development
Technical Consultant - Issue Diagnosis
Quality Assurance - AL Testing
Technical Architect - Solution Review
```

## Planning-aware feature flow

```text
Functional -> Solution -> Technical Design -> Persistent Plan
-> Human Plan Review -> Development -> Testing -> Solution Review
-> Human Acceptance
```

## Key rule

Technical Design defines what will be built. Implementation Planning defines how and in what order work will be executed. Development executes only approved eligible steps and updates the plan as the persistent session state.

See `AGENT-HANDOFFS.md` and `README-planning-layer.md` for routing and usage.
