permissionset 50100 "CE - Tenant Ext."
{
    // CAT.001 2022-12-01 CL - add tables and pages
    Assignable = true;
    Caption = 'CE - Tenant Extension';

    Permissions =
        table "CAT Job Group" = X,
        table "CAT Purchase Order Status" = X, //++CAT.001
        tabledata "CAT Job Group" = RMID,
        tabledata "CAT Purchase Order Status" = RMID, //++CAT.001
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
        page "CAT Purchase Order Status List" = X, //++CAT.001
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
