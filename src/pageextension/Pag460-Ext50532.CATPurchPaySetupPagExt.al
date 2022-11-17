pageextension 50532 "CAT Purch. & Pay. Setup PagExt" extends "Purchases & Payables Setup" //460
{
    // CAT.001 2019-12-20 CL - new pageext
    // CAT.002 2021-03-02 CL - new field 50001 to identify No. Series to use for Purchase Headers where "CAT Requisition" is true
    layout
    {
        addlast(General)
        {
            field("CAT Def. New Purch. Line Type"; "CAT Def. New Purch. Line Type")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the default Type for new purchase lines.';
            }
        }
        addbefore("Quote Nos.")
        {
            field("CAT Requisition Quote Nos."; Rec."CAT Requisition Quote Nos.")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the code for the number series that will be used to assign numbers to purchase requisition quotes.';
            }
        }
    }

    actions
    {
    }
}