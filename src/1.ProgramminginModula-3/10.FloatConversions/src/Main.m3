MODULE Main;

IMPORT SIO;

VAR
  r:REAL;
  i:INTEGER;
  
BEGIN
  (* There is no loss of precision when converting from INTEGER -> FLOAT.
     However the precision is lost when converting from FLOAT -> INTEGER.
     Smaller types can be converted to bigger types with no loss of precision,
     however the opposite is not true.
     for example: REAL -> LONGREAL (no loss), LONGREAL -> REAL (loss).
     IF R >= 0 THEN TRUNC(R) = FLOOR(R) and IF R < 0 THEN TRUNC(R) = CEILING(R).
     The rounding border of ROUND is in the middle, meaning ROUND(0.5) = 1.
     So if the floating value is greater than or equal to 0.5 then
     it is rounded up, else rounded down.
  *)
  SIO.PutText("Please enter an integer:\n");
  i := SIO.GetInt();
  SIO.PutText("FLOAT("); SIO.PutInt(i); SIO.PutText("): ");
  SIO.PutReal(FLOAT(i)); SIO.Nl();
  SIO.PutText("Floating-point conversions:\n");
  SIO.PutText("Please enter a floating-point number:\n");
  r := SIO.GetReal();
  SIO.PutText("ROUND("); SIO.PutReal(r); SIO.PutText("): ");
  SIO.PutInt(ROUND(r)); SIO.Nl();
  SIO.PutText("TRUNC("); SIO.PutReal(r); SIO.PutText("): ");
  SIO.PutInt(TRUNC(r)); SIO.Nl();
  SIO.PutText("FLOOR("); SIO.PutReal(r); SIO.PutText("): ");
  SIO.PutInt(FLOOR(r)); SIO.Nl();
  SIO.PutText("CEILING("); SIO.PutReal(r); SIO.PutText("): ");
  SIO.PutInt(CEILING(r)); SIO.Nl();
END Main.

