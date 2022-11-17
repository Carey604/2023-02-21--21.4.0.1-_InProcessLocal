pageextension 50514 "CATVendor Ledger Entries50514" extends "Vendor Ledger Entries"
{
    layout
    {
        modify("Payment Reference")
        {
            Visible = false;
        }
        modify("Creditor No.")
        {
            Visible = false;
        }
        modify("Payment Method Code")
        {
            Visible = false;
        }
        addafter("Vendor No.")
        {
            field("CATVendor Name62091"; "Vendor Name")
            {
                ApplicationArea = All;
            }
        }
        moveafter("Currency Code"; "Remaining Amount")
        moveafter("Remaining Amount"; "Remaining Amt. (LCY)")
    }
    actions
    {
    }
}
