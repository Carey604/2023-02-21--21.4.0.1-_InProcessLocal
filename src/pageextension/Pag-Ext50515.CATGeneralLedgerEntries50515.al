pageextension 50515 "CATGeneral Ledger Entries50515" extends "General Ledger Entries"
{
    // CAT.001 2022-03-07 CL - add field to existing pagext.
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
        modify("Bal. Account No.")
        {
            Visible = false;
        }
        addafter("G/L Account No.")
        {
            field("CAT CATG/L Account Name36418"; Rec."G/L Account Name")
            {
                ApplicationArea = All;
            }
        }
        modify("Bal. Account Type")
        {
            Visible = false;
        }

        addlast(Control1)
        {
            field("CAT CATSourceNo"; Rec."Source No.")
            {
                ApplicationArea = All;
                Editable = false;
            }

            field("CAT Source Name"; CATSourceName)
            {
                Caption = 'Source Name';
                ApplicationArea = All;
                Editable = false;
            }
            //>>CAT.001
            field("CAT Source Item No."; "CAT Source Item No.")
            {
                ApplicationArea = All;
                Editable = false;
            }
            //<<CAT.001
        }
    }

    actions
    {
    }

    trigger OnAfterGetRecord()
    var
        CATVendor: Record "Vendor";
        CATCustomer: Record "Customer";
        CATBank: Record "Bank Account";
        CATFixedAsset: Record "Fixed Asset";
        CATEmployee: Record Employee;
    begin
        CATSourceName := '';
        CASE Rec."Source Type" OF
            Rec."Source Type"::" ":
                CATSourceName := '';
            Rec."Source Type"::"Bank Account":
                begin
                    CATBank.RESET;
                    IF CATBank.GET(Rec."Source No.") then
                        CATSourceName := CATBank.Name;
                end;

            Rec."Source Type"::Customer:
                begin
                    CATCustomer.RESET;
                    IF CATCustomer.GET(Rec."Source No.") then
                        CATSourceName := CATCustomer.Name;
                end;

            Rec."Source Type"::Vendor:
                begin
                    CATVendor.RESET;
                    IF CATVendor.GET(Rec."Source No.") then
                        CATSourceName := CATVendor.Name;
                end;

            Rec."Source Type"::"Fixed Asset":
                begin
                    CATFixedAsset.RESET;
                    IF CATFixedAsset.GET(Rec."Source No.") then
                        CATSourceName := CATFixedAsset.Description;
                end;

            Rec."Source Type"::Employee:
                begin
                    CATEmployee.RESET;
                    IF CATEmployee.GET(Rec."Source No.") then
                        CATSourceName := CATEmployee.FullName();
                end;
        end;
    end;


    var
        CATSourceName: Text[100];
}
