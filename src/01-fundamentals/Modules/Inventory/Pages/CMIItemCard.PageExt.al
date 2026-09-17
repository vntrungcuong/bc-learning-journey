namespace CuongMai.Fundamentals.Inventory.Item;

using Microsoft.Inventory.Item;

pageextension 50103 "CMI Item Card Ext" extends "Item Card"
{
    layout
    {
        addafter(Description)
        {
            field("Quality Level"; Rec."CMI Quality Level")
            {
                ApplicationArea = All;
            }
        }
    }

    actions
    {
        addlast(Processing)
        {
            group(CMILearning)
            {
                Caption = 'CMI Learning';
                Image = Setup;

                action(CMIShowItem)
                {
                    Caption = 'Show Current Item';
                    ApplicationArea = All;
                    Image = ViewDetails;
                    ToolTip = 'Show information for the current item by retrieving it with the Get method.';

                    trigger OnAction()
                    var
                        ItemQualityMgt: Codeunit "CMI Item Quality Mgt.";
                    begin
                        ItemQualityMgt.ShowItem(Rec."No.");
                    end;
                }

                action(CMIShowFirstPremiumItem)
                {
                    Caption = 'Show First Premium Item';
                    ApplicationArea = All;
                    Image = ViewDetails;
                    ToolTip = 'Show the first item that has the Premium quality level.';

                    trigger OnAction()
                    var
                        ItemQualityMgt: Codeunit "CMI Item Quality Mgt.";
                    begin
                        ItemQualityMgt.ShowFirstPremiumItem();
                    end;
                }

                action(CMIShowPremiumItems)
                {
                    Caption = 'Show Premium Items';
                    ApplicationArea = All;
                    Image = List;
                    ToolTip = 'Shows all items that have the Premium quality level.';

                    trigger OnAction()
                    var
                        ItemQualityMgt: Codeunit "CMI Item Quality Mgt.";
                    begin
                        ItemQualityMgt.ShowPremiumItems();
                    end;
                }

                action(CMIShowRestrictedItems)
                {
                    Caption = 'Show Restricted Items';
                    ApplicationArea = All;
                    Image = FilterLines;
                    ToolTip = 'Show items that have the Restricted quality level using the specified item number filter.';

                    trigger OnAction()
                    var
                        ItemQualityMgt: Codeunit "CMI Item Quality Mgt.";
                        ItemNoFilter: Text;
                    begin
                        ItemNoFilter := '';

                        ItemQualityMgt.ShowRestrictedItems(ItemNoFilter);
                    end;
                }

                action(CMISetPremium)
                {
                    Caption = 'Set Quality to Premium';
                    ApplicationArea = All;
                    Image = Edit;
                    ToolTip = 'Changes the quality level of the current item to Premium.';

                    trigger OnAction()
                    var
                        ItemQualityMgt: Codeunit "CMI Item Quality Mgt.";
                    begin
                        ItemQualityMgt.SetItemQualityLevel(Rec."No.", Rec."CMI Quality Level"::Premium);

                        CurrPage.Update(false);
                    end;
                }

                action(CMISetRestricted)
                {
                    Caption = 'Set Quality to Restricted';
                    ApplicationArea = All;
                    Image = Edit;
                    ToolTip = 'Change the quality level of the current item to Restricted.';

                    trigger OnAction()
                    var
                        ItemQualityMgt: Codeunit "CMI Item Quality Mgt.";
                    begin
                        ItemQualityMgt.SetItemQualityLevel(Rec."No.", Rec."CMI Quality Level"::Restricted);

                        CurrPage.Update(false);
                    end;
                }

                action(CMIShowQualityCount)
                {
                    Caption = 'Count Premium Items';
                    ApplicationArea = All;
                    Image = Calculate;
                    ToolTip = 'Show the number of items that have the Premium quality level.';

                    trigger OnAction()
                    var
                        ItemQualityMgt: Codeunit "CMI Item Quality Mgt.";
                        PremiumItemCount: Integer;
                        PremiumItemCountMsg: Label 'Number of Premium items: %1', Comment = '%1 = number of Premium items.';
                    begin
                        PremiumItemCount := ItemQualityMgt.GetItemCountByQualityLevel(Rec."CMI Quality Level"::Premium);

                        Message(PremiumItemCountMsg, PremiumItemCount);
                    end;
                }
            }
        }
    }
}
