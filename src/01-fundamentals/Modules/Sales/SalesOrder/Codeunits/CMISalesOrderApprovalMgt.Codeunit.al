namespace CuongMai.Fundamentals.Sales.SalesOrder;

using Microsoft.Sales.Document;

codeunit 50110 "CMI Sales Order Approval Mgt."
{
    procedure CheckApprovalRequirement(SalesHeader: Record "Sales Header")
    begin
        if SalesHeader."Document Type" <> SalesHeader."Document Type"::Order then
            exit;

        if not SalesHeader."CMI Approval Required" then
            exit;

        CheckApprovalRequirement(SalesHeader);
    end;

    procedure CheckSalesOrderCanBeProcessed(SalesHeader: Record "Sales Header")
    begin
        if not SalesHeader."CMI Approval Required" then
            exit;

        if SalesHeader.Status = SalesHeader.Status::"Pending Approval" then
            Error(SalesOrderPendingApprovalErr);

        if SalesHeader.Status = SalesHeader.Status::Open then
            Error(SalesOrderRequiresApprovalErr);
    end;

    procedure IsApprovalRequired(SalesHeader: Record "Sales Header"): Boolean
    begin
        exit(
            (SalesHeader."Document Type" = SalesHeader."Document Type"::Order) and
            SalesHeader."CMI Approval Required"
        );
    end;

    procedure IsPendingApproval(SalesHeader: Record "Sales Header"): Boolean
    begin
        exit(
            IsApprovalRequired(SalesHeader) and
            (SalesHeader.Status = SalesHeader.Status::"Pending Approval")
        );
    end;

    procedure IsApproved(SalesHeader: Record "Sales Header"): Boolean
    begin
        exit(
            IsApprovalRequired(SalesHeader) and
            (SalesHeader.Status = SalesHeader.Status::Released)
        );
    end;

    var
        SalesOrderRequiresApprovalErr: Label 'This sales order requires approval before it can be processed.';
        SalesOrderPendingApprovalErr: Label 'This sales order is pending approval and cannot be processed.';
}
