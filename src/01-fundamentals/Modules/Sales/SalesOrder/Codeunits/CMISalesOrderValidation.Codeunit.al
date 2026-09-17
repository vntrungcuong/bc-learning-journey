namespace CuongMai.Fundamentals.Sales.SalesOrder;

using Microsoft.Sales.Document;

codeunit 50101 "CMI Sales Order Valid."
{
    procedure ValidateSalesOrder(SalesHeader: Record "Sales Header")
    begin
        ValidateDocumentType(SalesHeader);
        ValidateRequriedFields(SalesHeader);
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

    var
        NotSalesOrderErr: Label 'The document must be a sales order.';
}
