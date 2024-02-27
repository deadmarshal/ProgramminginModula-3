MODULE Main;

IMPORT SIO;

VAR
  a,b:BOOLEAN;
  
BEGIN
  SIO.PutText("Logical operations:\n");
  SIO.PutText("Please enter two logical values(TRUE or FALSE):\n");
  a := SIO.GetBool();
  b := SIO.GetBool();
  SIO.PutText("\na\tb\tNOT a\tNOT b\ta OR b\ta AND b\n");
  SIO.PutBool(a); SIO.PutText("\t");
  SIO.PutBool(b); SIO.PutText("\t");
  SIO.PutBool(NOT a); SIO.PutText("\t");
  SIO.PutBool(NOT b); SIO.PutText("\t");
  SIO.PutBool(a OR b); SIO.PutText("\t");
  SIO.PutBool(a AND b); SIO.Nl();
END Main.

