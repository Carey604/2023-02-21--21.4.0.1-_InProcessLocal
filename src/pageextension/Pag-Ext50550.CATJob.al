pageextension 50550 "CAT Job" extends "Job Card"
{
    layout
    {
        addafter("Job Posting Group")
        {
            field("CAT Job Group Code"; "CAT Job Group Code")
            {
                Caption = 'Job Group Code';
                ApplicationArea = All;
            }
        }
    }

    actions
    {
        // Add changes to page actions here
    }

    var
}