namespace CuongMai.Fundamentals.Sales.SalesOrder;

using Microsoft.Sales.Document;

pageextension 50104 "CMI Sales Order Ext" extends "Sales Order"
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

    actions
    {
        // Add changes to page actions here
    }

}