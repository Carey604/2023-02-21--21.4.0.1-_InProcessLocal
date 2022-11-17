page 50104 "CAT Time Sheet Detail PBI"
{

    Caption = 'CAT Time Sheet Detail PBI';
    PageType = List;
    SourceTable = "Time Sheet Detail";
    UsageCategory = None;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Cause of Absence Code"; Rec."Cause of Absence Code")
                {
                    ApplicationArea = All;
                }
                field("Dimension Set ID"; Rec."Dimension Set ID")
                {
                    ApplicationArea = All;
                }
                field("Job No."; Rec."Job No.")
                {
                    ApplicationArea = All;
                }
                field("Job Task No."; Rec."Job Task No.")
                {
                    ApplicationArea = All;
                }
                field("Posted Quantity"; Rec."Posted Quantity")
                {
                    ApplicationArea = All;
                }
                field("Resource No."; Rec."Resource No.")
                {
                    ApplicationArea = All;
                }
                field("Time Sheet Line No."; Rec."Time Sheet Line No.")
                {
                    ApplicationArea = All;
                }
                field("Time Sheet No."; Rec."Time Sheet No.")
                {
                    ApplicationArea = All;
                }
                field(Date; Rec.Date)
                {
                    ApplicationArea = All;
                }
                field(Posted; Rec.Posted)
                {
                    ApplicationArea = All;
                }
                field(Quantity; Rec.Quantity)
                {
                    ApplicationArea = All;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = All;
                }
                field(Type; Rec.Type)
                {
                    ApplicationArea = All;
                }
                field(CATJobName; CATJob.Description)
                {
                    ApplicationArea = All;
                    Caption = 'Job Name';
                }
                field(CATJobTaskName; CATJobTask.Description)
                {
                    ApplicationArea = All;
                    Caption = 'Job Task Name';
                }
                field(CATTimeSheetStartDate; CATTimeSheetHeader."Starting Date")
                {
                    ApplicationArea = All;
                    Caption = 'Time Sheet Start Date';
                }
                field(CATTimeSheet; CATTimeSheetHeader."Owner User ID")
                {
                    ApplicationArea = All;
                    Caption = 'Time Sheet Owner User ID';
                }
                field(CATTimeSheetLine; CATTimeSheetLine."CAT Job Group Code")
                {
                    ApplicationArea = All;
                    Caption = 'Job Group Code';
                }

                field(CATShortcutDimCode1; ShortcutDimCode[1])
                {
                    ApplicationArea = All;
                    Caption = 'Shortcut Dimension 1 Code';
                    TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(1), "Dimension Value Type" = CONST(Standard), Blocked = CONST(false));
                    CaptionClass = '1,2,1';

                }
                field(CATShortcutDimCode2; ShortcutDimCode[2])
                {
                    ApplicationArea = All;
                    Caption = 'Shortcut Dimension 2 Code';
                    TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(2), "Dimension Value Type" = CONST(Standard), Blocked = CONST(false));
                    CaptionClass = '1,2,2';

                }
                field(CATShortcutDimCode3; ShortcutDimCode[3])
                {
                    ApplicationArea = All;
                    Caption = 'Shortcut Dimension 3 Code';
                    TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(3), "Dimension Value Type" = CONST(Standard), Blocked = CONST(false));
                    CaptionClass = '1,2,3';

                }
                field(CATShortcutDimCode4; ShortcutDimCode[4])
                {
                    ApplicationArea = All;
                    Caption = 'Shortcut Dimension 4 Code';
                    TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(4), "Dimension Value Type" = CONST(Standard), Blocked = CONST(false));
                    CaptionClass = '1,2,4';

                }
                field(CATShortcutDimCode5; ShortcutDimCode[5])
                {
                    ApplicationArea = All;
                    Caption = 'Shortcut Dimension 5 Code';
                    TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(5), "Dimension Value Type" = CONST(Standard), Blocked = CONST(false));
                    CaptionClass = '1,2,5';

                }
                field(CATShortcutDimCode6; ShortcutDimCode[6])
                {
                    ApplicationArea = All;
                    Caption = 'Shortcut Dimension 6 Code';
                    TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(6), "Dimension Value Type" = CONST(Standard), Blocked = CONST(false));
                    CaptionClass = '1,2,6';

                }
                field(CATShortcutDimCode7; ShortcutDimCode[7])
                {
                    ApplicationArea = All;
                    Caption = 'Shortcut Dimension 7 Code';
                    TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(7), "Dimension Value Type" = CONST(Standard), Blocked = CONST(false));
                    CaptionClass = '1,2,7';

                }
                field(CATShortcutDimCode8; ShortcutDimCode[8])
                {
                    ApplicationArea = All;
                    Caption = 'Shortcut Dimension 8 Code';
                    TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(8), "Dimension Value Type" = CONST(Standard), Blocked = CONST(false));
                    CaptionClass = '1,2,8';

                }
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        CATTimeSheetHeader.RESET;
        CATTimeSheetHeader.GET(Rec."Time Sheet No.");
        CATTimeSheetLine.RESET;
        CATTimeSheetLine.GET(Rec."Time Sheet No.", Rec."Time Sheet Line No.");
        IF Rec."Job No." <> '' then
            CATJob.GET(Rec."Job No.");
        IF Rec."Job Task No." <> '' then
            CATJobTask.GET(Rec."Job No.", Rec."Job Task No.");
        CATShowShortcutDimCode(ShortcutDimCode);
    end;

    var
        CATTimeSheetHeader: Record "Time Sheet Header";
        CATTimeSheetLine: Record "Time Sheet Line";
        CATJob: Record "Job";
        CATJobTask: Record "Job Task";
        ShortcutDimCode: array[8] of code[20];

    procedure CATShowShortCutDimCode(var ShortCutDimCode: array[8] of code[20])
    var
        DimMgt: Codeunit DimensionManagement;
    begin
        DimMgt.GetShortcutDimensions(Rec."Dimension Set ID", ShortcutDimCode);
    end;

}
