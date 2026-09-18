namespace CuongMai.Fundamentals.Sales.SalesOrder;

using Microsoft.Sales.Document;

codeunit 50105 "CMI VIP SO Validator" implements "CMI Sales Order Validator"
{
    procedure ValidateSalesOrder(SalesHeader: Record "Sales Header")
    begin
        SalesHeader.TestField("Sell-to Customer No.");

        if SalesHeader."Document Date" = 0D then
            Error(DocumentDateRequiredErr);
    end;

    var
        DocumentDateRequiredErr: Label 'Document Date is required for VIP sales orders.';
}
