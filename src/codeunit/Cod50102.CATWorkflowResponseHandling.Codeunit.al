codeunit 50102 "CAT Workflow Response Handling"
{
    // CAT.001 2022-11-25 CL - new codeunit to handle new workflow responses. Created for adding functionality for a response to set Approved Amount on Purchase Header and Lines when Purchase Header is approved.

    /// <summary>
    /// AddWorkflowResponsesToLibrary subscribes to cod1521.OnAddWorkflowResponsesToLibrary, which is called at the end of cod1521.CreateResponsesLibrary.
    /// Add code here to add the event predecessors similar to how cod1521.CreateResponsesLibrary does it.
    /// </summary>
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Workflow Response Handling", 'OnAddWorkflowResponsesToLibrary', '', false, false)]
    local procedure cod1521_OnAddWorkflowResponsesToLibrary();
    var
        WorkflowResponseHandling: Codeunit "Workflow Response Handling";
        SetApprovedAmountTxt: Label 'Set Approved Purchase Amounts';
        CalcAndSetAmountOverApprovedAmountTxt: Label 'Calculate and Set Amount Over Approved Purchase Amounts';
    begin
        WorkflowResponseHandling.AddResponseToLibrary(CATSetApprovedPurchaseAmountsCode(), 0, SetApprovedAmountTxt, 'GROUP 0');
        WorkflowResponseHandling.AddResponseToLibrary(CATCalcAndSetAmountOverApprovedPurchaseAmountsCode(), 0, CalcAndSetAmountOverApprovedAmountTxt, 'GROUP 0');
    end;

    /// <summary>
    /// AddWorkflowResponsePredecessorsToLibrary subscribes to cod1521.OnAddWorkflowResponsePredecessorsToLibrary, which is called at the end of cod1521.AddResponsePredecessors.
    /// Add code here to add the event predecessors similar to how cod1520.AddResponsePrecessors does it.
    /// </summary>
    /// <param name="ResponseFunctionName">Code[128].</param>
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Workflow Response Handling", 'OnAddWorkflowResponsePredecessorsToLibrary', '', false, false)]
    local procedure cod1521_OnAddWorkflowResponsePredecessorsToLibrary(ResponseFunctionName: Code[128]);
    var
        WorkflowResponseHandling: Codeunit "Workflow Response Handling";
        WorkflowEventHandling: Codeunit "Workflow Event Handling";
    begin
        case ResponseFunctionName of
            CATSetApprovedPurchaseAmountsCode():
                begin
                    WorkflowResponseHandling.AddResponsePredecessor(CATCalcAndSetAmountOverApprovedPurchaseAmountsCode(), WorkflowEventHandling.RunWorkflowOnSendPurchaseDocForApprovalCode());
                    WorkflowResponseHandling.AddResponsePredecessor(CATSetApprovedPurchaseAmountsCode(), WorkflowEventHandling.RunWorkflowOnApproveApprovalRequestCode());
                end;
        end;
    end;

    //No events added yet.
    // [EventSubscriber(ObjectType::Codeunit, Codeunit::"Workflow Event Handling", 'OnAddWorkflowTableRelationsToLibrary', '', false, false)]
    // local procedure OnAddWorkflowTableRelationsToLibrary();
    // var
    //     WorkflowSetup: Codeunit "Workflow Setup";
    // begin
    //     //WorkflowSetup.InsertTableRelation(Database::"Purchase Header", 1, Database::"Approval Entry", 2);
    // end;


    /// <summary>
    /// CATSetApprovedPurchaseAmountsCode returns the code that identifies the response functionality to set approved amounts when the purchase document is approved
    /// </summary>
    /// <returns>Return value of type code[128].</returns>
    local procedure CATSetApprovedPurchaseAmountsCode(): code[128]
    begin
        exit('CATSETAPPROVEDPURCHASEAMOUNTS');
    end;

    /// <summary>
    /// CATCalcAndSetAmountOverApprovedPurchaseAmountsCode returns the code that odentifies the response functionality to calculate and set PO amounts that represent the current amount on purchase header and lines that exceeds previously approved amount.
    /// </summary>
    /// <returns>Return value of type code[128].</returns>
    local procedure CATCalcAndSetAmountOverApprovedPurchaseAmountsCode(): code[128]
    begin
        exit('CATCALCANDSETAMOUNTOVERAPPROVEDPURCHASEAMOUNTS');
    end;

    /// <summary>
    /// OnExecuteWorkflowResponse_CATSETAPPROVEDPURCHASEAMOUNTS subscribes to codeunit 1521 Workflow Response Handling OnExecuteWorkflowResponse event.
    /// It executes the code to handle the response.
    /// </summary>
    /// <param name="ResponseExecuted">VAR Boolean.</param>
    /// <param name="Variant">VAR Variant.</param>
    /// <param name="xVariant">Variant.</param>
    /// <param name="ResponseWorkflowStepInstance">Record "Workflow Step Instance".</param>
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Workflow Response Handling", 'OnExecuteWorkflowResponse', '', false, false)]
    local procedure OnExecuteWorkflowResponse_CATSETAPPROVEDPURCHASEAMOUNTS(var ResponseExecuted: Boolean; var Variant: Variant; xVariant: Variant; ResponseWorkflowStepInstance: Record "Workflow Step Instance");
    var
        WorkflowResponse: Record "Workflow Response";
    begin
        if WorkflowResponse.Get(ResponseWorkflowStepInstance."Function Name") then begin
            case WorkflowResponse."Function Name" of
                CATSetApprovedPurchaseAmountsCode:
                    begin
                        CATSetApprovedPurchaseAmounts(Variant, ResponseWorkflowStepInstance, ResponseExecuted);
                    end;
                CATCalcAndSetAmountOverApprovedPurchaseAmountsCode:
                    begin
                        CATCalcAndSetAmountOverApprovedPurchaseAmounts(Variant, ResponseWorkflowStepInstance, ResponseExecuted);
                    end;
            end;
        end;
    end;

    procedure CATSetApprovedPurchaseAmounts(Variant: Variant; WorkflowStepInstance: Record "Workflow Step Instance"; var ResponseExecuted: Boolean)
    var
        PurchaseHeader: Record "Purchase Header";
        PurchaseLine: Record "Purchase Line";
    begin
        if GetPurchaseHeader(Variant, PurchaseHeader) then begin
            PurchaseLine.SetRange("Document Type", PurchaseHeader."Document Type");
            PurchaseLine.SetRange("Document No.", PurchaseHeader."No.");
            if PurchaseLine.FindSet() then
                repeat
                    PurchaseLine."CAT Approved Amount" := PurchaseLine.Amount;
                    PurchaseLine."CAT Amt. Over Approved Amt." := 0;
                    PurchaseLine.Modify(false);
                until PurchaseLine.Next() = 0;
            PurchaseHeader.Calcfields(Amount);
            PurchaseHeader."CAT Approved Amount" := PurchaseHeader.Amount;
            PurchaseHeader."CAT Amt. Over Approved Amt." := 0;
            PurchaseHeader."CAT Previously Approved" := true;
            PurchaseHeader.Modify(false);
            ResponseExecuted := true;
        end;
    end;

    procedure CATCalcAndSetAmountOverApprovedPurchaseAmounts(Variant: Variant; WorkflowStepInstance: Record "Workflow Step Instance"; var ResponseExecuted: Boolean)
    var
        PurchaseHeader: Record "Purchase Header";
        PurchaseLine: Record "Purchase Line";
    begin
        if GetPurchaseHeader(Variant, PurchaseHeader) then begin
            PurchaseLine.SetRange("Document Type", PurchaseHeader."Document Type");
            PurchaseLine.SetRange("Document No.", PurchaseHeader."No.");
            if PurchaseLine.FindSet() then
                repeat
                    PurchaseLine."CAT Amt. Over Approved Amt." := PurchaseLine.Amount - PurchaseLine."CAT Approved Amount";
                    if PurchaseLine."CAT Amt. Over Approved Amt." < 0 then
                        PurchaseLine."CAT Amt. Over Approved Amt." := 0;
                    PurchaseLine.Modify(false);
                until PurchaseLine.Next() = 0;

            PurchaseHeader.CalcFields(Amount);
            PurchaseHeader."CAT Amt. Over Approved Amt." := PurchaseHeader.Amount - PurchaseHeader."CAT Approved Amount";
            if PurchaseHeader."CAT Amt. Over Approved Amt." < 0 then
                PurchaseHeader."CAT Amt. Over Approved Amt." := 0;
            PurchaseHeader.Modify();
            ResponseExecuted := true;
        end;
    end;

    local procedure GetPurchaseHeader(Variant: Variant; var PurchaseHeader: Record "Purchase Header"): Boolean
    var
        ApprovalEntry: Record "Approval Entry";
        WorkflowWebhookEntry: Record "Workflow Webhook Entry";
        RecRef: RecordRef;
        TargetRecRef: RecordRef;
    begin
        RecRef.GetTable(Variant);

        case RecRef.number of
            Database::"Approval Entry":
                begin
                    ApprovalEntry := Variant;
                    TargetRecRef.Get(ApprovalEntry."Record ID to Approve");
                    TargetRecRef.SetTable(PurchaseHeader);
                    exit(true);
                end;
            Database::"Workflow Webhook Entry":
                begin
                    WorkflowWebhookEntry := Variant;
                    TargetRecRef.Get(WorkflowWebhookEntry."Record ID");
                    TargetRecRef.SetTable(PurchaseHeader);
                    exit(true);
                end;
            Database::"Purchase Header":
                begin
                    PurchaseHeader := Variant;
                    if not PurchaseHeader.IsTemporary then
                        exit(true)
                    else begin
                        Clear(PurchaseHeader);
                        exit(false);
                    end;
                end;
        end;
    end;

    /// <summary>
    /// AddWorkflowEventsToLibrary subscribes to cod1520.OnAddWorkflowEventsToLibrary, which is called at end of cod1520.CreateEventsLibrary.
    /// Add code here to add the events to library similar to how cod1520.CreateEventsLibrary does it. Normally, if Events are added then this 
    /// procedure would be added to CAT Workflow Eevent Handling codeunit. There are no new events being created so instead of adding that codeunit 
    /// and the subcriber, we add the subscriber here so that we can do what is described in the next sentence.
    /// Use code here to also add records to table 1509 WF Event/Response Combination.
    /// </summary>
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Workflow Event Handling", 'OnAddWorkflowEventsToLibrary', '', false, false)]
    local procedure AddWorkflowEventsToLibrary();
    var
        WorkflowEventHandling: Codeunit "Workflow Event Handling";
    begin
        AddResponseWorkflowEventCombinationToLibrary(CATSetApprovedPurchaseAmountsCode(), WorkflowEventHandling.RunWorkflowOnApproveApprovalRequestCode());
    end;


    /// <summary>
    /// AddResponseWorkflowEventCombinationToLibrary creates records in table 1509 "WF Event/Response Combination" so that they can be selected as responses
    /// </summary>
    /// <param name="FunctionName"></param>
    /// <param name="PredecessorFunctionName"></param>
    local procedure AddResponseWorkflowEventCombinationToLibrary(FunctionName: Code[128]; PredecessorFunctionName: Code[128]);
    var
        WFEventResponseCombination: Record "WF Event/Response Combination";
    begin
        WFEventResponseCombination.Init();
        WFEventResponseCombination.Type := WFEventResponseCombination.Type::"Response";
        WFEventResponseCombination."Function Name" := FunctionName;
        WFEventResponseCombination."Predecessor Type" := WFEventResponseCombination."Predecessor Type"::"Event";
        WFEventResponseCombination."Predecessor Function Name" := PredecessorFunctionName;
        if WFEventResponseCombination.Insert() then;
    end;

    [EventSubscriber(ObjectType::Table, Database::"Purchase Line", 'OnAfterUpdateAmounts', '', false, false)]
    local procedure Tab39_OnAfterUpdateAmounts(var PurchLine: Record "Purchase Line"; var xPurchLine: Record "Purchase Line"; CurrFieldNo: Integer);
    begin
        PurchLine."CAT Amt. Over Approved Amt." := PurchLine.Amount - PurchLine."CAT Approved Amount";
        if PurchLine."CAT Amt. Over Approved Amt." < 0 then
            PurchLine."CAT Amt. Over Approved Amt." := 0;
    end;

    /// <summary>
    /// Tab39_OnValidateTypeOnBeforeInitRec subscribes to "Purchase Line".OnValidateTypeOnBeforeInitRec trigger. 
    /// When Type is changed on the Purchase Line then assume that any previously approved amounts are cancelled.
    /// </summary>
    /// <param name="PurchaseLine">VAR Record "Purchase Line".</param>
    /// <param name="xPurchaseLine">Record "Purchase Line".</param>
    /// <param name="CallingFieldNo">Integer.</param>
    [EventSubscriber(ObjectType::Table, Database::"Purchase Line", 'OnValidateTypeOnBeforeInitRec', '', false, false)]
    local procedure Tab39_OnValidateTypeOnBeforeInitRec(var PurchaseLine: Record "Purchase Line"; xPurchaseLine: Record "Purchase Line"; CallingFieldNo: Integer);
    begin
        if PurchaseLine.Type <> xPurchaseLine.Type then begin
            PurchaseLine."CAT Approved Amount" := 0;
            PurchaseLine."CAT Amt. Over Approved Amt." := PurchaseLine.Amount;
        end;
    end;

    /// <summary>
    /// Tab39_OnValidateNoOnBeforeInitRec subscribes to "Purchase Line".OnValidateNoOnBeforeInitRec trigger. 
    /// When "No." is changed on the Purchase Line then assume that any previously approved amounts are cancelled.
    /// </summary>
    /// <param name="PurchaseLine">VAR Record "Purchase Line".</param>
    /// <param name="xPurchaseLine">Record "Purchase Line".</param>
    /// <param name="CallingFieldNo">Integer.</param>
    [EventSubscriber(ObjectType::Table, Database::"Purchase Line", 'OnValidateNoOnBeforeInitRec', '', false, false)]
    local procedure Tab39_OnValidateNoOnBeforeInitRec(var PurchaseLine: Record "Purchase Line"; xPurchaseLine: Record "Purchase Line"; CallingFieldNo: Integer);
    begin
        if PurchaseLine."No." <> xPurchaseLine."No." then begin
            PurchaseLine."CAT Approved Amount" := 0;
            PurchaseLine."CAT Amt. Over Approved Amt." := PurchaseLine.Amount;
        end;
    end;
}
