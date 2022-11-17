pageextension 50538 "CATGet Receipt Lines50538" extends "Get Receipt Lines"
{
    layout
    {
        addafter("Document No.")
        {
            field("Order No."; "Order No.")
            {
                ApplicationArea = All;
            }
        }
    }
    actions
    {
    }
}
