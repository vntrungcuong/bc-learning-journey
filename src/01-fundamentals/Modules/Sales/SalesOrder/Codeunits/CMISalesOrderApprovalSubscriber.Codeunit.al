namespace CuongMai.Fundamentals.Sales.SalesOrder;

using Microsoft.Sales.Posting;
using Microsoft.Sales.Document;

codeunit 50111 "CMI Sales Approval Subscriber"
{
    [EventSubscriber(
        ObjectType::Codeunit,
        Codeunit::"Sales-Post (Yes/No)",
        'OnAfterConfirmPost',
        '',
        false,
        false
    )]
    local procedure SalesPostYesNoOnAfterConfirmPost(
        SalesHeader: Record "Sales Header";
        IsHandled: Boolean
    )
    var
        SalesOrderApprovalMgt: Codeunit "CMI Sales Order Approval Mgt.";
    begin
        SalesOrderApprovalMgt.CheckApprovalRequirement(SalesHeader);
    end;
}
