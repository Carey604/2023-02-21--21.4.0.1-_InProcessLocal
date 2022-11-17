pageextension 50518 "CATItem Lookup50518" extends "Item Lookup"
{
    layout
    {
        addafter("Base Unit of Measure")
        {
            field(CATInventory; Inventory)
            {
                ApplicationArea = All;
            }
        }
    }
    actions
    {
    }
}
