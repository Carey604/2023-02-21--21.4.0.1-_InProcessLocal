enum 50101 "CAT Purchase Type"
{
    // CAT.001 2022-12-01 CL - new enum for Purchase
    AssignmentCompatibility = true;
    Extensible = true;

    value(0; " ")
    {
        Caption = ' ';
    }
    value(1; Goods)
    {
        Caption = 'Goods';
    }
    value(2; Services)
    {
        Caption = 'Services';
    }
}
