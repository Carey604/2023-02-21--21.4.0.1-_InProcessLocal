pageextension 50565 "CAT Doc. Attach. PageExt AH" extends "Ex Approval History"
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
        CurrPage.ReceiptDocumentAttachment.Page.UpdateListApprovalStatusHistory(Rec);
        IsFactBoxVisible := Rec."Document Type" = Rec."Document Type"::"Posted Invoice";
    end;

    var
        IsFactBoxVisible: Boolean;
}