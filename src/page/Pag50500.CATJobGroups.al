page 50500 "CAT Job Groups"
{

    Caption = 'Job Groups';
    PageType = List;
    SourceTable = "CAT Job Group";

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field(Code; Rec.Code)
                {
                    ApplicationArea = All;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                }
            }
        }
    }

}
