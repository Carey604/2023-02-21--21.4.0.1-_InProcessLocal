pageextension 50563 "CAT Doc. Attach. PageExt DA" extends "Ex Document Approval"
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