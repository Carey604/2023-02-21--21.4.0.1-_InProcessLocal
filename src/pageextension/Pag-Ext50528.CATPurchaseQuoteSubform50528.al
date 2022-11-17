pageextension 50528 "CATPurchase Quote Subform50528" extends "Purchase Quote Subform"
{   // CAT.001 2021-08-20 CL - add fiix field
    // CAT.002 2021-09-27 CL - add order date
    // CAT.003 2021-09-28 CL - replace order date with Requested Receipt Date
    layout
    {
        modify("Total VAT Amount")
        {
            Visible = false;
        }
        modify("Total Amount Incl. VAT")
        {
            Visible = false;
        }
        modify("Location Code")
        {
            Visible = false;
        }
        modify("Amount Including VAT")
        {
            Visible = false;
        }
        moveafter("Direct Unit Cost"; "Line Amount")
        modify("Line Discount %")
        {
            Visible = false;
        }
        modify("Qty. to Assign")
        {
            Visible = false;
        }
        modify("Qty. Assigned")
        {
            Visible = false;
        }
        modify("Tax Area Code")
        {
            Visible = false;
        }
        modify("Tax Group Code")
        {
            Visible = false;
        }
        modify("Shortcut Dimension 1 Code")
        {
            Visible = false;
        }
        addafter("Line Amount")
        {
            field("CATJob No."; Rec."Job No.")
            {
                ApplicationArea = All;
            }
            field("CATJob Task No."; Rec."Job Task No.")
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
        modify("Shortcut Dimension 2 Code")
        {
            Visible = false;
        }
        //>>CAT.002
        addafter(ShortcutDimCode8)
        {
            //--CAT.003field("Order Date"; Rec."Order Date")
            field("Requested Receipt Date"; Rec."Requested Receipt Date") //++CAT.003
            {
                ApplicationArea = All;
                Tooltip = 'Specifies the requested receipt date.';
            }
        }
        //<<CAT.002
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
