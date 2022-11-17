pageextension 50553 "CAT Pur. Order Archive Subform" extends "Purchase Order Archive Subform"
{
    layout
    {
        addlast(Control1)
        {
            field("CAT Ship Date"; "CAT Ship Date")
            {
                ApplicationArea = All;
                Caption = 'Ship Date';
            }
            field("CAT Print on PO Confirmation"; "CAT Print on PO Confirmation")
            {
                ApplicationArea = All;
                Caption = 'Print on PO Confirmation';
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