report 50300 "CAT Tax Liable Toggle"
{
    Permissions = TableData 122 = rimd, TableData 123 = rimd;
    ProcessingOnly = true;

    dataset
    {
        dataitem(DataItem1000000000; "Purch. Inv. Header")
        {
            DataItemTableView = SORTING("No.")
                                ORDER(Ascending);

            dataitem(DataItem1000000001; "Purch. Inv. Line")
            {
                DataItemLink = "Document No." = FIELD("No.");
                DataItemTableView = SORTING("Document No.", "Line No.")
                                    ORDER(Ascending);

                trigger OnAfterGetRecord()
                begin
                    "Tax Liable" := FALSE;
                    "Tax Area Code" := '';
                    "Provincial Tax Area Code" := '';
                    MODIFY;
                end;

            }

            trigger OnAfterGetRecord()
            begin
                "Tax Liable" := FALSE;
                "Tax Area Code" := '';
                "Provincial Tax Area Code" := '';
                MODIFY;
            end;

            trigger OnPreDataItem()
            begin
                IF NOT PurInvHdr.GET(DocNo) THEN
                    ERROR('%1 is not a valid Posted Purchase Invoice No.', DocNo);
                SETRANGE("No.", DocNo);
            end;

            trigger OnPostDataItem()
            begin
                MESSAGE('Process complete.');
            end;
        }
    }

    requestpage
    {
        SaveValues = true;

        layout
        {
            area(content)
            {
                field(DocNo; DocNo)
                {
                    ApplicationArea = All;

                    trigger OnValidate()
                    begin
                        IF NOT PurInvHdr.GET(DocNo) THEN
                            ERROR('%1 is not a valid Posted Purchase Invoice No.', DocNo);
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

    var
        PurInvHdr: Record "Purch. Inv. Header";
        DocNo: Code[20];
}

