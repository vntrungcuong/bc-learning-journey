namespace CuongMai.Fundamentals.Sales.SalesOrder;

enum 50102 "CMI SO Validation Type" implements "CMI Sales Order Validator"
{
    Extensible = true;

    value(0; Standard)
    {
        Caption = 'Standard';
        Implementation = "CMI Sales Order Validator" = "CMI Std. SO Validator";
    }
    value(1; Credit)
    {
        Caption = 'Credit';
        Implementation = "CMI Sales Order Validator" = "CMI Credit SO Validator";
    }
    value(2; VIP)
    {
        Caption = 'VIP';
        Implementation = "CMI Sales Order Validator" = "CMI VIP SO Validator";
    }
}
