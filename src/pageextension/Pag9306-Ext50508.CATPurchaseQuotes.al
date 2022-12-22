pageextension 50508 "CAT Purchase Quotes" extends "Purchase Quotes" //9306
{
    //CAT.001 2020-12-17 CL - new pagext
    //- add fields
    // CAT.002 2021-08-20 CL - add field Fiix Purchase Order No.
    // CAT.003 2022-12-01 CL - add fields

    layout
    {
        addafter("No.")
        {
            field("CAT Requisition"; Rec."CAT Requisition")
            {
                ApplicationArea = All;
                Editable = false;
                ToolTip = 'Specifies whether the quote is a requisition.';
            }
            //>>CAT.003
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
            //<<CAT.003
        }
        //>>CAT.002
        addbefore(Status)
        {
            field("CAT Fiix Purchase Order No."; Rec."CAT Fiix Purchase Order No.")
            {
                ApplicationArea = All;
                Importance = Standard;
                Tooltip = 'Specifies the Fiix purchase order no.';
            }

        }
        //<<CAT.002
    }

    actions
    {
    }
    //17.0.0.5>>
    trigger OnOpenPage()
    var
    begin
        rec.filtergroup(2);
        rec.setrange("CAT Requisition", false);
        rec.FilterGroup(0);

    end;
    //17.0.0.5<<
}