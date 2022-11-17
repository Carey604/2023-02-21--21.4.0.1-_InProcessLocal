pageextension 50541 "CAT Resource Card" extends "Resource Card"
{
    layout
    {
    }

    actions
    {
        addlast(Processing)
        {
            action("CAT Change Approver User ID")
            {
                Caption = 'Change Approver User ID';
                Image = ChangeStatus;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                ApplicationArea = All;

                trigger OnAction()
                var
                    CATResource: Record "Resource";
                    CATApproverSwap: Report "CAT Resource TS Approver Swap";
                begin
                    IF "Time Sheet Approver User ID" <> '' THEN BEGIN
                        CATResource.RESET;
                        CATResource.SETRANGE("No.");
                        IF CATResource.FINDFIRST THEN BEGIN
                            //CATApproverSwap.SetResource(CATResource);
                            CLEAR(CATApproverSwap);
                            CATApproverSwap.SetFields("No.", "Time Sheet Approver User ID");
                            CATApproverSwap.SETTABLEVIEW(CATResource);
                            CATApproverSwap.RUN;
                        END;
                    END;
                end;
            }
        }
    }

    var
}