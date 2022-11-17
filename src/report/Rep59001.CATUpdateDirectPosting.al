report 59001 "CAT Update Direct Posting"
{
    Caption = 'Toggle Direct Posting on G/L Accounts';
    ApplicationArea = All;
    UsageCategory = Tasks;
    Permissions = TableData "G/L Account" = rimd;
    ProcessingOnly = true;

    dataset
    {
        dataitem("Integer"; "Integer")
        {
            DataItemTableView = SORTING(Number) ORDER(Ascending) WHERE(Number = CONST(1));
            MaxIteration = 1;

            trigger OnAfterGetRecord()
            begin
                CompanyRec.Reset;
                if CompanyRec.FindSet then
                    repeat
                        CompanyCount += 1;
                        GLAccount.Reset;
                        GLAccount.ChangeCompany(CompanyRec.Name);
                        GLAccount.SetFilter("No.", StrSubstNo('%1', GLAccFilter), GLAccFilter);
                        if GLAccount.FindSet then begin
                            AccountCount += GLAccount.Count;
                            GLAccount.ModifyAll("Direct Posting", FlipOption);
                        end;
                    until CompanyRec.Next = 0;
            end;
        }
    }

    requestpage
    {

        layout
        {
            area(content)
            {
                field(FlipOption; FlipOption)
                {
                    ApplicationArea = All;
                    Caption = 'Direct Posting Toggle';
                }
                field(GLAccFilter; GLAccFilter)
                {
                    ApplicationArea = All;
                    Caption = 'G/L Account Filter';

                    trigger OnLookup(var Text: Text): Boolean
                    var
                        GLAcc: Record "G/L Account";
                    begin
                        Clear(GLAccList);
                        GLAcc.Reset;
                        GLAcc.FilterGroup(6);
                        GLAcc.SetRange("Account Type", GLAcc."Account Type"::Posting);
                        GLAcc.FilterGroup(0);
                        GLAccList.SetTableView(GLAcc);
                        GLAccList.LookupMode(true);
                        if GLAccList.RunModal in [ACTION::OK, ACTION::LookupOK] then begin
                            GLAccList.SetSelectionFilter(GLAcc);
                            if GLAcc.FindFirst then begin
                                repeat
                                    if GLAccFilter <> '' then
                                        GLAccFilter := GLAccFilter + '|';
                                    GLAccFilter := GLAccFilter + GLAcc."No."; // create filter expr.
                                until GLAcc.Next = 0;
                                Clear(GLAcc);
                                GLAcc.SetFilter("No.", GLAccFilter); // create the filter
                            end;
                            ValidateGLFilter(GLAccFilter);
                            //GLAccList.GETRECORD(GLAcc);
                            //GLAccFilter := GLAcc."No.";
                        end else
                            GLAccFilter := '';
                    end;

                    trigger OnValidate()
                    begin
                        ValidateGLFilter(GLAccFilter);
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
        if (CompanyCount <> 0) and (AccountCount <> 0) then
            Message('Process complete: %1 G/L accounts updated in %2 companies.', AccountCount, CompanyCount)
        else
            Message('No records found to update.');
    end;

    trigger OnPreReport()
    begin
        CompanyCount := 0;
        AccountCount := 0;
    end;

    var
        CompanyRec: Record Company;
        GLAccount: Record "G/L Account";
        GLAccList: Page "G/L Account List";
        GLAccFilter: Text;
        FlipOption: Boolean;
        CompanyCount: Integer;
        AccountCount: Integer;

    local procedure ValidateGLFilter(FilterString: Text)
    var
        GLAcc: Record "G/L Account";
    begin
        GLAcc.Reset;
        GLAcc.SetFilter("No.", StrSubstNo('%1', GLAccFilter), GLAccFilter);
        if GLAcc.FindSet then
            repeat
                if GLAcc."Account Type" <> GLAcc."Account Type"::Posting
                  then
                    Error('You can only select Posting account types.');
            until GLAcc.Next = 0;
    end;
}

