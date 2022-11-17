page 50501 "CE Doc. Attach. FactBox"
{
    PageType = ListPart;
    Caption = 'Purchase Receipt Attachments';
    SourceTableTemporary = true;
    SourceTable = "Purchase Header";

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field(ReceiptNo; rec."Vendor Invoice No.")
                {
                    ApplicationArea = All;
                    Caption = 'Receipt No.';
                    trigger OnDrillDown()
                    var
                        PurchRcptHeader: Record "Purch. Rcpt. Header";
                        PostedPurchaseReceipt: Page "Posted Purchase Receipt";
                    begin
                        PurchRcptHeader.Reset();
                        PurchRcptHeader.SetRange("No.", Rec."No.");
                        if PurchRcptHeader.FindFirst() then begin
                            Clear(PostedPurchaseReceipt);
                            PostedPurchaseReceipt.SetTableView(PurchRcptHeader);
                            PostedPurchaseReceipt.RunModal();
                        end;
                    end;
                }
                field("No. Printed"; Rec."No. Printed")
                {
                    ApplicationArea = All;
                    Caption = 'No. of Attachments';
                    trigger OnDrillDown()
                    var
                        DocumentAttachment: Record "Document Attachment";
                        DocumentAttachments: Page "Document Attachment Details";
                    begin
                        DocumentAttachment.Reset();
                        DocumentAttachment.SetRange("Table ID", Database::"Purch. Rcpt. Header");
                        DocumentAttachment.SetRange("No.", Rec."No.");
                        if DocumentAttachment.FindSet() then begin
                            Clear(DocumentAttachments);
                            DocumentAttachments.SetTableView(DocumentAttachment);
                            DocumentAttachments.RunModal();
                        end;
                    end;
                }
            }
        }
    }

    internal procedure UpdateListImportJournal(InboundDocumentNo: BigInteger)
    var
        ExPurchaseDocumentLine: Record "Ex Purchase Document Line";
        PurchRcptHdr: Record "Purch. Rcpt. Header";
        DocumentAttachment: Record "Document Attachment";
    begin
        Rec.Reset();
        Rec.DeleteAll();

        ExPurchaseDocumentLine.Reset();
        ExPurchaseDocumentLine.SetRange("Inbound Document No.", InboundDocumentNo);
        if ExPurchaseDocumentLine.FindSet() then begin
            repeat
                if ExPurchaseDocumentLine."Receipt No." <> '' then begin
                    if not Rec.Get(Rec."Document Type"::Order, ExPurchaseDocumentLine."Receipt No.") then begin
                        Rec.Init();
                        Rec."Document Type" := Rec."Document Type"::Order;
                        Rec."No." := ExPurchaseDocumentLine."Receipt No.";
                        Rec."Vendor Invoice No." := ExPurchaseDocumentLine."Receipt No.";
                        DocumentAttachment.Reset();
                        DocumentAttachment.SetRange("Table ID", Database::"Purch. Rcpt. Header");
                        DocumentAttachment.SetRange("No.", ExPurchaseDocumentLine."Receipt No.");
                        Rec."No. Printed" := DocumentAttachment.Count;
                        if Rec."No. Printed" <> 0 then
                            Rec.Insert(false);
                    end;
                end;
            until ExPurchaseDocumentLine.Next() = 0;
        end;
        if Rec.FindFirst() then;

        CurrPage.Update(false);
    end;


    internal procedure UpdateListApprovalStatus(ExDocument: Record "Ex Document")
    var
        PurchaseLine: Record "Purchase Line";
        PurchRcptHdr: Record "Purch. Rcpt. Header";
        DocumentAttachment: Record "Document Attachment";
    begin
        Rec.Reset();
        Rec.DeleteAll();

        if ExDocument."Document Type" <> ExDocument."Document Type"::Invoice then
            exit;

        PurchaseLine.Reset();
        PurchaseLine.SetRange("Document Type", ExDocument."Document Type");
        PurchaseLine.SetRange("Document No.", ExDocument."Document No.");
        if PurchaseLine.FindSet() then begin
            repeat
                if PurchaseLine."Receipt No." <> '' then begin
                    if not Rec.Get(Rec."Document Type"::Order, PurchaseLine."Receipt No.") then begin
                        Rec.Init();
                        Rec."Document Type" := Rec."Document Type"::Order;
                        Rec."No." := PurchaseLine."Receipt No.";
                        Rec."Vendor Invoice No." := PurchaseLine."Receipt No.";
                        DocumentAttachment.Reset();
                        DocumentAttachment.SetRange("Table ID", Database::"Purch. Rcpt. Header");
                        DocumentAttachment.SetRange("No.", PurchaseLine."Receipt No.");
                        Rec."No. Printed" := DocumentAttachment.Count;
                        if Rec."No. Printed" <> 0 then
                            Rec.Insert(false);
                    end;
                end;
            until PurchaseLine.Next() = 0;
        end;
        if Rec.FindFirst() then;

        CurrPage.Update(false);
    end;

    internal procedure UpdateListApprovalStatusHistory(ExPostedDocument: Record "Ex Posted Document")
    var
        PurchInvLine: Record "Purch. Inv. Line";
        PurchRcptHeader: Record "Purch. Rcpt. Header";
        ExPostedDocumentLine: Record "Ex Posted Document Line";
        ValueEntry: Record "Value Entry";
        ReceiptValueEntry: Record "Value Entry";
        DocumentAttachment: Record "Document Attachment";
    begin
        Rec.Reset();
        Rec.DeleteAll();

        if ExPostedDocument."Document Type" <> ExPostedDocument."Document Type"::"Posted Invoice" then
            exit;

        PurchInvLine.Reset();
        PurchInvLine.SetRange("Document No.", ExPostedDocument."Document No.");
        if PurchInvLine.FindSet() then begin
            repeat
                if PurchInvLine."Receipt No." <> '' then begin
                    if PurchInvLine."No." <> '' then begin
                        if not rec.get(rec."Document Type"::Order, PurchInvLine."Receipt No.") then begin
                            rec.init();
                            rec."Document Type" := rec."Document Type"::Order;
                            rec."No." := PurchInvLine."Receipt No.";
                            rec."Vendor Invoice No." := PurchInvLine."Receipt No.";
                            DocumentAttachment.Reset();
                            DocumentAttachment.SetRange("Table ID", Database::"Purch. Rcpt. Header");
                            DocumentAttachment.SetRange("No.", PurchInvLine."Receipt No.");
                            rec."No. Printed" := DocumentAttachment.count;
                            if rec."No. Printed" <> 0 then
                                rec.Insert(false);
                        end;
                    end else begin
                        ValueEntry.Reset();
                        ValueEntry.SetCurrentKey("Item Ledger Entry No.", "Document No.", "Document Line No.");
                        ValueEntry.SetRange("Document No.", PurchInvLine."Document No.");
                        ValueEntry.SetRange("Document Line No.", PurchInvLine."Line No.");
                        ValueEntry.SetRange("Item Ledger Entry Type", ValueEntry."Item Ledger Entry Type"::Purchase);
                        ValueEntry.SetRange("Document Type", ValueEntry."Document Type"::"Purchase Invoice");
                        if ValueEntry.FindFirst() then begin
                            ReceiptValueEntry.Reset();
                            ReceiptValueEntry.SetCurrentKey("Item Ledger Entry No.", "Entry Type");
                            ReceiptValueEntry.SetRange("Item Ledger Entry No.", ValueEntry."Item Ledger Entry No.");
                            ReceiptValueEntry.SetRange("Document Type", ReceiptValueEntry."Document Type"::"Purchase Receipt");
                            if ReceiptValueEntry.FindFirst() then begin
                                if not Rec.Get(Rec."Document Type"::Order, ReceiptValueEntry."Document No.") then begin
                                    Rec.Init();
                                    Rec."Document Type" := Rec."Document Type"::Order;
                                    Rec."No." := ReceiptValueEntry."Document No.";
                                    Rec."Vendor Invoice No." := ReceiptValueEntry."Document No.";
                                    DocumentAttachment.Reset();
                                    DocumentAttachment.SetRange("Table ID", Database::"Purch. Rcpt. Header");
                                    DocumentAttachment.SetRange("No.", ReceiptValueEntry."Document No.");
                                    Rec."No. Printed" := DocumentAttachment.Count;
                                    if Rec."No. Printed" <> 0 then
                                        Rec.Insert(false);
                                end;
                            end;
                        end;
                    end;
                end;
            until PurchInvLine.Next() = 0;
        end;
        if Rec.FindFirst() then;

        CurrPage.Update(false);

    end;
}