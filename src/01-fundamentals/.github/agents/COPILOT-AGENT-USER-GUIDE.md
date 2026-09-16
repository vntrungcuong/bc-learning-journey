# GitHub Copilot Agent User Guide for Business Central AL Development

## Overview

                  AL DEVELOPMENT LIFECYCLE
                           │
           ┌───────────────┼────────────────┐
           │               │                │
        DESIGN         DELIVERY          ASSURANCE
           │               │                │
           ▼               ▼                ▼
     AL Architect     AL Developer      AL Reviewer
     (Custom)          (Custom)           (Custom)
                           │                │
                           │           AL Test Engineer
                           │           (Custom)
                           │           AL Security Reviewer
                           │           (Custom)
                           │           AL Performance Reviewer
                           │           (Custom)
                           │
                     TROUBLESHOOTING
                           │
                           ▼
                      AL Debugger (Custom)

## Details:

                     BUSINESS CENTRAL AL DEVELOPMENT LIFECYCLE
                                      │
                                      ▼
                              REQUIREMENT / TASK
                                      │
                                      ▼
                         ┌────────────────────────┐
                         │        DESIGN          │
                         └────────────────────────┘
                                      │
                                      ▼
                          AL Architect (Custom)
                                      │
                         Analyze requirements
                         Explore existing solution
                         Search symbols/dependencies
                         Identify extension points
                         Design technical solution
                         Assess architectural impact
                                      │
                                      ▼
                              APPROVED DESIGN
                                      │
                                      ▼
                         ┌────────────────────────┐
                         │       DELIVERY         │
                         └────────────────────────┘
                                      │
                                      ▼
                          AL Developer (Custom)
                                      │
                         Implement approved design
                         Create/extend AL objects
                         Follow project conventions
                         Reuse standard extensibility
                         Build and compile
                         Resolve straightforward
                         implementation errors
                                      │
                     ┌────────────────┴────────────────┐
                     │                                 │
                     ▼                                 ▼
              BUILD SUCCESSFUL                  UNKNOWN FAILURE
                     │                                 │
                     │                                 ▼
                     │                      ┌────────────────────────┐
                     │                      │   TROUBLESHOOTING      │
                     │                      └────────────────────────┘
                     │                                 │
                     │                                 ▼
                     │                       AL Debugger (Custom)
                     │                                 │
                     │                       Collect diagnostics
                     │                       Investigate code path
                     │                       Search symbols
                     │                       Isolate failure
                     │                       Identify root cause
                     │                                 │
                     │                                 ▼
                     │                         ROOT CAUSE FOUND
                     │                                 │
                     │                                 ▼
                     │                       AL Developer (Custom)
                     │                                 │
                     │                         Implement minimal fix
                     │                                 │
                     └─────────────────┬───────────────┘
                                       │
                                       ▼
                          ┌────────────────────────┐
                          │      VERIFICATION      │
                          └────────────────────────┘
                                       │
                                       ▼
                         AL Test Engineer (Custom)
                                       │
                           Define test scenarios
                           Positive-path testing
                           Negative-path testing
                           Boundary testing
                           Regression testing
                           Automated AL tests
                                       │
                                       ▼
                                TESTS PASSED
                                       │
                                       ▼
                          ┌────────────────────────┐
                          │       ASSURANCE        │
                          └────────────────────────┘
                                       │
                                       ▼
                            AL Reviewer (Custom)
                                       │
                         General implementation review
                         Correctness
                         AL best practices
                         Maintainability
                         Naming and structure
                         Extension safety
                         Upgrade impact
                         Analyzer findings
                                       │
                      ┌────────────────┴────────────────┐
                      │                                 │
                      ▼                                 ▼
              SECURITY RELEVANT                PERFORMANCE RELEVANT
                      │                                 │
                      ▼                                 ▼
          AL Security Reviewer (Custom)     AL Performance Reviewer (Custom)
                      │                                 │
              Permission review                 Database access
              Data exposure                     Filters
              Privileged operations             Loops
              Security boundaries               FlowFields
              Sensitive operations              Repeated reads
                      │                          Processing patterns
                      │                                 │
                      └────────────────┬────────────────┘
                                       │
                                       ▼
                              FINAL VALIDATION
                                       │
                                       ▼
                             FEATURE COMPLETE
