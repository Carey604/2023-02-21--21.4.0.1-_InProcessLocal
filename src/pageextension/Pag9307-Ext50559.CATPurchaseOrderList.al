pageextension 50559 "CAT Purchase Order List" extends "Purchase Order List" //9307
{   // CAT.001 2021-08-20 CL - new page extension
    // CAT.002 2022-12-01 CL - add fields
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
            //>>CAT.002
            // field("CAT CEIC Equipment Tag No."; Rec."CAT CEIC Equipment Tag No.")
            // {
            //     ApplicationArea = All;
            //     ToolTip = 'Specifies the CEIC Equipment Tag No.';
            // }
            field("CAT Purch. Order Status Code"; Rec."CAT Purch. Order Status Code")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the purchase order status code.';
            }
            field("CAT Purchase Type"; Rec."CAT Purchase Type")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the purchase type.';
            }
            field("CAT Purchase Requisition No."; Rec."CAT Purchase Requisition No.")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the No. from the original purchase requisition that was used to generate the purchase header.';
            }
            //<<CAT.002
        }
    }

    actions
    {
    }
}