pageextension 50501 "CATPayment Journal50501" extends "Payment Journal"
{
    layout
    {
        modify("Applies-to Doc. Type")
        {
            Visible = false;
        }
        modify(GetAppliesToDocDueDate)
        {
            Visible = false;
        }
        moveafter(Description; AppliesToDocNo)
        moveafter("Bal. Account No."; "Payment Method Code")
        moveafter("Payment Method Code"; "Payment Reference")
        moveafter("Payment Reference"; "Bank Payment Type")
        modify("Transaction Type Code")
        {
            Visible = false;
        }
        modify("Shortcut Dimension 1 Code")
        {
            Visible = false;
        }
        modify("Shortcut Dimension 2 Code")
        {
            Visible = false;
        }
        addafter("Currency Code")
        {
            field("CATDebit Amount10866"; Rec."Debit Amount")
            {
                ApplicationArea = All;
            }
        }
        modify(Amount)
        {
            Visible = false;
        }
        modify("Check Printed")
        {
            Visible = false;
        }
    }
    actions
    {
    }
}
