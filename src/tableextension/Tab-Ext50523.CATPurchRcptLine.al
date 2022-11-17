tableextension 50523 "CAT Purch. Rcpt. Line" extends "Purch. Rcpt. Line"
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