pageextension 50558 "CAT Team Member Act. No Msgs" extends "Team Member Activities No Msgs"
{
    layout
    {
        addafter("Open Time Sheets")
        {
            field("CAT New Time Sheets"; "CAT New Time Sheets")
            {
                ApplicationArea = All;
                DrillDownPageID = "Time Sheet List";
            }
        }
    }

    actions
    {
        // Add changes to page actions here
    }

    var
    //myInt: Integer;
}