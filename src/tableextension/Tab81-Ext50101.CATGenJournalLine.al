tableextension 50101 "CAT Gen . Journal Line" extends "Gen. Journal Line"  //81
{
    // CAT.001 2022-03-07 - item posting, copy source item no. to gen journal line
    fields
    {
        field(50100; "CAT Source Item No."; Code[20])
        {
            Caption = 'Source Item No.';
            DataClassification = ToBeClassified;
        }
    }
}
