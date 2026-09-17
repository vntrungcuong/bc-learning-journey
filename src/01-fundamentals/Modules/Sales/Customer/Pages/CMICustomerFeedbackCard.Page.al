namespace CuongMai.Fundamentals.Sales.Customer;

page 50101 "CMI Customer Feedback Card"
{
    PageType = Card;
    SourceTable = "CMI Customer Feedback";

    Caption = 'Customer Feedback Card';
    ApplicationArea = All;

    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';

                field("Entry No."; Rec."Entry No.")
                {
                    ToolTip = 'Specifies the value of the Entry No. field.', Comment = '%';
                    Editable = false;
                }
                field("Customer No."; Rec."Customer No.")
                {
                    ToolTip = 'Specifies the value of the Customer No. field.', Comment = '%';
                }
                field("Feedback Date"; Rec."Feedback Date")
                {
                    ToolTip = 'Specifies the value of the Feedback Date field.', Comment = '%';
                }
                field(Rating; Rec.Rating)
                {
                    ToolTip = 'Specifies the value of the Rating field.', Comment = '%';
                }
                field(Reviewed; Rec.Reviewed)
                {
                    ToolTip = 'Specifies the value of the Reviewed field.', Comment = '%';
                }
            }

            group(Feedback)
            {
                Caption = 'Feedback';

                field(Comments; Rec.Comments)
                {
                    ToolTip = 'Specifies the value of the Comments field.', Comment = '%';
                    MultiLine = true;
                }
            }
        }
    }
}
