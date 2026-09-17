namespace CuongMai.Fundamentals.Integration.ExternalSalesOrder;

using Microsoft.Sales.Document;
using CuongMai.Fundamentals.Sales.SalesOrder;

codeunit 50108 "CMI External SO Service"
{
    procedure ProcessExternalRequest(EndpointUrl: Text)
    var
        ExternalSORequest: Record "CMI External SO Request" temporary;
        SalesHeader: Record "Sales Header";
        ExternalSOCLient: Codeunit "CMI External SO Client";
        ExternalSOMapper: Codeunit "CMI External SO Mapper";
        Validator: Interface "CMI Sales Order Validator";
        ResponseText: Text;
    begin
        ExternalSOCLient.GetSalesOrderRequest(
            EndpointUrl,
            ResponseText
        );

        ExternalSOMapper.Map(
            ResponseText,
            ExternalSORequest
        );

        SalesHeader.SetRange(
            "Document Type",
            SalesHeader."Document Type"::Order
        );

        SalesHeader.SetRange(
            "No.",
            ExternalSORequest."Document No."
        );

        if not SalesHeader.FindFirst() then
            Error(
                SalesOrderNotFoundErr,
                ExternalSORequest."Document No.");

        Validator := ExternalSORequest."Validation Type";

        Validator.ValidateSalesOrder(SalesHeader);
    end;

    var
        SalesOrderNotFoundErr:
            Label 'Sales Order %1 was not found.';
}
