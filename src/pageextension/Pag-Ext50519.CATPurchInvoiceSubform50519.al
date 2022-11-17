pageextension 50519 "CATPurch. Invoice Subform50519" extends "Purch. Invoice Subform"
{   //CAT.001 2021-08-20 CL - add fiix field
    layout
    {
        modify("Location Code")
        {
            Visible = false;
        }
        modify("Line Discount %")
        {
            Visible = false;
        }
        modify("Qty. to Assign")
        {
            Visible = false;
        }
        modify("Tax Area Code")
        {
            Visible = false;
        }
        modify("Qty. Assigned")
        {
            Visible = false;
        }
        addafter("Line Amount")
        {
            field("CATJob No.65105"; Rec."Job No.")
            {
                ApplicationArea = All;
                Width = 10;
            }
            field("CATJob Task No.96784"; Rec."Job Task No.")
            {
                ApplicationArea = All;
                Width = 9;
            }
            field("CAT Ship Date"; Rec."CAT Ship Date")
            {
                ApplicationArea = All;
                Editable = false;
            }
            field("CAT Print on PO Confirmation"; Rec."CAT Print on PO Confirmation")
            {
                ApplicationArea = All;
                Editable = false;
                Visible = false;
            }
            //>>CAT.001
            field("CAT Fiix Work Order No."; Rec."CAT Fiix Work Order No.")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the Fiix work order no.';
            }
            //<<CAT.001
        }
        modify("Shortcut Dimension 2 Code")
        {
            Visible = false;
        }
    }
    actions
    {
        addlast(Processing)
        {
            action(CATGLSwap)
            {
                Caption = 'Swap G/L Account No.';
                Image = ChangeTo;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                ApplicationArea = All;

                trigger OnAction()
                var
                    CATPurchLine: Record "Purchase Line";
                    CATGLAccSwap: Report "CAT Pur. Line G/L Account Swap";
                begin
                    IF (Rec."Receipt No." = '') OR (Rec."Receipt Line No." = 0) THEN
                        ERROR('You can only perform this on lines pulled from Purchase Receipts.');
                    IF Rec.Type <> Rec.Type::"G/L Account" THEN
                        ERROR('You can only run this on G/L account lines.');
                    CATPurchLine.SETRANGE("Document Type", Rec."Document Type");
                    CATPurchLine.SETRANGE("Document No.", Rec."Document No.");
                    CATPurchLine.SETRANGE("Line No.", Rec."Line No.");
                    IF CATPurchLine.FINDFIRST THEN BEGIN
                        CATGLAccSwap.SetPurchLine(CATPurchLine);
                        CATGLAccSwap.SETTABLEVIEW(CATPurchLine);
                        CATGLAccSwap.RUN;
                    END;
                end;
            }
        }
    }

    trigger OnNewRecord(BelowxRec: Boolean);
    begin
        Rec.Type := Rec.CATGetDefaultLineType();
    end;

}
