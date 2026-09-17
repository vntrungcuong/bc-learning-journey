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

        addafter("Sell-to Customer Name")
        {
            field("CMI Validate Type"; Rec."CMI Validate Type")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the validation strategy used for this sales order.';
            }
        }
    }

    actions
    {
        addlast(Processing)
        {
            action(CMIValidateSalesOrderV1)
            {
                ApplicationArea = All;
                Caption = 'Validate Sales Order V1';
                Image = Check;
                ToolTip = 'Validates that the sales order contains the required business information';

                trigger OnAction()
                var
                    SalesOrderValidation: Codeunit "CMI Sales Order Validation.";
                begin
                    SalesOrderValidation.ValidateSalesOrderV1(Rec);

                    Message(ValidationSuccessfulMsgV1);
                end;
            }

            action(CMIValidateSalesOrderV2)
            {
                ApplicationArea = All;
                Caption = 'Validate Sales Order V2';
                Image = Check;
                ToolTip = 'Validates that the sales order contains the required business information';

                trigger OnAction()
                var
                    SalesOrderValidator: Interface "CMI Sales Order Validator";
                begin
                    SalesOrderValidator := Rec."CMI Validate Type";
                    SalesOrderValidator.ValidateSalesOrder(Rec);

                    Message(ValidationSuccessfulMsgV2, Rec."CMI Validate Type");
                end;
            }
        }
    }

    var
        ValidationSuccessfulMsgV1: Label 'Sales order validation completed successfully.';
        ValidationSuccessfulMsgV2: Label 'Sales Order validation completed successfully using %1 strategy.';

}