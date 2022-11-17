tableextension 50508 "CAT Time Sheet Header TabExt" extends "Time Sheet Header"  //950
{
    //CAT.001 2019-11-04 CL - add Resource Name to page

    fields
    {

    }
    procedure GetResourceName(): Text
    var
    begin
        GetResource();
        exit(Resource.Name);
    end;

    procedure GetResource();
    var
    begin
        if Resource."No." <> "Resource No." then
            if not Resource.get("Resource No.") then
                clear(Resource);
    end;

    var
        Resource: Record Resource;

}