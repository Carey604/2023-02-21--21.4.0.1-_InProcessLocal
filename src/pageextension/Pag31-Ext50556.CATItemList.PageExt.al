pageextension 50556 "CAT Item List" extends "Item List"
{
    layout
    {
        // Add changes to page layout here
    }

    actions
    {
        addafter("Phys. Inventory List")
        {
            action("CAT Phys. Inventory List")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Phys. Inventory List';
                Image = Report;
                Scope = Page;
                ToolTip = 'View a list of the lines that you have calculated in the Phys. Inventory Journal window. You can use this report during the physical inventory count to mark down actual quantities on hand in the warehouse and compare them to what is recorded in the program.';
                RunObject = Report "CAT Phys. Inventory List";
            }
        }
        modify("Phys. Inventory List")
        {
            Visible = false;
        }
    }

    var
    //myInt: Integer;
}