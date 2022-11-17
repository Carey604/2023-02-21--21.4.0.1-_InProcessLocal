page 50110 "CEM Per Diem"
{
    Caption = 'CEM Per Diem';
    PageType = List;
    SourceTable = "CEM Per Diem";
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
                field(Amount; Rec.Amount)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the amount.';
                }
                field("Amount (LCY)"; Rec."Amount (LCY)")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the amount in local currency calculated based on the mileage rates.';
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
                field("Departure Country/Region"; Rec."Departure Country/Region")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the departure country or region.';
                }
                field("Departure Date/Time"; Rec."Departure Date/Time")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the date and time of the departure.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the description of the per diem.';
                }
                field("Description 2"; Rec."Description 2")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the description of the Per Diem.';
                }
                field("Destination Country/Region"; Rec."Destination Country/Region")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the destination country or region.';
                }
                field("Employee Reimbursed"; Rec."Employee Reimbursed")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies whether the employee has been reimbursed for this per diem.';
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
                field("Per Diem Completed"; Rec."Per Diem Completed")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Per Diem Completed field.';
                }
                field("Per Diem GUID"; Rec."Per Diem GUID")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Per Diem GUID field.';
                }
                field("Per Diem Group Code"; Rec."Per Diem Group Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the Per Diem group code. The per diem group handles the setup and the per diem rate.';
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
                field("Posting Date"; Rec."Posting Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the posting date.';
                }
                field("Register No."; Rec."Register No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Register No. field.';
                }
                field(Reimbursed; Rec.Reimbursed)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies if the amount was refunded.';
                }
                field("Reimbursement Method"; Rec."Reimbursement Method")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies whether the Per Diem should be posted internally, externally in a payroll system or if it should be posted both internal and external at the same time.';
                }
                field("Reimbursement Register No."; Rec."Reimbursement Register No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Reimbursement Register No. field.';
                }
                field("Response from Dataloen"; Rec."Response from Dataloen")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the response received from Dataloen when transferring the per diem details.';
                }
                field("Return Date/Time"; Rec."Return Date/Time")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the date and time of the return.';
                }
                field("Settlement GUID"; Rec."Settlement GUID")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Expense Report GUID field.';
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
                field("Taxable Amount"; Rec."Taxable Amount")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the taxable amount.';
                }
                field("Taxable Amount (LCY)"; Rec."Taxable Amount (LCY)")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the taxable amount in local currency calculated based on the mileage rates.';
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
            }
        }
    }
}
