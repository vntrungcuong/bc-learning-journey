namespace CuongMai.Fundamentals.Sales.Customer;

page 50100 "CMI Customer Feedback List"
{
    PageType = List;
    SourceTable = "CMI Customer Feedback";

    Caption = 'Customer Feedback';
    ApplicationArea = All;
    UsageCategory = Lists;

    CardPageId = "CMI Customer Feedback Card";

    layout
    {
        area(Content)
        {
            repeater(Feedback)
            {
                field("Entry No."; Rec."Entry No.")
                {
                    ToolTip = 'Specifies the value of the Entry No. field.', Comment = '%';
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
                field(Comments; Rec.Comments)
                {
                    ToolTip = 'Specifies the value of the Comments field.', Comment = '%';
                }
                field(Reviewed; Rec.Reviewed)
                {
                    ToolTip = 'Specifies the value of the Reviewed field.', Comment = '%';
                }
            }
        }
    }
}
