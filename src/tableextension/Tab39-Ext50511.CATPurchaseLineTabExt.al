tableextension 50511 "CAT Purchase Line TabExt" extends "Purchase Line" //39
{
    // CAT.001 2019-12-20 - new tabext
    // CAT.002 2020-12-09 CL 
    // - add function to change No. and 
    // CAT.003 2021-08-19 CL - add field 50502
    fields
    {
        field(50500; "CAT Ship Date"; Date)
        {
            Caption = 'Ship Date';
        }
        field(50501; "CAT Print on PO Confirmation"; Boolean)
        {
            Caption = 'Print on PO Confirmation';
            InitValue = true;
        }
        //>>CAT.003
        field(50502; "CAT Fiix Work Order No."; Text[250])
        {
            Caption = 'Fiix WO#';
            DataClassification = ToBeClassified;
        }
        //<<CAT.003
    }
    procedure CATGetDefaultLineType(): Integer
    var
        PurchSetup: Record "Purchases & Payables Setup";
    begin
        PurchSetup.Get();
        exit(PurchSetup."CAT Def. New Purch. Line Type");
    end;

    procedure CATUpdateGLAccNo()
    var
        PurchSetup: Record "Purchases & Payables Setup";
        OrigGLAcc: Record "G/L Account";
        GLAcc: Record "G/L Account";
        NewGLAcc: Record "G/L Account";

        Text001: Label 'You cannot change %1 because the order line is associated with sales order %2.';
        Text044: Label 'You cannot change %1 because this purchase order is associated with %2 %3.';
    begin
        //logic copied from "purchase line"."No." OnValidate trigger
        Rec.CATTestHeaderIsRequisition();
        Rec.Testfield("Document No.");
        Rec.TestField("Document Type", Rec."Document Type"::Quote);
        Rec.TestField(Type, Type::"G/L Account");
        Rec.TestField("No."); //if is blank, should use the standard No. validation
        Rec.TestStatusOpen();

        if Rec."Drop Shipment" then
            Error(Text001, FieldCaption("No."), "Sales Order No.");
        if Rec."Special Order" then
            Error(Text001, FieldCaption("No."), "Special Order Sales No.");
        if Rec."Prod. Order No." <> '' then
            Error(Text044, FieldCaption(Type), FieldCaption("Prod. Order No."), "Prod. Order No.");

        //put logic to get the glacc here 
        NewGLAcc.FilterGroup(2);
        if Rec."No." > '' then
            NewGLAcc.get("No.");
        NewGLAcc.SetRange("Account Type", NewGLAcc."Account Type"::Posting);
        //For now, don't filter on blocked, so that the user can see all the posting accounts and select.
        //It will error on subsequent CheckGLAcc call.
        NewGLAcc.FilterGroup(0);
        if not (Page.RunModal(0, NewGLAcc) = Action::LookupOK) then
            exit;
        NewGLAcc.TestField("No.");

        if NewGLAcc."No." <> rec."No." then begin
            if not OrigGLAcc.Get(Rec."No.") then
                clear(OrigGLAcc);
            Rec."No." := NewGLAcc."No.";

            GLAcc.Get("No.");
            GLAcc.CheckGLAcc;
            if not "System-Created Entry" then
                GLAcc.TestField("Direct Posting", true);
            if Rec.Description = OrigGLAcc.Name then
                Description := GLAcc.Name;
            "Gen. Prod. Posting Group" := GLAcc."Gen. Prod. Posting Group";
            "VAT Prod. Posting Group" := GLAcc."VAT Prod. Posting Group";
            //leave these as is for now.
            //"Tax Group Code" := GLAcc."Tax Group Code";
            //"Allow Invoice Disc." := false;
            //"Allow Item Charge Assignment" := false;

            // for now this is commented out. Leave the dims as they are.
            // CreateDim(
            //     DimMgt.TypeToTableID3(Type.AsInteger()), "No.",
            //     DATABASE::Job, "Job No.",
            //     DATABASE::"Responsibility Center", "Responsibility Center",
            //     DATABASE::"Work Center", "Work Center No.");
            Modify();
        end;
    end;

    procedure CATTestHeaderIsRequisition(): Boolean
    var
        PurchHeader: Record "Purchase Header";
    begin
        PurchHeader.Get(Rec."Document Type", Rec."Document No.");
        PurchHeader.CATTestRequisition(true);
    end;
}