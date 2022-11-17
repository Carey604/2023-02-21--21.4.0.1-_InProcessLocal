report 59002 "CAT Set All PO Lines to Print"
{
    Permissions = tabledata 39 = rimd, tabledata 121 = rimd, tabledata 123 = rimd, tabledata 125 = rimd, tabledata 5110 = rimd;
    UseRequestPage = false;
    ProcessingOnly = true;

    dataset
    {
        dataitem(Integer; Integer)
        {
            MaxIteration = 1;
            trigger OnAfterGetRecord()
            begin

                if not Confirm('Set all print to PO flags as true?') then
                    CurrReport.Quit();
                PurchaseLine.ModifyAll("CAT Print on PO Confirmation", true);
                PurchaseLineArchive.ModifyAll("CAT Print on PO Confirmation", true);
                PurchaseRcptLine.ModifyAll("CAT Print on PO Confirmation", true);
                PurchaseInvLine.ModifyAll("CAT Print on PO Confirmation", true);
                PurchaseCrMemoLine.ModifyAll("CAT Print on PO Confirmation", true);
            end;
        }
    }

    var
        PurchaseLine: Record "Purchase Line";
        PurchaseLineArchive: Record "Purchase Line Archive";
        PurchaseRcptLine: Record "Purch. Rcpt. Line";
        PurchaseInvLine: Record "Purch. Inv. Line";
        PurchaseCrMemoLine: Record "Purch. Cr. Memo Line";
}