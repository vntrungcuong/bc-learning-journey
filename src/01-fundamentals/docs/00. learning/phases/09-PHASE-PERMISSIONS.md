# Phase 09 - Permissions

## Objective
Treat security as part of extension development rather than an afterthought.

## Concepts
- Permission Set
- Object permissions
- TableData permissions
- Execute/run access for relevant objects
- Least-privilege thinking

## Exercise 09 - Project User and Administrator Permission Sets
### Requirement
Create permission sets that allow users to run the practice functionality without depending on broad administrator access.

### Suggested source placement
```text
Permissions/
├── ProjectUser.PermissionSet.al
└── ProjectAdmin.PermissionSet.al
```

### Practice tasks
- Inventory custom objects created in previous phases.
- Define permissions required for normal usage.
- Separate elevated administration needs where appropriate.
- Test with a user context that does not rely on unrestricted permissions.

### Acceptance criteria
- Practice features are usable with intended permissions.
- Permissions are explicit and reviewable.
- Developer can explain why each custom object needs its granted access.
