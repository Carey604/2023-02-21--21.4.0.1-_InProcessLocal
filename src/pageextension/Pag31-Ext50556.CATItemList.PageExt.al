pageextension 50556 "CAT Item List" extends "Item List" //31
{
    // CAT.001 2023-03-22 CL - add new fields to existing pagext.
    layout
    {
        // Add changes to page layout here
        //>>CAT.001
        addlast(Control1)
        {
            field("CAT Qty. on Purch. Order"; Rec."Qty. on Purch. Order")
            {
                ApplicationArea = Basic, Suite;
                ToolTip = 'Specifies how many units of the item are inbound on purchase orders, meaning listed on outstanding purchase order lines.';
            }

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
            field("CAT ExtendedTextLineText"; CATGetFirstExtendedTextLine())
            {
                ApplicationArea = Basic, Suite;
                Caption = 'First Attribute Extended Text';
                ToolTip = 'Shows the first extended text line related to the item where the extended text description is ''Attribute''. Note that the text description ''Attribute'' is case sensitive.';
            }

        }
        //<<CAT.001
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

    //>>CAT.001
    local procedure CATGetFirstExtendedTextLine(): Text
    var
        ExtendedTextHeader: Record "Extended Text Header";
    begin
        ExtendedTextHeader.SetRange("Table Name", ExtendedTextHeader."Table Name"::Item);
        ExtendedTextHeader.SetRange("No.", Rec."No.");
        ExtendedTextHeader.SetRange(Description, 'Attributes'); //spec says look for hardcoded string
        if ExtendedTextHeader.FindFirst() then
            exit(CATGetFirstExtendedTextLineOfExtendedTextHeader(ExtendedTextHeader));

        exit('');
    end;

    local procedure CATGetFirstExtendedTextLineOfExtendedTextHeader(ExtendedTextHeader: Record "Extended Text Header"): Text
    var
        ExtendedTextLine: Record "Extended Text Line";
    begin
        ExtendedTextLine.SetRange("Table Name", ExtendedTextHeader."Table Name");
        ExtendedTextLine.SetRange("No.", ExtendedTextHeader."No.");
        ExtendedTextLine.SetRange("Language Code", ExtendedTextHeader."Language Code");
        ExtendedTextLine.SetRange("Text No.", ExtendedTextHeader."Text No.");
        if ExtendedTextLine.FindFirst() then
            exit(ExtendedTextLine.Text);

        exit('');
    end;
    //<<CAT.001

    var

}