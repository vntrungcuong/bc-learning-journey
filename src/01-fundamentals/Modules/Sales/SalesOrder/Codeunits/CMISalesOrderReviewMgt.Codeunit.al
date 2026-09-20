namespace CuongMai.Fundamentals.Sales.SalesOrder;

using Microsoft.Sales.Document;

codeunit 50112 "CMI Sales Order Review Mgt."
{
    procedure ReviewSalesOrders()
    var
        SalesHeader: Record "Sales Header";
    begin
        SalesHeader.SetRange(
        "Document Type",
        SalesHeader."Document Type"::Order);

        SalesHeader.SetRange(
        "CMI Approval Required",
        true);

        SalesHeader.SetRange(
        Status,
        SalesHeader.Status::Open);

        if SalesHeader.FindSet(true) then
            repeat
                ReviewSalesOrder(SalesHeader);
            until SalesHeader.Next() = 0;
    end;

    local procedure ReviewSalesOrder(var SalesHeader: Record "Sales Header")
    begin
        SalesHeader."CMI Last Approval Review At" := CurrentDateTime();
        SalesHeader.Modify();
    end;
}
