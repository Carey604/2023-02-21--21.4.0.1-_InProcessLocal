page 50111 "CEM Expense Header"
{
    Caption = 'CEM Expense Header';
    PageType = List;
    SourceTable = "CEM Expense Header";
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
                field(Billable; Rec.Billable)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies if the job number is billable or not. When posting a billable job, the job line type will be set to contract.';
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
                field("Created by User ID"; Rec."Created by User ID")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Created by User ID field.';
                }
                field("Currency Code"; Rec."Currency Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the currency code of the expense report amounts. Used only for suggestion when new lines are created.';
                }
                field("Date Created"; Rec."Date Created")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the date when the expense report was created.';
                }
                field("Departure Date/Time"; Rec."Departure Date/Time")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the date and time of the departure.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the description of the expense report.';
                }
                field("Description 2"; Rec."Description 2")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the description 2 of the expense report.';
                }
                field("Document Type"; Rec."Document Type")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Document Type field.';
                }
                field("Employee Reimbursed"; Rec."Employee Reimbursed")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies whether the employee has been reimbursed for this expense report.';
                }
                field("Exp. Header GUID"; Rec."Exp. Header GUID")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Exp. Header GUID field.';
                }
                field("Expense Header Completed"; Rec."Expense Header Completed")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Expense Report Completed field.';
                }
                field("Expense Total (LCY)"; Rec."Expense Total (LCY)")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Expense Total (LCY) field.';
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
                field("Mileage Total (LCY)"; Rec."Mileage Total (LCY)")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Mileage Total (LCY) field.';
                }
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the number of the expense report, generated from the number series declared in Expense Management Setup.';
                }
                field("No. Series"; Rec."No. Series")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the No. Series field.';
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
                field(Posted; Rec.Posted)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Posted field.';
                }
                field("Posted Date/Time"; Rec."Posted Date/Time")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Posted Date Time field.';
                }
                field("Posted by User ID"; Rec."Posted by User ID")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Posted by User ID field.';
                }
                field("Posting Date"; Rec."Posting Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the posting date.';
                }
                field("Posting Description"; Rec."Posting Description")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Posting Description field.';
                }
                field("Pre-approval Amount"; Rec."Pre-approval Amount")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the amount to be pre-approved.';
                }
                field("Pre-approval Status"; Rec."Pre-approval Status")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the status of the pre-approval process.';
                }
                field("Return Date/Time"; Rec."Return Date/Time")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the date and time of the return.';
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
                field("Updated By Delegation User"; Rec."Updated By Delegation User")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Updated By Delegation User field.';
                }
            }
        }
    }
}
