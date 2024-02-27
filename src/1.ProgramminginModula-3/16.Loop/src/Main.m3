MODULE Main;

IMPORT SIO;

VAR
  I:INTEGER := 0;
  
BEGIN
  (*
    loop statement syntax:
    LOOP statement sequence END;
    NOTE: This is an infinite loop and we can exit the loop
    with the EXIT keyword.
  *)
  SIO.PutInt(I); SIO.Nl();
  LOOP
    INC(I);
    IF I = 10 THEN EXIT END
  END;
  SIO.PutInt(I); SIO.Nl();
END Main.

