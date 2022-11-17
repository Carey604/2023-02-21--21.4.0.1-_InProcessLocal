pageextension 50562 "CAT Doc. Attach. PageExt DH" extends "Ex Document Head"
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
        CurrPage.ReceiptDocumentAttachment.Page.UpdateListApprovalStatus(Rec);
        IsFactBoxVisible := Rec."Document Type" = Rec."Document Type"::Invoice;
    end;

    var
        IsFactBoxVisible: Boolean;
}