page 50502 "CAT Purchase Order Status List"
{
    // CAT.001 2022-12-01 CL - new page
    ApplicationArea = All;
    Caption = 'Purchase Order Status List';
    PageType = List;
    SourceTable = "CAT Purchase Order Status";
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Code"; Rec."Code")
                {
                    ToolTip = 'Specifies the value of the Code field.';
                }
                field(Description; Rec.Description)
                {
                    ToolTip = 'Specifies the value of the Description field.';
                }
            }
        }
    }
}
