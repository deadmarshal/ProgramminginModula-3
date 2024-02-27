MODULE Main;

IMPORT SIO;

VAR
  a,b:INTEGER;
  
BEGIN
  SIO.PutText("Relational operations: \n");
  SIO.PutText("Please enter two numbers: \n");
  a := SIO.GetInt();
  b := SIO.GetInt();
  SIO.PutInt(a); SIO.PutText(" = "); SIO.PutInt(b); SIO.PutText(" is ");
  SIO.PutBool(a = b); SIO.Nl();
  SIO.PutInt(a); SIO.PutText(" # "); SIO.PutInt(b); SIO.PutText(" is ");
  SIO.PutBool(a # b); SIO.Nl();
  SIO.PutInt(a); SIO.PutText(" < "); SIO.PutInt(b); SIO.PutText(" is ");
  SIO.PutBool(a < b); SIO.Nl();
  SIO.PutInt(a); SIO.PutText(" > "); SIO.PutInt(b); SIO.PutText(" is ");
  SIO.PutBool(a > b); SIO.Nl();
  SIO.PutInt(a); SIO.PutText(" >= "); SIO.PutInt(b); SIO.PutText(" is ");
  SIO.PutBool(a >= b); SIO.Nl();
  SIO.PutInt(a); SIO.PutText(" <= "); SIO.PutInt(b); SIO.PutText(" is ");
  SIO.PutBool(a <= b); SIO.Nl();
END Main.

