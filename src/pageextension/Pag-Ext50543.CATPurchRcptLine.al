pageextension 50543 "CAT Purch. Rcpt. Line" extends "Posted Purchase Receipt Lines"
{
    layout
    {
        addlast(Control1)
        {
            field(CAT_Correction; Correction)
            {
                ApplicationArea = All;
            }
        }
    }
}