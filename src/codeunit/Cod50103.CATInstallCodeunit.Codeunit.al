codeunit 50103 "CAT InstallCodeunit"
// CAT.001 2022-11-29 CL - new codeunit
{
    Subtype = Install;

    trigger OnInstallAppPerCompany()
    var
        AppModuleInfo: ModuleInfo;
    begin
        NavApp.GetCallerModuleInfo(AppModuleInfo); //The version of ms base app
        //error('AppModuleInfo.DataVersion:%1', AppModuleInfo.DataVersion);
        NavApp.GetCurrentModuleInfo(AppModuleInfo); //The version of the app

        if AppModuleInfo.DataVersion <= Version.Create(21, 3, 0, 4) then
            FreshInstall()
        else
            FreshInstall();

    end;

    local procedure FreshInstall()
    var
    begin
        CATPurchDocApprovalAmountWorkflow();
    end;

    local procedure CATPurchDocApprovalAmountWorkflow()
    var
        WorkflowResponseHandling: Codeunit "Workflow Response Handling";
        WorkflowEventHandling: Codeunit "Workflow Event Handling";

    begin
        WorkflowResponseHandling.CreateResponsesLibrary(); //calls OnAddWorkflowResponsesToLibrary (and OnAddWorkflowResponsePredecessorsToLibrary is called downstream) that we subscribe to in codeunit 50102
        WorkflowEventHandling.CreateEventsLibrary(); //calls OnAddWorkflowEventsToLibrary and OnAddWorkflowTableRelationsToLibrary event triggers that we subscribe to in codeunit 50102
    end;

}
