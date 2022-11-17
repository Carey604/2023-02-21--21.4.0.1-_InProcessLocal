pageextension 50560 "CAT Doc. Attach. PageExt IJ" extends "Ex Purch. Doc. Worksheet"
{
    layout
    {
        addfirst(factboxes)
        {
            part(ReceiptDocumentAttachment; "CE Doc. Attach. FactBox")
            {
                ApplicationArea = All;
                Editable = false;
                Visible = IsFactBoxVisible;
            }
        }
    }

    trigger OnAfterGetCurrRecord()
    begin
        CurrPage.ReceiptDocumentAttachment.Page.UpdateListImportJournal(Rec."Inbound Document No.");
        IsFactBoxVisible := Rec."ExFlow Document Type" = Rec."ExFlow Document Type"::Invoice;
    end;

    var
        IsFactBoxVisible: Boolean;
}