namespace CuongMai.Fundamentals.Sales.SalesOrder;

using Microsoft.Sales.Document;
using CuongMai.Fundamentals.Integration.ExternalSalesOrder;

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

    actions
    {
        addlast(Processing)
        {
            action(CMIProcessExternalRequest)
            {
                ApplicationArea = All;
                Caption = 'Process External Request';
                Image = Process;

                trigger OnAction()
                var
                    ExternalSOService: Codeunit "CMI External SO Service";
                    EndpointUrl: Text;
                begin
                    EndpointUrl := 'https://businesscentral.dynamics.com/6561b059-75a8-4c8e-9de4-b7d7ba9e39bf/Development';

                    ExternalSOService.ProcessExternalRequest(EndpointUrl);

                    Message(ProcessCompletedMsg);
                end;
            }
        }
    }

    var
        ProcessCompletedMsg:
            Label 'The external Sales Order request was processed successfully.';
}
