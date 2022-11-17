report 50103 "CAT Resource TS Approver Swap"
{
    Permissions = TableData 156 = rimd;
    ProcessingOnly = true;

    dataset
    {
        dataitem(Resource; Resource)
        {
            DataItemTableView = SORTING("No.")
                                ORDER(Ascending);

            trigger OnAfterGetRecord()
            begin
                "Time Sheet Approver User ID" := NewApprover;
                MODIFY;
                ResourceNo := "No.";
            end;

            trigger OnPreDataItem()
            var
                User: Record "User";
            begin
                IF (OldApprover = '') OR (NewApprover = '') THEN
                    ERROR('Approver cannot be left blank.');
                User.RESET;
                User.SETRANGE("User Name", NewApprover);
                IF NOT User.FINDFIRST THEN
                    ERROR('%1 is not a valid user.', NewApprover);

                //SETRANGE("No.", Resource."No.");
                SETRANGE("No.", ResourceNo);
            end;
        }
    }

    requestpage
    {

        layout
        {
            area(content)
            {
                field(OldApprover; OldApprover)
                {
                    Caption = 'Old Approver';
                    ApplicationArea = All;
                    Editable = false;
                }
                field(NewApprover; NewApprover)
                {
                    Caption = 'New Approver';
                    ApplicationArea = All;

                    trigger OnLookup(var Text: Text): Boolean
                    var
                        User: Record "User";
                        Users: Page "Users";
                    begin
                        CLEAR(User);
                        User.FILTERGROUP(2);
                        User.SETFILTER("User Name", '<>%1', OldApprover);
                        User.FILTERGROUP(0);
                        Users.SETTABLEVIEW(User);
                        Users.LOOKUPMODE(TRUE);
                        IF Users.RUNMODAL = ACTION::LookupOK THEN BEGIN
                            Users.GETRECORD(User);
                            NewApprover := User."User Name";
                        END;
                    end;
                }
            }
        }

        actions
        {
        }
    }

    labels
    {
    }

    trigger OnPostReport()
    begin
        MESSAGE('Process complete. Approver for %1 changed from %2 to %3.', ResourceNo, OldApprover, NewApprover);
    end;

    var
        OldApprover: Code[50];
        NewApprover: Code[50];
        ResourceNo: Code[50];

    procedure SetResource(ResRec: Record "Resource")
    begin
        ResourceNo := '';
        ResourceNo := ResRec."No.";
        //Resource.RESET;
        //Resource.COPY(ResRec);
        OldApprover := ResRec."Time Sheet Approver User ID";
    end;

    procedure SetFields(ResourceNumber: Code[50]; OldApp: Code[50])
    begin
        ResourceNo := '';
        ResourceNo := ResourceNumber;
        OldApprover := OldApp;
    end;
}

