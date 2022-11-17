codeunit 50101 "CATDocumentAttachmentEvents"
{
    //CAT.001 2022-01-18 TM - New Codeunit to handle the attaching of documents to Purchase Receipts.
    [EventSubscriber(ObjectType::Page, Page::"Document Attachment Factbox", 'OnBeforeDrillDown', '', false, false)]
    local procedure OnBeforeDrillDown(DocumentAttachment: Record "Document Attachment"; var RecRef: RecordRef);
    var
        PurchRcptHdr: Record "Purch. Rcpt. Header";
    begin
        case DocumentAttachment."Table ID" of

            DATABASE::"Purch. Rcpt. Header":
                begin
                    //RecRef.Open(DATABASE::"Purch. Rcpt. Header");
                    if PurchRcptHdr.Get(DocumentAttachment."No.") then
                        RecRef.GetTable(PurchRcptHdr);
                end;
        end;
    end;

    [EventSubscriber(ObjectType::Table, Database::"Document Attachment", 'OnAfterInitFieldsFromRecRef', '', false, false)]
    local procedure OnAfterInitFieldsFromRecRef(var DocumentAttachment: Record "Document Attachment"; var RecRef: RecordRef);
    var
        PurchRcptHdr: Record "Purch. Rcpt. Header";
        FieldRef: FieldRef;
        RecNo: Code[20];
    begin
        case DocumentAttachment."Table ID" of
            DATABASE::"Purch. Rcpt. Header":
                begin
                    FieldRef := RecRef.Field(3);
                    RecNo := FieldRef.Value;
                    documentattachment.Validate("No.", RecNo);
                end;
        end;

    end;

    [EventSubscriber(ObjectType::Page, Page::"Document Attachment Details", 'OnAfterOpenForRecRef', '', false, false)]
    local procedure OnAfterOpenForRecRef(var DocumentAttachment: Record "Document Attachment"; var RecRef: RecordRef; var FlowFieldsEditable: Boolean);
    var
        FieldRef: FieldRef;
        RecNo: Code[20];
    begin
        case RecRef.Number of
            DATABASE::"Purch. Rcpt. Header":
                begin
                    FieldRef := RecRef.Field(3);
                    RecNo := FieldRef.Value;
                    DocumentAttachment."Table ID" := RecRef.Number;
                    documentattachment.SetRange("No.", RecNo);
                    FlowFieldsEditable := false;
                end;
        end;
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Purch.-Post", 'OnAfterInsertReceiptHeader', '', false, false)]
    local procedure OnAfterInsertReceiptHeader(var PurchHeader: Record "Purchase Header"; var PurchRcptHeader: Record "Purch. Rcpt. Header"; var TempWhseRcptHeader: Record "Warehouse Receipt Header"; WhseReceive: Boolean; CommitIsSuppressed: Boolean);
    var
        FromRecRef: RecordRef;
        ToRecRef: RecordRef;
    begin
        FromRecRef.GetTable(PurchHeader);
        ToRecRef.GetTable(PurchRcptHeader);
        CopyAttachmentsForPostedDocs(FromRecRef, ToRecRef);
    end;

    //Copied from Document Attachment Management CU 1173
    procedure CopyAttachmentsForPostedDocs(var FromRecRef: RecordRef; var ToRecRef: RecordRef)
    var
        FromDocumentAttachment: Record "Document Attachment";
        ToDocumentAttachment: Record "Document Attachment";
        FromFieldRef: FieldRef;
        ToFieldRef: FieldRef;
        FromDocumentType: Option Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order";
        FromNo: Code[20];
        ToNo: Code[20];
        IsHandled: Boolean;
    begin
        IsHandled := false;

        if IsHandled then
            exit;

        FromDocumentAttachment.SetRange("Table ID", FromRecRef.Number);

        FromFieldRef := FromRecRef.Field(1);
        FromDocumentType := FromFieldRef.Value();
        FromDocumentAttachment.SetRange("Document Type", FromDocumentType);

        FromFieldRef := FromRecRef.Field(3);
        FromNo := FromFieldRef.Value();
        FromDocumentAttachment.SetRange("No.", FromNo);

        // Find any attached docs for headers (sales / purch)
        if FromDocumentAttachment.FindSet() then begin
                                                     repeat
                                                         Clear(ToDocumentAttachment);
                                                         ToDocumentAttachment.Init();
                                                         ToDocumentAttachment.TransferFields(FromDocumentAttachment);
                                                         ToDocumentAttachment.Validate("Table ID", ToRecRef.Number);

                                                         ToFieldRef := ToRecRef.Field(3);
                                                         ToNo := ToFieldRef.Value();
                                                         ToDocumentAttachment.Validate("No.", ToNo);
                                                         Clear(ToDocumentAttachment."Document Type");
                                                         ToDocumentAttachment.Insert(true);

                                                     until FromDocumentAttachment.Next() = 0;
        end;
        //        CopyAttachmentsForPostedDocsLines(FromRecRef, ToRecRef);
    end;

}
