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
        addlast(Processing)
        {
            action(CMIValidateSalesOrder)
            {
                ApplicationArea = All;
                Caption = 'Validate Sales Order';
                Image = Check;
                ToolTip = 'Validates that the sales order contains the required business information';

                trigger OnAction()
                var
                    SalesOrderValidation: Codeunit "CMI Sales Order Valid.";
                begin
                    SalesOrderValidation.ValidateSalesOrder(Rec);

                    Message(ValidationSuccessfulMsg);
                end;
            }
        }
    }

    var
        ValidationSuccessfulMsg: Label 'Sales order validation completed successfully.';

}