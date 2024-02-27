MODULE Main;

IMPORT SIO;

BEGIN
  (* for loop syntax:
     FOR identifier := expression TO expression BY expression DO
       statement sequence
     END;
       
     NOTE: The 3 expressions are evaluated only once.
     NOTE: "BY expression" part is optional and can be omitted,
     in which case it would be 1. (This is called the step)
     NOTE: identifier's scope is restricted only to the body
     of the for loop and disappears after the statement.
     NOTE: step must be an ordinal type, and can be negative.
  *)

  FOR I := 0 TO 10 DO
    SIO.PutInt(I); SIO.PutChar(' ');
  END;
  SIO.Nl();
  FOR I := 0 TO 10 BY 2 DO
    SIO.PutInt(I); SIO.PutChar(' ');
  END;
  SIO.Nl();
  FOR I := 10 TO 0 BY -1 DO
    SIO.PutInt(I); SIO.PutChar(' ');
  END;
  SIO.Nl();
  FOR I := 10 TO 0 BY -2 DO
    SIO.PutInt(I); SIO.PutChar(' ');
  END;
  SIO.Nl();
END Main.

