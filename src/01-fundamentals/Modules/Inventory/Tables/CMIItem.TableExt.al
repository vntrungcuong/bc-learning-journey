namespace CuongMai.Fundamentals.Inventory.Item;

using Microsoft.Inventory.Item;

tableextension 50101 "CMI Item Ext" extends Item
{
    fields
    {
        field(50100; "CMI Quality Level"; Enum "CMI Item Quality Level")
        {
            Caption = 'Quality Level';
            DataClassification = CustomerContent;
        }
    }
}
