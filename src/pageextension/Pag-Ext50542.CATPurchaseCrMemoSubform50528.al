pageextension 50542 "CATPurchaseCrMemo Subform50528" extends "Purch. Cr. Memo Subform"
{
    layout
    {
        addlast(Control1)
        {
            field("CAT Ship Date"; "CAT Ship Date")
            {
                ApplicationArea = All;
            }
            field("CAT Print on PO Confirmation"; "CAT Print on PO Confirmation")
            {
                ApplicationArea = All;
                Editable = false;
                Visible = false;
            }
        }
    }

    actions
    {
    }

    trigger OnNewRecord(BelowxRec: Boolean);
    begin
        Type := CATGetDefaultLineType();
    end;

}
