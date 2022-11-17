tableextension 50516 "CAT Purch. Cr. Memo Hdr." extends "Purch. Cr. Memo Hdr." //124
{
    // CAT.001 2020-05-12 CL - initial customization to add fields 50000..50001
    fields
    {
        field(50000; "CAT Blanket Order Version No."; Integer)
        {
            DataClassification = ToBeClassified;
            Caption = 'Blanket Order Version No.';
            MinValue = 0;
            Editable = false;
        }
        field(50001; "CAT Purchase Order Version No."; Integer)
        {
            DataClassification = ToBeClassified;
            Caption = 'Purchase Order Version No.';
            MinValue = 0;
            Editable = false;
        }
        field(50002; "CAT Original Document Date"; Date)
        {
            Caption = 'Original Document Date';
            Editable = false;
        }
    }

}