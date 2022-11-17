pageextension 50511 "CATChart of Accounts50511" extends "Chart of Accounts"
{
    layout
    {
        addafter("Net Change")
        {
            field("CATNet Change19898"; Rec."Net Change")
            {
                ApplicationArea = All;
            }
            field("CATBalance at Date98636"; Rec."Balance at Date")
            {
                ApplicationArea = All;
            }
        }
    }
    actions
    {
    }
    views
    {
        addfirst
        {
            view("2019 Income Statement")
            {
                Filters = where("No." = filter('4000|4999|5000|5999|7000|7149|7198|7199|7200|7224|7298|7299|7399|7549|7649|7849|7949|7999|9000|9149|9199|9349|9399|9499|9749|9998|9999'), "Date Filter" = filter('190101..191231'));
                OrderBy = ascending("No.");
                SharedLayout = true;
                CaptionML = ENC = '2019 Income Statement';
            }
            view("2018 Balance Sheet")
            {
                Filters = where("No." = filter('1000|1001|1099|1199|1129|1139|1149|1249|1349|1498|1500|1501|1509|1534|1544|1554|1574|1599|1650|1659|1669|1684|1699|1997|1998|1999|2000|2001|2019|2049|2149|2249|2349|2249|2399|2498|2499|2500|2749|2799|2997|2998|2999|3000|3001|3054|3098|3099|3649|3949|3998|3999'), "Date Filter" = filter('181231'));
                OrderBy = ascending("No.");
                SharedLayout = true;
                CaptionML = ENC = '2018 Balance Sheet';
            }
        }
    }
}
