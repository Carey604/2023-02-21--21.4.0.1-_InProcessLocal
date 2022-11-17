pageextension 50516 "CATG/L Entries Preview" extends "G/L Entries Preview"
{
    layout
    {
        modify("Gen. Posting Type")
        {
            Visible = false;
        }
        modify("Gen. Bus. Posting Group")
        {
            Visible = false;
        }
        modify("Gen. Prod. Posting Group")
        {
            Visible = false;
        }
        addafter("Bal. Account No.")
        {
            field("CATGlobal Dimension 1 Code16983"; Rec."Global Dimension 1 Code")
            {
                ApplicationArea = All;
            }
            field("CATGlobal Dimension 2 Code13124"; Rec."Global Dimension 2 Code")
            {
                ApplicationArea = All;
            }
        }
        addafter("G/L Account No.")
        {
            field("CATG/L Account Name75503"; Rec."G/L Account Name")
            {
                ApplicationArea = All;
            }
        }
        addafter(Description)
        {
            field("CATDebit Amount25525"; Rec."Debit Amount")
            {
                ApplicationArea = All;
            }
            field("CATCredit Amount21037"; Rec."Credit Amount")
            {
                ApplicationArea = All;
            }
        }
        modify(Amount)
        {
            Visible = false;
        }
        modify("Bal. Account Type")
        {
            Visible = false;
        }
        modify("Bal. Account No.")
        {
            Visible = false;
        }
    }
    actions
    {
    }
}
