pageextension 50520 "CAT Purchase Invoice" extends "Purchase Invoice"  //51
{
    //CAT.002 2020-05-12 CL - add fields, then comment them out. Left them here just in case we want to uncomment out later.
    layout
    {
        modify("Buy-from Contact")
        {
            Importance = Additional;
        }
        moveafter("Vendor Invoice No."; "Tax Area Code")
        moveafter("Tax Area Code"; "Provincial Tax Area Code")
        moveafter("Provincial Tax Area Code"; "Shortcut Dimension 1 Code")
        moveafter("Shortcut Dimension 1 Code"; "Shortcut Dimension 2 Code")
        modify("Provincial Tax Area Code")
        {
            Importance = Standard;
        }
        addbefore("Vendor Invoice No.")
        {
            field("CAT Vendor Order No."; "Vendor Order No.")
            {
                ApplicationArea = All;
                Importance = Standard;
            }
        }
        modify("Purchaser Code")
        {
            Importance = Standard;
        }
        modify("Buy-from Vendor No.")
        {
            Importance = Standard;
        }
        moveafter("Buy-from Vendor Name"; "Purchaser Code")
        movebefore("Document Date"; "Posting Date")
        modify("Posting Date")
        {
            Importance = Standard;
        }
        //>>CAT.002
        // addafter(Status)
        // {
        //     field("CAT Blanket Order Version No."; "CAT Blanket Order Version No.")
        //     {
        //         ApplicationArea = All;
        //         ToolTip = 'Specifies the Blanket Order Version No.';
        //     }
        //     field("CAT Purchase Order Version No."; "CAT Purchase Order Version No.")
        //     {
        //         ApplicationArea = All;
        //         ToolTip = 'Specifies the Purchase Order Version No.';
        //     }
        // }
        //<<CAT.002
    }
    actions
    {
    }
}
