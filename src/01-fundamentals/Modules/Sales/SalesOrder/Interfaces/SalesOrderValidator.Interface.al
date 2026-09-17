namespace CuongMai.Fundamentals.Sales.SalesOrder;

using Microsoft.Sales.Document;

interface "CMI Sales Order Validator"
{
    procedure ValidateSalesOrder(SalesHeader: Record "Sales Header");
}
