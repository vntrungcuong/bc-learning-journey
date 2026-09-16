namespace CuongMai.Fundamentals.Sales.Customer;

using Microsoft.Sales.Customer;

pageextension 50102 "Customer List Ext" extends "Customer List"
{
    layout
    {
        addafter("Name")
        {
            // field(<Control Name>; <Source Expression>)
            // Rec."Customer Category": field was add in file CMICustomer.TableExt
            // Rec: is current record.
            field("Customer Category"; Rec."Customer Category")
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
}
