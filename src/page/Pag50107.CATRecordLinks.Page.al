page 50107 "CAT Record Links"
{
    // CAT.001 2022-06-02 CL - new page to show Record Link records of Type=Note
    ApplicationArea = All;
    Caption = 'Record Links';
    AdditionalSearchTerms = 'CAT Notes,Notes,CAT Record Links';
    PageType = List;
    UsageCategory = Administration;
    Editable = false;
    DeleteAllowed = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    SourceTable = "Record Link";
    SourceTableView = SORTING(Company, "Record ID") ORDER(ascending) where("Type" = Filter(Note));

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field(Company; Rec.Company)
                {
                    ToolTip = 'Specifies the value of the Company field.';
                    ApplicationArea = All;
                }
                field(Created; Rec.Created)
                {
                    ToolTip = 'Specifies the value of the Created field.';
                    ApplicationArea = All;
                }
                field(Description; Rec.Description)
                {
                    ToolTip = 'Specifies the value of the Description field.';
                    ApplicationArea = All;
                }
                field("Link ID"; Rec."Link ID")
                {
                    ToolTip = 'Specifies the value of the Link ID field. The Link ID is the primary key of the Record Link table.';
                    ApplicationArea = All;
                }
                // field(Note; Rec.Note)
                // {
                //     ToolTip = 'Specifies the value of the Note field.';
                //     ApplicationArea = All;
                // }
                field(TableNo; TableNo)
                {
                    ApplicationArea = All;
                    Caption = 'Table No.';
                    Tooltip = 'Specifies the table number of the record that the Record Link is linked to.';
                }
                field(TableNameText; TableNameText)
                {
                    ApplicationArea = All;
                    Caption = 'Table Name';
                    Tooltip = 'Specifies the table name of the record that the Record Link is linked to.';
                }
                field(RecGuid; RecGuid)
                {
                    ApplicationArea = All;
                    Caption = 'Source Record SystemId';
                    Tooltip = 'Specifies the SystemId of the record the Record Link is linked to. The SystemId is a GUID that indentifies the record in the table.';
                }

                field(NoteText; NoteText)
                {
                    ApplicationArea = All;
                    Caption = 'Note Text';
                    Tooltip = 'Specifies the Note field as text.';
                    MultiLine = true;
                }
                field(NoteTextSingleLine; NoteText)
                {
                    ApplicationArea = All;
                    Caption = 'Note Text no Line Separator';
                    Tooltip = 'Specifies the Note field as a single text.';
                }
                field(Notify; Rec.Notify)
                {
                    ToolTip = 'Specifies the value of the Notify field.';
                    ApplicationArea = All;
                }
                field("Record ID"; format(Rec."Record ID"))
                {
                    ToolTip = 'Specifies the value of the Record ID field. The Record ID points to the record that the Record Link is linked to.';
                    ApplicationArea = All;
                }
                field(SystemCreatedAt; Rec.SystemCreatedAt)
                {
                    ToolTip = 'Specifies the value of the SystemCreatedAt field.';
                    ApplicationArea = All;
                }
                field(SystemCreatedBy; Rec.SystemCreatedBy)
                {
                    ToolTip = 'Specifies the value of the SystemCreatedBy field.';
                    ApplicationArea = All;
                }
                field(SystemId; Rec.SystemId)
                {
                    ToolTip = 'Specifies the value of the SystemId field.';
                    ApplicationArea = All;
                }
                field(SystemModifiedAt; Rec.SystemModifiedAt)
                {
                    ToolTip = 'Specifies the value of the SystemModifiedAt field.';
                    ApplicationArea = All;
                }
                field(SystemModifiedBy; Rec.SystemModifiedBy)
                {
                    ToolTip = 'Specifies the value of the SystemModifiedBy field.';
                    ApplicationArea = All;
                }
                field("To User ID"; Rec."To User ID")
                {
                    ToolTip = 'Specifies the value of the To User ID field.';
                    ApplicationArea = All;
                }
                field("Type"; Rec."Type")
                {
                    ToolTip = 'Specifies the value of the Type field.';
                    ApplicationArea = All;
                }
                field(URL1; Rec.URL1)
                {
                    ToolTip = 'Specifies the value of the URL1 field.';
                    ApplicationArea = All;
                }
                field("User ID"; Rec."User ID")
                {
                    ToolTip = 'Specifies the value of the User ID field.';
                    ApplicationArea = All;
                }
            }
        }
    }

    trigger OnOpenPage()
    var
    begin
        Rec.SetRange(Company, CompanyName);
    end;

    trigger OnAfterGetRecord()
    var
        RecordLinkMgt: Codeunit "Record Link Management";
        TypeHelper: Codeunit "Type Helper";
        RecRef: RecordRef;
        RecId: RecordId;
        SystemIDFldRef: FieldRef;
        NoteInstream: InStream;
    begin
        clear(NoteText);
        if Rec.Type = Rec.Type::Note then begin
            Rec.CalcFields(Note);
            NoteText := RecordLinkMgt.ReadNote(Rec);
        end;

        RecId := Rec."Record ID";
        RecRef := RecId.GetRecord();
        TableNo := RecRef.Number;
        TableNameText := RecRef.Name;

        if RecRef.Find() then begin
            SystemIDFldRef := RecRef.Field(RecRef.SystemIdNo);
            RecGuid := SystemIDFldRef.Value;
        end else
            clear(RecGuid);
    end;


    var
        NoteText: Text;
        // NoteText2: Text;
        TableNo: Integer;
        TableNameText: Text;
        RecGuid: Guid;

}
