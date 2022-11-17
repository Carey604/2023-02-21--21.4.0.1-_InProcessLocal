page 50106 "CAT Time Sheet Line (PBI)"
{

    Caption = 'CAT Time Sheet Line (PBI)';
    PageType = List;
    SourceTable = "Time Sheet Line";

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Time Sheet No."; Rec."Time Sheet No.")
                {
                    ToolTip = 'Specifies the value of the Time Sheet No. field';
                    ApplicationArea = All;
                }
                field("Line No."; Rec."Line No.")
                {
                    ToolTip = 'Specifies the value of the Line No. field';
                    ApplicationArea = All;
                }
                field("Job No."; Rec."Job No.")
                {
                    ToolTip = 'Specifies the value of the Job No. field';
                    ApplicationArea = All;
                }
                field("Job Task No."; Rec."Job Task No.")
                {
                    ToolTip = 'Specifies the value of the Job Task No. field';
                    ApplicationArea = All;
                }
                field(Type; Rec.Type)
                {
                    ToolTip = 'Specifies the value of the Type field';
                    ApplicationArea = All;
                }
                field("Work Type Code"; Rec."Work Type Code")
                {
                    ToolTip = 'Specifies the value of the Work Type Code field';
                    ApplicationArea = All;
                }
                field(Description; Rec.Description)
                {
                    ToolTip = 'Specifies the value of the Description field';
                    ApplicationArea = All;
                }
                field("Total Quantity"; Rec."Total Quantity")
                {
                    ToolTip = 'Specifies the value of the Total Quantity field';
                    ApplicationArea = All;
                }
                field(Status; Rec.Status)
                {
                    ToolTip = 'Specifies the value of the Status field';
                    ApplicationArea = All;
                }
                field(Posted; Rec.Posted)
                {
                    ToolTip = 'Specifies the value of the Posted field';
                    ApplicationArea = All;
                }
                field("Cause of Absence Code"; Rec."Cause of Absence Code")
                {
                    ToolTip = 'Specifies the value of the Cause of Absence Code field';
                    ApplicationArea = All;
                }
                field("Approved By"; Rec."Approved By")
                {
                    ToolTip = 'Specifies the value of the Approved By field';
                    ApplicationArea = All;
                }
                field("Approval Date"; Rec."Approval Date")
                {
                    ToolTip = 'Specifies the value of the Approval Date field';
                    ApplicationArea = All;
                }
                field("Approver ID"; Rec."Approver ID")
                {
                    ToolTip = 'Specifies the value of the Approver ID field';
                    ApplicationArea = All;
                }
                field("Dimension Set ID"; Rec."Dimension Set ID")
                {
                    ToolTip = 'Specifies the value of the Dimension Set ID field';
                    ApplicationArea = All;
                }
                field("Time Sheet Starting Date"; Rec."Time Sheet Starting Date")
                {
                    ToolTip = 'Specifies the value of the Time Sheet Starting Date field';
                    ApplicationArea = All;
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
        CATShowShortcutDimCode(ShortcutDimCode);
    end;

    var
        ShortcutDimCode: array[8] of code[20];


    procedure CATShowShortCutDimCode(var ShortCutDimCode: array[8] of code[20])
    var
        DimMgt: Codeunit DimensionManagement;
    begin
        DimMgt.GetShortcutDimensions(Rec."Dimension Set ID", ShortcutDimCode);
    end;

}
