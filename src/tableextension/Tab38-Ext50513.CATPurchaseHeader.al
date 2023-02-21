tableextension 50513 "CAT Purchase Header" extends "Purchase Header" //38
{
    // CAT.001 2020-05-12 CL - initial customization to add fields 50000..50001
    // CAT.002 2020-12-09 CL 
    // - add new function CATGetAssignedUserApproverID to get manager userid
    // - add function to change buy-from vendor no. and 
    // - new fields
    // CAT.003 2021-08-19 CL - add field 50012
    // CAT.004 2022-03-30 CL - copy notes when changing requisition to quote
    // CAT.005 2022-11-25 CL - purchase approval amounts 
    // CAT.006 2022-11-30 CL - remove dimension update when Purchase Code is changed. Recaption field. 
    // - New "Purchase Requisition No." field to store original "No."" value when requisition is converted to quote.
    // - new field "CAT Purch. Order Status Code"
    // - new CAT Purchase Type field
    // CAT.007 2023-02-08 CL - remove check on CAT Purchase Type field when converting to quote
    fields
    {
        field(50000; "CAT Blanket Order Version No."; Integer)
        {
            DataClassification = ToBeClassified;
            Caption = 'Blanket Order Version No.';
            InitValue = 0;
            MinValue = 0;
            Editable = false;
        }
        field(50001; "CAT Purchase Order Version No."; Integer)
        {
            DataClassification = ToBeClassified;
            Caption = 'Purchase Order Version No.';
            InitValue = 0;
            MinValue = 0;
            Editable = false;
        }
        field(50002; "CAT Original Document Date"; Date)
        {
            Caption = 'Original Document Date';
            Editable = false;
        }
        //>>CAT.002
        field(50005; "CAT Valid SDS"; Boolean)
        {
            DataClassification = ToBeClassified;
            Caption = 'Valid SDS';
        }
        field(50006; "CAT Submitted SDS"; Boolean)
        {
            DataClassification = ToBeClassified;
            Caption = 'Submitted SDS';
        }
        field(50007; "CAT Assigned User Approver ID"; code[50])
        {
            Caption = 'Assigned User Approver ID';
            FieldClass = FlowField;
            CalcFormula = lookup("User Setup"."Approver ID" WHERE("User ID" = field("Assigned User ID")));
            Editable = false;
        }
        field(50008; "CAT Approving Manager ID"; code[50])
        {
            Caption = 'Approving Manager';
            DataClassification = EndUserIdentifiableInformation;
            TableRelation = "User Setup";
        }

        field(50010; "CAT Requisition"; Boolean)
        {
            Caption = 'Requisition';
            InitValue = false;
        }
        field(50011; "CAT Requisition Priority"; Enum "CAT Purchase Req. Priority")
        {
            Caption = 'Purchase Requisition Priority';
            InitValue = "Standard";
        }
        //<<CAT.002
        //>>CAT.003
        field(50012; "CAT Fiix Purchase Order No."; Text[250])
        {
            //--CAT.006Caption = 'Fiix PO#';
            Caption = 'Fiix PO/MOC/WO#'; //++CAT.006;
            DataClassification = ToBeClassified;
        }
        //<<CAT.003
        //>>CAT.005
        field(50013; "CAT Approved Amount"; Decimal)
        {
            Caption = 'Approved Amount';
            DataClassification = CustomerContent;
            AutoFormatExpression = "Currency Code";
            AutoFormatType = 1;
        }
        field(50014; "CAT Amt. Over Approved Amt."; Decimal)
        {
            Caption = 'Amount Over Approved Amount';
            DataClassification = CustomerContent;
            AutoFormatExpression = "Currency Code";
            AutoFormatType = 1;
        }
        field(50015; "CAT Line Approved Amount"; Decimal)
        {
            Caption = 'Line Approved Amount';
            AutoFormatExpression = "Currency Code";
            AutoFormatType = 1;
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = sum("Purchase Line"."CAT Approved Amount" WHERE("Document Type" = FIELD("Document Type"),
                "Document No." = FIELD("No.")));
        }
        field(50016; "CAT Line Amt. Over Appr. Amt."; Decimal)
        {
            Caption = 'Line Amount Over Approved Amount';
            AutoFormatExpression = "Currency Code";
            AutoFormatType = 1;
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = sum("Purchase Line"."CAT Amt. Over Approved Amt." WHERE("Document Type" = FIELD("Document Type"),
                "Document No." = FIELD("No.")));
        }
        //<<CAT.005
        //>>CAT.006
        field(50017; "CAT Purch. Code Dim. IsHandled"; Boolean) // New field to store value. We set it in event trigger code and then in subsequent triggers skip if true
        {
            Caption = 'Purchaser Code Dimension Update IsHandled';
            DataClassification = CustomerContent;
            Editable = false;
        }
        field(50018; "CAT Purchase Requisition No."; Code[20]) // New field to store requisition no. so that it is retained when requisition is copied to new PO
        {
            Caption = 'Purchase Requisition No.';
            DataClassification = CustomerContent;
            Editable = false;
        }
        field(50020; "CAT Purch. Order Status Code"; Code[20])
        {
            Caption = 'Purchase Order Status';
            DataClassification = CustomerContent;
            TableRelation = "CAT Purchase Order Status";
        }
        field(50030; "CAT CEIC Equipment Tag No."; Text[20])
        {
            Caption = 'CEIC Equipment Tag #';
            DataClassification = CustomerContent;
        }
        field(50035; "CAT Purchase Type"; Enum "CAT Purchase Type")
        {
            Caption = 'Purchase Type';
            DataClassification = CustomerContent;
        }
        //<<CAT.006
        //>>CAT.005
        field(50040; "CAT Previously Approved"; Boolean)
        {
            Caption = 'Previously Approved';
            DataClassification = CustomerContent;
        }
        //<<CAT.005
    }

    procedure CATIncrementVersion()
    var
        PurchDocTypeEnum: Enum "Purchase Document Type";
    begin
        TestStatusOpen();
        if "Document Type" = PurchDocTypeEnum::"Blanket Order" then
            "CAT Blanket Order Version No." += 1
        else
            "CAT Purchase Order Version No." += 1; //Quote? - currently updated too
    end;

    //>>CAT.002
    // replaced by flowfield CAT Assigned User Approver ID
    // procedure CATGetAssignedUserApproverID(): Text
    // var
    //     UserSetup: Record "User Setup";
    // begin
    //     if "Assigned User ID" > '' then
    //         if UserSetup.Get("Assigned User ID") then
    //             if UserSetup."Approver ID" > '' then
    //                 exit(UserSetup."Approver ID");
    //     exit('');
    // end;

    procedure CATUpdateBuyFromVendorNo()
    var
        GLSetup: Record "General Ledger Setup";
        Vendor: Record Vendor;
        NewVendor: Record Vendor;
        PayToVendor: Record Vendor;
        SalesShipmentLine: Record "Sales Shipment Line";

        VendorList: Page "Vendor List";

        BuyFromVendorTxt: Label 'Buy-from Vendor';
        YouCannotChangeFieldErr: Label 'You cannot change %1 because the order is associated with one or more sales orders.', Comment = '%1 - fieldcaption';
    begin
        Rec.CATTestRequisition(true);
        Rec.TestField("Buy-from Vendor No.");  // if no vendor no. entered yet, should use normal processing
        Rec.TestField("Document Type", "Document Type"::Quote);

        Rec.TestStatusOpen();
        Rec.TestField("No.");

        //put logic for lookup here
        //NewVendor.FilterGroup(2);
        //NewVendor.FilterGroup(0);
        if Rec."Buy-from Vendor No." <> '' then
            if not NewVendor.Get("Buy-from Vendor No.") then
                Clear(NewVendor);
        if not (Page.RunModal(0, NewVendor) = Action::LookupOK) then
            exit;
        NewVendor.TestField("No.");

        if NewVendor."No." = Rec."Buy-from Vendor No." then
            exit
        else
            Rec."Buy-from Vendor No." := NewVendor."No.";

        if ("Buy-from Vendor No." <> xRec."Buy-from Vendor No.") and (xRec."Buy-from Vendor No." <> '')
        then begin
            GLSetup.Get();
            // logic copied from purchase header.buy-from Vendor no. onvalidate trigger
            Vendor.Get("Buy-from Vendor No.");
            Vendor.CheckBlockedVendOnDocs(Vendor, false);
            if GLSetup."VAT in Use" then
                Vendor.TestField("Gen. Bus. Posting Group");

            "Buy-from Vendor Name" := Vendor.Name;
            "Buy-from Vendor Name 2" := Vendor."Name 2";
            "Buy-from Address" := Vendor.Address;
            "Buy-from Address 2" := Vendor."Address 2";
            "Buy-from City" := Vendor.City;
            "Buy-from Post Code" := Vendor."Post Code";
            "Buy-from County" := Vendor.County;
            "Buy-from Country/Region Code" := Vendor."Country/Region Code";
            "Buy-from Contact" := Vendor.Contact;
            "Gen. Bus. Posting Group" := Vendor."Gen. Bus. Posting Group";
            "VAT Bus. Posting Group" := Vendor."VAT Bus. Posting Group";
            "Tax Area Code" := Vendor."Tax Area Code";
            "Tax Liable" := Vendor."Tax Liable";
            "VAT Registration No." := Vendor."VAT Registration No.";
            "Buy-from IC Partner Code" := Vendor."IC Partner Code";
            "Send IC Document" := ("Buy-from IC Partner Code" <> '') and ("IC Direction" = "IC Direction"::Outgoing);

            //pay-to vendor
            if Vendor."Pay-to Vendor No." <> '' then
                "Pay-to Vendor No." := Vendor."Pay-to Vendor No."
            else
                "Pay-to Vendor No." := "Buy-from Vendor No.";
            PayToVendor.Get("Pay-to Vendor No.");
            "Order Address Code" := '';
            "Pay-to Name" := PayToVendor.Name;
            "Pay-to Name 2" := PayToVendor."Name 2";
            "Pay-to Address" := PayToVendor.Address;
            "Pay-to Address 2" := PayToVendor."Address 2";
            "Pay-to City" := PayToVendor.City;
            "Pay-to Post Code" := PayToVendor."Post Code";
            "Pay-to County" := PayToVendor.County;
            "Pay-to Country/Region Code" := PayToVendor."Country/Region Code";
            "Pay-to Contact" := PayToVendor.Contact;
            "Payment Terms Code" := PayToVendor."Payment Terms Code";
            "Prepmt. Payment Terms Code" := PayToVendor."Payment Terms Code";
            "Payment Method Code" := PayToVendor."Payment Method Code";
            "Price Calculation Method" := PayToVendor.GetPriceCalculationMethod();
            if "Buy-from Vendor No." = PayToVendor."No." then
                "Shipment Method Code" := PayToVendor."Shipment Method Code";
            "Vendor Posting Group" := PayToVendor."Vendor Posting Group";
            if GLSetup."Bill-to/Sell-to VAT Calc." = GLSetup."Bill-to/Sell-to VAT Calc."::"Bill-to/Pay-to No." then begin
                "VAT Bus. Posting Group" := PayToVendor."VAT Bus. Posting Group";
                "VAT Country/Region Code" := PayToVendor."Country/Region Code";
                "VAT Registration No." := PayToVendor."VAT Registration No.";
                "Gen. Bus. Posting Group" := PayToVendor."Gen. Bus. Posting Group";
            end;
            "Prices Including VAT" := PayToVendor."Prices Including VAT";
            //"Currency Code" := PayToVendor."Currency Code";
            "Invoice Disc. Code" := PayToVendor."Invoice Disc. Code";
            "Language Code" := PayToVendor."Language Code";
            //SetPurchaserCode(Vend."Purchaser Code", "Purchaser Code");
            "IRS 1099 Code" := PayToVendor."IRS 1099 Code";
            //Validate("Payment Terms Code");
            //Validate("Prepmt. Payment Terms Code");
            Validate("Payment Method Code");
            //Validate("Currency Code");
            Validate("Creditor No.", PayToVendor."Creditor No.");
            Modify();
            UpdatePurchLineVendor();
        end;
    end;

    local procedure UpdatePurchLineVendor()
    var
        PurchLine: Record "Purchase Line";
    begin
        PurchLine.SetRange("Document Type", Rec."Document Type");
        PurchLine.SetRange("Document No.", Rec."No.");
        if PurchLine.FindSet() then
            repeat
                PurchLine."Buy-from Vendor No." := Rec."Buy-from Vendor No.";
                PurchLine."Pay-to Vendor No." := Rec."Pay-to Vendor No.";
                PurchLine.Modify();
            until PurchLine.Next() = 0;
    end;

    procedure CATChangeRequistitionToQuote()
    var
        CopyDocMgt: Codeunit "Copy Document Mgt.";//17.0.0.5++
        ToPurchHeader: Record "Purchase Header";//17.0.0.5++
        OldPurchHeader: Record "Purchase Header";//17.0.0.5++
        FromDocType: Enum "Purchase Document Type From";//17.0.0.5++
        FromRecRef: RecordRef;
        ToRecRef: RecordRef;
        DocumentAttachment: Codeunit CATDocumentAttachmentEvents;
        CATPurchaseTypeErrTxt: Label 'cannot be blank'; //++CAT.006

    begin
        Rec.CATTestRequisition(true);
        Rec.TestField("Document Type", Rec."Document Type"::Quote);
        Rec.TestField("No.");
        Rec.TestField("CAT Requisition", true);
        //>>CAT.007 start delete
        // //>>CAT.006
        // if Rec."CAT Purchase Type" = Rec."CAT Purchase Type"::" " then
        //     Rec.FieldError("CAT Purchase Type", CATPurchaseTypeErrTxt);
        // //<<CAT.006
        //<<CAT.007

        //what kind of test for the user who is trying to change to quote? Put code here.

        if Rec."CAT Requisition Priority" in [rec."CAT Requisition Priority"::Hold, Rec."CAT Requisition Priority"::Cancel] then
            Rec.FieldError(Rec."CAT Requisition Priority");

        Rec."CAT Requisition" := false;

        Rec.Modify();

        //17.0.0.5>>
        OldPurchHeader := rec;
        ToPurchHeader.init;
        ToPurchHeader."Document Type" := ToPurchHeader."Document Type"::Quote;
        ToPurchHeader."Buy-from Vendor No." := rec."Buy-from Vendor No.";

        CopyDocMgt.SetProperties(true, false, false, true, true, false, false);
        CopyDocMgt.CopyPurchDoc(FromDocType::Quote, rec."No.", ToPurchHeader);
        //>>CAT.006
        ToPurchHeader."CAT Purchase Requisition No." := OldPurchHeader."No.";
        ToPurchHeader.Modify();
        //<<CAT.006
        FromRecRef.GetTable(OldPurchHeader);
        ToRecRef.GetTable(ToPurchHeader);
        DocumentAttachment.CopyAttachmentsForPostedDocs(FromRecRef, ToRecRef);//It says posted but will work
        CATCopyRecordLink(OldPurchHeader, ToPurchHeader); //++CAT.004
        OldPurchHeader.delete(true);
        //17.0.0.5<<

    end;

    //>>CAT.004
#pragma warning disable AA0072
    local procedure CATCopyRecordLink(FromRecord: Variant; ToRecord: Variant)
#pragma warning restore AA0072
    var
        RecordLinkManagment: Codeunit "Record Link Management";
    begin
        RecordLinkManagment.CopyLinks(FromRecord, ToRecord);
    end;
    //<<CAT.004
    Procedure CATTestRequisition(TestValue: Boolean)
    var
        ErrMsg: Label 'In %1 %2 %3, %4 is %5.';
    begin
        if (Rec.CATIsRequisition() <> TestValue) then
            Error(ErrMsg,
                Rec.TableCaption(),
                Rec."Document Type",
                Rec."No.",
                Rec.FieldCaption("CAT Requisition"),
                Rec."CAT Requisition");
    end;

    Procedure CATIsRequisition(): Boolean
    begin
        exit(Rec."CAT Requisition");
    end;
    //<<CAT.002
}