report 50301 "CAT Purch. Rcpt. Line Swap"
{
    Caption = 'Purchase Receipt Line Swap';
    Permissions = tabledata 120 = rimd, tabledata 121 = rimd;
    ProcessingOnly = true;

    dataset
    {
        dataitem(PurRcptLine; "Purch. Rcpt. Line")
        {
            //DataItemTableView = SORTING("Document No.", "Line No.") ORDER(Ascending) WHERE("Document No." = CONST('104657'), "Line No." = CONST(10000));
            DataItemTableView = SORTING("Document No.", "Line No.") ORDER(Ascending) WHERE("Document No." = CONST('104657'));

            trigger OnPreDataItem()
            begin
                SETFILTER("Line No.", '%1|%2', 10000, 40000);
            end;

            trigger OnAfterGetRecord()
            begin
                IF ("Line No." = 10000) OR ("Line No." = 40000) then begin
                    "No." := '7155';
                    MODIFY;
                end
            end;
        }
    }

    requestpage
    {
        layout
        {
            area(Content)
            {
                group(GroupName)
                {

                }
            }
        }
    }

    var
    //myInt: Integer;
}