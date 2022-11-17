pageextension 50540 "CAT Blanket Purchase Order" extends "Blanket Purchase Order" //509
{
    //CAT.002 2020-05-12 CL - add field and actions
    layout
    {
        //>>CAT.002
        addafter(Status)
        {
            field("CAT Blanket Order Version No."; "CAT Blanket Order Version No.")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the Blanket Order Version No.';
            }
            field("CAT Purchase Order Version No."; "CAT Purchase Order Version No.")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the Purchase Order Version No.';
            }
        }
        //<<CAT.002

    }

    actions
    {
        //CAT.002
        addfirst("F&unctions")
        {
            action("CAT Increment Version No.")
            {
                ApplicationArea = All;
                Caption = 'Increment Version No.';
                Ellipsis = true;
                Image = MoveUp;
                ToolTip = 'Increment the version no.';

                trigger OnAction()
                begin
                    CATIncrementVersion();
                    CurrPage.Update(true);
                end;
            }

        }
        //<<CAT.002
    }
}