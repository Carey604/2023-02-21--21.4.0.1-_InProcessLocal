tableextension 50524 "CAT Extended Text Header" extends "Extended Text Header"
{
    fields
    {
        field(50500; "CAT Print on Phys. Inv. List"; Boolean)
        {
            InitValue = false;
            Caption = 'Print on Phys. Inv. List';

            trigger OnValidate()
            var
                CATExtTextHdr: Record "Extended Text Header";
            begin
                if (xRec."CAT Print on Phys. Inv. List" = false) and (Rec."CAT Print on Phys. Inv. List" = true) then begin
                    CATExtTextHdr.RESET;
                    CATExtTextHdr.SETRANGE("Table Name", "Table Name");
                    CATExtTextHdr.SETRANGE("No.", "No.");
                    CATExtTextHdr.SetRange("CAT Print on Phys. Inv. List", true);
                    if CATExtTextHdr.FINDFIRST then
                        error('You can only set one Extended Text Header to print on the Phys. Inv. List.');
                end;
            end;
        }
    }

    var
    //myInt: Integer;
}