tableextension 50522 "CAT Purch. Line Archive" extends "Purchase Line Archive"
{
    fields
    {
        field(50500; "CAT Ship Date"; Date)
        {
            Caption = 'Ship Date';
        }
        field(50501; "CAT Print on PO Confirmation"; Boolean)
        {
            Caption = 'Print on PO Confirmation';
        }
    }

    var
    //myInt: Integer;
}