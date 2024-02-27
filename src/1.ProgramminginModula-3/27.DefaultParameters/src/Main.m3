MODULE Main;

IMPORT SIO;

PROCEDURE Add(a,b:CARDINAL := 0):CARDINAL = 
BEGIN
  RETURN a+b
END Add;

BEGIN
  (*
    Default values can be specified for a parameter like a normal variable 
    assignment. This is not allowed for VAR parameters because the procedure 
    cannot make any assumptions as if the actual parameter contains a value or not!
    Either type or default value can be omitted, but not both. If the type is omitted,
    then it is inferred from the given value.
    Although it is recommended to write the type too.
    If both type and default value is specified, then the value must be in the 
    range of the specified type. 
  *)

  (*
    Actual procedure parameters can be specified positionally, by name or mixed:
    positionally like:
    Add(10,5);
    By name like:
    Proc(a := 10, b := 5);
    Mixed like:
    Proc(10, b := 5);
    NOTE: In the mixed mode the positional parameters must be specified first!
  *)
  
  SIO.PutInt(Add()); SIO.Nl();
  SIO.PutInt(Add(5)); SIO.Nl(); (* a := 5 *)
  SIO.PutInt(Add(10,5)); SIO.Nl();
  SIO.PutInt(Add(a := 10, b := 5)); SIO.Nl();
  (* If for example you want to omit the first param, you have to use := *)
  SIO.PutInt(Add(b := 5)); SIO.Nl();
  SIO.PutInt(Add(b := 5, a := 10)); SIO.Nl(); (* order doesn't matter! *)
  SIO.PutInt(Add(10, b := 5)); SIO.Nl(); (* mixed *)
END Main.

