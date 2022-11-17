tableextension 50510 "CAT Purch. & Pay. Setup TabExt" extends "Purchases & Payables Setup" //321
{
    // CAT.001 2019-12-20 CL - new pageext
    // CAT.002 2021-03-02 CL - new field 50001 to identify No. Series to use for Purchase Headers where "CAT Requisition" is true

    fields
    {
        field(50000; "CAT Def. New Purch. Line Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = " ","G/L Account",Item,"","Fixed Asset","Charge (Item)";
            Caption = 'Def. New Purch. Line Type';

            trigger OnValidate()
            var
            begin
                if ("CAT Def. New Purch. Line Type" = 3) then
                    FieldError("CAT Def. New Purch. Line Type");
            end;
        }
        field(50001; "CAT Requisition Quote Nos."; Code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Requisition Quote Nos.';
            TableRelation = "No. Series";
        }

    }
    var
}