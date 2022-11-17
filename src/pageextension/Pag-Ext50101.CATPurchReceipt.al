pageextension 50101 "CATPurchReceipt" extends "Posted Purchase Receipt"
{
    layout
    {
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
}
