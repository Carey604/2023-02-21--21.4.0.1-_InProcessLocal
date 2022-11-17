pageextension 50507 "CAT Manager Time Sheet by Job" extends "Manager Time Sheet by Job" //954
{
    //CAT.001 2019-11-13 CL - add Resource No and Name to page

    layout
    {
        addafter(Description)
        {
            field(CATGetResourceNoCtrl; GetResourceNo())
            {
                ApplicationArea = ALL;
                Editable = False;
                Caption = 'Resource No.';
            }

            field(CATGetResourceNameCtrl; GetResourceName())
            {
                ApplicationArea = ALL;
                Editable = False;
                Caption = 'Resource Name';
            }
        }

    }

    actions
    {
    }
}