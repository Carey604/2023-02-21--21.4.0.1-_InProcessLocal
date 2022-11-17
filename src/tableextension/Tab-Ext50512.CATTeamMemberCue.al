tableextension 50512 "CATTeamMemberCue" extends "Team Member Cue"
{
    fields
    {
        field(50500; "CAT New Time Sheets"; Integer)
        {
            CalcFormula = Count ("Time Sheet Header" WHERE("Owner User ID" = field("User ID Filter"), "Open Exists" = CONST(false), "Submitted Exists" = CONST(false), "Approved Exists" = CONST(false), "Posted Exists" = CONST(false), "Rejected Exists" = CONST(false)));
            Caption = 'New Time Sheets';
            Editable = false;
            FieldClass = FlowField;
        }
    }
}