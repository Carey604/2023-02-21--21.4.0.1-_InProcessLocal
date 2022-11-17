pageextension 50531 "CATProject Manager Act50531" extends "Project Manager Activities"
{
    layout
    {
        modify("Upcoming Invoices")
        {
            Visible = false;
        }
        modify("Invoices Due - Not Created")
        {
            Visible = false;
        }
        modify(Invoicing)
        {
            Visible = false;
        }
        modify("Work in Process")
        {
            Visible = false;
        }
    }
    actions
    {
    }
}
