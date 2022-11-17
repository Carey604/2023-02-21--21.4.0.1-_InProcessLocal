permissionset 50100 "CE - Tenant Ext."
{
    Assignable = true;
    Caption = 'CE - Tenant Extension';

    Permissions =
        table "CAT Job Group" = X,
        tabledata "CAT Job Group" = RMID,
        codeunit "CAT Event Subscribers" = X,
        codeunit CATDocumentAttachmentEvents = X,
        page "CAT Approval Entries" = X,
        page "CAT Timesheet Line Details" = X,
        page "CAT Purchase Requisition Subf." = X,
        page "CAT Time Sheet Detail PBI" = X,
        page "CAT Purchase Requisitions" = X,
        page "CAT Time Sheet Line (PBI)" = X,
        page "CAT Job Groups" = X,
        page "CAT Purchase Requisition" = X,
        report "CAT Standard Purchase - Order" = X,
        report "CAT Pur. Line G/L Account Swap" = X,
        report "CAT Resource TS Approver Swap" = X,
        report "CAT Ship Date Purchase Order" = X,
        report "CAT Phys. Inventory List" = X,
        report "CAT Tax Liable Toggle" = X,
        report "CAT Purch. Rcpt. Line Swap" = X,
        report "CAT Update Direct Posting" = X,
        report "CAT Set All PO Lines to Print" = X,
        report "CAT Purchase Blanket Order" = X;
}
