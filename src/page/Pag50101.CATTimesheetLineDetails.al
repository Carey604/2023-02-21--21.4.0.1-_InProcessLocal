page 50101 "CAT Timesheet Line Details"
{
    PageType = List;
    SourceTable = "Time Sheet Detail";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Time Sheet No."; Rec."Time Sheet No.")
                {
                    ApplicationArea = All;
                }
                field("Time Sheet Line No."; Rec."Time Sheet Line No.")
                {
                    ApplicationArea = All;
                }
                field(Date; Rec.Date)
                {
                    ApplicationArea = All;
                }
                field(Type; Rec.Type)
                {
                    ApplicationArea = All;
                }
                field("Resource No."; Rec."Resource No.")
                {
                    ApplicationArea = All;
                }
                field("Job No."; Rec."Job No.")
                {
                    ApplicationArea = All;
                }
                field("Job Task No."; Rec."Job Task No.")
                {
                    ApplicationArea = All;
                }
                field("Cause of Absence Code"; Rec."Cause of Absence Code")
                {
                    ApplicationArea = All;
                }
                field("Service Order No."; Rec."Service Order No.")
                {
                    ApplicationArea = All;
                }
                field("Service Order Line No."; Rec."Service Order Line No.")
                {
                    ApplicationArea = All;
                }
                field(Quantity; Rec.Quantity)
                {
                    ApplicationArea = All;
                }
                field("Posted Quantity"; Rec."Posted Quantity")
                {
                    ApplicationArea = All;
                }
                field("Assembly Order No."; Rec."Assembly Order No.")
                {
                    ApplicationArea = All;
                }
                field("Assembly Order Line No."; Rec."Assembly Order Line No.")
                {
                    ApplicationArea = All;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = All;
                }
                field(Posted; Rec.Posted)
                {
                    ApplicationArea = All;
                }
            }
        }
    }

    actions
    {
    }
}