`

## 1. Purpose

This guide defines the recommended way to use the built-in **Agent** and project-specific **Custom Agents** in Visual Studio Code for Microsoft Dynamics 365 Business Central AL development.

The goal is to keep daily development simple while using specialized agents when a task has a clear professional scope such as architecture, implementation, review, debugging, testing, security, or performance.

## 2. Core Principle

Use this rule when selecting an agent:

> **If the task is general, exploratory, small, or crosses multiple scopes, start with the built-in Agent. If the task has a clear specialist role, select the corresponding Custom Agent.**

Custom Agents are project-defined personas that can apply role-specific instructions and tool configurations. They are useful when a repeatable task benefits from a consistent role and operating boundary.

## 3. Agent Types

### 3.1 Built-in Agent (Default)

Use **Agent** as the default entry point for daily AL development.

Recommended for:

- General development questions
- Small or straightforward code changes
- Exploring an unfamiliar part of the codebase
- Tasks that combine analysis, coding, building, and fixing
- Tasks whose specialist scope is not yet clear
- Ad hoc AL or Business Central questions
- End-to-end changes where switching specialist roles would add unnecessary overhead

Example:

```text
Add a Customer Reference field to Sales Header,
show it on Sales Order,
build the project,
and fix any compilation errors.
```

Recommended selection:

```text
Agent (default)
```

### 3.2 Custom Agents

Use a Custom Agent when the task has a clear specialist objective.

The project may expose agents such as:

- **AL Architect (Custom)**: solution analysis and technical design
- **AL Developer (Custom)**: implementation
- **AL Reviewer (Custom)**: general code and implementation review
- **AL Debugger (Custom)**: investigation and root-cause analysis
- **AL Test Engineer (Custom)**: test design and automated testing
- **AL Security Reviewer (Custom)**: security-focused review
- **AL Performance Reviewer (Custom)**: performance-focused review

## 4. Quick Agent Selection Guide

```text
What am I doing?
│
├─ General / mixed / exploratory work
│  └─ Agent (default)
│
├─ Designing the solution
│  └─ AL Architect (Custom)
│
├─ Implementing an approved design
│  └─ AL Developer (Custom)
│
├─ Reviewing completed code
│  └─ AL Reviewer (Custom)
│
├─ Investigating an unknown error or runtime issue
│  └─ AL Debugger (Custom)
│
├─ Designing or implementing tests
│  └─ AL Test Engineer (Custom)
│
├─ Performing a security-focused review
│  └─ AL Security Reviewer (Custom)
│
└─ Performing a performance-focused review
   └─ AL Performance Reviewer (Custom)
```

When unsure, start with **Agent (default)**.

## 5. Standard Feature Development Workflow

For a non-trivial Business Central feature, use specialist agents according to the development stage.

```text
Requirement
    │
    ▼
AL Architect (Custom)
"I need to design the solution."
    │
    ▼
Approved Design
    │
    ▼
AL Developer (Custom)
"The design is approved. Implement it."
    │
    ▼
Build / Compile
    │
    ├─ Expected result
    │      │
    │      ▼
    │  AL Test Engineer (Custom)
    │  "Create and run the appropriate tests."
    │      │
    │      ▼
    │  AL Reviewer (Custom)
    │  "The implementation is complete. Review it."
    │
    └─ Unknown failure
           │
           ▼
       AL Debugger (Custom)
       "The build/runtime behavior is failing and the cause is unknown. Investigate it."
```

Security and performance reviews are additional specialist gates when relevant to the feature.

### Step 1: Solution Design

Select:

```text
AL Architect (Custom)
```

Example prompt:

```text
We need to prevent Sales Order release when the customer
exceeds a custom credit threshold.

Analyze the requirement and propose the safest AL extension design.
Identify the required objects, extension points, dependencies,
and expected validation flow.

Do not implement the solution yet.
```

Expected purpose:

- Clarify the technical approach
- Identify suitable AL objects
- Prefer extensibility patterns
- Identify dependencies and extension points
- Establish implementation boundaries before code changes

### Step 2: Implementation

When the design is accepted, switch to:

```text
AL Developer (Custom)
```

Example prompt:

```text
Implement the approved Customer Credit Check design.

Use the existing project conventions and the approved architecture.
Build the project after implementation.
Do not publish unless explicitly requested.
```

Expected purpose:

- Implement the approved design
- Follow project coding conventions
- Reuse existing symbols and extension points
- Keep the change focused on the approved requirement
- Build and inspect diagnostics after implementation

### Step 3: Testing

When implementation is ready for verification, switch to:

```text
AL Test Engineer (Custom)
```

Example prompt:

```text
Create automated tests for the Customer Credit Check feature.

Cover at least these business scenarios:
- customer below the credit threshold
- customer exactly at the threshold
- customer above the threshold
- blocked customer where applicable

Keep production behavior unchanged unless a testability change is required.
```

Expected purpose:

- Identify relevant test scenarios
- Implement focused automated tests
- Cover positive, boundary, and negative paths
- Validate expected business behavior

### Step 4: General Code Review

After implementation and tests are stable, switch to:

```text
AL Reviewer (Custom)
```

Example prompt:

```text
Review the completed Customer Credit Check implementation.

