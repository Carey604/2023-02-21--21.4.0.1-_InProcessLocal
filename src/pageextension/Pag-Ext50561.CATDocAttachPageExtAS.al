pageextension 50561 "CAT Doc. Attach. PageExt AS" extends "Ex Approval Status"
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