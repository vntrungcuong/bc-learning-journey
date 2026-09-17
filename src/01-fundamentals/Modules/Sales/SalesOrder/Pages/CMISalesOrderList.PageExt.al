namespace CuongMai.Fundamentals.Sales.SalesOrder;

using Microsoft.Sales.Document;

pageextension 50105 "CMI Sales Order List Ext" extends "Sales Order List"
{
    layout
    {
        addafter("External Document No.")
        {
            field("CMI Customer PO Reference"; Rec."CMI Customer PO Reference")
            {
                ApplicationArea = All;
            }
        }
    }
}
