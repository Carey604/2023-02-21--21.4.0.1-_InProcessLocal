tableextension 50525 "CAT My Time Sheets" extends "My Time Sheets"
{
    fields
    {
        field(50000; "CAT Archived"; Boolean)
        {
            Caption = 'Archived';
            FieldClass = FlowField;
            CalcFormula = Exist("Time Sheet Header Archive" WHERE("No." = FIELD("Time Sheet No.")));
        }
    }

    var

}