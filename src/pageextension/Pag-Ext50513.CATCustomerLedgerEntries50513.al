pageextension 50513 "CATCustomerLedgerEntries50513" extends "Customer Ledger Entries"
{
    layout
    {
        moveafter("Currency Code"; "Remaining Amount")
        moveafter("Remaining Amount"; "Remaining Amt. (LCY)")
        addafter("Customer No.")
        {
            field("CATCustomer Name93903"; "Customer Name")
            {
                ApplicationArea = All;
            }
        }
    }
    actions
    {
    }
}
