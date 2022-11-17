report 50102 "CAT Pur. Line G/L Account Swap"
{
    Permissions = TableData 39 = rimd,
                  TableData 121 = rimd;
    ProcessingOnly = true;

    dataset
    {
        dataitem(PurchLn; "Purchase Line")
        {
            DataItemTableView = SORTING("Document Type", "Document No.", "Line No.")
                                ORDER(Ascending)
                                WHERE(Type = CONST("G/L Account"),
                                      "Document Type" = CONST(Invoice));
            //RequestFilterFields = "Document Type", "Document No.", "Line No.";
            dataitem(PurRcptLn; "Purch. Rcpt. Line")
            {
                DataItemLink = "Document No." = FIELD("Receipt No."),
                               "Line No." = FIELD("Receipt Line No.");
                DataItemTableView = SORTING("Document No.", "Line No.")
                                    ORDER(Ascending)
                                    WHERE(Type = CONST("G/L Account"));

                trigger OnAfterGetRecord()
                begin
                    IF "No." = OldGLNo THEN BEGIN
                        "No." := NewGLNo;
                        RecCount += 1;
                        MODIFY;
                    END;
                end;
            }

            trigger OnAfterGetRecord()
            begin
                IF ReceiptPreviouslyInvoiced("Receipt No.", "Receipt Line No.") THEN
                    IF NOT CONFIRM('This line has previously-invoiced quantities. Are you sure you want to change the G/L Account No.?') then
                        error('Process cancelled by user.');
                //ERROR('You cannot modify a receipt that has a previously-invoiced quantity.');

                IF "No." = OldGLNo THEN BEGIN
                    "No." := NewGLNo;
                    MODIFY;
                    RecCount += 1;
                    UpdateOtherPurchLines(PurchLn);
                END;
            end;

            trigger OnPreDataItem()
            begin
                IF (NewGLNo = '') OR (OldGLNo = '') THEN
                    ERROR('G/L Account numbers must not be blank.');
            end;
        }
    }

    requestpage
    {

        layout
        {
            area(content)
            {
                field(OldGLNo; OldGLNo)
                {
                    Caption = 'Old Account No.';
                    Editable = false;
                    ApplicationArea = All;
                }
                field(NewGLNo; NewGLNo)
                {
                    Caption = 'New Account No.';
                    ApplicationArea = All;

                    trigger OnLookup(var Text: Text): Boolean
                    var
                        GLAccount: Record "G/L Account";
                        GLAccountList: Page "G/L Account List";
                    begin
                        GLAccount.RESET;
                        GLAccount.FILTERGROUP(2);
                        GLAccount.SETRANGE("Direct Posting", TRUE);
                        GLAccount.SETRANGE(Blocked, FALSE);
                        GLAccount.SETRANGE("Account Type", GLAccount."Account Type"::Posting);
                        GLAccount.SETFILTER("No.", '<>%1', OldGLNo);
                        GLAccount.FILTERGROUP(0);
                        GLAccountList.SETTABLEVIEW(GLAccount);
                        GLAccountList.LOOKUPMODE(TRUE);
                        IF GLAccountList.RUNMODAL = ACTION::LookupOK THEN BEGIN
                            GLAccountList.GETRECORD(GLAccount);
                            NewGLNo := GLAccount."No.";
                        END;
                    end;
                }
            }
        }

        actions
        {
        }

        trigger OnOpenPage()
        begin
            OldGLNo := PurchLine."No.";
        end;
    }

    labels
    {
    }

    trigger OnPostReport()
    begin
        MESSAGE('Process complete. Invoice and Posted Receipt lines related to this receipt changed from %2 to %3.', RecCount, OldGLNo, NewGLNo);
    end;

    trigger OnPreReport()
    begin
        RecCount := 0;
    end;

    var
        PurchRcptLine: Record "Purch. Rcpt. Line";
        PurchLine: Record "Purchase Line";
        OldGLNo: Code[20];
        NewGLNo: Code[20];
        RecCount: Integer;

    procedure SetPurchLine(PurchLineRec: Record "Purchase Line")
    begin
        PurchLine.COPY(PurchLineRec);
    end;

    local procedure UpdateOtherPurchLines(PurchLineRec: Record "Purchase Line")
    var
        PurchLine2: Record "Purchase Line";
    begin
        //Update other lines in this invoice
        PurchLine2.RESET;
        PurchLine2.SETFILTER("Document No.", PurchLineRec."Document No.");
        PurchLine2.SETRANGE("Document Type", PurchLineRec."Document Type");
        PurchLine2.SETFILTER("Line No.", '<>%1', PurchLineRec."Line No.");
        PurchLine2.SETRANGE("No.", OldGLNo);
        PurchLine2.SETRANGE("Receipt No.", PurchLineRec."Receipt No.");
        PurchLine2.SETRANGE("Receipt Line No.", PurchLineRec."Receipt Line No.");
        IF PurchLine2.FINDSET THEN BEGIN
            PurchLine2.MODIFYALL("No.", NewGLNo);
        END;

        //Update lines on other invoices
        PurchLine2.RESET;
        PurchLine2.SETFILTER("Document No.", '<>%1', PurchLineRec."Document No.");
        PurchLine2.SETRANGE("Document Type", PurchLineRec."Document Type");
        PurchLine2.SETRANGE("No.", OldGLNo);
        PurchLine2.SETRANGE("Receipt No.", PurchLineRec."Receipt No.");
        PurchLine2.SETRANGE("Receipt Line No.", PurchLineRec."Receipt Line No.");
        IF PurchLine2.FINDSET THEN BEGIN
            PurchLine2.MODIFYALL("No.", NewGLNo);
        END;
    end;

    local procedure ReceiptPreviouslyInvoiced(RcptNo: Code[20]; RcptLineNo: Integer) PreviouslyInvoiced: Boolean
    var
        PurRcptLn: Record "Purch. Rcpt. Line";
    begin
        PurRcptLn.GET(RcptNo, RcptLineNo);
        IF PurRcptLn."Quantity Invoiced" <> 0 THEN
            EXIT(TRUE)
        ELSE
            EXIT(FALSE);
    end;
}

