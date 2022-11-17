enum 50100 "CAT Purchase Req. Priority"
{
    //CAT.001 2020-12-16 CL - new enum
    AssignmentCompatibility = true;
    Extensible = true;

    value(0; " ") { Caption = ' '; }
    value(1; "Cancel") { Caption = 'Cancel'; }
    value(2; "Hold") { Caption = 'Hold'; }
    value(3; "Low") { Caption = 'Low'; }
    value(4; "Standard") { Caption = 'Standard'; }
    value(5; "Critical/Urgent") { Caption = 'Critical/Urgent'; }

}