Focus on:
- correctness
- AL best practices
- maintainability
- naming and structure
- extension safety
- upgrade impact
- unnecessary customization
- diagnostics and analyzer findings

Do not modify files yet. Report findings first.
```

Expected purpose:

- Perform an independent review of the completed change
- Identify correctness and maintainability issues
- Check alignment with project and AL conventions
- Keep review separate from implementation when an independent review is valuable

### Step 5: Debugging When the Cause Is Unknown

If a build, runtime, or behavioral problem cannot be explained immediately, switch to:

```text
AL Debugger (Custom)
```

Example prompt:

```text
Sales Order release is failing after the new customization.
The root cause is unknown.

Investigate the failure first.
Use available project diagnostics and AL development tools where appropriate.
Identify the root cause before changing business logic.
```

Expected purpose:

- Reproduce or isolate the issue where possible
- Inspect diagnostics and relevant code paths
- Identify the root cause
- Avoid speculative code changes before the cause is understood

After the cause is known, implementation can return to **AL Developer** if a code change is required.

## 6. Specialist Review Workflows

### 6.1 Security Review

Select:

```text
AL Security Reviewer (Custom)
```

Use when security is a meaningful part of the requirement or review scope.

Example prompt:

```text
Review this customization from an AL security perspective.

Focus on permissions, sensitive data exposure,
privileged operations, and security-related extension behavior.

Do not modify code. Report findings and recommended actions first.
```

A security review supplements the general code review. It does not have to be run for every trivial change.

### 6.2 Performance Review

Select:

```text
AL Performance Reviewer (Custom)
```

Use for database-heavy logic, processing loops, imports, reports, batch-style processing, or a known performance concern.

Example prompt:

```text
Review SalesOrderImport.Codeunit.al for performance risks.

Focus on database access inside loops,
record filtering, repeated reads,
FlowField calculations, and unnecessary processing.

Do not modify code. Report findings first.
```

A performance review supplements the general code review when performance risk is relevant.

## 7. Standard Workflow Variants

### 7.1 Small Change

For a small, low-risk change:

```text
Agent (default) (Custom)
    ↓
Implement
    ↓
Build
    ↓
Review result
```

Example:

```text
Add a field to an existing table extension,
show it on the related page extension,
and build the project using the custom agent.
```

Do not create a full multi-agent workflow for every small change.

### 7.2 Medium Feature

```text
AL Architect (Custom)
    ↓
AL Developer (Custom)
    ↓
AL Test Engineer (Custom)
    ↓
AL Reviewer (Custom)
```

Use when the feature requires design decisions but does not need dedicated security or performance analysis.

### 7.3 Complex or High-Risk Feature

```text
AL Architect (Custom)
    ↓
AL Developer (Custom)
    ↓
AL Test Engineer (Custom)
    ↓
AL Reviewer (Custom)
    ↓
AL Security Reviewer (Custom)     [when security scope exists]
    ↓
AL Performance Reviewer (Custom)  [when performance scope exists]
```

Use specialist review gates only when their scope is relevant.

### 7.4 Troubleshooting Workflow

```text
Problem observed
    ↓
AL Debugger (Custom)
    ↓
Root cause identified
    ↓
AL Developer (Custom)
    ↓
Build / Test
    ↓
AL Reviewer
```

Do not start by making speculative fixes when the root cause is unknown.

## 8. Practical Examples

### Scenario A: Simple UI Extension

Requirement:

```text
Add a custom Customer Reference field to Sales Order.
```

Recommended:

```text
Agent (default)
```

Reason: the change is small and does not require a dedicated architecture workflow unless the implementation reveals broader design concerns.

### Scenario B: New Approval Feature

Requirement:

```text
Introduce a custom approval rule based on Sales Order amount.
```

Recommended:

```text
AL Architect (Custom)
    ↓
AL Developer (Custom)
    ↓
AL Test Engineer (Custom)
    ↓
AL Reviewer (Custom)
```

### Scenario C: Unknown Runtime Failure

Problem:

```text
Sales Order release fails after customization,
but the source of the error is not known.
```

Recommended:

```text
AL Debugger (Custom)
```

After root cause identification:

```text
AL Developer (Custom)
```

### Scenario D: Large Import Routine

Requirement:

```text
Implement a large Sales Order import process.
```

Recommended:

```text
AL Architect (Custom)
    ↓
AL Developer (Custom)
    ↓
AL Test Engineer (Custom)
    ↓
AL Reviewer (Custom)
    ↓
AL Performance Reviewer (Custom)
```

### Scenario E: Permission-Sensitive Feature

Requirement:

```text
Implement a process that requires new permissions
and accesses business-sensitive records.
```

Recommended:

```text
AL Architect (Custom)
    ↓
