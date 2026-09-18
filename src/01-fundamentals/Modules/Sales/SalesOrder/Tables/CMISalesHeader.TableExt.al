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

        field(50104; "CMI Approval Required"; Boolean)
        {
            Caption = 'Approval Required';
            DataClassification = CustomerContent;
        }

        field(50105; "CMI Last Approval Review At"; DateTime)
        {
            Caption = 'Last Approval Review At';
            DataClassification = SystemMetadata;
            ToolTip = 'Specifies the date and time when this sales order was last reviewed by the background approval review job.';
            Editable = false;
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