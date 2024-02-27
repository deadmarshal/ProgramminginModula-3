MODULE Main;

IMPORT SIO,Text;

CONST
  Stop = '.';
  
VAR
  num,n,sum:INTEGER := 0;
  mean:REAL;

BEGIN
  (* while loop syntax:
     WHILE expression DO statements END;
  *)
  SIO.PutText("Arithmetic mean of a series of numbers\n" &
    "Terminate input with " & Text.FromChar(Stop) & "\n");

  WHILE SIO.LookAhead() # Stop DO
    num := SIO.GetInt();
    INC(sum,num);
    INC(n);
  END;

  IF n > 0 THEN
    mean := FLOAT(sum) / FLOAT(n);
    SIO.PutText("Arithmetic mean: ");
    SIO.PutReal(mean); SIO.Nl();
  ELSE
    SIO.PutText("Empty input stream!\n");
  END;
END Main.

