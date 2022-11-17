pageextension 50551 "CAT Tax Groups" extends "Tax Groups"
{
    layout
    {
        addlast(Control1)
        {
            field("CAT PO Confirm. Description"; "CAT PO Confirm. Description")
            {
                ApplicationArea = All;
                Caption = 'PO Confirm. Description';
                ToolTip = 'The print description that appears on PO Confirmation reports.';
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