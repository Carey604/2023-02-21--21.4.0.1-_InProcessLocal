pageextension 50559 "CAT Purchase Order List" extends "Purchase Order List" //9307
{   // CAT.001 2021-08-20 CL - new page extension
    layout
    {
        addbefore(Status)
        {
            field("CAT Fiix Purchase Order No."; Rec."CAT Fiix Purchase Order No.")
            {
                ApplicationArea = All;
                Importance = Standard;
                Tooltip = 'Specifies the Fiix purchase order no.';
            }

        }
    }

    actions
    {
    }
}