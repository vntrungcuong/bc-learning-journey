tableextension 50102 "CMI Sales Header Ext" extends "Sales Header"
{
    fields
    {
        field(50102; "CMI Customer PO Reference"; Code[35])
        {
            Caption = 'Customer PO Reference';
            DataClassification = CustomerContent;
            ToolTip = 'Specifies the customer purchase order reference for the sales document.';
        }
    }

    keys
    {
        // Add changes to keys here
    }

    fieldgroups
    {
        // Add changes to field groups here
    }

}