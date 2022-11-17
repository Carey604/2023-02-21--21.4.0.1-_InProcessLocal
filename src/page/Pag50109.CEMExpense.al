page 50109 "CEM Expense"
{
    Caption = 'CEM Expense';
    PageType = List;
    SourceTable = "CEM Expense";
    Editable = false;
    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Admin Comment"; Rec."Admin Comment")
                {
                    ApplicationArea = All;
                    ToolTip = 'View communication comments between the expenses user, admin and approvers.';
                }
                field("Allocated Amount (LCY)"; Rec."Allocated Amount (LCY)")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the allocated amount in local currency.';
                }
                field(Amount; Rec.Amount)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the amount.';
                }
                field("Amount (LCY)"; Rec."Amount (LCY)")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the amount in local currency.';
                }
                field("Amount w/o VAT"; Rec."Amount w/o VAT")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Amount without VAT field.';
                }
                field("Bank Currency Code"; Rec."Bank Currency Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the currency code of the bank account. This currency code inherited from the account linked to the credit card.';
                }
                field("Bank-Currency Amount"; Rec."Bank-Currency Amount")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the amount in the local currency of the bank account, as received in the bank transaction.';
                }
                field(Billable; Rec.Billable)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies if the job number is billable or not. When posting a billable job, the job line type will be set to contract.';
                }
                field("Business Description"; Rec."Business Description")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the description of the business where the purchase was made, received in the bank transaction.';
                }
                field("Cash/Private Card"; Rec."Cash/Private Card")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies if the expense was paid by cash or a private credit card.';
                }
                field(Comment; Rec.Comment)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Comment field.';
                }
                field("Continia Online Version No."; Rec."Continia Online Version No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Continia Online Version No. field.';
                }
                field("Continia User ID"; Rec."Continia User ID")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the ID of the Continia User.';
                }
                field("Continia User Name"; Rec."Continia User Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the name of the user.';
                }
                field("Country/Region Code"; Rec."Country/Region Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the country or region code.';
                }
                field("Created By User ID"; Rec."Created By User ID")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Created By User ID field.';
                }
                field("Created Doc. ID"; Rec."Created Doc. ID")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Created Doc. ID field.';
                }
                field("Created Doc. Ref. No."; Rec."Created Doc. Ref. No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Created Doc. Ref. No. field.';
                }
                field("Created Doc. Subtype"; Rec."Created Doc. Subtype")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Created Doc. Subtype field.';
                }
                field("Created Doc. Type"; Rec."Created Doc. Type")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Created Doc. Type field.';
                }
                field("Credit Card No."; Rec."Credit Card No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the number of the credit card used for this expense.';
                }
                field("Currency Code"; Rec."Currency Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the currency code of the amount.';
                }
                field("Current Reminder Level"; Rec."Current Reminder Level")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the current reminder level.';
                }
                field("Date Created"; Rec."Date Created")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Date Created field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies a description of the expense.';
                }
                field("Description 2"; Rec."Description 2")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the description 2 of the expense.';
                }
                field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the document date.';
                }
                field("Document Time"; Rec."Document Time")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the time of the transaction.';
                }
                field("Employee Reimbursed"; Rec."Employee Reimbursed")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies whether the employee has been reimbursed for this expense.';
                }
                field("Entry No."; Rec."Entry No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the entry number.';
                }
                field("Entry No. (Code)"; Rec."Entry No. (Code)")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Entry No. (Code) field.';
                }
                field("Exp. Account Manually Changed"; Rec."Exp. Account Manually Changed")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies if the expense account was manually changed after it has been copied from the expense posting setup.';
                }
                field("Expense Account"; Rec."Expense Account")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies a posting account for expense. By default, this account is copied from the Expense Type - Posting Setup but it is possible to change it manually for each individual expense.';
                }
                field("Expense Account Type"; Rec."Expense Account Type")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies a posting account type for the expense. By default, this account is copied from the Expense Type - Posting Setup but it is possible to change it manually for each individual expense.';
                }
                field("Expense Completed"; Rec."Expense Completed")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Expense Completed field.';
                }
                field("Expense GUID"; Rec."Expense GUID")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Expense GUID field.';
                }
                field("Expense Header GUID"; Rec."Expense Header GUID")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Expense Report GUID field.';
                }
                field("Expense Type"; Rec."Expense Type")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies a code used to categorize expenses and associates the corresponding posting setup.';
                }
                field("External Posting Account No."; Rec."External Posting Account No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies an external interface from which the posting accounts can be chosen. By default, this setup is inherited from the posting setup but it is possible to change it manually for each individual document.';
                }
                field("External Posting Account Type"; Rec."External Posting Account Type")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies an external interface from which the posting accounts can be chosen. By default, this setup is inherited from the posting setup but it is possible to change it manually for each individual document.';
                }
                field("Gen. Bus. Posting Group"; Rec."Gen. Bus. Posting Group")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the general business posting group that will be used when posting. This will overwrite the default values from the posting account.';
                }
                field("Gen. Prod. Posting Group"; Rec."Gen. Prod. Posting Group")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies a general product posting group that will be used when posting. This will overwrite the default values from the posting account.';
                }
                field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the code for Shortcut Dimension 1, which is one of two global dimension codes that you set up in the General Ledger Setup window.';
                }
                field("Global Dimension 2 Code"; Rec."Global Dimension 2 Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the code for Shortcut Dimension 2, which is one of two global dimension codes that you set up in the General Ledger Setup window.';
                }
                field("Job Line Type"; Rec."Job Line Type")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies an account type for job usage to be posted in the job journal.';
                }
                field("Job No."; Rec."Job No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the number of the job.';
                }
                field("Job Task No."; Rec."Job Task No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the number of the related job task.';
                }
                field("Matched to Bank Transaction"; Rec."Matched to Bank Transaction")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies if an expense is matched to a bank transaction.';
                }
                field("No Refund"; Rec."No Refund")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies if the expense should be refunded by the company. When not refunded, the employee will be charged if he used the company credit card. Also used if the user withdrew cash from an ATM, from the company credit card.';
                }
                field("No. of Attachments"; Rec."No. of Attachments")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the number of the attachments belonging to the current document.';
                }
                field("No. of Attendees"; Rec."No. of Attendees")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the No. of Attendees field.';
                }
                field("Notification Type"; Rec."Notification Type")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Notification Type field.';
                }
                field("On Hold"; Rec."On Hold")
                {
                    ApplicationArea = All;
                    ToolTip = 'Mark the document as not being ready for further processing.';
                }
                field("Original Expense Entry No."; Rec."Original Expense Entry No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Original Expense Entry No. field.';
                }
                field("Payment Type"; Rec."Payment Type")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the payment type used for this document.';
                }
                field(Posted; Rec.Posted)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies if the document was registered in the company books.';
                }
                field("Posted Date/Time"; Rec."Posted Date/Time")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the date and time when the document was posted.';
                }
                field("Posted by User ID"; Rec."Posted by User ID")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the user which posted.';
                }
                field("Register No."; Rec."Register No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Register No. field.';
                }
                field(Reimbursed; Rec.Reimbursed)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specified whether the expense is reimbursed.';
                }
                field("Reimbursement Method"; Rec."Reimbursement Method")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies whether the expense should be posted internally, externally in a payroll system or if it should be posted both internal and external at the same time.';
                }
                field("Reimbursement Register No."; Rec."Reimbursement Register No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Reimbursement Register No. field.';
                }
                field("Response from Dataloen"; Rec."Response from Dataloen")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Response from Dataloen field.';
                }
                field("Settlement Line No."; Rec."Settlement Line No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Expense Report Line No. field.';
                }
                field("Settlement No."; Rec."Settlement No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the expense report number.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the status of the document. When the document is pending expense user it will be visible in the Expense app and in the Expense portal.';
                }
                field(SystemCreatedAt; Rec.SystemCreatedAt)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the SystemCreatedAt field.';
                }
                field(SystemCreatedBy; Rec.SystemCreatedBy)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the SystemCreatedBy field.';
                }
                field(SystemId; Rec.SystemId)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the SystemId field.';
                }
                field(SystemModifiedAt; Rec.SystemModifiedAt)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the SystemModifiedAt field.';
                }
                field(SystemModifiedBy; Rec.SystemModifiedBy)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the SystemModifiedBy field.';
                }
                field("Tax Area Code"; Rec."Tax Area Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the Tax Area Code.';
                }
                field("Tax Group Code"; Rec."Tax Group Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the Tax Group Code.';
                }
                field("Transfer Attachments to CO"; Rec."Transfer Attachments to CO")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Transfer Attachments to CO field.';
                }
                field("Updated By Delegation User"; Rec."Updated By Delegation User")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Updated By Delegation User field.';
                }
                field("Usage Entry No."; Rec."Usage Entry No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Usage Entry No. field.';
                }
                field("VAT Amount"; Rec."VAT Amount")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the VAT Amount field.';
                }
                field("VAT Bus. Posting Group"; Rec."VAT Bus. Posting Group")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the VAT product posting group that will be used when posting. This will overwrite the default values from the GL Account.';
                }
                field("VAT Prod. Posting Group"; Rec."VAT Prod. Posting Group")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the VAT product posting group that will be used when posting. This will overwrite the default values from the GL Account.';
                }
                field("Vendor No."; Rec."Vendor No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the business vendor from where the purchase was made. When posting, ledger entries for this Vendor will be created.';
                }
            }
        }
    }
}