AL Developer (Custom)
    ↓
AL Test Engineer (Custom)
    ↓
AL Reviewer (Custom)
    ↓
AL Security Reviewer (Custom)
```

## 9. Agent, Skills, Instructions, and AL Tools

Do not treat these components as replacements for one another. They solve different problems.

```text
copilot-instructions.md
        │
        └─ Global project guidance

instructions/
        │
        └─ Context-specific project guidance

skills/
        │
        └─ Reusable task workflows and specialized knowledge

agents/
        │
        └─ Specialized roles/personas

Microsoft AL Language Model Tools
        │
        └─ AL development actions available to the agent
```

A useful mental model is:

```text
Instructions = What rules and context should guide the work?
Skills       = How should a reusable task be performed?
Agent        = Which role should perform the task?
AL Tools     = What AL development actions can the agent execute?
```

## 10. Working with Microsoft AL Tools

When using a compatible AL Language extension and GitHub Copilot Agent mode, the agent can use available AL development tools for operations such as build, symbol search, diagnostics, symbol download, publishing, and supported debugging workflows.

For normal interactive development in Visual Studio Code, let the selected agent use the available AL tools as required by the task.

Useful explicit tool references during troubleshooting or verification may include:

```text
#al_build
#al_symbolsearch
#al_getdiagnostics
```

Example:

```text
#al_build
Build the current project.
Do not publish.
Show the relevant errors and warnings.
```

## 11. Prompting Guidelines

Regardless of the selected agent, provide enough task context.

A good request normally states:

1. **Goal**: what should be achieved?
2. **Scope**: which module, feature, or files are relevant?
3. **Constraints**: what must not change?
4. **Expected action**: analyze, design, implement, test, debug, or review?
5. **Validation**: should the agent build, retrieve diagnostics, or only report findings?

Example:

```text
Goal:
Add a custom credit validation before Sales Order release.

Scope:
Sales/CreditCheck.

Constraints:
- Prefer extension objects and available events.
- Do not modify unrelated code.
- Do not publish.

Action:
Implement the approved design.

Validation:
Build the project and report remaining compilation errors.
```

## 12. Golden Rules

1. **Start with Agent (default) when unsure.**
2. **Use a Custom Agent only when the specialist scope is meaningful.**
3. **Use AL Architect before implementation when genuine design decisions are required.**
4. **Use AL Developer when the desired design and implementation scope are understood.**
5. **Use AL Debugger for root-cause investigation rather than speculative fixes.**
6. **Use AL Test Engineer when verification and automated tests are the primary objective.**
7. **Use AL Reviewer after implementation when an independent general review is valuable.**
8. **Use security and performance reviewers only when those risks are relevant.**
9. **Do not turn every small change into a multi-agent process.**
10. **Build, test, and review generated changes before treating them as complete.**
11. **Do not publish to an environment unless publishing is explicitly required and the target is understood.**
12. **Keep each Custom Agent focused on its intended responsibility.**

## 13. Quick Reference

```text
General daily work
→ Agent (default)

Solution architecture / design
→ AL Architect

Implementation
→ AL Developer

General code review
→ AL Reviewer

Unknown error / root-cause analysis
→ AL Debugger

Testing
→ AL Test Engineer

Security-specific review
→ AL Security Reviewer

Performance-specific review
→ AL Performance Reviewer
```

### Standard Feature Flow

```text
AL Architect
    ↓
AL Developer
    ↓
AL Test Engineer
    ↓
AL Reviewer
```

Optional specialist gates:

```text
AL Security Reviewer
AL Performance Reviewer
```

Troubleshooting branch:

```text
Failure with unknown cause
    ↓
AL Debugger
    ↓
Root cause
    ↓
AL Developer
    ↓
Build / Test / Review
```

## 14. Recommended Team Convention

Use the built-in **Agent** as the team's general-purpose entry point and use Custom Agents as explicit specialist modes.

The objective is not to maximize the number of agents used. The objective is to select the smallest useful role for the current task and switch roles only when the development stage or review scope genuinely changes.

This keeps the workflow predictable:

```text
Simple task
→ Agent (default)

Clear specialist task
→ Relevant Custom Agent

Non-trivial feature
→ Architect → Developer → Test Engineer → Reviewer

Unknown failure
→ Debugger → Developer → Validation

Additional risk
→ Security Reviewer and/or Performance Reviewer
```

---

## References

- Visual Studio Code documentation: Custom agents in VS Code
- Visual Studio Code documentation: Understand agent customization
- Microsoft Dynamics 365 Business Central documentation: AI Agent Tools for AL development
- Project-level GitHub Copilot instructions, skills, and custom agent definitions should remain the source of truth for repository-specific behavior.
