# Sales Order Source Structure Guide

## 1. Purpose

This guide defines how Sales Order AL source code is organized and where developers should add new or extended objects.

The Sales Order function follows this rule:

> **Function → Object Type → AL File**

Current structure:

```text
Sales/
└── SalesOrder/
    ├── Codeunits/
    ├── Enums/
    ├── Interfaces/
    ├── Pages/
    ├── Reports/
    ├── Tables/
    └── README.md
```

## 2. Folder responsibilities

### Codeunits

Place Sales Order AL codeunits here, including orchestration, validation, event-subscriber, mapping, or other Sales Order behavior implemented as codeunits.

Examples:

```text
Codeunits/
├── SalesOrderMgt.Codeunit.al
├── SalesOrderApprovalMgt.Codeunit.al
├── SalesOrderCreditCheck.Codeunit.al
└── SalesOrderSubscriber.Codeunit.al
```

### Enums

Place enums and enum extensions owned by Sales Order here.

```text
Enums/
├── SalesOrderStatus.Enum.al
└── SalesDocumentType.EnumExt.al
```

### Interfaces

Place interfaces whose responsibility belongs to Sales Order here.

```text
Interfaces/
└── SalesOrderValidator.Interface.al
```

### Pages

Place both new pages and page extensions owned by Sales Order here.

```text
Pages/
├── SalesOrderImport.Page.al
├── SalesOrder.PageExt.al
└── SalesOrderSubform.PageExt.al
```

### Reports

Place new Sales Order reports and report extensions here.

```text
Reports/
├── SalesOrderSummary.Report.al
└── SalesOrder.ReportExt.al
```

Keep report layouts/resources together with the report according to the project's chosen layout convention.

### Tables

Place both new tables and table extensions owned by Sales Order here.

```text
Tables/
├── SalesOrderImportBuffer.Table.al
├── SalesHeader.TableExt.al
└── SalesLine.TableExt.al
```

## 3. Where should new and extended objects go?

The distinction between **new** and **extended** does not determine the folder. The **AL object type** does.

```text
New table        → Tables/
Table extension  → Tables/
New page         → Pages/
Page extension   → Pages/
New enum         → Enums/
Enum extension   → Enums/
New report       → Reports/
Report extension → Reports/
Codeunit         → Codeunits/
Interface        → Interfaces/
```

Do not introduce structures such as:

```text
SalesOrder/
├── NewObjects/
└── Extensions/
```

## 4. Business sub-features such as Approval or Credit Check

With the selected object-type structure, Approval, Credit Check, Workflow, and similar concerns normally appear in **object names**, not as additional folders.

```text
Codeunits/
├── SalesOrderApprovalMgt.Codeunit.al
├── SalesOrderCreditCheck.Codeunit.al
├── SalesOrderWorkflowMgt.Codeunit.al
└── SalesOrderSubscriber.Codeunit.al
```

Create a new subfolder only when there is a strong need to treat a sub-capability as a separate unit. Do not add extra nesting for every small requirement.

### Preferred for the selected object-type model

If Import is ordinary Sales Order functionality, place each Import object in its normal object-type folder and make `Import` visible in the object name:

```text
SalesOrder/
├── Tables/
│   └── SalesOrderImportBuffer.Table.al
├── Pages/
│   └── SalesOrderImport.Page.al
└── Codeunits/
    └── SalesOrderImportMgt.Codeunit.al
```

## 5. When a requirement touches several object types

Example requirement: **Sales Order Approval** needs fields, UI changes, and business logic.

Place each object according to its type:

```text
SalesOrder/
├── Tables/
│   └── SalesHeader.TableExt.al
├── Pages/
│   └── SalesOrder.PageExt.al
├── Codeunits/
│   └── SalesOrderApprovalMgt.Codeunit.al
└── Enums/
    └── SalesOrderApprovalStatus.Enum.al
```

The common business relationship is expressed through the `SalesOrder` function and meaningful object names, rather than through another folder layer.

## 6. When code should leave `SalesOrder`

Keep an object in `SalesOrder` when Sales Order is its primary business owner.

Move/place it elsewhere when another area clearly owns the responsibility. Examples:

```text
Customer-specific behavior       → Sales/Customer/
Sales invoice behavior           → Sales/SalesInvoice/
Cross-functional reusable code   → Common/
External integration concern     → Integration/<System>/
App-wide permission set          → Permissions/
Project-wide configuration       → Setup/
```

Integration-specific code should not be placed in `SalesOrder` solely because the payload contains Sales Orders. Keep core Sales Order behavior under `Sales/SalesOrder`, while communication with an external system belongs under its integration boundary.

## 7. File naming

Use:

```text
<ObjectName>.<ObjectType>.al
```

Examples:

```text
SalesOrderImportBuffer.Table.al
SalesHeader.TableExt.al
SalesOrder.PageExt.al
SalesOrderApprovalMgt.Codeunit.al
SalesOrderApprovalStatus.Enum.al
SalesOrderValidator.Interface.al
SalesOrderSummary.Report.al
```

Keep one AL object per file.

## 8. Adding a new AL object: quick process

1. Confirm Sales Order is the owning function.
2. Identify the AL object type.
3. Reuse the existing object-type folder.
4. Create the folder only if that object type does not exist yet.
5. Name the file using `<ObjectName>.<ObjectType>.al`.
6. Keep one AL object in the file.
7. Follow the project namespace and prefix/suffix policy.
8. Do not create another capability folder unless the exception in section 5 applies.

## 9. Examples

### Extend Sales Header with an approval field

```text
Sales/SalesOrder/Tables/SalesHeader.TableExt.al
```

### Add an approval action to Sales Order

```text
Sales/SalesOrder/Pages/SalesOrder.PageExt.al
```

### Add approval processing logic

```text
Sales/SalesOrder/Codeunits/SalesOrderApprovalMgt.Codeunit.al
```

### Add an import buffer table

```text
Sales/SalesOrder/Tables/SalesOrderImportBuffer.Table.al
```

### Add an import service/codeunit

```text
Sales/SalesOrder/Codeunits/SalesOrderImportMgt.Codeunit.al
```

### Add an interface

```text
Sales/SalesOrder/Interfaces/SalesOrderValidator.Interface.al
```

## 10. Developer checklist

- [ ] Does the requirement belong primarily to Sales Order?
- [ ] Is the file stored under its AL object-type folder?
- [ ] Are new and extension objects kept together by type?
- [ ] Does the filename clearly describe the object and type?
- [ ] Is there one AL object per file?
- [ ] Does the file follow the project namespace and prefix/suffix policy?
- [ ] Has unnecessary nesting been avoided?

## 11. Quick rule

> **SalesOrder → Object Type → Object**

```text
Sales/
└── SalesOrder/
    └── Codeunits/
        └── SalesOrderApprovalMgt.Codeunit.al
```
