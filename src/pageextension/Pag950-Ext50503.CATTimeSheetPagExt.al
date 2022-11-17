pageextension 50503 "CAT Time Sheet PagExt" extends "Time Sheet" //950
{
    //CAT.001 2019-11-04 CL - add Resource Name to page
    //CAT.002 2019-12-20 Cl - Add dimension info to page
    layout
    {
        addafter(ResourceNo)
        {
            field(CATGetResourceNameCtrl; Rec.GetResourceName())
            {
                ApplicationArea = ALL;
                Editable = False;
                Caption = 'Resource Name';
            }
        }
        addafter(Status)
        {
            field(CATComment; Rec.Comment)
            {
                ApplicationArea = All;
            }
        }
        addafter(Type)
        {
            field("CAT Job Group Code"; Rec."CAT Job Group Code")
            {
                Caption = 'Job Group Code';
                ApplicationArea = All;

                trigger OnValidate()
                begin
                    CATSetJobNoFilter();
                end;
            }

            field("CAT Job No."; Rec."CAT Job No.")
            {
                Caption = 'Job No.';
                ApplicationArea = All;
                Width = 10;
            }
            /*
            field("CATJob No.93558"; Rec."Job No.")
            {
                ApplicationArea = All;
                Width = 10;
                Visible = false;
            }
            */
            field("CATJob Task No.56973"; Rec."Job Task No.")
            {
                ApplicationArea = All;
                Width = 13;
            }

        }
        //>>CAT.002
        addlast(Control1)
        {
            field(ShortcutDim1Ctrl; ShortcutDimCode[1])
            {
                ApplicationArea = All;
                Caption = 'Dimension 1 Code';
                CaptionClass = '1,2,1';
                Visible = true;
                //Editable = false;
                Editable = true;

                trigger OnValidate()
                begin
                    CATUpdateDimension(1, ShortcutDimCode[1]);
                end;

                trigger OnLookup(var Text: Text): Boolean
                var
                    CATDimensionValue: Record "Dimension Value";
                    CATDimensionValues: Page "Dimension Values";
                    CATGLSetup: Record "General Ledger Setup";
                begin
                    CATGLSetup.GET;
                    CLEAR(CATDimensionValue);
                    CATDimensionValue.FILTERGROUP(2);
                    CATDimensionValue.SETRANGE("Dimension Code", CATGLSetup."Shortcut Dimension 1 Code"); //Update
                    CATDimensionValue.SETRANGE("Dimension Value Type", CATDimensionValue."Dimension Value Type"::Standard);
                    CATDimensionValue.SETRANGE(Blocked, false);
                    CATDimensionValue.FILTERGROUP(0);
                    CATDimensionValues.SETTABLEVIEW(CATDimensionValue);
                    CATDimensionValues.LOOKUPMODE(TRUE);
                    IF CATDimensionValues.RUNMODAL = ACTION::LookupOK THEN BEGIN
                        CATDimensionValues.GETRECORD(CATDimensionValue);
                        ShortcutDimCode[1] := CATDimensionValue.Code; //Update
                        CATUpdateDimension(1, ShortcutDimCode[1]); //Update
                    END;
                end;
            }

            field(ShortcutDim2Ctrl; ShortcutDimCode[2])
            {
                ApplicationArea = All;
                Caption = 'Dimension 2 Code';
                CaptionClass = '1,2,2';
                Visible = true;
                //Editable = false;
                Editable = true;

                trigger OnValidate()
                begin
                    CATUpdateDimension(2, ShortcutDimCode[2]);
                end;

                trigger OnLookup(var Text: Text): Boolean
                var
                    CATDimensionValue: Record "Dimension Value";
                    CATDimensionValues: Page "Dimension Values";
                    CATGLSetup: Record "General Ledger Setup";
                begin
                    CATGLSetup.GET;
                    CLEAR(CATDimensionValue);
                    CATDimensionValue.FILTERGROUP(2);
                    CATDimensionValue.SETRANGE("Dimension Code", CATGLSetup."Shortcut Dimension 2 Code"); //Update
                    CATDimensionValue.SETRANGE("Dimension Value Type", CATDimensionValue."Dimension Value Type"::Standard);
                    CATDimensionValue.SETRANGE(Blocked, false);
                    CATDimensionValue.FILTERGROUP(0);
                    CATDimensionValues.SETTABLEVIEW(CATDimensionValue);
                    CATDimensionValues.LOOKUPMODE(TRUE);
                    IF CATDimensionValues.RUNMODAL = ACTION::LookupOK THEN BEGIN
                        CATDimensionValues.GETRECORD(CATDimensionValue);
                        ShortcutDimCode[2] := CATDimensionValue.Code; //Update
                        CATUpdateDimension(2, ShortcutDimCode[2]); //Update
                    END;
                end;

            }
            field(ShortcutDim3Ctrl; ShortcutDimCode[3])
            {
                ApplicationArea = All;
                Caption = 'Dimension 3 Code';
                CaptionClass = '1,2,3';
                Visible = True;
                //Editable = false;
                Editable = true;

                trigger OnValidate()
                begin
                    CATUpdateDimension(3, ShortcutDimCode[3]);
                end;

                trigger OnLookup(var Text: Text): Boolean
                var
                    CATDimensionValue: Record "Dimension Value";
                    CATDimensionValues: Page "Dimension Values";
                    CATGLSetup: Record "General Ledger Setup";
                begin
                    CATGLSetup.GET;
                    CLEAR(CATDimensionValue);
                    CATDimensionValue.FILTERGROUP(2);
                    CATDimensionValue.SETRANGE("Dimension Code", CATGLSetup."Shortcut Dimension 3 Code"); //Update
                    CATDimensionValue.SETRANGE("Dimension Value Type", CATDimensionValue."Dimension Value Type"::Standard);
                    CATDimensionValue.SETRANGE(Blocked, false);
                    CATDimensionValue.FILTERGROUP(0);
                    CATDimensionValues.SETTABLEVIEW(CATDimensionValue);
                    CATDimensionValues.LOOKUPMODE(TRUE);
                    IF CATDimensionValues.RUNMODAL = ACTION::LookupOK THEN BEGIN
                        CATDimensionValues.GETRECORD(CATDimensionValue);
                        ShortcutDimCode[3] := CATDimensionValue.Code; //Update
                        CATUpdateDimension(3, ShortcutDimCode[3]); //Update
                    END;
                end;
            }
            field(ShortcutDim4Ctrl; ShortcutDimCode[4])
            {
                ApplicationArea = All;
                Caption = 'Dimension 4 Code';
                CaptionClass = '1,2,4';
                Visible = True;
                //Editable = false;
                Editable = true;

                trigger OnValidate()
                begin
                    CATUpdateDimension(4, ShortcutDimCode[4]);
                end;

                trigger OnLookup(var Text: Text): Boolean
                var
                    CATDimensionValue: Record "Dimension Value";
                    CATDimensionValues: Page "Dimension Values";
                    CATGLSetup: Record "General Ledger Setup";
                begin
                    CATGLSetup.GET;
                    CLEAR(CATDimensionValue);
                    CATDimensionValue.FILTERGROUP(2);
                    CATDimensionValue.SETRANGE("Dimension Code", CATGLSetup."Shortcut Dimension 4 Code"); //Update
                    CATDimensionValue.SETRANGE("Dimension Value Type", CATDimensionValue."Dimension Value Type"::Standard);
                    CATDimensionValue.SETRANGE(Blocked, false);
                    CATDimensionValue.FILTERGROUP(0);
                    CATDimensionValues.SETTABLEVIEW(CATDimensionValue);
                    CATDimensionValues.LOOKUPMODE(TRUE);
                    IF CATDimensionValues.RUNMODAL = ACTION::LookupOK THEN BEGIN
                        CATDimensionValues.GETRECORD(CATDimensionValue);
                        ShortcutDimCode[4] := CATDimensionValue.Code; //Update
                        CATUpdateDimension(4, ShortcutDimCode[4]); //Update
                    END;
                end;
            }
            field(ShortcutDim5Ctrl; ShortcutDimCode[5])
            {
                ApplicationArea = All;
                Caption = 'Dimension 5 Code';
                CaptionClass = '1,2,5';
                Visible = true;
                //Editable = false;
                Editable = true;

                trigger OnValidate()
                begin
                    CATUpdateDimension(5, ShortcutDimCode[5]);
                end;

                trigger OnLookup(var Text: Text): Boolean
                var
                    CATDimensionValue: Record "Dimension Value";
                    CATDimensionValues: Page "Dimension Values";
                    CATGLSetup: Record "General Ledger Setup";
                begin
                    CATGLSetup.GET;
                    CLEAR(CATDimensionValue);
                    CATDimensionValue.FILTERGROUP(2);
                    CATDimensionValue.SETRANGE("Dimension Code", CATGLSetup."Shortcut Dimension 5 Code"); //Update
                    CATDimensionValue.SETRANGE("Dimension Value Type", CATDimensionValue."Dimension Value Type"::Standard);
                    CATDimensionValue.SETRANGE(Blocked, false);
                    CATDimensionValue.FILTERGROUP(0);
                    CATDimensionValues.SETTABLEVIEW(CATDimensionValue);
                    CATDimensionValues.LOOKUPMODE(TRUE);
                    IF CATDimensionValues.RUNMODAL = ACTION::LookupOK THEN BEGIN
                        CATDimensionValues.GETRECORD(CATDimensionValue);
                        ShortcutDimCode[5] := CATDimensionValue.Code; //Update
                        CATUpdateDimension(5, ShortcutDimCode[5]); //Update
                    END;
                end;
            }
            field(ShortcutDim6Ctrl; ShortcutDimCode[6])
            {
                ApplicationArea = All;
                Caption = 'Dimension 6 Code';
                CaptionClass = '1,2,6';
                Visible = true;
                //Editable = false;
                Editable = true;

                trigger OnValidate()
                begin
                    CATUpdateDimension(6, ShortcutDimCode[6]);
                end;

                trigger OnLookup(var Text: Text): Boolean
                var
                    CATDimensionValue: Record "Dimension Value";
                    CATDimensionValues: Page "Dimension Values";
                    CATGLSetup: Record "General Ledger Setup";
                begin
                    CATGLSetup.GET;
                    CLEAR(CATDimensionValue);
                    CATDimensionValue.FILTERGROUP(2);
                    CATDimensionValue.SETRANGE("Dimension Code", CATGLSetup."Shortcut Dimension 6 Code"); //Update
                    CATDimensionValue.SETRANGE("Dimension Value Type", CATDimensionValue."Dimension Value Type"::Standard);
                    CATDimensionValue.SETRANGE(Blocked, false);
                    CATDimensionValue.FILTERGROUP(0);
                    CATDimensionValues.SETTABLEVIEW(CATDimensionValue);
                    CATDimensionValues.LOOKUPMODE(TRUE);
                    IF CATDimensionValues.RUNMODAL = ACTION::LookupOK THEN BEGIN
                        CATDimensionValues.GETRECORD(CATDimensionValue);
                        ShortcutDimCode[6] := CATDimensionValue.Code; //Update
                        CATUpdateDimension(6, ShortcutDimCode[6]); //Update
                    END;
                end;
            }
            field(ShortcutDim7Ctrl; ShortcutDimCode[7])
            {
                ApplicationArea = All;
                Caption = 'Dimension 7 Code';
                CaptionClass = '1,2,7';
                Visible = False;
                //Editable = false;
                Editable = true;

                trigger OnValidate()
                begin
                    CATUpdateDimension(7, ShortcutDimCode[7]);
                end;

                trigger OnLookup(var Text: Text): Boolean
                var
                    CATDimensionValue: Record "Dimension Value";
                    CATDimensionValues: Page "Dimension Values";
                    CATGLSetup: Record "General Ledger Setup";
                begin
                    CATGLSetup.GET;
                    CLEAR(CATDimensionValue);
                    CATDimensionValue.FILTERGROUP(2);
                    CATDimensionValue.SETRANGE("Dimension Code", CATGLSetup."Shortcut Dimension 7 Code"); //Update
                    CATDimensionValue.SETRANGE("Dimension Value Type", CATDimensionValue."Dimension Value Type"::Standard);
                    CATDimensionValue.SETRANGE(Blocked, false);
                    CATDimensionValue.FILTERGROUP(0);
                    CATDimensionValues.SETTABLEVIEW(CATDimensionValue);
                    CATDimensionValues.LOOKUPMODE(TRUE);
                    IF CATDimensionValues.RUNMODAL = ACTION::LookupOK THEN BEGIN
                        CATDimensionValues.GETRECORD(CATDimensionValue);
                        ShortcutDimCode[7] := CATDimensionValue.Code; //Update
                        CATUpdateDimension(7, ShortcutDimCode[7]); //Update
                    END;
                end;
            }
            field(ShortcutDim8Ctrl; ShortcutDimCode[8])
            {
                ApplicationArea = All;
                Caption = 'Dimension 8 Code';
                CaptionClass = '1,2,8';
                Visible = False;
                //Editable = false;
                Editable = true;

                trigger OnValidate()
                begin
                    CATUpdateDimension(8, ShortcutDimCode[8]);
                end;

                trigger OnLookup(var Text: Text): Boolean
                var
                    CATDimensionValue: Record "Dimension Value";
                    CATDimensionValues: Page "Dimension Values";
                    CATGLSetup: Record "General Ledger Setup";
                begin
                    CATGLSetup.GET;
                    CLEAR(CATDimensionValue);
                    CATDimensionValue.FILTERGROUP(2);
                    CATDimensionValue.SETRANGE("Dimension Code", CATGLSetup."Shortcut Dimension 8 Code"); //Update
                    CATDimensionValue.SETRANGE("Dimension Value Type", CATDimensionValue."Dimension Value Type"::Standard);
                    CATDimensionValue.SETRANGE(Blocked, false);
                    CATDimensionValue.FILTERGROUP(0);
                    CATDimensionValues.SETTABLEVIEW(CATDimensionValue);
                    CATDimensionValues.LOOKUPMODE(TRUE);
                    IF CATDimensionValues.RUNMODAL = ACTION::LookupOK THEN BEGIN
                        CATDimensionValues.GETRECORD(CATDimensionValue);
                        ShortcutDimCode[8] := CATDimensionValue.Code; //Update
                        CATUpdateDimension(8, ShortcutDimCode[8]); //Update
                    END;
                end;
            }
        }
        //<<CAT.002


    }
    actions
    {
        modify("Activity &Details")
        {
            Promoted = false;
            Visible = false;
        }
        modify(CreateLinesFromJobPlanning)
        {
            Promoted = false;
            Visible = false;
        }
        modify("Time Sheet Allocation")
        {
            Promoted = false;
            Visible = false;
        }
    }
    //>>CAT.002
    trigger OnAfterGetRecord()
    var
        DimMgt: codeunit DimensionManagement;
    begin
        CATClearDims;
        IF Rec."Dimension Set ID" <> 0 then
            DimMgt.GetShortcutDimensions(Rec."Dimension Set ID", ShortcutDimCode);
        Rec."CAT Job No." := Rec."Job No.";
        CATSetJobNoFilter;
    end;

    trigger OnNewRecord(BelowxRec: Boolean);
    begin
        CATClearDims;
        Rec.Type := Rec.Type::Job;
        CATSetJobNoFilter;
    end;
    //<<CAT.002

    trigger OnModifyRecord(): Boolean
    begin
        CATSetJobNoFilter;
    end;

    var
        ShortcutDimCode: ARRAY[8] OF Code[20]; //++CAT.002


    local procedure CATSetJobNoFilter();
    begin
        IF Rec."CAT Job Group Code" = '' then
            Rec."CAT Job No. Filter" := Rec."CAT Job No. Filter"::All
        else
            Rec."CAT Job No. Filter" := Rec."CAT Job No. Filter"::Filtered;
    end;

    local procedure CATClearDims();
    var
        n: Integer;
    begin
        FOR n := 1 to 8 do
            ShortcutDimCode[n] := '';
    end;

    local procedure CATUpdateDimension(DimNo: Integer; DimCode: Code[20]);
    var
        CATTempDimSetEntry: Record "Dimension Set Entry" temporary;
        CATDimMgt: Codeunit DimensionManagement;
        CATGLSetup: Record "General Ledger Setup";
    begin

        CATTempDimSetEntry.RESET;
        CATTempDimSetEntry.DELETEALL;
        CATGLSetup.GET;

        IF Rec."Dimension Set ID" <> 0 THEN
            CATDimMgt.GetDimensionSet(CATTempDimSetEntry, Rec."Dimension Set ID")
        ELSE
            Rec."Dimension Set ID" := 99999;

        CATTempDimSetEntry.RESET;
        CASE DimNo of
            1:
                CATTempDimSetEntry.SETRANGE("Dimension Code", CATGLSetup."Shortcut Dimension 1 Code");
            2:
                CATTempDimSetEntry.SETRANGE("Dimension Code", CATGLSetup."Shortcut Dimension 2 Code");
            3:
                CATTempDimSetEntry.SETRANGE("Dimension Code", CATGLSetup."Shortcut Dimension 3 Code");
            4:
                CATTempDimSetEntry.SETRANGE("Dimension Code", CATGLSetup."Shortcut Dimension 4 Code");
            5:
                CATTempDimSetEntry.SETRANGE("Dimension Code", CATGLSetup."Shortcut Dimension 5 Code");
            6:
                CATTempDimSetEntry.SETRANGE("Dimension Code", CATGLSetup."Shortcut Dimension 6 Code");
            7:
                CATTempDimSetEntry.SETRANGE("Dimension Code", CATGLSetup."Shortcut Dimension 7 Code");
            8:
                CATTempDimSetEntry.SETRANGE("Dimension Code", CATGLSetup."Shortcut Dimension 8 Code");
        end;

        IF ShortcutDimCode[DimNo] <> '' THEN BEGIN
            IF NOT CATTempDimSetEntry.FINDFIRST THEN BEGIN
                CATTempDimSetEntry.INIT;

                CASE DimNo of
                    1:
                        CATTempDimSetEntry.VALIDATE("Dimension Code", CATGLSetup."Shortcut Dimension 1 Code");
                    2:
                        CATTempDimSetEntry.VALIDATE("Dimension Code", CATGLSetup."Shortcut Dimension 2 Code");
                    3:
                        CATTempDimSetEntry.VALIDATE("Dimension Code", CATGLSetup."Shortcut Dimension 3 Code");
                    4:
                        CATTempDimSetEntry.VALIDATE("Dimension Code", CATGLSetup."Shortcut Dimension 4 Code");
                    5:
                        CATTempDimSetEntry.VALIDATE("Dimension Code", CATGLSetup."Shortcut Dimension 5 Code");
                    6:
                        CATTempDimSetEntry.VALIDATE("Dimension Code", CATGLSetup."Shortcut Dimension 6 Code");
                    7:
                        CATTempDimSetEntry.VALIDATE("Dimension Code", CATGLSetup."Shortcut Dimension 7 Code");
                    8:
                        CATTempDimSetEntry.VALIDATE("Dimension Code", CATGLSetup."Shortcut Dimension 8 Code");
                end;

                CATTempDimSetEntry.VALIDATE("Dimension Value Code", ShortcutDimCode[DimNo]);
                CATTempDimSetEntry."Dimension Set ID" := Rec."Dimension Set ID";
                CATTempDimSetEntry.INSERT;
            END ELSE begin

                CASE DimNo of
                    1:
                        CATTempDimSetEntry.VALIDATE("Dimension Code", CATGLSetup."Shortcut Dimension 1 Code");
                    2:
                        CATTempDimSetEntry.VALIDATE("Dimension Code", CATGLSetup."Shortcut Dimension 2 Code");
                    3:
                        CATTempDimSetEntry.VALIDATE("Dimension Code", CATGLSetup."Shortcut Dimension 3 Code");
                    4:
                        CATTempDimSetEntry.VALIDATE("Dimension Code", CATGLSetup."Shortcut Dimension 4 Code");
                    5:
                        CATTempDimSetEntry.VALIDATE("Dimension Code", CATGLSetup."Shortcut Dimension 5 Code");
                    6:
                        CATTempDimSetEntry.VALIDATE("Dimension Code", CATGLSetup."Shortcut Dimension 6 Code");
                    7:
                        CATTempDimSetEntry.VALIDATE("Dimension Code", CATGLSetup."Shortcut Dimension 7 Code");
                    8:
                        CATTempDimSetEntry.VALIDATE("Dimension Code", CATGLSetup."Shortcut Dimension 8 Code");
                end;

                CATTempDimSetEntry.VALIDATE("Dimension Value Code", ShortcutDimCode[DimNo]);
                CATTempDimSetEntry."Dimension Set ID" := Rec."Dimension Set ID";
                CATTempDimSetEntry.MODIFY;
            end;
        END else
            IF CATTempDimSetEntry.FINDFIRST THEN
                CATTempDimSetEntry.Delete();
        CATTempDimSetEntry.RESET;
        Rec."Dimension Set ID" := CATDimMgt.GetDimensionSetID(CATTempDimSetEntry);
        Rec.MODIFY;
    end;

    var

}