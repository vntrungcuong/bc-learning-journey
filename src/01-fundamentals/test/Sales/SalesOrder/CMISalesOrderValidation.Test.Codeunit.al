namespace CuongMai.Fundamentals.Tests.Sales.SalesOrder;

using CuongMai.Fundamentals.Sales.SalesOrder;
using Microsoft.Sales.Document;

codeunit 50109 "CMI Sales Order Val. Test"
{
    Subtype = Test;

    [Test]
    procedure InvalidSalesOrderShouldFail()
    var
        SalesHeader: Record "Sales Header";
        SalesOrderValidation: Codeunit "CMI Sales Order Validation.";
    begin
        // Arrange
        // Prepare scenario
        CreateSalesOrder(SalesHeader);

        // Deliberately make the Sales Order invalid.
        SalesHeader."Sell-to Customer No." := '';

        // Act
        // Call production code
        asserterror SalesOrderValidation.ValidateSalesOrderV2(SalesHeader);

        // Assert
        if GetLastErrorText() = '' then
            Error(ExpectedValidationErrorErr);
    end;

    [Test]
    procedure ValidSalesOrderShouldSucceed()
    var
        SalesHeader: Record "Sales Header";
        SalesOrderValidation: Codeunit "CMI Sales Order Validation.";
    begin
        // Arrange
        CreateSalesOrder(SalesHeader);

        // Act
        SalesOrderValidation.ValidateSalesOrderV2(SalesHeader);

        // Assert
        // Reaching this point means that validation completed
        // without raising an error.
    end;

    local procedure CreateSalesOrder(var SalesHeader: Record "Sales Header")
    begin
        SalesHeader.Init();
        SalesHeader."Document Type" := SalesHeader."Document Type"::Order;
        SalesHeader."No." := GetNextSalesOrderNo();
        SalesHeader."Sell-to Customer No." := GetTestCustomerNo();
        SalesHeader.Insert(true);
    end;

    local procedure GetNextSalesOrderNo(): Code[20]
    var
        SalesHeader: Record "Sales Header";
    begin
        SalesHeader.SetRange(
            "Document Type",
            SalesHeader."Document Type"::Order);

        if SalesHeader.FindLast() then
            exit(IncStr(SalesHeader."No."));

        exit('TEST-SO-0001');
    end;

    local procedure GetTestCustomerNo(): Code[20]
    begin
        exit('10000');
    end;

    var
        ExpectedValidationErrorErr:
            Label 'The Sales Order validation was expected to raise an error.';
}