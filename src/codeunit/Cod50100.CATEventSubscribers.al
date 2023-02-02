codeunit 50100 "CAT Event Subscribers"
{
    // CAT.001 2019-12-20 CL - new codeunit. 
    // CAT.002 2020-05-12 CL - add eventsubscriber to codeunit 97 OnBeforePurchOrderHeaderModify
    // CAT.003 2021-01-22 CL - Purchase Requisition. Change event subscriber to codeunit 97 OnBeforePurchOrderHeaderModify because it marked for removal.
    // CAT.004 2021-03-02 CL - Purchase Requisition. Use new "Purchases & Payables Setup"."CAT Requisition Quote Nos.".
    // CAT.005 2022-03-07 CL - item posting - copy source item no to gl entry.
    // CAT.006 2022-11-30 CL - Purchase Header. Do not validate dimensions when Purchaser Code is updated.
    //  - OnBeforeReleasePurchaseDoc - check fields
    //  - OnBeforePurchQuoteToOrder - check fields
    // CAT.007 2023-01-19 CL - subscriber to OnAfterSubstituteReport to replace report 11383 with 50106
    // CAT.008 2023-01-23 CL - add check to CAT.006 OnBeforeReleasePurchaseDoc


    [EventSubscriber(ObjectType::Report, Report::"Suggest Job Jnl. Lines", 'OnAfterTransferTimeSheetDetailToJobJnlLine', '', false, false)]
    local procedure Rep952SuggestJobJnlLines_OnAfterTransferTimeSheetDetailToJobJnlLine(var JobJournalLine: Record "Job Journal Line"; JobJournalTemplate: Record "Job Journal Template"; var TempTimeSheetLine: Record "Time Sheet Line" temporary; TimeSheetDetail: Record "Time Sheet Detail"; JobJournalBatch: Record "Job Journal Batch")
    // Function to set dimensions when the user runs rep952 "Suggest Job Jnl. Lines" (typically from Job Journal page 201 page action).
    // The dimensions are to come from the job task line.
    var
        JobTaskDim: Record "Job Task Dimension"; //pk: "Job No.", "Job Task No.", "Dimension Code"
        DimMgt: Codeunit DimensionManagement;
        DimSetID: integer;
    begin
        //replace the dimensions with the dimensions that were on the JobTaskDim that the time sheet detail is related to
        JobTaskDim.SetRange("Job No.", TimeSheetDetail."Job No.");
        JobTaskDim.SetRange("Job Task No.", TimeSheetDetail."Job Task No.");
        if not JobTaskDim.IsEmpty then
            DimSetID := GetDimSetIDFromJobTaskDim(JobTaskDim)
        else
            DimSetID := 0;
        JobJournalLine."Dimension Set ID" := DimSetID;
        JobJournalLine."Dimension Set ID" := TimeSheetDetail."Dimension Set ID"; //++RAMIN
        //DimMgt.UpdateGlobalDimFromDimSetID(DimSetID, JobJournalLine."Shortcut Dimension 1 Code", JobJournalLine."Shortcut Dimension 2 Code");
        DimMgt.UpdateGlobalDimFromDimSetID(TimeSheetDetail."Dimension Set ID", JobJournalLine."Shortcut Dimension 1 Code", JobJournalLine."Shortcut Dimension 2 Code"); //++RAMIN
    end;

    local procedure GetDimSetIDFromJobTaskDim(var JobTaskDim: Record "Job Task Dimension"): Integer
    var
        TempDimSetEntry: Record "Dimension Set Entry" temporary;
    begin
        if JobTaskDim.FindSet() then
            repeat
                TempDimSetEntry."Dimension Code" := JobTaskDim."Dimension Code";
                TempDimSetEntry.validate("Dimension Value Code", JobTaskDim."Dimension Value Code");
                TempDimSetEntry.insert;
            until JobTaskDim.Next() = 0;

        TempDimSetEntry.reset;
        if not TempDimSetEntry.IsEmpty then
            exit(TempDimSetEntry.GetDimensionSetID(TempDimSetEntry))
        else
            exit(0);
    end;

    //>>CAT.002
    [EventSubscriber(ObjectType::Table, database::"Purchase Header", 'OnAfterInitRecord', '', false, false)]
    local procedure tab38PurchaseHeader_OnAfterInitRecord(VAR PurchHeader: Record "Purchase Header")
    var
    begin
        if PurchHeader."Document Type" = PurchHeader."Document Type"::"Blanket Order" then
            PurchHeader."CAT Blanket Order Version No." := 1
        else
            PurchHeader."CAT Purchase Order Version No." := 1;
    end;

    [EventSubscriber(ObjectType::Codeunit, CodeUnit::"Blanket Purch. Order to Order", 'OnBeforePurchOrderHeaderModify', '', false, false)]
    local procedure cod97BlanketPurchOrdertoOrder_OnBeforePurchOrderHeaderModify(var PurchOrderHeader: Record "Purchase Header"; BlanketOrderPurchHeader: Record "Purchase Header")
    var
    begin
        PurchOrderHeader."CAT Blanket Order Version No." := BlanketOrderPurchHeader."CAT Blanket Order Version No.";
        PurchOrderHeader."CAT Purchase Order Version No." := 1;
    end;
    //<<CAT.002

    //>>CAT.003
    //Method 'OnBeforeInsertPurchOrderHeader' is marked for removal. Reason: Replaced by OnCreatePurchHeaderOnBeforePurchOrderHeaderModify(). Tag: 17.0.
    //[EventSubscriber(ObjectType::Codeunit, CodeUnit::"Purch.-Quote to Order", 'OnBeforeInsertPurchOrderHeader', '', false, false)]
    // local procedure cod96PurchQuotetoOrder_OnBeforeInsertPurchOrderHeader(var PurchOrderHeader: Record "Purchase Header"; PurchQuoteHeader: Record "Purchase Header")
    // var
    // begin
    //     PurchOrderHeader."CAT Blanket Order Version No." := PurchQuoteHeader."CAT Blanket Order Version No.";
    //     PurchOrderHeader."CAT Purchase Order Version No." := PurchQuoteHeader."CAT Purchase Order Version No.";
    // end;

    [EventSubscriber(ObjectType::Codeunit, CodeUnit::"Purch.-Quote to Order", 'OnCreatePurchHeaderOnBeforePurchOrderHeaderModify', '', false, false)]
    local procedure cod96PurchQuotetoOrder_OnCreatePurchHeaderOnBeforePurchOrderHeaderModify(var PurchOrderHeader: Record "Purchase Header"; var PurchHeader: Record "Purchase Header")
    var
    begin
        PurchOrderHeader."CAT Blanket Order Version No." := PurchHeader."CAT Blanket Order Version No.";
        PurchOrderHeader."CAT Purchase Order Version No." := PurchHeader."CAT Purchase Order Version No.";
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Copy Document Mgt.", 'OnAfterCopyFieldsFromOldPurchHeader', '', false, false)]
    local procedure cod6620CopyDocumentMgt_OnAfterCopyFieldsFromOldPurchHeader(var ToPurchHeader: Record "Purchase Header"; OldPurchHeader: Record "Purchase Header"; MoveNegLines: Boolean; IncludeHeader: Boolean)
    begin
        ToPurchHeader."CAT Blanket Order Version No." := OldPurchHeader."CAT Blanket Order Version No.";
        ToPurchHeader."CAT Purchase Order Version No." := OldPurchHeader."CAT Purchase Order Version No.";
    end;
    //<<CAT.003

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Release Purchase Document", 'OnAfterReleasePurchaseDoc', '', false, false)]
    local procedure CATOnAfterReleasePurchaseDocument(var PurchaseHeader: Record "Purchase Header"; PreviewMode: Boolean; var LinesWereModified: Boolean)
    begin
        IF (PurchaseHeader."CAT Original Document Date" = 0D) AND (PurchaseHeader."Document Type" = PurchaseHeader."Document Type"::Order) then begin
            PurchaseHeader."CAT Original Document Date" := PurchaseHeader."Document Date";
            PurchaseHeader.MODIFY;
        end;
    end;

    //>>CAT.003
    // [EventSubscriber(ObjectType::Codeunit, Codeunit::"Purch.-Quote to Order (Yes/No)", 'OnBeforePurchQuoteToOrder', '', false, false)]
    // local procedure Cod93_OnBeforePurchQuoteToOrder(var PurchaseHeader: Record "Purchase Header"; var IsHandled: Boolean)
    // begin
    //     //PurchaseHeader.CATTestRequisition(true);
    // end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Page Management", 'OnAfterGetPageID', '', false, false)]
    local procedure Cod700_OnAfterGetPageID(RecordRef: RecordRef; var PageID: Integer)
    var
        FldRef: FieldRef;
        BoolVal: Boolean;
    begin
        if RecordRef.Number = Database::"Purchase Header" then
            if RecordRef.FieldExist(50010) then begin //fieldno 50010 is "CAT Requisition" boolean field
                FldRef := RecordRef.Field(50010);
                BoolVal := FldRef.Value();
                if BoolVal = true then
                    if PageID = Page::"Purchase Quote" then
                        PageID := Page::"CAT Purchase Requisition";
            end;
    end;
    //<<CAT.003

    //>>CAT.004
    [EventSubscriber(ObjectType::Table, Database::"Purchase Header", 'OnAfterTestNoSeries', '', false, false)]
    local procedure tab38_OnAfterTestNoSeries(var PurchHeader: Record "Purchase Header")
    var
        PurchSetup: Record "Purchases & Payables Setup";
    begin
        if not PurchHeader.CATIsRequisition() then
            exit;

        if PurchHeader."Document Type" = PurchHeader."Document Type"::Quote then begin
            PurchSetup.Get();
            PurchSetup.TestField("CAT Requisition Quote Nos.");
        end;
    end;

    [EventSubscriber(ObjectType::Table, Database::"Purchase Header", 'OnAfterGetNoSeriesCode', '', false, false)]
    local procedure tab38_OnAfterGetNoSeriesCode(var PurchHeader: Record "Purchase Header"; PurchSetup: Record "Purchases & Payables Setup"; var NoSeriesCode: Code[20])
    begin
        if not PurchHeader.CATIsRequisition() then
            exit;
        if PurchHeader."Document Type" <> PurchHeader."Document Type"::Quote then
            exit;

        NoSeriesCode := PurchSetup."CAT Requisition Quote Nos.";
    end;
    //<<CAT.004

    //>>CAT.005
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Inventory Posting To G/L", 'OnBeforePostInvtPostBufProcessGlobalInvtPostBuf', '', false, false)]
    local procedure cod5802_OnBeforePostInvtPostBufProcessGlobalInvtPostBuf(var GlobalInvtPostBuf: Record "Invt. Posting Buffer"; var GenJnlLine: Record "Gen. Journal Line"; var ValueEntry: Record "Value Entry"; var GenJnlPostLine: Codeunit "Gen. Jnl.-Post Line"; CalledFromItemPosting: Boolean; PostPerPostGroup: Boolean; var IsHandled: Boolean);
    var
        DescrTxt: Label '(%1) %2';
    begin
        if not PostPerPostGroup then begin
            GenJnlLine."CAT Source Item No." := ValueEntry."Item No.";
        end else
            GenJnlLine."CAT Source Item No." := '';
        if GenJnlLine."CAT Source Item No." > '' then
            GenJnlLine.Description := copystr(StrSubstNo(DescrTxt, genjnlline."CAT Source Item No.", GenJnlLine.Description), 1, MaxStrLen(GenJnlLine.Description));

    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Gen. Jnl.-Post Line", 'OnInsertGLEntryOnBeforeAssignTempGLEntryBuf', '', false, false)]
    local procedure cod12_OnInsertGLEntryOnBeforeAssignTempGLEntryBuf(var GLEntry: Record "G/L Entry"; GenJournalLine: Record "Gen. Journal Line"; GLRegister: Record "G/L Register");
    begin
        if GenJournalLine."CAT Source Item No." > '' then
            GLEntry."CAT Source Item No." := GenJournalLine."CAT Source Item No.";
    end;
    //<<CAT.005

    //>>CAT.006 - bypass updating dims when purchaser code changes
    [EventSubscriber(ObjectType::Table, Database::"Purchase Header", 'OnAfterInitDefaultDimensionSources', '', false, false)]
    local procedure OnAfterInitDefaultDimensionSources(var PurchaseHeader: Record "Purchase Header"; var DefaultDimSource: List of [Dictionary of [Integer, Code[20]]]; FieldNo: Integer);
    begin
        if FieldNo = PurchaseHeader.FieldNo("Purchaser Code") then
            PurchaseHeader."CAT Purch. Code Dim. IsHandled" := true
        else
            PurchaseHeader."CAT Purch. Code Dim. IsHandled" := false;
    end;

    [EventSubscriber(ObjectType::Table, Database::"Purchase Header", 'OnBeforeCreateDim', '', false, false)]
    local procedure OnBeforeCreateDim(var PurchaseHeader: Record "Purchase Header"; var IsHandled: Boolean; var DefaultDimSource: List of [Dictionary of [Integer, Code[20]]]);
    begin
        IsHandled := PurchaseHeader."CAT Purch. Code Dim. IsHandled";
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Release Purchase Document", 'OnBeforeReleasePurchaseDoc', '', false, false)]
    local procedure OnBeforeReleasePurchaseDoc(var PurchaseHeader: Record "Purchase Header"; PreviewMode: Boolean; var SkipCheckReleaseRestrictions: Boolean; var IsHandled: Boolean);
    var
        CATPurchaseTypeErrTxt: Label 'cannot be blank';
    begin
        //>>CAT.008
        case PurchaseHeader."Document Type" of
            PurchaseHeader."Document Type"::Quote, PurchaseHeader."Document Type"::Order:
                begin
                    If PurchaseHeader."CAT Purchase Type" = PurchaseHeader."CAT Purchase Type"::" " then
                        PurchaseHeader.FieldError("CAT Purchase Type", CATPurchaseTypeErrTxt);
                end;
        end;
        //<<CAT.008
        //>>CAT.008 start delete
        // If PurchaseHeader."CAT Purchase Type" = PurchaseHeader."CAT Purchase Type"::" " then
        //     PurchaseHeader.FieldError("CAT Purchase Type", CATPurchaseTypeErrTxt);
        //<<CAT.008
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Purch.-Quote to Order (Yes/No)", 'OnBeforePurchQuoteToOrder', '', false, false)]
    local procedure OnBeforePurchQuoteToOrder(var PurchaseHeader: Record "Purchase Header"; var IsHandled: Boolean);
    var
        CATPurchaseTypeErrTxt: Label 'cannot be blank';
    begin
        If PurchaseHeader."CAT Purchase Type" = PurchaseHeader."CAT Purchase Type"::" " then
            PurchaseHeader.FieldError("CAT Purchase Type", CATPurchaseTypeErrTxt);
    end;

    //<<CAT.006
    //>>CAT.007
    [EventSubscriber(ObjectType::Codeunit, Codeunit::ReportManagement, 'OnAfterSubstituteReport', '', false, false)]
    local procedure OnAfterSubstituteReport(ReportId: Integer; RunMode: Option; RequestPageXml: Text; RecordRef: RecordRef; var NewReportId: Integer);
    begin
        case ReportId of
            report::"ExportElecPayments - Word": //11383
                NewReportId := 50106;
        end;
    end;
    //<<CAT.007

    var

}