namespace CuongMai.Fundamentals.Inventory.Item;

enum 50101 "CMI Item Quality Level"
{
    Extensible = true;

    value(0; Standard)
    {
        Caption = 'Standard';
    }
    value(1; Premium)
    {
        Caption = 'Premium';
    }
    value(2; Restricted)
    {
        Caption = 'Restricted';
    }
}
