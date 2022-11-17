pageextension 50525 "Team Member Role Center50525" extends "Team Member Role Center"
{
    layout
    {
    }
    actions
    {
        modify(Finance)
        {
            Visible = false;
        }
        modify(Sales)
        {
            Visible = false;
        }
        modify("Incoming Documents")
        {
            Visible = false;
        }
        modify("<Page Purchase Orders>")
        {
            Visible = false;
        }
        modify("Blanket Purchase Orders")
        {
            Visible = false;
        }
        modify("<Page Purchase Invoices>")
        {
            Visible = false;
        }
        modify("<Page Posted Purchase Invoices>")
        {
            Visible = false;
        }
        modify("<Page Purchase Credit Memos>")
        {
            Visible = false;
        }
        modify("<Page Posted Purchase Credit Memos>")
        {
            Visible = false;
        }
        modify("<Page Posted Purchase Receipts>")
        {
            Visible = false;
        }
        addfirst(Embedding)
        {
            action("CATTime Sheet List")
            {
                ApplicationArea = All;
                CaptionML = ENC = 'Time Sheets', ENU = 'Time Sheets', FRC = 'Feuilles de temps';
                RunObject = page "Time Sheet List";
            }
        }
    }
}
