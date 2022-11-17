pageextension 50510 "CATCash Receipt Journal50510" extends "Cash Receipt Journal"
{
    layout
    {
        moveafter("Amount (LCY)"; "Applies-to Doc. No.")
        modify("Applies-to Doc. Type")
        {
            Visible = false;
        }
        addafter("Applies-to Doc. No.")
        {
            field("CATCurrency Code92721"; Rec."Currency Code")
            {
                ApplicationArea = All;
            }
        }
        modify("Shortcut Dimension 1 Code")
        {
            Visible = false;
        }
        modify("Shortcut Dimension 2 Code")
        {
            Visible = false;
        }
        modify(ShortcutDimCode3)
        {
            Visible = false;
        }
        modify(ShortcutDimCode4)
        {
            Visible = false;
        }
        modify(ShortcutDimCode5)
        {
            Visible = false;
        }
        modify(ShortcutDimCode6)
        {
            Visible = false;
        }
        modify(Correction)
        {
            Visible = false;
        }
    }
    actions
    {
    }
}
