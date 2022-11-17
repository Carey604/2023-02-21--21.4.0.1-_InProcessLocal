pageextension 50557 "CAT My Time Sheets" extends "My Time Sheets"
{
    layout
    {
        // Add changes to page layout here
    }

    actions
    {
        // Add changes to page actions here
    }

    trigger OnOpenPage()
    begin
        Rec.SETRANGE("CAT Archived", false);
    end;
}