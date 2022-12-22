pageextension 50104 "CAT Purchase List" extends "Purchase List" //53
{
    // CAT.001 2022-12-02 CL - new pagext

    layout
    {
        addlast(Control1)
        {
            field("CAT CEIC Equipment Tag No."; Rec."CAT CEIC Equipment Tag No.")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the CEIC Equipment Tag No.';
            }
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

        }
    }

    actions
    {

    }
}
