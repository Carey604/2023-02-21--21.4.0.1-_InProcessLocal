tableextension 50509 "CAT Time Sheet Line TabExt" extends "Time Sheet Line" //951
{
    //CAT.001 2019-11-04 CL - add GetResourceName
    //CAT.001.001 2019-11-13 - add GetResourceNo
    //CAT.002 2019-12-20 CL - add onbeforeinsert

    fields
    {
        field(50000; "CAT Job Group Code"; Code[20])
        {
            Caption = 'Job Group Code';
            TableRelation = "CAT Job Group";
        }

        field(50001; "CAT Job No. Filter"; Option)
        {
            Caption = 'Job No. Filter';
            OptionMembers = "All","Filtered";
        }

        field(50002; "CAT Job No."; Code[20])
        {
            Caption = 'Job No.';
            TableRelation = IF ("CAT Job No. Filter" = CONST(All)) Job ELSE
            IF ("CAT Job No. Filter" = CONST(Filtered)) Job WHERE("CAT Job Group Code" = FIELD("CAT Job Group Code"));

            trigger OnValidate()
            var
                CATJobGroup: Record "CAT Job Group";
                CATJobRec: Record "Job";
            begin
                IF "Job No." <> "CAT Job No." then
                    "Job No." := "CAT Job No.";
                IF CATJobRec.GET("CAT Job No.") THEN begin
                    "CAT Job Group Code" := CATJObRec."CAT Job Group Code";
                end;
            end;
        }

        modify("Job No.")
        {
            trigger OnAfterValidate()
            begin
                IF ("Job No." <> "CAT Job No.") then begin
                    VALIDATE("CAT Job No.", Rec."Job No.");
                end;
            end;
        }
    }



    procedure GetResourceNo(): code[20]
    var
    begin
        GetTimeSheetHeader();
        exit(TimeSheetHeader."Resource No.");
    end;

    procedure GetResourceName(): Text
    var
    begin
        GetTimeSheetHeader();
        exit(TimeSheetHeader.GetResourceName());
    end;

    procedure GetTimeSheetHeader()
    var
    begin
        if TimeSheetHeader."No." <> "Time Sheet No." then
            if not TimeSheetHeader.get("Time Sheet No.") then
                clear(TimeSheetHeader);
    end;

    var
        TimeSheetHeader: record "Time Sheet Header";

}