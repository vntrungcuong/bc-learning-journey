namespace CuongMai.Fundamentals.Integration.ExternalSalesOrder;

using CuongMai.Fundamentals.Sales.SalesOrder;

table 50101 "CMI External SO Request"
{
    Caption = 'CMI External SO Request';
    TableType = Temporary;


    fields
    {
        field(1; "Document No."; Code[20])
        {
            Caption = 'Document No.';
            DataClassification = CustomerContent;
        }

        field(2; "Validation Type"; Enum "CMI SO Validation Type")
        {
            Caption = 'Validation Type';
            DataClassification = CustomerContent;
        }
    }
    keys
    {
        key(PK; "Document No.")
        {
            Clustered = true;
        }
    }
}
