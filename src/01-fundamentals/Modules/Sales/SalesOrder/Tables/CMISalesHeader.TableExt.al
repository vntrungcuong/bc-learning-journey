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

        field(50103; "CMI Validate Type"; Enum "CMI SO Validation Type")
        {
            Caption = 'Validation Type';
            DataClassification = CustomerContent;
        }

        field(50100; "CMI Approval Required"; Boolean)
        {
            Caption = 'Approval Required';
            DataClassification = CustomerContent;
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