pageextension 50537 "CATPostedPurchaseReceipts50537" extends "Posted Purchase Receipts"//145
{
    //CAT.001 2022-01-18 TM - Added attachment part
    //CAT.002 2022-03-11 CL- add vendor shipment no.
    layout
    {
        addafter("No.")
        {
            field("Order No."; "Order No.")
            {
                ApplicationArea = All;
            }
        }
        //>>CAT.002
        addbefore("Shortcut Dimension 1 Code")
        {
            field("CAT Vendor Shipment No."; Rec."Vendor Shipment No.")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the vendor shipment no.';
            }
        }
        //<<CAT.002

        addbefore(Control1900383207)
        {
            part("Attached Documents"; "Document Attachment Factbox")
            {
                ApplicationArea = All;
                Caption = 'Attachments';
                SubPageLink = "Table ID" = CONST(120),
                              "No." = FIELD("No.");
            }
        }
    }
    actions
    {
    }
}
