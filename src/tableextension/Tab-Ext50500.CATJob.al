tableextension 50500 "CAT Job" extends Job
{
    fields
    {
        field(50000; "CAT Job Group Code"; Code[20])
        {
            Caption = 'Job Group Code';
            TableRelation = "CAT Job Group";
        }
    }
}
