codeunit 50103 "CAT InstallCodeunit"
// CAT.001 2022-11-29 CL - new codeunit
// CAT.002 2023-03-02 CL - new procedure CATUpdatePurchHeader to recalculate field. PurchaseHeader."CAT Amt. Over Approved Amt." is allowed to go negative now. Before, it was set to 0 if negative.
{
    Subtype = Install;

    trigger OnInstallAppPerCompany()
    var
        AppModuleInfo: ModuleInfo;
    begin
        NavApp.GetCallerModuleInfo(AppModuleInfo); //The version of ms base app
        //error('AppModuleInfo.DataVersion:%1', AppModuleInfo.DataVersion);
        NavApp.GetCurrentModuleInfo(AppModuleInfo); //The version of the app

        if AppModuleInfo.AppVersion <= Version.Create(21, 4, 0, 2) then
            FreshInstall()
        else begin
            CATPurchDocApprovalAmountWorkflow();
        end;
        // if AppModuleInfo.DataVersion <= Version.Create(21, 3, 0, 4) then
        //     FreshInstall()
        // else
        //     FreshInstall();

    end;

    local procedure FreshInstall()
    var
    begin
        CATPurchDocApprovalAmountWorkflow();
        CATUpdatePurchaseCATApprovedAmount(); // ++CAT.002
    end;

    local procedure CATPurchDocApprovalAmountWorkflow()
    var
        WorkflowResponseHandling: Codeunit "Workflow Response Handling";
        WorkflowEventHandling: Codeunit "Workflow Event Handling";

    begin
        WorkflowResponseHandling.CreateResponsesLibrary(); //calls OnAddWorkflowResponsesToLibrary (and OnAddWorkflowResponsePredecessorsToLibrary is called downstream) that we subscribe to in codeunit 50102
        WorkflowEventHandling.CreateEventsLibrary(); //calls OnAddWorkflowEventsToLibrary and OnAddWorkflowTableRelationsToLibrary event triggers that we subscribe to in codeunit 50102
    end;

    //>>CAT.002
    local procedure CATUpdatePurchaseCATApprovedAmount()
    var
        PurchaseHeader: Record "Purchase Header";
        PurchaseLine: Record "Purchase Line";
        NewAmt: Decimal;
    begin
        PurchaseHeader.ModifyAll("CAT Amt. Over Approved Amt.", 0, false);
        PurchaseLine.ModifyAll("CAT Amt. Over Approved Amt.", 0, false);

        PurchaseHeader.Reset();
        PurchaseHeader.SetRange("CAT Previously Approved", true);
        if PurchaseHeader.FindSet() then
            repeat
                PurchaseHeader.CalcFields(Amount);
                NewAmt := PurchaseHeader.Amount - PurchaseHeader."CAT Approved Amount";
                if NewAmt <> PurchaseHeader."CAT Amt. Over Approved Amt." then begin
                    PurchaseHeader."CAT Amt. Over Approved Amt." := NewAmt;
                    PurchaseHeader.Modify(false);
                end;

                PurchaseLine.reset;
                PurchaseLine.SetRange("Document Type", PurchaseHeader."Document Type");
                PurchaseLine.SetRange("Document No.", PurchaseHeader."No.");
                if PurchaseLine.FindSet() then
                    repeat
                        NewAmt := PurchaseLine.Amount - PurchaseLine."CAT Approved Amount";
                        if NewAmt <> PurchaseLine."CAT Amt. Over Approved Amt." then begin
                            PurchaseLine."CAT Amt. Over Approved Amt." := NewAmt;
                            PurchaseLine.Modify(false);
                        end;
                    until PurchaseLine.Next() = 0;
            until PurchaseHeader.Next() = 0;
    end;
    //<<CAT.002

}
