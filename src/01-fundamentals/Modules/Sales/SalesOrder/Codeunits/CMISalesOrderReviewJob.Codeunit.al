namespace CuongMai.Fundamentals.Sales.SalesOrder;

codeunit 50113 "CMI Sales Order Review Job"
{
    trigger OnRun()
    var
        SalesOrderReviewMgt: Codeunit "CMI Sales Order Review Mgt.";
    begin
        SalesOrderReviewMgt.ReviewSalesOrders();
    end;
}
