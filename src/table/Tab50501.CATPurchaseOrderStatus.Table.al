table 50501 "CAT Purchase Order Status"
{
    // CAT.001 2022-12-01 CL - new table
    Caption = 'Purchase Order Status';
    DataCaptionFields = "Code", Description;
    DataClassification = CustomerContent;
    DrillDownPageId = 50502;
    LookupPageId = 50502;

    fields
    {
        field(1; "Code"; Code[20])
        {
            Caption = 'Code';
            NotBlank = true;
            DataClassification = CustomerContent;

            trigger OnValidate()
            begin
                TestField(Code);
            end;
        }
        field(2; Description; Text[100])
        {
            Caption = 'Description';
            DataClassification = CustomerContent;
        }
    }

    keys
    {
        key(PK; "Code")
        {
            Clustered = true;
        }
    }

    trigger OnDelete()
    var
        PurchaseHeader: Record "Purchase Header";
        RelatedPurchaseHeaderExistsErr: Label '%1 records where %2 is %3 exist.';
    begin
        PurchaseHeader.SetRange("CAT Purch. Order Status Code", Rec.Code);
        if not IsEmpty then
            Error(RelatedPurchaseHeaderExistsErr, PurchaseHeader.TableCaption, PurchaseHeader.FieldCaption("CAT Purch. Order Status Code"), Rec.Code);
    end;

}
