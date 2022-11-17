pageextension 50527 "CAT Purchase Quote" extends "Purchase Quote" //49
{
    // CAT.002 2020-05-12 CL - add field and actions
    // CAT.003 2021-08-20 CL - add field Fiix Purchase Order No.
    layout
    {
        modify("Campaign No.")
        {
            Visible = false;
        }
        modify("Responsibility Center")
        {
            Visible = false;
        }
        modify("Assigned User ID")
        {
            Importance = Standard;
        }
        modify(Status)
        {
            Importance = Standard;
        }
        modify("Purchaser Code")
        {
            Importance = Additional;
        }
        modify("Buy-from Contact")
        {
            Importance = Additional;
        }
        modify("Vendor Shipment No.")
        {
            Importance = Additional;
        }
        moveafter(Status; "Shortcut Dimension 2 Code")
        moveafter("Shortcut Dimension 2 Code"; "Shortcut Dimension 1 Code")
        modify("Currency Code")
        {
            Visible = true;
        }
        modify("Expected Receipt Date")
        {
            Visible = false;
        }
        modify("VAT Bus. Posting Group")
        {
            Visible = false;
        }
        modify("Payment Terms Code")
        {
            Importance = Additional;
            Visible = false;
        }
        modify("Payment Method Code")
        {
            Visible = false;
        }
        modify("Transaction Type")
        {
            Visible = false;
        }
        modify("Payment Discount %")
        {
            Visible = false;
        }
        modify("Pmt. Discount Date")
        {
            Visible = false;
        }
        modify("Shipment Method Code")
        {
            Visible = false;
        }
        modify("Payment Reference")
        {
            Visible = false;
        }
        modify("Creditor No.")
        {
            Visible = false;
        }
        modify("On Hold")
        {
            Visible = false;
        }
        modify("Tax Liable")
        {
            Visible = false;
        }
        modify("Tax Area Code")
        {
            Visible = false;
        }
        addbefore("Document Date")
        {
            field("CAT CATPosting Date"; "Posting Date")
            {
                ApplicationArea = all;
                Importance = Standard;
            }
        }
        moveafter("Buy-from Vendor Name"; "Purchaser Code")
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
