namespace CuongMai.Fundamentals.Sales.SalesOrder;

using Microsoft.Sales.Document;

codeunit 50101 "CMI Sales Order Validation."
{
    procedure ValidateSalesOrderV1(SalesHeader: Record "Sales Header")
    begin
        ValidateDocumentType(SalesHeader);
        ValidateRequriedFields(SalesHeader);
    end;

    procedure ValidateSalesOrderV2(SalesHeader: Record "Sales Header")
    begin
        ValidateSellToCustomer(SalesHeader);
        ValidateSalesLines(SalesHeader);
    end;

    procedure SetCustomerPOReference(
        SalesHeader: Record "Sales Header";
        CustomerPOReference: Code[35]
    )
    begin
        ValidateDocumentType(SalesHeader);

        SalesHeader.Validate("CMI Customer PO Reference", CustomerPOReference);

        SalesHeader.Modify(true);
    end;

    local procedure ValidateDocumentType(SalesHeader: Record "Sales Header")
    begin
        if SalesHeader."Document Type" <> SalesHeader."Document Type"::Order then
            Error(NotSalesOrderErr);
    end;

    local procedure ValidateRequriedFields(SalesHeader: Record "Sales Header")
    begin
        SalesHeader.TestField("Sell-to Customer No.");
        SalesHeader.TestField("CMI Customer PO Reference");
    end;

    local procedure ValidateSellToCustomer(SalesHeader: Record "Sales Header")
    var
        MissingCustomerErr: Label 'Sell-to Customer No. must be specified before the sales order can be released.';
    begin
        if SalesHeader."Sell-to Customer No." = '' then
            Error(MissingCustomerErr);
    end;

    local procedure ValidateSalesLines(SalesHeader: Record "Sales Header")
    var
        SalesLine: Record "Sales Line";
        NoSalesLinesErr: Label 'The sales order must contain at least one sales line before it can be released.';
    begin
        SalesLine.SetRange("Document Type", SalesHeader."Document Type");
        SalesLine.SetRange("Document No.", SalesHeader."No.");

        if SalesLine.IsEmpty() then
            Error(NoSalesLinesErr);
    end;

    var
        NotSalesOrderErr: Label 'The document must be a sales order.';
}
