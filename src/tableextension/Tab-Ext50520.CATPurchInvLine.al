tableextension 50520 "CAT Purch. Inv. Line" extends "Purch. Inv. Line"
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