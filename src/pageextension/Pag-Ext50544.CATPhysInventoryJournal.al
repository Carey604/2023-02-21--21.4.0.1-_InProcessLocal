pageextension 50544 "CAT Phys. Inventory Journal" extends "Phys. Inventory Journal"
{
    layout
    {
        // Add changes to page layout here
    }

    actions
    {
        // Add changes to page actions here
        addafter(Print)
        {
            action(CATPrint)
            {
                ApplicationArea = Basic, Suite;
                Caption = '&Print';
                Ellipsis = true;
                Image = Print;
                Promoted = true;
                PromotedCategory = Category4;
                Scope = Repeater;
                ToolTip = 'Prepare to print the document. A report request window for the document opens where you can specify what to include on the print-out.';

                trigger OnAction()
                begin
                    CATItemJournalBatch.SetRange("Journal Template Name", Rec."Journal Template Name");
                    CATItemJournalBatch.SetRange(Name, Rec."Journal Batch Name");
                    REPORT.RunModal(REPORT::"CAT Phys. Inventory List", true, false, CATItemJournalBatch);
                end;
            }
        }
        modify(Print)
        {
            Visible = false;
        }
    }

    var
        //myInt: Integer;
        CATItemJournalBatch: Record "Item Journal Batch";
}