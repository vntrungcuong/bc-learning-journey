namespace CuongMai.Fundamentals.Integration.ExternalSalesOrder;

using CuongMai.Fundamentals.Sales.SalesOrder;

codeunit 50106 "CMI External SO Mapper"
{
    procedure Map(
        ResponseText: Text;
        ExternalSORequest: Record "CMI External SO Request" temporary
    )
    var
        JsonObject: JsonObject;
        JsonToken: JsonToken;
    begin
        if not JsonObject.ReadFrom(ResponseText) then
            Error(InvalidJsonErr);

        ExternalSORequest.Init();

        if not JsonObject.Get('documentNo', JsonToken) then
            Error(MissingDocumentNoErr);

        ExternalSORequest."Document No." := CopyStr(
            JsonToken.AsValue().AsText(),
            1,
            MaxStrLen(ExternalSORequest."Document No.")
        );

        if not JsonObject.Get('validateType', JsonToken) then
            Error(MissingValidationTypeErr);

        MapValidationType(
            JsonToken.AsValue().AsText(),
            ExternalSORequest."Validation Type"
        );

        ExternalSORequest.Insert();
    end;

    local procedure MapValidationType(
        ExternalValue: Text;
        ValidationType: Enum "CMI SO Validation Type"
    )
    begin
        case ExternalValue.ToUpper() of
            'STANDARD':
                ValidationType := ValidationType::Standard;

            'CREDIT':
                ValidationType := ValidationType::Credit;

            'VIP':
                ValidationType := ValidationType::VIP;

            else
                Error(UnsupportedValidationTypeErr, ExternalValue);
        end;
    end;

    var
        InvalidJsonErr:
            Label 'The external response contains invalid JSON.';
        MissingDocumentNoErr:
            Label 'The external response does not contain documentNo.';
        MissingValidationTypeErr:
            Label 'The external response does not contain validationType.';
        UnsupportedValidationTypeErr:
            Label 'Validation type %1 is not supported.';
}
