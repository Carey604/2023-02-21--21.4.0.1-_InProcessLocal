tableextension 50521 "CAT Purch. Cr. Memo Line" extends "Purch. Cr. Memo Line"
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