# Business Central Project Structure Guide

## 1. Purpose

This guide defines where developers should place new Microsoft Dynamics 365 Business Central AL source files and folders in this project. The project uses a **functional-first structure**, then groups AL files by **object type inside each business function**.

## 2. Structure principle

```text
Project
├── Administrator/
├── Common/
├── docs/
├── Finance/
├── Integration/
├── Inventory/
├── Permissions/
├── Purchase/
├── Sales/
├── Setup/
└── Warehouse/
```

Business areas are the first classification level. A business area can contain business functions. For example:

```text
Sales/
├── CreditManagement/
├── Customer/
├── Payment/
├── SalesInvoice/
└── SalesOrder/
```

Inside a function, organize files by AL object type when that type is used:

```text
SalesOrder/
├── Codeunits/
├── Enums/
├── Interfaces/
├── Pages/
├── Reports/
├── Tables/
└── README.md
```

Do not create empty object-type folders only to make every function look identical. Add an object-type folder when the function actually contains that object type.

## 3. Where should a new file go?

Use this decision order:

1. Identify the **business area** that owns the requirement, such as `Sales`, `Purchase`, `Inventory`, or `Finance`.
2. Identify the **business function** that owns the behavior, such as `SalesOrder`, `Customer`, or `SalesInvoice`.
3. Identify the **AL object type**.
4. Put the `.al` file in the matching object-type folder.

Example:

```text
Requirement: Add validation to Sales Order
Business area: Sales
Function: SalesOrder
Object type: Codeunit
Location: Sales/SalesOrder/Codeunits/
```

Another example:

```text
Requirement: Extend the Sales Order page
Business area: Sales
Function: SalesOrder
Object type: Page Extension
Location: Sales/SalesOrder/Pages/
```

## 4. New objects and extension objects

Do **not** separate new objects and extension objects into `New`, `Extensions`, or similar folders. Place both according to functional ownership and object type.

```text
Sales/SalesOrder/Tables/
├── SalesOrderImportBuffer.Table.al
├── SalesHeader.TableExt.al
└── SalesLine.TableExt.al

Sales/SalesOrder/Pages/
├── SalesOrderImport.Page.al
└── SalesOrder.PageExt.al
```

Recommended file pattern:

```text
<ObjectName>.<ObjectType>.al
```

Common examples:

```text
Customer.Table.al
Customer.TableExt.al
CustomerCard.Page.al
CustomerCard.PageExt.al
SalesOrderMgt.Codeunit.al
SalesOrderStatus.Enum.al
SalesOrderStatus.EnumExt.al
SalesOrderValidator.Interface.al
SalesOrderSummary.Report.al
CustomerBalance.Query.al
CustomerImport.Xmlport.al
ProjectUser.PermissionSet.al
```

Keep one AL object per file.

## 5. When to create a new business function

Create a new function folder when the code represents a distinct business capability that developers will commonly search, maintain, and change together.

Example:

```text
Sales/
├── Customer/
├── SalesOrder/
└── SalesInvoice/
```

Do not create a function merely because a new AL object was created. The function boundary should represent the business responsibility.

## 6. Cross-cutting folders

### Common

Use `Common/` only for reusable, cross-functional code that does not belong naturally to one business function.

Suggested structure when needed:

```text
Common/
├── Codeunits/
├── Enums/
└── Interfaces/
```

Avoid generic dumping grounds such as a single large `Helper.Codeunit.al` or `Utility.Codeunit.al`. If code only serves Sales Order, keep it under `Sales/SalesOrder/`.

### Integration

Use `Integration/` for code whose primary responsibility is communication with an external system or integration boundary. Group it first by integration/system, then by object type.

```text
Integration/
└── PaymentGateway/
    ├── Codeunits/
    ├── Enums/
    ├── Interfaces/
    ├── Pages/
    └── Tables/
```

Business logic should remain in its owning functional module where possible; integration-specific transport, mapping, synchronization, and related implementation belong to the integration area.

### Permissions

Keep app-level permission sets in `Permissions/` when permissions span multiple functions.

```text
Permissions/
├── ProjectAdmin.PermissionSet.al
├── ProjectUser.PermissionSet.al
└── ProjectIntegration.PermissionSet.al
```

### Setup

Use `Setup/` for project-wide setup/configuration. Setup that exists only for a specific feature should remain with that feature where practical.

### Administrator

Use `Administrator/` only for application administration functionality that does not naturally belong to another business area. Do not use it as a miscellaneous folder.

### docs

Use `docs/` for project-level documentation, architecture decisions, development guidance, and technical notes. Feature-specific guidance may live in the feature `README.md`.

## 7. Repository/tooling folders

The following are project/tooling concerns, not functional AL modules:

```text
.alpackages/
.github/
.snapshots/
.vscode/
```

Developers should not place business AL source files in these locations.

Generated `.app` files are build artifacts and should not become a source-code organization mechanism.

## 8. Naming rules

Use **PascalCase** for business-area, function, and object-type folder names in this template.

```text
Sales/
SalesOrder/
CreditManagement/
PaymentGateway/
Codeunits/
```

For AL source files, use the object name plus the Microsoft object-type notation.

```text
<ObjectName>.<ObjectType>.al
```

Examples:

```text
SalesHeader.TableExt.al
SalesOrder.PageExt.al
SalesOrderMgt.Codeunit.al
SalesOrderStatus.Enum.al
PaymentGateway.Interface.al
```

Object prefix/suffix and namespace policy must follow the project's AL naming rules and target publishing requirements.

## 9. Namespace guidance

Use stable namespaces that reflect organization/product and logical grouping. Do not encode version numbers in namespaces.

Example convention:

```al
namespace Company.Product.Sales.SalesOrder;
```

The exact namespace convention should be defined once at project level and applied consistently. Treat namespace renaming carefully because it can be a breaking change for dependent apps.

## 10. Developer checklist

Before adding a source file:

- [ ] Is the owning business area clear?
- [ ] Is there already a suitable business function?
- [ ] Is the file in the correct object-type folder?
- [ ] Is this one AL object per file?
- [ ] Does the filename follow `<ObjectName>.<ObjectType>.al`?
- [ ] If extending an object, is it still placed by business function rather than in a global `Extensions` folder?
- [ ] If shared code is proposed for `Common`, is it genuinely cross-functional?
- [ ] If integration code is proposed, is its primary responsibility integration rather than core business logic?
- [ ] Does the object follow the project's namespace and prefix/suffix policy?
- [ ] Has unnecessary folder nesting been avoided?

## 11. Quick rule

> **Business Area → Business Function → Object Type → AL File**

Example:

```text
Sales
└── SalesOrder
    └── Codeunits
        └── SalesOrderApprovalMgt.Codeunit.al
```
