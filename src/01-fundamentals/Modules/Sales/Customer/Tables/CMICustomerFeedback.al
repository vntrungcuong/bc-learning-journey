namespace CuongMai.Fundamentals.Sales.Customer;

using Microsoft.Sales.Customer;

table 50100 "CMI Customer Feedback"
{
    Caption = 'Customer Feedback';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Entry No."; Integer)
        {
            Caption = 'Entry No.';
            AutoIncrement = true;
        }
        field(2; "Customer No."; Code[20])
        {
            Caption = 'Customer No.';
            TableRelation = Customer."No.";
        }
        field(3; "Feedback Date"; Date)
        {
            Caption = 'Feedback Date';
        }
        field(4; Rating; Integer)
        {
            Caption = 'Rating';
            MinValue = 1;
            MaxValue = 5;
        }
        field(5; Comments; Text[250])
        {
            Caption = 'Comments';
        }
        field(6; Reviewed; Boolean)
        {
            Caption = 'Reviewed';
        }
    }

    keys
    {
        // Primary key
        key(PK; "Entry No.")
        {
            Clustered = true;
        }

        // Secondary keys
        // Customer is key name (display only)
        key(Customer; "Customer No.", "Feedback Date")
        {
        }
    }

    trigger OnInsert()
    begin
        // date:
        // 0D is blank/zero date value
        // datetime
        // 0DT is blank/zero datetime value
        // <> is not equal to.
        if "Feedback Date" = 0D then
            "Feedback Date" := Today(); // CurrentDateTime() for date and time type
    end;
}
