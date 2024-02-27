MODULE Main;

IMPORT SIO;

VAR
  I:INTEGER := 0;
  
BEGIN
  (*
    repeat loop syntax:
    REPEAT statements UNTIL expression;
    NOTE: The condition is reverse of WHILE loop.
    NOTE: The repeat loop is run at least once, regardless of the condition.
  *)
  REPEAT
    SIO.PutInt(I);
    SIO.Nl();
    INC(I);
  UNTIL I = 10;
END Main.

