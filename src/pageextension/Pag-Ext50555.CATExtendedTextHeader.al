pageextension 50555 "CAT Extended Text Header" extends "Extended Text"
{
    layout
    {
        addlast(content)
        {
            group(CATInventory)
            {
                Caption = 'Inventory';
                field("CAT Print on Phys. Inv. List"; Rec."CAT Print on Phys. Inv. List")
                {
                    ApplicationArea = All;
                    Tooltip = 'Print on the Physical Inventory List printed from the Phys. Inventory Journal.';
                }
            }
        }
    }
}