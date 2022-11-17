pageextension 50512 "CATVendor Card50512" extends "Vendor Card"
{
    layout
    {
        addafter("Bank Communication")
        {
            field("CATVAT Registration No.22061"; Rec."VAT Registration No.")
            {
                ApplicationArea = All;
            }
        }
        modify(County)
        {
            Visible = true;
        }
        moveafter(City; County)
    }
    actions
    {
    }
}
