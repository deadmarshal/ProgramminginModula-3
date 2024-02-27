MODULE Main;

IMPORT SIO;

PROCEDURE Euclid(x,y:CARDINAL):CARDINAL = 
BEGIN
  WHILE x # y DO
    IF x > y THEN x := x - y ELSE y := y - x END
  END;
  RETURN x
END Euclid;

PROCEDURE Input(VAR x,y:CARDINAL) = 
BEGIN
  x := SIO.GetInt();
  y := SIO.GetInt();
END Input;

PROCEDURE Output(res:CARDINAL) = 
BEGIN
  SIO.PutText("Greatest common divisor: ");
  SIO.PutInt(res); SIO.Nl()
END Output;

PROCEDURE Terminate():BOOLEAN =
CONST Digits = SET OF CHAR{'0'..'9'};
BEGIN
  RETURN NOT (SIO.LookAhead() IN Digits)
END Terminate;

PROCEDURE Compute() =
VAR a,b:CARDINAL;
BEGIN
  Input(a,b);
  Output(Euclid(a,b))
END Compute;

BEGIN
  (* 
     1) Input Parameters: These parameters provide a procedure with input values.
     2) Output Parameters: With these kind of parameter a procedure can return a 
     result to the invoking procedure. Its value is undefined at the time of the 
     procedure call; it receives a value within the invoked procedure.
     3) Input/output Parameters: This kind of parameters is the combination of the 
     two above.
  *)
  
  (*
    1) Value Parameters: They are the default mode and can be used for input. The
    procedure only receives a copy of the actual parameter, so any changes to these
    kinds of parameters are only local to the procedure and are not reflected in
    the calling procedure. We can use the keyword VALUE before a parameter to
    make it so.
    2) Variable Parameters: Variable parameters implement the input/output 
    parameters. This can be achieved by using the keyword VAR before the parameter.
    The actual parameter must be writable and the formal parameter is replaced by a
    reference to this variable. Changes to the actual parameter are 
    reflected outside of the procedure.
    3) Read-only Parameters: This can be employed for large input parameters 
    (composite parameters such as arrays and records). Use the keyword READONLY
    before the corresponding formal parameter for this purpose. A parameter of this
    mode usually receives a reference to the actual parameter like VAR parameters,
    but it is not writable. If the actual parameter is a variable then it is passed
    as a non-modifiable VAR parameter, otherwise the READONLY parameter behaves 
    like a VALUE parameter.

    NOTE:
    PROCEDURE Euclid(x,y:CARDINAL):CARDINAL;
    is equal to:
    PROCEDURE Euclid(VALUE x,y:CARDINAL):CARDINAL;
  *)
  
  SIO.PutText("Greatest common divisor using Euclidian method\n" & 
              "Please enter a pair of numbers of anything else to quit\n");
  REPEAT Compute() UNTIL Terminate()
END Main.

