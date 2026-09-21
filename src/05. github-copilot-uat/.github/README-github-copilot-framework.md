# GitHub Copilot Framework for Business Central AL

## Layers

```text
Repository Instructions = project-wide governance
Custom Agents = role ownership and native handoffs
Scoped Instructions = contextual rules
Agent Skills = reusable specialist workflows
Prompt Files = current user entry points
Persistent Plans = version-controlled execution state
Official AL tools = verified build/symbol/diagnostic/debug capabilities
Human Review = approval and accountability
```

## Feature flow

```text
Requirement document or text
-> Functional Analysis
-> Solution Design
-> Technical Design
-> Persistent Implementation Planning
-> Human Plan Review
-> AL Development
-> QA Testing
-> Independent Solution Review
-> Human Acceptance
```

## Issue flow

```text
Issue document or text
-> Evidence-first Diagnosis
-> Functional/Solution/Technical Architecture when required
-> Persistent Fix Planning after verified root cause
-> Human Plan Review
-> AL Development
-> QA Testing
-> Independent Solution Review
-> Human Acceptance
```

## Resume rule

The active `.plan.md` file is the execution state across sessions. A new session reads the plan, references, evidence, blockers, and Resume Contract before editing code. It continues from the first eligible incomplete approved step and updates the plan after each meaningful increment.

## Human gates

AI does not approve plans, production, migrations, permission expansion, security boundaries, public contract changes, financial behavior, destructive changes, commits, or merges.
