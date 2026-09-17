namespace CuongMai.Fundamentals.Sales.SalesOrder;

using Microsoft.Sales.Document;

codeunit 50102 "CMI Sales Order Subscriber"
{
    [EventSubscriber(
        ObjectType::Codeunit,
        Codeunit::"Release Sales Document",
        'OnBeforeReleaseSalesDoc',
        '',
        false,
        false
    )]
    local procedure OnBeforeReleaseSalesDoc(
        SalesHeader: Record "Sales Header";
        PreviewMode: Boolean;
        IsHandled: Boolean;
        SkipCheckReleaseRestrictions: Boolean;
        SkipWhseRequestOperations: Boolean
    )
    var
        SalesOrderValidation: Codeunit "CMI Sales Order Validation.";
    begin
        if SalesHeader."Document Type" <> SalesHeader."Document Type"::Order then
            exit;

        SalesOrderValidation.ValidateSalesOrderV2(SalesHeader);
    end;
}