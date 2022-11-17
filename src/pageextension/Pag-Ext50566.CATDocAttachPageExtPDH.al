pageextension 50566 "CAT Doc. Attach. PageExt PDH" extends "Ex Posted Document Head"
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