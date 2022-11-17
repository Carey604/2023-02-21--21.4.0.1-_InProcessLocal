pageextension 50524 "CATPurchase Order Subform50524" extends "Purchase Order Subform"
{   //CAT.001 2021-08-20 CL - add fiix field
    layout
    {
        addafter("Expected Receipt Date")
        {
            field("CATJob No.59857"; Rec."Job No.")
            {
                ApplicationArea = All;
            }
            field("CATJob Task No.58266"; Rec."Job Task No.")
            {
                ApplicationArea = All;
            }
            field("CAT Ship Date"; Rec."CAT Ship Date")
            {
                ApplicationArea = All;
            }
            field("CAT Print on PO Confirmation"; Rec."CAT Print on PO Confirmation")
            {
                ApplicationArea = All;
            }
            field("CAT Item Type"; CATItem.Type)
            {
                ApplicationArea = All;
                Editable = false;
                Caption = 'Item Type';
            }
            //>>CAT.001
            field("CAT Fiix Work Order No."; Rec."CAT Fiix Work Order No.")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the Fiix work order no.';
            }
            //<<CAT.001
        }
        modify("GST/HST")
        {
            Visible = false;
        }
        modify("Tax Area Code")
        {
            Visible = false;
        }
        modify("Location Code")
        {
            Visible = false;
        }
        modify("Bin Code")
        {
            Visible = false;
        }
        modify("Reserved Quantity")
        {
            Visible = false;
        }
        modify("Qty. to Assign")
        {
            Visible = false;
        }
        moveafter("Direct Unit Cost"; "Line Amount")
        modify("Qty. Assigned")
        {
            Visible = false;
        }
        modify("Shortcut Dimension 2 Code")
        {
            Visible = false;
        }
    }
    actions
    {
    }

    trigger OnNewRecord(BelowxRec: Boolean);
    begin
        Rec.Type := Rec.CATGetDefaultLineType();
    end;

    trigger OnAfterGetRecord()
    begin
        CATItem.RESET;
        IF (Rec.Type = Rec.Type::Item) AND (Rec."No." <> '') then
            CATItem.GET(Rec."No.");
    end;

    var
        CATItem: Record Item;


}
