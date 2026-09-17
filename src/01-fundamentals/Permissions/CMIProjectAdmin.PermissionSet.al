namespace CuongMai.Fundamentals.Permissions;

using CuongMai.Fundamentals.Inventory.Item;
using CuongMai.Fundamentals.Sales.Customer;
using CuongMai.Fundamentals.Sales.SalesOrder;

permissionset 50101 "CMI Project Admin"
{
    Assignable = true;
    Caption = 'CMI Project Admin', MaxLength = 30;
    Permissions =
        table "CMI Customer Feedback" = X,
        tabledata "CMI Customer Feedback" = RMID,
        page "CMI Customer Feedback Card" = X,
        page "CMI Customer Feedback List" = X,
        report "CMI Sales Order Summary" = X,
        codeunit "CMI Item Quality Mgt." = X,
        codeunit "CMI Sales Order Validation." = X,
        codeunit "CMI Std. SO Validator" = X,
        codeunit "CMI Credit SO Validator" = X,
        codeunit "CMI VIP SO Validator" = X,
        codeunit "CMI Sales Order Subscriber" = X;
}
