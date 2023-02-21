pageextension 50536 "CATVendor List50536" extends "Vendor List" //27
{
    // CAT.001 2023-02-02 CL - add to existing pagext. Add field. Also prepended Rec to field names (not commented).
    layout
    {
        addafter("Search Name")
        {
            field(Balance; Rec.Balance)
            {
                ApplicationArea = All;
            }
        }
        addafter("Balance (LCY)")
        {
            field("Balance Due"; Rec."Balance Due")
            {
                ApplicationArea = All;
            }
        }
        //>>CAT.001
        addafter("Phone No.")
        {
            field("CAT E-Mail"; Rec."E-Mail")
            {
                ApplicationArea = All;
                ExtendedDatatype = EMail;
                ToolTip = 'Specifies the vendor''s email address.';
            }
        }
        //<<CAT.001
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
