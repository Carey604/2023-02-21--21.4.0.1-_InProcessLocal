pageextension 50523 "CAT Purchase Order" extends "Purchase Order" //50
{
    //CAT.002 2020-05-12 CL - add field and actions
    //CAT.003 2021-08-20 CL - add field
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
