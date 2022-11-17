pageextension 50102 "CAT Item Card" extends "Item Card" //30
{
    // CAT.001 2022-07-26 CL - new page extension. Show order modifier fields if Item.Type = Item.Type::Non-Inventory. 
    //      Normally those fields are part of Planning Group but we don't want to show all of standard Planning group, so 
    //      add new group and only show new if it type=non-inventory
    layout
    {
        addafter(Planning)
        {
            group("CAT Non-Inventory Order Modifiers")
            {
                Caption = 'Non-Inventory Type Order Modifiers';
                Visible = IsNonInventoriable and not IsService;
                group("CAT Control50000")
                {
                    ShowCaption = false;
                    field("CAT Minimum Order Quantity"; Rec."Minimum Order Quantity")
                    {
                        ApplicationArea = Planning;
                        ToolTip = 'Specifies a minimum allowable quantity for an item order proposal.';
                    }
                    field("CAT Maximum Order Quantity"; Rec."Maximum Order Quantity")
                    {
                        ApplicationArea = Planning;
                        ToolTip = 'Specifies a maximum allowable quantity for an item order proposal.';
                    }
                    field("CAT Order Multiple"; Rec."Order Multiple")
                    {
                        ApplicationArea = Planning;
                        ToolTip = 'Specifies a parameter used by the planning system to modify the quantity of planned supply orders.';
                    }
                }

            }
        }
    }


    actions
    {

    }

}
