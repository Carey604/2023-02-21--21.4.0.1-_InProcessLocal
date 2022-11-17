pageextension 50536 "CATVendor List50536" extends "Vendor List"
{
    layout
    {
        addafter("Search Name")
        {
            field(Balance; Balance)
            {
                ApplicationArea = All;
            }
        }
        addafter("Balance (LCY)")
        {
            field("Balance Due"; "Balance Due")
            {
                ApplicationArea = All;
            }
        }
        modify("Location Code")
        {
            Visible = false;
        }
        modify("Phone No.")
        {
            Visible = false;
        }
        modify("Search Name")
        {
            Visible = false;
        }
    }
    actions
    {
    }
}
