report 50104 "CAT Ship Date Purchase Order"
{
    //CAT.001 2019-12-20 CL - copied from 1322 and modified
    //CAT.002 2020-01-06 JS + RM Adding Columns + Editing Comment Lines
    //CAT.003 2020-01-22 CL - Add Salesperson/Purchaser and date format changes
    //CAT.004 2020-05-12 CL - add fields 50000 50001
    //CAT.005 2021-04-29 CL - change usage of formataddr for bill-to address array
    //CAT.006 2022-03-07 CL - add "CAT Fiix Purchase Order No." to output
    //RDLCLayout = './layouts/StandardPurchaseOrder.rdlc';
    WordLayout = './layouts/Carbon Engineering Revised Purchase Order.docx';
    Caption = 'Carbon Engineering - Purchase Order';
    DefaultLayout = Word;
    EnableHyperlinks = true;
    PreviewMode = PrintLayout;
    WordMergeDataItem = "Purchase Header";

    dataset
    {
        dataitem("Purchase Header"; "Purchase Header")
        {
            DataItemTableView = SORTING("Document Type", "No.") WHERE("Document Type" = CONST(Order));
            RequestFilterFields = "No.", "Buy-from Vendor No.", "No. Printed";
            RequestFilterHeading = 'Standard Purchase - Order';
            column(CompanyAddress1; CompanyAddr[1])
            {
            }
            column(CompanyAddress2; CompanyAddr[2])
            {
            }
            column(CompanyAddress3; CompanyAddr[3])
            {
            }
            column(CompanyAddress4; CompanyAddr[4])
            {
            }
            column(CompanyAddress5; CompanyAddr[5])
            {
            }
            column(CompanyAddress6; CompanyAddr[6])
            {
            }
            column(CompanyHomePage_Lbl; HomePageCaptionLbl)
            {
            }
            column(CompanyHomePage; CompanyInfo."Home Page")
            {
            }
            column(CompanyEmail_Lbl; EmailIDCaptionLbl)
            {
            }
            column(CompanyEMail; CompanyInfo."E-Mail")
            {
            }
            column(CompanyPicture; CompanyInfo.Picture)
            {
            }
            column(CompanyPhoneNo; CompanyInfo."Phone No.")
            {
            }
            column(CompanyPhoneNo_Lbl; CompanyInfoPhoneNoCaptionLbl)
            {
            }
            column(CompanyGiroNo; CompanyInfo."Giro No.")
            {
            }
            column(CompanyGiroNo_Lbl; CompanyInfoGiroNoCaptionLbl)
            {
            }
            column(CompanyBankName; CompanyInfo."Bank Name")
            {
            }
            column(CompanyBankName_Lbl; CompanyInfoBankNameCaptionLbl)
            {
            }
            column(CompanyBankBranchNo; CompanyInfo."Bank Branch No.")
            {
            }
            column(CompanyBankBranchNo_Lbl; CompanyInfo.FieldCaption("Bank Branch No."))
            {
            }
            column(CompanyBankAccountNo; CompanyInfo."Bank Account No.")
            {
            }
            column(CompanyBankAccountNo_Lbl; CompanyInfoBankAccNoCaptionLbl)
            {
            }
            column(CompanyIBAN; CompanyInfo.IBAN)
            {
            }
            column(CompanyIBAN_Lbl; CompanyInfo.FieldCaption(IBAN))
            {
            }
            column(CompanySWIFT; CompanyInfo."SWIFT Code")
            {
            }
            column(CompanySWIFT_Lbl; CompanyInfo.FieldCaption("SWIFT Code"))
            {
            }
            column(CompanyLogoPosition; CompanyLogoPosition)
            {
            }
            column(CompanyRegistrationNumber; CompanyInfo.GetRegistrationNumber)
            {
            }
            column(CompanyRegistrationNumber_Lbl; CompanyInfo.GetRegistrationNumberLbl)
            {
            }
            column(CompanyVATRegNo; CompanyInfo.GetVATRegistrationNumber)
            {
            }
            column(CompanyVATRegNo_Lbl; CompanyInfo.GetVATRegistrationNumberLbl)
            {
            }
            column(CompanyVATRegistrationNo; CompanyInfo.GetVATRegistrationNumber)
            {
            }
            column(CompanyVATRegistrationNo_Lbl; CompanyInfo.GetVATRegistrationNumberLbl)
            {
            }
            column(CompanyLegalOffice; CompanyInfo.GetLegalOffice)
            {
            }
            column(CompanyLegalOffice_Lbl; CompanyInfo.GetLegalOfficeLbl)
            {
            }
            column(CompanyCustomGiro; CompanyInfo.GetCustomGiro)
            {
            }
            column(CompanyCustomGiro_Lbl; CompanyInfo.GetCustomGiroLbl)
            {
            }
            column(DocType_PurchHeader; "Document Type")
            {
            }
            column(No_PurchHeader; "No.")
            {
            }
            column(DocumentTitle_Lbl; DocumentTitleLbl)
            {
            }
            column(Amount_Lbl; AmountCaptionLbl)
            {
            }
            column(PurchLineInvDiscAmt_Lbl; PurchLineInvDiscAmtCaptionLbl)
            {
            }
            column(Subtotal_Lbl; SubtotalCaptionLbl)
            {
            }
            column(VATAmtLineVAT_Lbl; VATAmtLineVATCaptionLbl)
            {
            }
            column(VATAmtLineVATAmt_Lbl; VATAmtLineVATAmtCaptionLbl)
            {
            }
            column(VATAmtSpec_Lbl; VATAmtSpecCaptionLbl)
            {
            }
            column(VATIdentifier_Lbl; VATIdentifierCaptionLbl)
            {
            }
            column(VATAmtLineInvDiscBaseAmt_Lbl; VATAmtLineInvDiscBaseAmtCaptionLbl)
            {
            }
            column(VATAmtLineLineAmt_Lbl; VATAmtLineLineAmtCaptionLbl)
            {
            }
            column(VALVATBaseLCY_Lbl; VALVATBaseLCYCaptionLbl)
            {
            }
            column(Total_Lbl; TotalCaptionLbl)
            {
            }
            column(PaymentTermsDesc_Lbl; PaymentTermsDescCaptionLbl)
            {
            }
            column(ShipmentMethodDesc_Lbl; ShipmentMethodDescCaptionLbl)
            {
            }
            column(PrepymtTermsDesc_Lbl; PrepymtTermsDescCaptionLbl)
            {
            }
            column(HomePage_Lbl; HomePageCaptionLbl)
            {
            }
            column(EmailID_Lbl; EmailIDCaptionLbl)
            {
            }
            column(AllowInvoiceDisc_Lbl; AllowInvoiceDiscCaptionLbl)
            {
            }
            //--CAT.003column(DocumentDate; Format("Document Date", 0, 4))
            column(DocumentDate; Format("Document Date", 0, '<Month Text> <Closing><Day>, <Year4>')) //++CAT.003
            {
            }
            column(DueDate; Format("Due Date", 0, 4))
            {
            }
            //--CAT.003column(ExptRecptDt_PurchaseHeader; Format("Expected Receipt Date", 0, 4))
            column(ExptRecptDt_PurchaseHeader; Format("Expected Receipt Date", 0, '<Standard Format,9>')) //++CAT.003
            {
            }
            column(OrderDate_PurchaseHeader; Format("Order Date", 0, 4))
            {
            }
            column(VATNoText; VATNoText)
            {
            }
            column(VATRegNo_PurchHeader; "VAT Registration No.")
            {
            }
            column(PurchaserText; PurchaserText)
            {
            }
            column(SalesPurchPersonName; SalespersonPurchaser.Name)
            {
            }
            column(ReferenceText; ReferenceText)
            {
            }
            column(YourRef_PurchHeader; "Your Reference")
            {
            }
            column(BuyFrmVendNo_PurchHeader; "Buy-from Vendor No.")
            {
            }
            column(BuyFromAddr1; BuyFromAddr[1])
            {
            }
            column(BuyFromAddr2; BuyFromAddr[2])
            {
            }
            column(BuyFromAddr3; BuyFromAddr[3])
            {
            }
            column(BuyFromAddr4; BuyFromAddr[4])
            {
            }
            column(BuyFromAddr5; BuyFromAddr[5])
            {
            }
            column(BuyFromAddr6; BuyFromAddr[6])
            {
            }
            column(BuyFromAddr7; BuyFromAddr[7])
            {
            }
            column(BuyFromAddr8; BuyFromAddr[8])
            {
            }
            column(PricesIncludingVAT_Lbl; PricesIncludingVATCaptionLbl)
            {
            }
            column(PricesInclVAT_PurchHeader; "Prices Including VAT")
            {
            }
            column(OutputNo; OutputNo)
            {
            }
            column(VATBaseDisc_PurchHeader; "VAT Base Discount %")
            {
            }
            column(PricesInclVATtxt; PricesInclVATtxtLbl)
            {
            }
            column(PaymentTermsDesc; PaymentTerms.Description)
            {
            }
            column(ShipmentMethodDesc; ShipmentMethod.Description)
            {
            }
            column(PrepmtPaymentTermsDesc; PrepmtPaymentTerms.Description)
            {
            }
            column(DimText; DimText)
            {
            }
            column(OrderNo_Lbl; OrderNoCaptionLbl)
            {
            }
            column(Page_Lbl; PageCaptionLbl)
            {
            }
            column(DocumentDate_Lbl; DocumentDateCaptionLbl)
            {
            }
            column(BuyFrmVendNo_PurchHeader_Lbl; FieldCaption("Buy-from Vendor No."))
            {
            }
            column(PricesInclVAT_PurchHeader_Lbl; FieldCaption("Prices Including VAT"))
            {
            }
            column(Receiveby_Lbl; ReceivebyCaptionLbl)
            {
            }
            column(Buyer_Lbl; BuyerCaptionLbl)
            {
            }
            column(PayToVendNo_PurchHeader; "Pay-to Vendor No.")
            {
            }
            column(VendAddr8; VendAddr[8])
            {
            }
            column(VendAddr7; VendAddr[7])
            {
            }
            column(VendAddr6; VendAddr[6])
            {
            }
            column(VendAddr5; VendAddr[5])
            {
            }
            column(VendAddr4; VendAddr[4])
            {
            }
            column(VendAddr3; VendAddr[3])
            {
            }
            column(VendAddr2; VendAddr[2])
            {
            }
            column(VendAddr1; VendAddr[1])
            {
            }
            column(PaymentDetails_Lbl; PaymentDetailsCaptionLbl)
            {
            }
            column(VendNo_Lbl; VendNoCaptionLbl)
            {
            }
            column(SellToCustNo_PurchHeader; "Sell-to Customer No.")
            {
            }
            column(ShipToAddr1; ShipToAddr[1])
            {
            }
            column(ShipToAddr2; ShipToAddr[2])
            {
            }
            column(ShipToAddr3; ShipToAddr[3])
            {
            }
            column(ShipToAddr4; ShipToAddr[4])
            {
            }
            column(ShipToAddr5; ShipToAddr[5])
            {
            }
            column(ShipToAddr6; ShipToAddr[6])
            {
            }
            column(ShipToAddr7; ShipToAddr[7])
            {
            }
            column(ShipToAddr8; ShipToAddr[8])
            {
            }
            column(ShiptoAddress_Lbl; ShiptoAddressCaptionLbl)
            {
            }
            column(SellToCustNo_PurchHeader_Lbl; FieldCaption("Sell-to Customer No."))
            {
            }
            column(ItemNumber_Lbl; ItemNumberCaptionLbl)
            {
            }
            column(ItemDescription_Lbl; ItemDescriptionCaptionLbl)
            {
            }
            column(ItemQuantity_Lbl; ItemQuantityCaptionLbl)
            {
            }
            column(ItemUnit_Lbl; ItemUnitCaptionLbl)
            {
            }
            column(ItemUnitPrice_Lbl; ItemUnitPriceCaptionLbl)
            {
            }
            column(ItemLineAmount_Lbl; ItemLineAmountCaptionLbl)
            {
            }
            column(ToCaption_Lbl; ToCaptionLbl)
            {
            }
            column(VendorIDCaption_Lbl; VendorIDCaptionLbl)
            {
            }
            column(ConfirmToCaption_Lbl; ConfirmToCaptionLbl)
            {
            }
            column(PurchOrderCaption_Lbl; PurchOrderCaptionLbl)
            {
            }
            column(PurchOrderNumCaption_Lbl; PurchOrderNumCaptionLbl)
            {
            }
            column(PurchOrderDateCaption_Lbl; PurchOrderDateCaptionLbl)
            {
            }
            column(TaxIdentTypeCaption_Lbl; TaxIdentTypeCaptionLbl)
            {
            }
            column(InvoiceDiscountCaption_Lbl; InvoiceDiscountCaptionLbl)
            {
            }
            column(TotalPriceCaption_Lbl; TotalPriceCaptionLbl)
            {
            }
            column(TotalTaxLabel; TotalTaxLabel)
            {
            }
            column(Tax_Lbl; TaxLbl)
            {
            }
            column(OrderDate_Lbl; OrderDateLbl)
            {
            }
            column(VendorInvoiceNo_Lbl; VendorInvoiceNoLbl)
            {
            }
            column(VendorInvoiceNo; "Vendor Invoice No.")
            {
            }
            column(VendorOrderNo_Lbl; VendorOrderNoLbl)
            {
            }
            column(VendorOrderNo; "Vendor Order No.")
            {
            }
            //>>CAT.001
            column(CATBuyFromVendorEmailLbl; CATBuyFromVendorEmailLbl) { }
            column(CATBuyFromVendorEmail; CATBuyFromVendorEmail) { }
            column(CATBuyFromVendorContactNameLbl; CATBuyFromVendorContactNameLbl) { }
            column(CATBuyFromVendorContactName; CATBuyFromVendorContactName) { }
            column(CATBuyFromVendorPhoneNumberLbl; CATBuyFromVendorPhoneNumberLbl) { }
            column(CATBuyFromVendorPhoneNumber; CATBuyFromVendorPhoneNumber) { }
            column(CATAssignedUserIDFullNameLbl; CATAssignedUserIDFullNameLbl) { }
            column(CATAssignedUserIDFullName; CATAssignedUserIDFullName) { }
            column(CATPurchaserNameLbl; CATPurchaserNameLbl) { }
            column(CATPurchaserName; CATPurchaserName) { }
            //<<CAT.001
            //>>CAT.002
            column(TransportationMethod; "Transport Method") { }
            column(CATTransportMethodDescription; CATTransportMethod.Description) { }
            column(CurrencyCode; "Currency Code") { }
            column(QuoteNo; "Quote No.") { }
            column(Shortcut_Dimension_2_Code; "Shortcut Dimension 2 Code") { }
            //<<CAT.002
            //>>CAT.003
            column(CATGetPurchaserCodeCaption; CatPurchaser.FieldCaption(Code)) { }
            column(CATGetPurchaserCode; CATGetPurchaserCode) { }
            column(CATGetPurchaserNameCaption; CatPurchaser.FieldCaption(Name)) { }
            column(CATGetPurchaserName; CATGetPurchaserName) { }
            column(CATGetPurchaserEmailCaption; CatPurchaser.FieldCaption("E-Mail")) { }
            column(CATGetPurchaserEmail; CATGetPurchaserEmail) { }
            column(CATGetPurchaserPhoneNoCaption; CatPurchaser.FieldCaption("Phone No.")) { }
            column(CATGetPurchaserPhoneNo; CATGetPurchaserPhoneNo) { }
            column(CATGetPurchaserJobTitleCaption; CatPurchaser.FieldCaption("Job Title")) { }
            column(CATGetPurchaserJobTitle; CATGetPurchaserJobTitle) { }
            column(CATGetPurchaserEmail2Caption; CatPurchaser.FieldCaption("E-Mail 2")) { }
            column(CATGetPurchaserEmail2; CATGetPurchaserEmail2) { }
            //<<CAT.003
            //>>CAT.004
            column(CATBlanketOrderVersionNoCaption; "Purchase Header".FieldCaption("CAT Blanket Order Version No.")) { }
            column(CATBlanketOrderVersionNo; "CAT Blanket Order Version No.") { }
            column(CATPurchaseOrderVersionNoCaption; "Purchase Header".FieldCaption("CAT Purchase Order Version No.")) { }
            column(CATPurchaseOrderVersionNo; "CAT Purchase Order Version No.") { }
            //<<CAT.004
            //>>CAT.006
            column(CATFiixPurchaseOrderNo; "CAT Fiix Purchase Order No.") { }
            //<<CAT.006
            column(CATOriginalDocDate; Format("CAT Original Document Date", 0, '<Month Text> <Closing><Day>, <Year4>')) { }
            dataitem("Purchase Line"; "Purchase Line")
            {
                DataItemLink = "Document Type" = FIELD("Document Type"), "Document No." = FIELD("No.");
                DataItemTableView = SORTING("Document Type", "Document No.", "Line No.") WHERE("CAT Print on PO Confirmation" = CONST(true));
                column(LineNo_PurchLine; "Line No.")
                {
                }
                column(AllowInvDisctxt; AllowInvDisctxt)
                {
                }
                column(Type_PurchLine; Format(Type, 0, 2))
                {
                }
                column(No_PurchLine; "No.")
                {
                }
                column(Desc_PurchLine; Description)
                {
                }
                column(Qty_PurchLine; FormattedQuanitity)
                {
                }
                column(UOM_PurchLine; "Unit of Measure")
                {
                }
                column(DirUnitCost_PurchLine; FormattedDirectUnitCost)
                {
                    AutoFormatExpression = "Purchase Header"."Currency Code";
                    AutoFormatType = 2;
                }
                column(LineDisc_PurchLine; "Line Discount %")
                {
                }
                //>>CAT.002 start delete
                // column(LineAmt_PurchLine; "Line Amount")
                // {
                //     AutoFormatExpression = "Purchase Header"."Currency Code";
                //     AutoFormatType = 1;
                // }
                //<<CAT.002 end delete
                //>>CAT.002
                column(LineAmt_PurchLine; CATBlankLineAmountIfText())
                {
                }
                //<<CAT.002
                column(AllowInvDisc_PurchLine; "Allow Invoice Disc.")
                {
                }
                column(VATIdentifier_PurchLine; "VAT Identifier")
                {
                }
                column(InvDiscAmt_PurchLine; -"Inv. Discount Amount")
                {
                    AutoFormatExpression = "Currency Code";
                    AutoFormatType = 1;
                }
                column(TotalInclVAT; "Line Amount" - "Inv. Discount Amount")
                {
                    AutoFormatExpression = "Purchase Header"."Currency Code";
                    AutoFormatType = 1;
                }
                column(DirectUniCost_Lbl; DirectUniCostCaptionLbl)
                {
                }
                column(PurchLineLineDisc_Lbl; PurchLineLineDiscCaptionLbl)
                {
                }
                column(VATDiscountAmount_Lbl; VATDiscountAmountCaptionLbl)
                {
                }
                column(No_PurchLine_Lbl; FieldCaption("No."))
                {
                }
                column(Desc_PurchLine_Lbl; FieldCaption(Description))
                {
                }
                column(Qty_PurchLine_Lbl; FieldCaption(Quantity))
                {
                }
                column(UOM_PurchLine_Lbl; ItemUnitOfMeasureCaptionLbl)
                {
                }
                column(VATIdentifier_PurchLine_Lbl; FieldCaption("VAT Identifier"))
                {
                }
                column(AmountIncludingVAT; "Amount Including VAT")
                {
                }
                column(LineAmtTaxAmtInvDiscountAmt; "Line Amount" + TaxAmount - "Inv. Discount Amount")
                {
                }
                column(UnitPrice_PurchLine; "Unit Price (LCY)")
                {
                }
                column(UnitPrice_PurchLine_Lbl; UnitPriceLbl)
                {
                }
                column(JobNo_PurchLine; "Job No.")
                {
                }
                column(JobNo_PurchLine_Lbl; JobNoLbl)
                {
                }
                column(JobTaskNo_PurchLine; "Job Task No.")
                {
                }
                column(JobTaskNo_PurchLine_Lbl; JobTaskNoLbl)
                {
                }
                column(PlannedReceiptDateLbl; PlannedReceiptDateLbl)
                {
                }
                column(PlannedReceiptDate; Format("Planned Receipt Date", 0, 4))
                {
                }
                column(ExpectedReceiptDateLbl; ExpectedReceiptDateLbl)
                {
                }
                //--CAT.003column(ExpectedReceiptDate; Format("Expected Receipt Date", 0, 4))
                column(ExpectedReceiptDate; Format("Expected Receipt Date", 0, '<Standard Format,9>')) //++CAT.003
                {
                }
                column(PromisedReceiptDateLbl; PromisedReceiptDateLbl)
                {
                }
                column(PromisedReceiptDate; Format("Promised Receipt Date", 0, 4))
                {
                }
                column(RequestedReceiptDateLbl; RequestedReceiptDateLbl)
                {
                }
                column(RequestedReceiptDate; Format("Requested Receipt Date", 0, 4))
                {
                }
                column(CE_ShipDate; FORMAT("CAT Ship Date"))
                {
                }
                column(CE_LineNo; CATLineNoToPrint)
                {
                }
                column(CE_CrossReferenceNo; "Item Reference No.")
                {
                }
                column(CE_TaxCodePrint; CATTaxGroupToPrint)
                {
                }

                trigger OnAfterGetRecord()
                begin
                    CATTaxGroup.RESET;
                    CATTaxGroupToPrint := '';
                    IF "Tax Group Code" <> '' then begin
                        CATTaxGroup.GET("Tax Group Code");
                        CATTaxGroupToPrint := CATTaxGroup."CAT PO Confirm. Description";
                    end;
                    //>>RAMIN
                    CATLineNoToPrint := '';
                    IF (Type <> Type::" ") AND ("No." <> '') then begin
                        CATLineNo += 1;
                        CATLineNoToPrint := PADSTR('', 3 - strlen(FORMAT(CATLineNo)), '0') + FORMAT(CATLineNo);
                    end;
                    //<<RAMIN
                    AllowInvDisctxt := Format("Allow Invoice Disc.");
                    TotalSubTotal += "Line Amount";
                    TotalInvoiceDiscountAmount -= "Inv. Discount Amount";
                    TotalAmount += Amount;
                    /*
                    if "Cross-Reference No." <> '' then
                        "No." := "Cross-Reference No.";
                    */

                    FormatDocument.SetPurchaseLine("Purchase Line", FormattedQuanitity, FormattedDirectUnitCost);

                    OnLineNumber := OnLineNumber + 1;

                    if ("Purchase Header"."Tax Area Code" <> '') and not UseExternalTaxEngine then
                        SalesTaxCalc.AddPurchLine("Purchase Line");

                    if Type = 0 then begin
                        "Unit of Measure" := '';
                        "Line Amount" := 0;
                        "Inv. Discount Amount" := 0;
                        Quantity := 0;
                    end;

                    if OnLineNumber = NumberOfLines then
                        if "Purchase Header"."Tax Area Code" <> '' then begin
                            if UseExternalTaxEngine then
                                SalesTaxCalc.CallExternalTaxEngineForPurch("Purchase Header", true)
                            else
                                SalesTaxCalc.EndSalesTaxCalculation(UseDate);
                            SalesTaxCalc.GetSummarizedSalesTaxTable(TempSalesTaxAmtLine);
                            BrkIdx := 0;
                            PrevPrintOrder := 0;
                            PrevTaxPercent := 0;
                            TaxAmount := 0;

                            TempSalesTaxAmtLine.Reset;
                            TempSalesTaxAmtLine.SetCurrentKey("Print Order", "Tax Area Code for Key", "Tax Jurisdiction Code");
                            if TempSalesTaxAmtLine.Find('-') then
                                repeat
                                    if (TempSalesTaxAmtLine."Print Order" = 0) or
                                       (TempSalesTaxAmtLine."Print Order" <> PrevPrintOrder) or
                                       (TempSalesTaxAmtLine."Tax %" <> PrevTaxPercent)
                                    then begin
                                        BrkIdx := BrkIdx + 1;
                                        //--CAT.001if BrkIdx > 1 then begin
                                        if TaxArea."Country/Region" = TaxArea."Country/Region"::CA then
                                            BreakdownTitle := TaxBreakdownLbl
                                        else
                                            BreakdownTitle := SalesTaxBreakdownLbl;
                                        //--CAT.001end;
                                        if BrkIdx > ArrayLen(BreakdownAmt) then begin
                                            BrkIdx := BrkIdx - 1;
                                            BreakdownLabel[BrkIdx] := OtherTaxesLbl;
                                        end else
                                            BreakdownLabel[BrkIdx] := StrSubstNo(TempSalesTaxAmtLine."Print Description", TempSalesTaxAmtLine."Tax %");
                                    end;
                                    BreakdownAmt[BrkIdx] := BreakdownAmt[BrkIdx] + TempSalesTaxAmtLine."Tax Amount";
                                    TaxAmount := TaxAmount + TempSalesTaxAmtLine."Tax Amount";
                                until TempSalesTaxAmtLine.Next = 0;

                            /* CAT.001
                            if BrkIdx = 1 then begin
                                Clear(BreakdownLabel);
                                Clear(BreakdownAmt);
                            end;
                            CAT.001 */
                        end;
                end;

                trigger OnPreDataItem()
                begin
                    NumberOfLines := Count;
                    OnLineNumber := 0;
                end;
            }
            dataitem(Totals; "Integer")
            {
                DataItemTableView = SORTING(Number) WHERE(Number = CONST(1));
                column(VATAmountText; TempVATAmountLine.VATAmountText)
                {
                }
                column(TotalVATAmount; VATAmount)
                {
                    AutoFormatExpression = "Purchase Header"."Currency Code";
                    AutoFormatType = 1;
                }
                column(TotalVATDiscountAmount; -VATDiscountAmount)
                {
                    AutoFormatExpression = "Purchase Header"."Currency Code";
                    AutoFormatType = 1;
                }
                column(TotalVATBaseAmount; VATBaseAmount)
                {
                    AutoFormatExpression = "Purchase Header"."Currency Code";
                    AutoFormatType = 1;
                }
                column(TotalAmountInclVAT; TotalAmountInclVAT)
                {
                    AutoFormatExpression = "Purchase Header"."Currency Code";
                    AutoFormatType = 1;
                }
                column(TotalInclVATText; TotalInclVATText)
                {
                }
                column(TotalExclVATText; TotalExclVATText)
                {
                }
                column(TotalSubTotal; TotalSubTotal)
                {
                    AutoFormatExpression = "Purchase Header"."Currency Code";
                    AutoFormatType = 1;
                }
                column(TotalInvoiceDiscountAmount; TotalInvoiceDiscountAmount)
                {
                    AutoFormatExpression = "Purchase Header"."Currency Code";
                    AutoFormatType = 1;
                }
                column(TotalAmount; TotalAmount)
                {
                    AutoFormatExpression = "Purchase Header"."Currency Code";
                    AutoFormatType = 1;
                }
                column(TotalText; TotalText)
                {
                }
                column(TaxAmount; TaxAmount)
                {
                }

                trigger OnAfterGetRecord()
                var
                    TempPrepmtPurchLine: Record "Purchase Line" temporary;
                begin
                    Clear(TempPurchLine);
                    Clear(PurchPost);
                    TempPurchLine.DeleteAll;
                    TempVATAmountLine.DeleteAll;
                    PurchPost.GetPurchLines("Purchase Header", TempPurchLine, 0);
                    TempPurchLine.CalcVATAmountLines(0, "Purchase Header", TempPurchLine, TempVATAmountLine);
                    TempPurchLine.UpdateVATOnLines(0, "Purchase Header", TempPurchLine, TempVATAmountLine);
                    VATAmount := TempVATAmountLine.GetTotalVATAmount;
                    VATBaseAmount := TempVATAmountLine.GetTotalVATBase;
                    VATDiscountAmount :=
                      TempVATAmountLine.GetTotalVATDiscount("Purchase Header"."Currency Code", "Purchase Header"."Prices Including VAT");
                    TotalAmountInclVAT := TempVATAmountLine.GetTotalAmountInclVAT;

                    TempPrepaymentInvLineBuffer.DeleteAll;
                    PurchasePostPrepayments.GetPurchLines("Purchase Header", 0, TempPrepmtPurchLine);
                    if not TempPrepmtPurchLine.IsEmpty then begin
                        PurchasePostPrepayments.GetPurchLinesToDeduct("Purchase Header", TempPurchLine);
                        if not TempPurchLine.IsEmpty then
                            PurchasePostPrepayments.CalcVATAmountLines("Purchase Header", TempPurchLine, TempPrePmtVATAmountLineDeduct, 1);
                    end;
                    PurchasePostPrepayments.CalcVATAmountLines("Purchase Header", TempPrepmtPurchLine, TempPrepmtVATAmountLine, 0);
                    TempPrepmtVATAmountLine.DeductVATAmountLine(TempPrePmtVATAmountLineDeduct);
                    PurchasePostPrepayments.UpdateVATOnLines("Purchase Header", TempPrepmtPurchLine, TempPrepmtVATAmountLine, 0);
                    PurchasePostPrepayments.BuildInvLineBuffer("Purchase Header", TempPrepmtPurchLine, 0, TempPrepaymentInvLineBuffer);
                    PrepmtVATAmount := TempPrepmtVATAmountLine.GetTotalVATAmount;
                    PrepmtVATBaseAmount := TempPrepmtVATAmountLine.GetTotalVATBase;
                    PrepmtTotalAmountInclVAT := TempPrepmtVATAmountLine.GetTotalAmountInclVAT;

                    TotalAmount := TotalSubTotal + TotalInvoiceDiscountAmount + TaxAmount;
                end;
            }
            dataitem(TaxBreakdown; "Integer")
            {
                DataItemTableView = SORTING(Number) WHERE(Number = CONST(1));
                column(BreakdownTitle; BreakdownTitle)
                {
                }
                column(BreakdownLabel1; BreakdownLabel[1])
                {
                }
                column(BreakdownAmt1; FormatBreakdownAmounts(BreakdownLabel[1], BreakdownAmt[1]))
                {
                }
                column(BreakdownLabel2; BreakdownLabel[2])
                {
                }
                column(BreakdownAmt2; FormatBreakdownAmounts(BreakdownLabel[2], BreakdownAmt[2]))
                {
                }
                column(BreakdownLabel3; BreakdownLabel[3])
                {
                }
                column(BreakdownAmt3; FormatBreakdownAmounts(BreakdownLabel[3], BreakdownAmt[3]))
                {
                }
                column(BreakdownAmt4; FormatBreakdownAmounts(BreakdownLabel[4], BreakdownAmt[4]))
                {
                }
                column(BreakdownLabel4; BreakdownLabel[4])
                {
                }
            }
            dataitem(VATCounter; "Integer")
            {
                DataItemTableView = SORTING(Number);
                column(VATAmtLineVATBase; TempVATAmountLine."VAT Base")
                {
                    AutoFormatExpression = "Purchase Header"."Currency Code";
                    AutoFormatType = 1;
                }
                column(VATAmtLineVATAmt; TempVATAmountLine."VAT Amount")
                {
                    AutoFormatExpression = "Purchase Header"."Currency Code";
                    AutoFormatType = 1;
                }
                column(VATAmtLineLineAmt; TempVATAmountLine."Line Amount")
                {
                    AutoFormatExpression = "Purchase Header"."Currency Code";
                    AutoFormatType = 1;
                }
                column(VATAmtLineInvDiscBaseAmt; TempVATAmountLine."Inv. Disc. Base Amount")
                {
                    AutoFormatExpression = "Purchase Header"."Currency Code";
                    AutoFormatType = 1;
                }
                column(VATAmtLineInvDiscAmt; TempVATAmountLine."Invoice Discount Amount")
                {
                    AutoFormatExpression = "Purchase Header"."Currency Code";
                    AutoFormatType = 1;
                }
                column(VATAmtLineVAT; TempVATAmountLine."VAT %")
                {
                    DecimalPlaces = 0 : 5;
                }
                column(VATAmtLineVATIdentifier; TempVATAmountLine."VAT Identifier")
                {
                }

                trigger OnAfterGetRecord()
                begin
                    TempVATAmountLine.GetLine(Number);
                end;

                trigger OnPreDataItem()
                begin
                    if VATAmount = 0 then
                        CurrReport.Break;
                    SetRange(Number, 1, TempVATAmountLine.Count);
                end;
            }
            dataitem(VATCounterLCY; "Integer")
            {
                DataItemTableView = SORTING(Number);
                column(VALExchRate; VALExchRate)
                {
                }
                column(VALSpecLCYHeader; VALSpecLCYHeader)
                {
                }
                column(VALVATAmountLCY; VALVATAmountLCY)
                {
                    AutoFormatType = 1;
                }
                column(VALVATBaseLCY; VALVATBaseLCY)
                {
                    AutoFormatType = 1;
                }

                trigger OnAfterGetRecord()
                begin
                    TempVATAmountLine.GetLine(Number);
                    VALVATBaseLCY :=
                      TempVATAmountLine.GetBaseLCY(
                        "Purchase Header"."Posting Date", "Purchase Header"."Currency Code", "Purchase Header"."Currency Factor");
                    VALVATAmountLCY :=
                      TempVATAmountLine.GetAmountLCY(
                        "Purchase Header"."Posting Date", "Purchase Header"."Currency Code", "Purchase Header"."Currency Factor");
                end;

                trigger OnPreDataItem()
                begin
                    if (not GLSetup."Print VAT specification in LCY") or
                       ("Purchase Header"."Currency Code" = '') or
                       (TempVATAmountLine.GetTotalVATAmount = 0)
                    then
                        CurrReport.Break;

                    SetRange(Number, 1, TempVATAmountLine.Count);

                    if GLSetup."LCY Code" = '' then
                        VALSpecLCYHeader := VATAmountSpecificationLbl + LocalCurrentyLbl
                    else
                        VALSpecLCYHeader := VATAmountSpecificationLbl + Format(GLSetup."LCY Code");

                    CurrExchRate.FindCurrency("Purchase Header"."Posting Date", "Purchase Header"."Currency Code", 1);
                    VALExchRate := StrSubstNo(ExchangeRateLbl, CurrExchRate."Relational Exch. Rate Amount", CurrExchRate."Exchange Rate Amount");
                end;
            }
            dataitem(PrepmtLoop; "Integer")
            {
                DataItemTableView = SORTING(Number) WHERE(Number = FILTER(1 ..));
                column(PrepmtLineAmount; PrepmtLineAmount)
                {
                    AutoFormatExpression = "Purchase Header"."Currency Code";
                    AutoFormatType = 1;
                }
                column(PrepmtInvBufGLAccNo; TempPrepaymentInvLineBuffer."G/L Account No.")
                {
                }
                column(PrepmtInvBufDesc; TempPrepaymentInvLineBuffer.Description)
                {
                }
                column(TotalInclVATText2; TotalInclVATText)
                {
                }
                column(TotalExclVATText2; TotalExclVATText)
                {
                }
                column(PrepmtInvBufAmt; TempPrepaymentInvLineBuffer.Amount)
                {
                    AutoFormatExpression = "Purchase Header"."Currency Code";
                    AutoFormatType = 1;
                }
                column(PrepmtVATAmountText; TempPrepmtVATAmountLine.VATAmountText)
                {
                }
                column(PrepmtVATAmount; PrepmtVATAmount)
                {
                    AutoFormatExpression = "Purchase Header"."Currency Code";
                    AutoFormatType = 1;
                }
                column(PrepmtTotalAmountInclVAT; PrepmtTotalAmountInclVAT)
                {
                    AutoFormatExpression = "Purchase Header"."Currency Code";
                    AutoFormatType = 1;
                }
                column(PrepmtVATBaseAmount; PrepmtVATBaseAmount)
                {
                    AutoFormatExpression = "Purchase Header"."Currency Code";
                    AutoFormatType = 1;
                }
                column(PrepmtInvBuDescCaption; PrepmtInvBuDescCaptionLbl)
                {
                }
                column(PrepmtInvBufGLAccNoCaption; PrepmtInvBufGLAccNoCaptionLbl)
                {
                }
                column(PrepaymentSpecCaption; PrepaymentSpecCaptionLbl)
                {
                }

                trigger OnAfterGetRecord()
                begin
                    if Number = 1 then begin
                        if not TempPrepaymentInvLineBuffer.Find('-') then
                            CurrReport.Break;
                    end else
                        if TempPrepaymentInvLineBuffer.Next = 0 then
                            CurrReport.Break;

                    if "Purchase Header"."Prices Including VAT" then
                        PrepmtLineAmount := TempPrepaymentInvLineBuffer."Amount Incl. VAT"
                    else
                        PrepmtLineAmount := TempPrepaymentInvLineBuffer.Amount;
                end;
            }
            dataitem(PrepmtVATCounter; "Integer")
            {
                DataItemTableView = SORTING(Number);
                column(PrepmtVATAmtLineVATAmt; TempPrepmtVATAmountLine."VAT Amount")
                {
                    AutoFormatExpression = "Purchase Header"."Currency Code";
                    AutoFormatType = 1;
                }
                column(PrepmtVATAmtLineVATBase; TempPrepmtVATAmountLine."VAT Base")
                {
                    AutoFormatExpression = "Purchase Header"."Currency Code";
                    AutoFormatType = 1;
                }
                column(PrepmtVATAmtLineLineAmt; TempPrepmtVATAmountLine."Line Amount")
                {
                    AutoFormatExpression = "Purchase Header"."Currency Code";
                    AutoFormatType = 1;
                }
                column(PrepmtVATAmtLineVAT; TempPrepmtVATAmountLine."VAT %")
                {
                    DecimalPlaces = 0 : 5;
                }
                column(PrepmtVATAmtLineVATId; TempPrepmtVATAmountLine."VAT Identifier")
                {
                }
                column(PrepymtVATAmtSpecCaption; PrepymtVATAmtSpecCaptionLbl)
                {
                }

                trigger OnAfterGetRecord()
                begin
                    TempPrepmtVATAmountLine.GetLine(Number);
                end;

                trigger OnPreDataItem()
                begin
                    SetRange(Number, 1, TempPrepmtVATAmountLine.Count);
                end;
            }
            dataitem(LetterText; "Integer")
            {
                DataItemTableView = SORTING(Number) WHERE(Number = CONST(1));
                column(GreetingText; GreetingLbl)
                {
                }
                column(BodyText; BodyLbl)
                {
                }
                column(ClosingText; ClosingLbl)
                {
                }
            }

            trigger OnAfterGetRecord()
            begin
                TotalAmount := 0;
                TotalSubTotal := 0;
                TaxAmount := 0;
                TotalInvoiceDiscountAmount := 0;
                CurrReport.Language := Language.GetLanguageIdOrDefault("Language Code");
                Clear(BreakdownTitle);
                Clear(BreakdownLabel);
                Clear(BreakdownAmt);
                //>>CAT.002
                if not CATTransportMethod.Get("Purchase Header"."Transport Method") then
                    Clear(CATTransportMethod);
                //<<CAT.002
                FormatAddressFields("Purchase Header");
                FormatDocumentFields("Purchase Header");
                CATGetCustomHeaderValues();//++CAT.001

                if not IsReportInPreviewMode then begin
                    CODEUNIT.Run(CODEUNIT::"Purch.Header-Printed", "Purchase Header");
                    if ArchiveDocument then
                        ArchiveManagement.StorePurchDocument("Purchase Header", LogInteraction);
                end;

                TotalTaxLabel := TaxLbl;
                if "Tax Area Code" <> '' then begin
                    TaxArea.Get("Tax Area Code");
                    case TaxArea."Country/Region" of
                        TaxArea."Country/Region"::US:
                            TotalTaxLabel := TotalSalesTaxLbl;
                        TaxArea."Country/Region"::CA:
                            TotalTaxLabel := TotalTaxLbl;
                    end;
                    UseExternalTaxEngine := TaxArea."Use External Tax Engine";
                    SalesTaxCalc.StartSalesTaxCalculation;
                end;

                if "Posting Date" <> 0D then
                    UseDate := "Posting Date"
                else
                    UseDate := WorkDate;
                CATLineNo := 0; //++RAMIN
            end;
        }
    }

    requestpage
    {
        SaveValues = true;

        layout
        {
            area(content)
            {
                group(Options)
                {
                    Caption = 'Options';
                    field(ArchiveDocument; ArchiveDocument)
                    {
                        ApplicationArea = Suite;
                        Caption = 'Archive Document';
                        ToolTip = 'Specifies whether to archive the order.';
                    }
                    field(LogInteraction; LogInteraction)
                    {
                        ApplicationArea = Suite;
                        Caption = 'Log Interaction';
                        Enabled = LogInteractionEnable;
                        ToolTip = 'Specifies if you want to log this interaction.';
                    }
                }
            }
        }

        actions
        {
        }

        trigger OnInit()
        begin
            LogInteractionEnable := true;
            ArchiveDocument := PurchSetup."Archive Orders";
        end;

        trigger OnOpenPage()
        begin
            LogInteractionEnable := LogInteraction;
        end;
    }

    labels
    {
    }

    trigger OnInitReport()
    begin
        GLSetup.Get;
        CompanyInfo.Get;
        PurchSetup.Get;
        CompanyInfo.CalcFields(Picture);
    end;

    trigger OnPostReport()
    begin
        if LogInteraction and not IsReportInPreviewMode then
            if "Purchase Header".FindSet then
                repeat
                    SegManagement.LogDocument(
                      13, "Purchase Header"."No.", 0, 0, DATABASE::Vendor, "Purchase Header"."Buy-from Vendor No.",
                      "Purchase Header"."Purchaser Code", '', "Purchase Header"."Posting Description", '');
                until "Purchase Header".Next = 0;
    end;

    trigger OnPreReport()
    begin
        if not CurrReport.UseRequestPage then
            InitLogInteraction;
    end;

    var
        VATAmountSpecificationLbl: Label 'VAT Amount Specification in ';
        LocalCurrentyLbl: Label 'Local Currency';
        ExchangeRateLbl: Label 'Exchange rate: %1/%2', Comment = '%1 = CurrExchRate."Relational Exch. Rate Amount", %2 = CurrExchRate."Exchange Rate Amount"';
        CompanyInfoPhoneNoCaptionLbl: Label 'Phone No.';
        CompanyInfoGiroNoCaptionLbl: Label 'Giro No.';
        CompanyInfoBankNameCaptionLbl: Label 'Bank';
        CompanyInfoBankAccNoCaptionLbl: Label 'Account No.';
        OrderNoCaptionLbl: Label 'Order No.';
        PageCaptionLbl: Label 'Page';
        DocumentDateCaptionLbl: Label 'Document Date';
        DirectUniCostCaptionLbl: Label 'Direct Unit Cost';
        PurchLineLineDiscCaptionLbl: Label 'Discount %';
        VATDiscountAmountCaptionLbl: Label 'Payment Discount on VAT';
        PaymentDetailsCaptionLbl: Label 'Payment Details';
        VendNoCaptionLbl: Label 'Vendor No.';
        ShiptoAddressCaptionLbl: Label 'Ship-to Address';
        PrepmtInvBuDescCaptionLbl: Label 'Description';
        PrepmtInvBufGLAccNoCaptionLbl: Label 'G/L Account No.';
        PrepaymentSpecCaptionLbl: Label 'Prepayment Specification';
        PrepymtVATAmtSpecCaptionLbl: Label 'Prepayment VAT Amount Specification';
        AmountCaptionLbl: Label 'Amount';
        PurchLineInvDiscAmtCaptionLbl: Label 'Invoice Discount Amount';
        SubtotalCaptionLbl: Label 'Subtotal';
        VATAmtLineVATCaptionLbl: Label 'VAT %';
        VATAmtLineVATAmtCaptionLbl: Label 'VAT Amount';
        VATAmtSpecCaptionLbl: Label 'VAT Amount Specification';
        VATIdentifierCaptionLbl: Label 'VAT Identifier';
        VATAmtLineInvDiscBaseAmtCaptionLbl: Label 'Invoice Discount Base Amount';
        VATAmtLineLineAmtCaptionLbl: Label 'Line Amount';
        VALVATBaseLCYCaptionLbl: Label 'VAT Base';
        PricesInclVATtxtLbl: Label 'Prices Including VAT';
        TotalCaptionLbl: Label 'Total';
        PaymentTermsDescCaptionLbl: Label 'Payment Terms';
        ShipmentMethodDescCaptionLbl: Label 'Shipment Method';
        PrepymtTermsDescCaptionLbl: Label 'Prepmt. Payment Terms';
        HomePageCaptionLbl: Label 'Home Page';
        EmailIDCaptionLbl: Label 'Email';
        AllowInvoiceDiscCaptionLbl: Label 'Allow Invoice Discount';
        GLSetup: Record "General Ledger Setup";
        CompanyInfo: Record "Company Information";
        ShipmentMethod: Record "Shipment Method";
        PaymentTerms: Record "Payment Terms";
        PrepmtPaymentTerms: Record "Payment Terms";
        SalespersonPurchaser: Record "Salesperson/Purchaser";
        TempVATAmountLine: Record "VAT Amount Line" temporary;
        TempPrepmtVATAmountLine: Record "VAT Amount Line" temporary;
        TempPurchLine: Record "Purchase Line" temporary;
        TempPrepaymentInvLineBuffer: Record "Prepayment Inv. Line Buffer" temporary;
        TempPrePmtVATAmountLineDeduct: Record "VAT Amount Line" temporary;
        TempSalesTaxAmtLine: Record "Sales Tax Amount Line" temporary;
        TaxArea: Record "Tax Area";
        RespCenter: Record "Responsibility Center";
        CurrExchRate: Record "Currency Exchange Rate";
        PurchSetup: Record "Purchases & Payables Setup";
        CATVendor: Record Vendor; //++CAT.001
        CATPurchaser: Record "Salesperson/Purchaser"; //++CAT.001
        CATUserSetup: Record "User Setup"; //++CAT.001
        CATUser: Record User; //++CAT.001
        CATTransportMethod: Record "Transport Method"; //++CAT.002
        Language: Codeunit Language;
        FormatAddr: Codeunit "Format Address";
        FormatDocument: Codeunit "Format Document";
        PurchPost: Codeunit "Purch.-Post";
        SegManagement: Codeunit SegManagement;
        PurchasePostPrepayments: Codeunit "Purchase-Post Prepayments";
        ArchiveManagement: Codeunit ArchiveManagement;
        SalesTaxCalc: Codeunit "Sales Tax Calculate";
        VendAddr: array[8] of Text[100];
        ShipToAddr: array[8] of Text[100];
        CompanyAddr: array[8] of Text[100];
        BuyFromAddr: array[8] of Text[100];
        PurchaserText: Text[50];
        VATNoText: Text[80];
        ReferenceText: Text[80];
        TotalText: Text[50];
        TotalInclVATText: Text[50];
        TotalExclVATText: Text[50];
        FormattedQuanitity: Text;
        FormattedDirectUnitCost: Text;
        OutputNo: Integer;
        DimText: Text[120];
        LogInteraction: Boolean;
        VATAmount: Decimal;
        VATBaseAmount: Decimal;
        VATDiscountAmount: Decimal;
        TotalAmountInclVAT: Decimal;
        VALVATBaseLCY: Decimal;
        VALVATAmountLCY: Decimal;
        VALSpecLCYHeader: Text[80];
        VALExchRate: Text[50];
        PrepmtVATAmount: Decimal;
        PrepmtVATBaseAmount: Decimal;
        PrepmtTotalAmountInclVAT: Decimal;
        PrepmtLineAmount: Decimal;
        AllowInvDisctxt: Text[30];
        [InDataSet]
        LogInteractionEnable: Boolean;
        TotalSubTotal: Decimal;
        TotalAmount: Decimal;
        TotalInvoiceDiscountAmount: Decimal;
        DocumentTitleLbl: Label 'Purchase Order';
        TaxAmount: Decimal;
        CompanyLogoPosition: Integer;
        ReceivebyCaptionLbl: Label 'Receive By';
        BuyerCaptionLbl: Label 'Buyer';
        ItemNumberCaptionLbl: Label 'Item No.';
        ItemDescriptionCaptionLbl: Label 'Description';
        ItemQuantityCaptionLbl: Label 'Quantity';
        ItemUnitCaptionLbl: Label 'Unit';
        ItemUnitPriceCaptionLbl: Label 'Unit Price';
        ItemLineAmountCaptionLbl: Label 'Line Amount';
        PricesIncludingVATCaptionLbl: Label 'Prices Including VAT';
        ItemUnitOfMeasureCaptionLbl: Label 'Unit';
        ToCaptionLbl: Label 'To:';
        VendorIDCaptionLbl: Label 'Vendor ID';
        ConfirmToCaptionLbl: Label 'Confirm To';
        PurchOrderCaptionLbl: Label 'PURCHASE ORDER';
        PurchOrderNumCaptionLbl: Label 'Purchase Order Number:';
        PurchOrderDateCaptionLbl: Label 'Purchase Order Date:';
        TaxIdentTypeCaptionLbl: Label 'Tax Ident. Type';
        TotalPriceCaptionLbl: Label 'Total Price';
        ArchiveDocument: Boolean;
        VendorOrderNoLbl: Label 'Vendor Order No.';
        VendorInvoiceNoLbl: Label 'Vendor Invoice No.';
        InvoiceDiscountCaptionLbl: Label 'Invoice Discount';
        SalesTaxBreakdownLbl: Label 'Sales Tax Breakdown';
        OtherTaxesLbl: Label 'Other Taxes';
        TotalSalesTaxLbl: Label 'Total Sales Tax';
        TotalTaxLbl: Label 'Total Tax';
        TaxLbl: Label 'Tax';
        TotalTaxLabel: Text[30];
        BreakdownTitle: Text[30];
        BreakdownLabel: array[4] of Text[30];
        UseExternalTaxEngine: Boolean;
        NumberOfLines: Integer;
        OnLineNumber: Integer;
        UseDate: Date;
        BrkIdx: Integer;
        PrevPrintOrder: Integer;
        PrevTaxPercent: Decimal;
        TaxBreakdownLbl: Label 'Tax Breakdown';
        BreakdownAmt: array[4] of Decimal;
        GreetingLbl: Label 'Hello';
        ClosingLbl: Label 'Sincerely';
        BodyLbl: Label 'The purchase order is attached to this message.';
        OrderDateLbl: Label 'Order Date';
        UnitPriceLbl: Label 'Unit Price (LCY)';
        JobNoLbl: Label 'Job No.';
        JobTaskNoLbl: Label 'Job Task No.';
        PromisedReceiptDateLbl: Label 'Promised Receipt Date';
        RequestedReceiptDateLbl: Label 'Requested Receipt Date';
        ExpectedReceiptDateLbl: Label 'Expected Receipt Date';
        PlannedReceiptDateLbl: Label 'Planned Receipt Date';

        CATBuyFromVendorEmailLbl: Label 'Vendor Email Address'; //++CAT.001
        CATBuyFromVendorContactNameLbl: Label 'Vendor Contact Name'; //++CAT.001
        CATBuyFromVendorPhoneNumberLbl: Label 'Vendor Phone No.'; //++CAT.001
        CATAssignedUserIDFullNameLbl: Label 'Assigned User Name'; //++CAT.001
        CATPurchaserNameLbl: Label 'Purchaser Name'; //++CAT.001
        CATBuyFromVendorEmail: Text; //++CAT.001
        CATBuyFromVendorContactName: Text; //++CAT.001
        CATBuyFromVendorPhoneNumber: Text; //++CAT.001
        CATAssignedUserIDFullName: Text; //++CAT.001
        CATPurchaserName: Text; //++CAT.001
        CATLineNo: Integer;
        CATLineNoToPrint: Text;
        CATTaxGroup: Record "Tax Group";
        CATTaxGroupToPrint: Text;

    procedure InitializeRequest(LogInteractionParam: Boolean)
    begin
        LogInteraction := LogInteractionParam;
    end;

    local procedure IsReportInPreviewMode(): Boolean
    var
        MailManagement: Codeunit "Mail Management";
    begin
        exit(CurrReport.Preview or MailManagement.IsHandlingGetEmailBody);
    end;

    local procedure FormatAddressFields(var PurchaseHeader: Record "Purchase Header")
    begin
        FormatAddr.GetCompanyAddr(PurchaseHeader."Responsibility Center", RespCenter, CompanyInfo, CompanyAddr);
        //--CAT.005FormatAddr.PurchHeaderBuyFrom(BuyFromAddr, PurchaseHeader);
        //>>CAT.005 - blank out buy-from contact. Note that we changed this report only, and did not change FormatAddr.PurchHeaderBuyFrom functionality
        //            by subscribing to the event and changing it there. That would change it for all objects using the function. Did it here as requested by consultant.
        FormatAddr.FormatAddr(
          BuyFromAddr, PurchaseHeader."Buy-from Vendor Name", PurchaseHeader."Buy-from Vendor Name 2", '', PurchaseHeader."Buy-from Address", PurchaseHeader."Buy-from Address 2",
          PurchaseHeader."Buy-from City", PurchaseHeader."Buy-from Post Code", PurchaseHeader."Buy-from County", PurchaseHeader."Buy-from Country/Region Code");
        //<<CAT.005
        if PurchaseHeader."Buy-from Vendor No." <> PurchaseHeader."Pay-to Vendor No." then
            FormatAddr.PurchHeaderPayTo(VendAddr, PurchaseHeader);
        FormatAddr.PurchHeaderShipTo(ShipToAddr, PurchaseHeader);
    end;

    local procedure FormatDocumentFields(PurchaseHeader: Record "Purchase Header")
    begin
        with PurchaseHeader do begin
            FormatDocument.SetTotalLabels("Currency Code", TotalText, TotalInclVATText, TotalExclVATText);
            FormatDocument.SetPurchaser(SalespersonPurchaser, "Purchaser Code", PurchaserText);
            FormatDocument.SetPaymentTerms(PaymentTerms, "Payment Terms Code", "Language Code");
            FormatDocument.SetPaymentTerms(PrepmtPaymentTerms, "Prepmt. Payment Terms Code", "Language Code");
            FormatDocument.SetShipmentMethod(ShipmentMethod, "Shipment Method Code", "Language Code");

            ReferenceText := FormatDocument.SetText("Your Reference" <> '', FieldCaption("Your Reference"));
            VATNoText := FormatDocument.SetText("VAT Registration No." <> '', FieldCaption("VAT Registration No."));
        end;
    end;

    //>>CAT.001
    local procedure CATGetCustomHeaderValues();
    var
    begin
        //CATVendorEmail: Text; 
        if not CATVendor.Get("Purchase Header"."Buy-from Vendor No.") then
            clear(CATVendor);
        //assume that we want to get the contact info from Vendor and not from related contact record.
        CATBuyFromVendorEmail := CATVendor."E-Mail";
        CATBuyFromVendorContactName := CATVendor.Contact;
        CATBuyFromVendorPhoneNumber := CATVendor."Phone No.";

        //CATAssignedUserIDFullName: Text;
        if not CATUserSetup.get("Purchase Header"."Assigned User ID") or ("Purchase Header"."Assigned User ID" = '') then begin
            Clear(CATUserSetup);
            clear(CATUser);
        end else begin
            CATUser.SetRange("User Name", CATUserSetup."User ID");
            if not CATUser.FindFirst() then
                Clear(CATUser);
        end;
        CATAssignedUserIDFullName := CATUser."Full Name";

        //--CAT.003if not CATPurchaser.get("Purchase Header"."Purchaser Code") or ("Purchase Header"."Purchaser Code" = '') then
        //--CAT.003    clear(CATPurchaser);
        CATGetCATPurchaser(); //++CAT.003
        CATPurchaserName := CATPurchaser.Name;
    end;
    //<<CAT.001

    //>>CAT.003
    local procedure CATGetCATPurchaser()
    var
    begin
        if CATPurchaser.code = "Purchase Header"."Purchaser Code" then
            exit;
        if "Purchase Header"."Purchaser Code" = '' then
            clear(CATPurchaser);
        if not CATPurchaser.Get("Purchase Header"."Purchaser Code") then
            clear(CATPurchaser);
    end;

    local procedure CATGetPurchaserCode(): Text
    var
    begin
        Exit(CATPurchaser.Code);
    end;

    local procedure CATGetPurchaserName(): Text
    var
    begin
        Exit(CATPurchaser.Name);
    end;

    local procedure CATGetPurchaserCommissionPct(): Text
    var
    begin
        Exit(format(CATPurchaser."Commission %"));
    end;

    local procedure CATGetPurchaserEmail(): Text
    var
    begin
        Exit(CATPurchaser."E-Mail");
    end;

    local procedure CATGetPurchaserPhoneNo(): Text
    var
    begin
        Exit(CATPurchaser."Phone No.");
    end;

    local procedure CATGetPurchaserJobTitle(): Text
    var
    begin
        Exit(CATPurchaser."Job Title");
    end;

    local procedure CATGetPurchaserEmail2(): Text
    var
    begin
        Exit(CATPurchaser."E-Mail 2");
    end;
    //<<CAT.003

    local procedure InitLogInteraction()
    begin
        LogInteraction := SegManagement.FindInteractTmplCode(13) <> '';
    end;

    local procedure FormatBreakdownAmounts(BreakdownLabel: Text; BreakdownAmount: Decimal): Text
    var
        BreakdownTextAmount: Text;
    begin
        // If the breakdown label is blank, the breakdown amount should be blank too.
        // This enables the NA report layout to serve both CA and US.
        if BreakdownLabel <> '' then
            BreakdownTextAmount := Format(BreakdownAmount, 0, '<Precision,2><Standard Format,0>')
        else
            BreakdownTextAmount := '';

        exit(BreakdownTextAmount);
    end;

    //>>CAT.002
    local procedure CATBlankLineAmountIfText(): Text
    var
        AutoFormatManagement: Codeunit "Auto Format";
    begin
        if "Purchase Line".Type = "Purchase Line".Type::" " then
            exit('')
        else
            exit(format("Purchase Line"."Line Amount", 0, AutoFormatManagement.ResolveAutoFormat(1, "purchase header"."currency code")));
    end;
    //<<CAT.002

}
