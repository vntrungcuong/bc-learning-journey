namespace CuongMai.Fundamentals.Sales.SalesOrder;

using Microsoft.Sales.Document;

report 50100 "CMI Sales Order Summary"
{
    ApplicationArea = All;
    Caption = 'Sales Order Summary';
    UsageCategory = ReportsAndAnalysis;

    DefaultRenderingLayout = SalesOrderSummaryLayout;

    dataset
    {
        dataitem(SalesHeader; "Sales Header")
        {
            DataItemTableView =
                where("Document Type" = const(Order));

            RequestFilterFields =
                "No.",
                "Sell-to Customer No.",
                "Order Date",
                Status;

            column(No; "No.")
            {
            }

            column(OrderDate; "Order Date")
            {
            }

            column(PostingDate; "Posting Date")
            {
            }

            column(SelltoCustomerNo; "Sell-to Customer No.")
            {
            }

            column(SelltoCustomerName; "Sell-to Customer Name")
            {
            }

            column(CurrencyCode; "Currency Code")
            {
            }

            column(Status; Status)
            {
            }
        }

        dataitem(SalesLine; "Sales Line")
        {
            DataItemLinkReference = SalesHeader;
            DataItemLink = "Document Type" = field("Document Type"), "Document No." = field("No.");
            DataItemTableView = sorting("Document Type", "Document No.", "Line No.");

            column(LineNo; "Line No.")
            {
            }

            column(LineType; Type)
            {
            }

            column(ItemNo; "No.")
            {
            }

            column(Description; Description)
            {
            }

            column(Quantity; Quantity)
            {
            }

            column(UnitPrice; "Unit Price")
            {
            }

            column(LineAmount; "Line Amount")
            {
            }
        }
    }

    rendering
    {
        layout(SalesOrderSummaryLayout)
        {
            Type = RDLC;
            LayoutFile = './Modules/Sales/SalesOrder/Reports/Layouts/CMISalesOrderSummary.rdl';
            Caption = 'Sales Order Summary';
            Summary = 'Displays sales order header and line information';
        }
    }

}
