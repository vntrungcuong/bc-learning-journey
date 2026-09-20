# Agent Handoff Configuration

## Feature flow

```text
functional-solution-analyst
  -> solution-architect
  -> technical-architect
  -> implementation-planner
  -> HUMAN PLAN REVIEW
  -> al-developer
  -> al-test-engineer
  -> solution-reviewer
  -> HUMAN ACCEPTANCE
```

## Issue flow

```text
al-debugger
  -> functional-solution-analyst when functional/configuration gap
  -> solution-architect when solution architecture gap
  -> technical-architect when technical architecture gap
  -> implementation-planner after verified technical root cause
```

## Correction loops

```text
al-developer -> implementation-planner when blocked/material deviation
al-test-engineer -> al-developer for verified narrow defects
al-test-engineer -> implementation-planner for material coverage/design gaps
solution-reviewer -> al-developer for narrow corrections
solution-reviewer -> al-test-engineer for missing evidence
solution-reviewer -> implementation-planner for material changes
```

All handoffs use `send: false`. A button suggests the next controlled step; it does not approve the current stage.

`handoffs.agent` uses the target filename without `.agent.md`.
