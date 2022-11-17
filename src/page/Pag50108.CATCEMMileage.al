page 50108 CATCEMMileage
{
    Caption = 'CATCEMMileage';
    PageType = List;
    SourceTable = "CEM Mileage";
    UsageCategory = None;
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
                field("Calculated Distance"; Rec."Calculated Distance")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the calculated distance by Google Maps.';
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
                    ToolTip = 'Specifies the description of the mileage.';
                }
                field("Description 2"; Rec."Description 2")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the description of the mileage.';
                }
                field("Employee Reimbursed"; Rec."Employee Reimbursed")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies whether the employee has been reimbursed for this mileage.';
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
                field("Expense Header GUID"; Rec."Expense Header GUID")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Expense Report GUID field.';
                }
                field("External Posting Account No."; Rec."External Posting Account No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies an account from external interfaces used when posting the document. By default, this setup is inherited from the posting setup but it is possible to change it manually for each individual document.';
                }
                field("External Posting Account Type"; Rec."External Posting Account Type")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies an external interface from which the posting accounts can be chosen. By default, this setup is inherited from the posting setup but it is possible to change it manually for each individual document.';
                }
                field("From Address"; Rec."From Address")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies an address from where the trip starts.';
                }
                field("From Address Latitude"; Rec."From Address Latitude")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the From Latitude field.';
                }
                field("From Address Longitude"; Rec."From Address Longitude")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the From Longitude field.';
                }
                field("From Home"; Rec."From Home")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies whether the address is the user''s home address or not.';
                }
                field("Gen. Bus. Posting Group"; Rec."Gen. Bus. Posting Group")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the general business posting group that will be used when posting.';
                }
                field("Gen. Prod. Posting Group"; Rec."Gen. Prod. Posting Group")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the general product posting group that will be used when posting.';
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
                    ToolTip = 'Specifies a job number.';
                }
                field("Job Task No."; Rec."Job Task No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies a job task number.';
                }
                field("Mil. Account Manually Changed"; Rec."Mil. Account Manually Changed")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies whether the posting account was changed on this particular mileage after it has been retrieved from the posting setup.';
                }
                field("Mileage Account"; Rec."Mileage Account")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies a posting account for mileage. By default, this account is copied from the Vehicle - Posting Setup but it is possible to change it manually for each individual mileage.';
                }
                field("Mileage Account Type"; Rec."Mileage Account Type")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies an account type used for the posting of mileage.';
                }
                field("Mileage Completed"; Rec."Mileage Completed")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Mileage Completed field.';
                }
                field("Mileage GUID"; Rec."Mileage GUID")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Mileage GUID field.';
                }
                field("No Refund"; Rec."No Refund")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies if the mileage should be refunded or not.';
                }
                field("No. of Attachments"; Rec."No. of Attachments")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the number of attachments related to the document.';
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
                field("Original Total Distance"; Rec."Original Total Distance")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Original Total Distance field.';
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
                field("Registration Date"; Rec."Registration Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the date when the mileage was created.';
                }
                field(Reimbursed; Rec.Reimbursed)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies if the amount was refunded.';
                }
                field("Reimbursement Method"; Rec."Reimbursement Method")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies whether the mileage should be posted internally, externally in a payroll system or if it should be posted both internal and external at the same time.';
                }
                field("Reimbursement Register No."; Rec."Reimbursement Register No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Reimbursement Register No. field.';
                }
                field("Response from Dataloen"; Rec."Response from Dataloen")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the response received from Dataloen when transferring the mileage details.';
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
                field("Taxable Amount (LCY)"; Rec."Taxable Amount (LCY)")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the taxable amount in local currency calculated based on the mileage rates.';
                }
                field("To Address"; Rec."To Address")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the destination address.';
                }
                field("To Address Latitude"; Rec."To Address Latitude")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the To Latitude field.';
                }
                field("To Address Longitude"; Rec."To Address Longitude")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the To Longitude field.';
                }
                field("To Home"; Rec."To Home")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies whether the address is the user''s home address or not.';
                }
                field("Total Distance"; Rec."Total Distance")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the distance declared by the user.';
                }
                field("Transfer Attachments to CO"; Rec."Transfer Attachments to CO")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Transfer Attachments to CO field.';
                }
                field("Travel Time"; Rec."Travel Time")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the time of the actual departure when the bank transaction is purchasing a travel ticket and the information is provided.';
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
                field("VAT Bus. Posting Group"; Rec."VAT Bus. Posting Group")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the VAT business posting group that will be used when posting.';
                }
                field("VAT Prod. Posting Group"; Rec."VAT Prod. Posting Group")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the VAT product posting group that will be used when posting.';
                }
                field("Vehicle Code"; Rec."Vehicle Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the code of the vehicle.';
                }
                field("Vehicle Registration No."; Rec."Vehicle Registration No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the registration number of the vehicle.';
                }
            }
        }
    }
}
