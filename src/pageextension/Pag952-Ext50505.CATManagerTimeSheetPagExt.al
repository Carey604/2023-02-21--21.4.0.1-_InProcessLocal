pageextension 50505 "CAT Manager Time Sheet PagExt" extends "Manager Time Sheet" //952
{
    //CAT.001 2019-11-13 CL - add Resource Name to page
    //CAT.002 2019-12-20 Cl - Add dimension info to page
    layout
    {
        addafter(ResourceNo)
        {
            field(CATGetResourceNameCtrl; GetResourceName())
            {
                ApplicationArea = ALL;
                Editable = False;
                Caption = 'Resource Name';
            }

        }
        addafter(Field5)
        {
            field(CATComment; Comment)
            {
                ApplicationArea = All;
            }
        }
        addafter(Type)
        {
            field("CATJob No.48688"; "Job No.")
            {
                ApplicationArea = All;
            }
            field("CATJob Task No.77969"; "Job Task No.")
            {
                ApplicationArea = All;
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
                Visible = False;
                Editable = false;
            }
            field(ShortcutDim2Ctrl; ShortcutDimCode[2])
            {
                ApplicationArea = All;
                Caption = 'Dimension 2 Code';
                CaptionClass = '1,2,2';
                Visible = False;
                Editable = false;
            }
            field(ShortcutDim3Ctrl; ShortcutDimCode[3])
            {
                ApplicationArea = All;
                Caption = 'Dimension 3 Code';
                CaptionClass = '1,2,3';
                Visible = True;
                Editable = false;
            }
            field(ShortcutDim4Ctrl; ShortcutDimCode[4])
            {
                ApplicationArea = All;
                Caption = 'Dimension 4 Code';
                CaptionClass = '1,2,4';
                Visible = True;
                Editable = false;
            }
            field(ShortcutDim5Ctrl; ShortcutDimCode[5])
            {
                ApplicationArea = All;
                Caption = 'Dimension 5 Code';
                CaptionClass = '1,2,5';
                Visible = True;
                Editable = false;
            }
            field(ShortcutDim6Ctrl; ShortcutDimCode[6])
            {
                ApplicationArea = All;
                Caption = 'Dimension 6 Code';
                CaptionClass = '1,2,6';
                Visible = True;
                Editable = false;
            }
            field(ShortcutDim7Ctrl; ShortcutDimCode[7])
            {
                ApplicationArea = All;
                Caption = 'Dimension 7 Code';
                CaptionClass = '1,2,7';
                Visible = False;
                Editable = false;
            }
            field(ShortcutDim8Ctrl; ShortcutDimCode[8])
            {
                ApplicationArea = All;
                Caption = 'Dimension 8 Code';
                CaptionClass = '1,2,8';
                Visible = False;
                Editable = false;
            }
        }
        modify(Field6)
        {
            Visible = true;
        }
        modify(Field7)
        {
            Visible = true;
        }
        moveafter(Field5; Field6)
        moveafter(Field6; Field7)
        //<<CAT.002
    }

    actions
    {
        modify("Activity &Details")
        {
            Promoted = false;
        }
        modify("Posting E&ntries")
        {
            Promoted = false;
        }
        modify("&Line")
        {
            Visible = false;
        }
    }

    //>>CAT.002
    trigger OnAfterGetRecord()
    var
        DimMgt: codeunit DimensionManagement;
    begin
        DimMgt.GetShortcutDimensions("Dimension Set ID", ShortcutDimCode);
    end;
    //<<CAT.002

    var
        ShortcutDimCode: ARRAY[8] OF Code[20]; //++CAT.002


}