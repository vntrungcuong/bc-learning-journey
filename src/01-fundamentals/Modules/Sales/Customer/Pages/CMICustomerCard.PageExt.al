namespace CuongMai.Fundamentals.Sales.Customer;

using Microsoft.Sales.Customer;

pageextension 50101 "CMI Customer Card Ext" extends "Customer Card"
{
    layout
    {
        addafter(Name)
        {
            // field(<Control Name>; <Source Expression>)
            // Rec."Customer Category": field was add in file CMICustomer.TableExt
            // Rec: is current record.
            field("CMI Customer Category"; Rec."Customer Category")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the customer category.';
            }
        }

        // Other layout modifications can be added here.
        // addafter(...)
        // addbefore(...)
        // addfirst(...)
        // addlast(...)
    }

    actions
    {
        addlast("Navigation")
        {
            action("Customer Feedback")
            {
                Caption = 'Feedback';
                ApplicationArea = All;

                // Icon
                Image = Comments;

                RunObject = Page "CMI Customer Feedback List";
                RunPageLink = "Customer No." = FIELD("No.");

                // Optimize per customer and feedback date.
                RunPageView = SORTING("Customer No.", "Feedback Date");
            }
        }
    }
}
