pageextension 50530 "CATProjectManager50530" extends "Job Project Manager RC"
{
    // CAT.001 2022-10-26 CL - work around error in v21. Error AL0271: The action 'SetupAndExtensions' is not found in the target 'Job Project Manager RC' - Job Id: ...
    //      - the action is marked for removal in 20.5 and in standard code Visible=false so we don't need our customization to set Visible=false.
    layout
    {
        modify("Job Actual Price to Budget Price")
        {
            Visible = false;
        }
        modify("Job Profitability")
        {
            Visible = false;
        }
        moveafter(Control33; Control77)
    }
    actions
    {
        modify("Sales & Purchases")
        {
            Visible = false;
        }
        modify(JobJournals)
        {
            Visible = false;
        }
        modify(JobGLJournals)
        {
            Visible = false;
        }
        modify(RecurringJobJournals)
        {
            Visible = false;
        }
        modify(Action91)
        {
            Visible = false;
        }
        modify(Journals)
        {
            Visible = false;
        }
        modify("Posted Sales Invoices")
        {
            Visible = false;
        }
        modify("Posted Sales Credit Memos")
        {
            Visible = false;
        }
        modify("G/L Registers")
        {
            Visible = false;
        }
        modify("Item Registers")
        {
            Visible = false;
        }
        modify(Action76)
        {
            Visible = false;
        }
        //--CAT.001modify(SetupAndExtensions)
        //--CAT.001{
        //--CAT.001    Visible = false;
        //--CAT.001}
        modify(NewGroup)
        {
            Visible = false;
        }
        modify("Job Cost Su&ggested Billing")
        {
            Visible = false;
        }
        modify("Job Actual to Budget (Price)")
        {
            Visible = false;
        }
        modify("Create Time Sheets")
        {
            Visible = false;
        }
        modify(WIP)
        {
            Visible = false;
        }
        modify(Customers)
        {
            Visible = false;
        }
        modify(Resources)
        {
            Visible = false;
        }
        addafter(Resources)
        {
            action("CATPurchase Quotes")
            {
                ApplicationArea = All;
                CaptionML = ENC = 'Purchase Quotes', ENU = 'Purchase Quotes', FRC = 'Devis d''achat';
                RunObject = page "Purchase Quotes";
            }
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
        addafter("CATTime Sheet List")
        {
            action("Manager Time Sheet List")
            {
                ApplicationArea = All;
                CaptionML = ENC = 'Manager Time Sheets', ENU = 'Manager Time Sheets', FRC = 'Feuilles de temps administrateur';
                RunObject = page "Manager Time Sheet List";
            }
        }
    }
}
