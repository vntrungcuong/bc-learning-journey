namespace CuongMai.Fundamentals.Sales.SalesOrder;

using Microsoft.Sales.Document;

codeunit 50104 "CMI Credit SO Validator" implements "CMI Sales Order Validator"
{
    procedure ValidateSalesOrder(SalesHeader: Record "Sales Header")
    begin
        SalesHeader.TestField("Sell-to Customer No.");
        SalesHeader.TestField("Posting Date");
    end;

    var
        AmountMustBeGreaterThanZeroErr: Label 'The sales order amount must be greater than zero.';
}
