namespace fundamentals.fundamentals;

using Microsoft.Inventory.Item;
using CuongMai.Fundamentals.Inventory.Item;

codeunit 50100 "CMI Item Quality Mgt."
{
    var
        ItemNotFoundErr: Label 'Item %1 does not exist.',
        Comment = '%1 = Item No.';

        ItemFoundMsg: Label 'Item %1 - %2 was found. Quality Level: %3.',
        Comment = '%1 = Item No., %2 = Item Description, %3 = Quality Level.';

        NoPremiumItemMsg: Label 'No Premium item was found.';
        NoRestrictedItemMsg: Label 'No Restricted item was found.';

        QualityLevelChangedMsg: Label 'Quality Level for item %1 has been changed to %2.',
        Comment = '%1 = Item No., %2 = new Quality Level.';

        QualityLevelUnchangedMsg: Label 'Item %1 already has Quality Level %2.',
        Comment = '%1 = Item No., %2 = current Quality Level.';

    #region Get

    procedure ShowItem(ItemNo: Code[20])
    var
        Item: Record Item;
    begin
        if not Item.Get(ItemNo) then
            Error(ItemNotFoundErr, ItemNo);

        Message(ItemFoundMsg, Item."No.", Item.Description, Item."CMI Quality Level");
    end;

    #endregion Get

    #region FindFirst

    procedure ShowFirstPremiumItem()
    var
        Item: Record Item;
    begin
        Item.SetRange("CMI Quality Level", Item."CMI Quality Level"::Premium);

        if not Item.FindFirst() then begin
            Message(NoPremiumItemMsg);
            exit;
        end;

        Message(ItemFoundMsg, Item."No.", Item.Description, Item."CMI Quality Level");
    end;

    #endregion FindFirst

    #region FindSet

    procedure ShowPremiumItems()
    var
        Item: Record Item;
    begin
        Item.SetRange("CMI Quality Level", Item."CMI Quality Level"::Premium);

        if not Item.FindSet(false) then begin
            Message(NoPremiumItemMsg);
            exit
        end;

        repeat
            Message(
                ItemFoundMsg, Item."No.", Item.Description, Item."CMI Quality Level"
            );
        until Item.Next() = 0;

    end;

    #endregion FindSet

    #region SetFilter

    procedure ShowRestrictedItems(ItemNoFilter: Text)
    var
        Item: Record Item;
    begin
        Item.SetRange("CMI Quality Level", Item."CMI Quality Level"::Restricted);

        if ItemNoFilter <> '' then
            Item.SetFilter("No.", ItemNoFilter);

        if not Item.FindSet(false) then begin
            Message(NoRestrictedItemMsg);
            exit;
        end;

        repeat
            Message(
                ItemFoundMsg, Item."No.", Item.Description, Item."CMI Quality Level"
            );
        until Item.Next() = 0;
    end;

    #endregion SetFilter

    #region ValidateAndModify

    procedure SetItemQualityLevel(
        ItemNo: Code[20];
        NewQualityLevel: Enum "CMI Item Quality Level"
    )
    var
        Item: Record Item;
    begin
        if not Item.Get(ItemNo) then
            Error(ItemNotFoundErr, ItemNo);

        if Item."CMI Quality Level" = NewQualityLevel then begin
            Message(QualityLevelUnchangedMsg, Item."No.", NewQualityLevel);
            exit;
        end;

        Item.Validate("CMI Quality Level", NewQualityLevel);

        Item.Modify(true);

        Message(QualityLevelChangedMsg, Item."No.", NewQualityLevel);
    end;

    #endregion ValidateAndModify

    #region Helper

    procedure GetItemCountByQualityLevel(
        QualityLevel: Enum "CMI Item Quality Level"
    ): Integer
    var
        Item: Record Item;
    begin
        Item.SetRange("CMI Quality Level", QualityLevel);

        exit(Item.Count());
    end;

    #endregion Helper


}
