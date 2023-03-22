pageextension 50523 "CAT Purchase Order" extends "Purchase Order" //50
{
    // CAT.002 2020-05-12 CL - add field and actions
    // CAT.003 2021-08-20 CL - add field
    // CAT.004 2022-12-01 CL - add fields
    // CAT.005 2023-02-21 CL - add fields
    layout
    {
        modify("Buy-from Contact")
        {
            Importance = Additional;
        }
        modify("Vendor Invoice No.")
        {
            Importance = Additional;
        }
        modify("Vendor Shipment No.")
        {
            Importance = Additional;
        }
        moveafter("Vendor Invoice No."; "Tax Area Code")
        moveafter("Tax Area Code"; "Provincial Tax Area Code")
        moveafter("Provincial Tax Area Code"; "Shortcut Dimension 1 Code")
        moveafter("Shortcut Dimension 1 Code"; "Shortcut Dimension 2 Code")
        modify("Tax Area Code")
        {
            Importance = Standard;
        }
        modify("Purchaser Code")
        {
            Importance = Standard;
        }
        modify(Status)
        {
            Importance = Standard;
        }
        modify("Responsibility Center")
        {
            Visible = false;
        }
        modify("No. of Archived Versions")
        {
            Importance = Standard;
        }
        //>>CAT.004
        addbefore("Quote No.")
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
        //<<CAT.004
        addafter("Shipment Method Code")
        {
            field("CAT CATTransport Method36882"; "Transport Method")
            {
                ApplicationArea = All;
            }
        }
        moveafter("Buy-from Vendor Name"; "Purchaser Code")
        movebefore("Document Date"; "Posting Date")
        modify("Posting Date")
        {
            Importance = Standard;
        }
        //>>CAT.002
        addafter(Status)
        {
            field("CAT Blanket Order Version No."; "CAT Blanket Order Version No.")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the Blanket Order Version No.';
            }
            field("CAT Purchase Order Version No."; "CAT Purchase Order Version No.")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the Purchase Order Version No.';
            }
            //>>CAT.003
            field("CAT Fiix Purchase Order No."; Rec."CAT Fiix Purchase Order No.")
            {
                ApplicationArea = All;
                Importance = Standard;
                Tooltip = 'Specifies the Fiix purchase order no.';
            }
            //<<CAT.003
        }
        addafter("Document Date")
        {
            field("CAT Original Document Date"; "CAT Original Document Date")
            {
                ApplicationArea = All;
                Caption = 'Original Document Date';
                Editable = false;
            }
        }
        //<<CAT.002
        //>>CAT.005
        addlast(General)
        {
            field("CAT Approved Amount"; Rec."CAT Approved Amount")
            {
                ApplicationArea = All;
                Editable = false;
                ToolTip = 'Specifies the amount previously approved. This value can be calculated and setby certain workflows.';
            }
            field("CAT Amt. Over Approved Amt."; Rec."CAT Amt. Over Approved Amt.")
            {
                ApplicationArea = All;
                Editable = false;
                Visible = false;
                ToolTip = 'Specifies the amount by which the order is greater than the approved amount. This value can be calculated and set by certain workflows.';
            }
            field("CAT Line Approved Amount"; Rec."CAT Line Approved Amount")
            {
                ApplicationArea = All;
                Editable = false;
                Visible = false;
                ToolTip = 'Specifies the sum of amounts previously approved on purchase lines. This value can be calculated and setby certain workflows.';
            }
            field("CAT Line Amt. Over Appr. Amt."; Rec."CAT Line Amt. Over Appr. Amt.")
            {
                ApplicationArea = All;
                Editable = false;
                Visible = false;
                ToolTip = 'Specifies the sum of order line amounts by which the order line''s amount is greater than the lines''s previously approved amount. This value can be calculated and set by certain workflows.';
            }
        }
        //<<CAT.005
    }
    actions
    {
        //CAT.002
        addfirst("F&unctions")
        {
            action("CAT Increment Version No.")
            {
                ApplicationArea = All;
                Caption = 'Increment Version No.';
                Ellipsis = true;
                Image = MoveUp;
                ToolTip = 'Increment the version no.';

                trigger OnAction()
                begin
                    CATIncrementVersion();
                    CurrPage.Update(true);
                end;
            }

        }
        //<<CAT.002
    }
}
