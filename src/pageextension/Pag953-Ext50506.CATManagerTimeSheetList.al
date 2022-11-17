pageextension 50506 "CAT Manager Time Sheet List" extends "Manager Time Sheet List" //953
{
    //CAT.001 2019-11-13 CL - add Resource Name to page

    layout
    {
        addafter("Resource No.")
        {
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