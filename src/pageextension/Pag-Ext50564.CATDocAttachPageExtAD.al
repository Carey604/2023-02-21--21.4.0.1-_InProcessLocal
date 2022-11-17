pageextension 50564 "CAT Doc. Attach. PageExt AD" extends "Ex Approval Documents"
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