pageextension 50554 "CAT Posted Purch. Inv. Subform" extends "Posted Purch. Invoice Subform"
{
    layout
    {
        addlast(Control1)
        {
            field("CAT Ship Date"; "CAT Ship Date")
            {
                Caption = 'Ship Date';
                ApplicationArea = All;
            }
            field("CAT Print on PO Confirmation"; "CAT Print on PO Confirmation")
            {
                Caption = 'Print on PO Confirmation';
                ApplicationArea = All;
            }
        }
    }

    actions
    {
        // Add changes to page actions here
    }

    var
    //myInt: Integer;
}