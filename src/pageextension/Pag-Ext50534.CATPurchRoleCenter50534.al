pageextension 50534 "CATPurchRoleCenter50534" extends "Purchasing Agent Role Center"
{
    layout
    {
    }
    actions
    {
        modify("Standard Cost Worksheets")
        {
            Visible = false;
        }
        modify(SubcontractingWorksheets)
        {
            Visible = false;
        }
        modify("Item Journals")
        {
            Visible = false;
        }
        modify("Stockkeeping Units")
        {
            Visible = false;
        }
        modify("Purchase Invoices")
        {
            Visible = false;
        }
        modify("Sales Orders")
        {
            Visible = false;
        }
        modify("Purchase Journals")
        {
            Visible = false;
        }
        modify(RequisitionWorksheets)
        {
            Visible = false;
        }
        modify("Purchase &Invoice")
        {
            Visible = false;
        }
        modify("&Purchase Journal")
        {
            Visible = false;
        }
        modify("Item &Journal")
        {
            Visible = false;
        }
        modify("Requisition &Worksheet")
        {
            Visible = false;
        }
        modify("Purchase &Line Discounts")
        {
            Visible = false;
        }
        modify("Posted Purchase Invoices")
        {
            Visible = false;
        }
        modify("Assembly Orders")
        {
            Visible = false;
        }
        addbefore("Purchase &Order")
        {
            action("Time Sheet List")
            {
                ApplicationArea = All;
                CaptionML = ENC = 'Time Sheets', FRC = 'Feuilles de temps', ENU = 'Time Sheets';
                RunObject = page "Time Sheet List";
            }
        }
    }
}
