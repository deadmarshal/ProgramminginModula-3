MODULE Main;

IMPORT SIO;

CONST
  Caps = CharacterSet{'A'..'Z'};
  LowerCase = CharacterSet{'a'..'z'};
  Letters = Caps + LowerCase;
  Digits = CharacterSet{'0'..'9'};
  Blanks = CharacterSet{' ','\t'};
  Sign = CharacterSet{'-','+'};
  Stop = '\n';
  
TYPE
  CharacterSet = SET OF CHAR;

VAR
  ch:CHAR;
  negative:BOOLEAN := FALSE;
  result:INTEGER := 0;
  letters,digits,others:CARDINAL := 0;
  
BEGIN
  SIO.PutText("Please enter a number:\n");
  REPEAT
    ch := SIO.GetChar()
  UNTIL NOT ch IN Blanks;
  IF ch IN Sign THEN
    negative := ch = '-';
    REPEAT ch := SIO.GetChar() UNTIL NOT ch IN Blanks;
  END;
  IF ch IN Digits THEN
    WHILE ch IN Digits DO
      result := 10 * result + (ORD(ch) - ORD('0'));
      ch := SIO.GetChar()
    END;
    IF negative THEN result := -result END;
    WHILE ch # Stop DO
      IF ch IN Letters THEN INC(letters)
      ELSIF ch IN Digits THEN INC(digits)
      ELSE INC(others)
      END;
      ch := SIO.GetChar()
    END;
    SIO.PutText("Input number: ");
    SIO.PutInt(result);
    SIO.PutText("\nSubsequent characters:\n");
    SIO.PutText("Letters: "); SIO.PutInt(letters);
    SIO.PutText(" Digits: "); SIO.PutInt(digits);
    SIO.PutText(" Others: "); SIO.PutInt(others);
    SIO.Nl()
  ELSE
    SIO.PutText("Invalid number!\n")
  END;
END Main.

