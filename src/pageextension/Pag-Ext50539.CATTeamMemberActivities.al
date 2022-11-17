pageextension 50539 "CAT Team Member Activities" extends "Team Member Activities"
{
    layout
    {
        addlast("Time Sheets")
        {
            field("CAT New Time Sheets"; "CAT New Time Sheets")
            {
                ApplicationArea = All;
                DrillDownPageID = "Time Sheet List";
            }
        }
    }
}