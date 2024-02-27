MODULE Main;

IMPORT SIO;

VAR
  C:CHAR;
  
BEGIN
  (* ORD(C) returns the corresponding numeric value of a character.
     for example 'A' is 65 in ASCII or Latin-1.
     VAL(I,T) takes an INTEGER, and any Ordinal type, and returns
     the corresponding value of the specified type. for example
     VAL(65,CHAR) = 'A'.
     ORD() and VAL() are inverses of each other so:
     ORD(VAL(I,CHAR)) = I;
     VAL(ORD(C),CHAR)) = C;
     where I is an INTEGER and C is a CHAR.
     INC(x) and DEC(x) can be used with characters too.
     INC('a') is 'b', and DEC('b') is 'a' etc...
     We should avoid things like DEC('a') or INC('z')
     because this depends on the character encoding
     and is not reliable.
     Relational operations are also defined for characters
     since they are ordinal types, so:
     'a' < 'b' => TRUE
     'A' < 'B' => TRUE
     '0' < '1' => TRUE
     etc...
     These use the ASCIIbetical ordering, which means that
     they use the ASCII table for comparison.
     BOOLEAN TRUE corresponds to 1 and BOOLEAN FALSE
     corresponds to 0. So ORD(TRUE) = 1 and ORD(FALSE) = 0.
  *)
  SIO.PutText("Please enter a character:\n");
  C := SIO.GetChar();
  SIO.PutText("ORD("); SIO.PutChar(C); SIO.PutText("): ");
  SIO.PutInt(ORD(C)); SIO.Nl();
  SIO.PutText("VAL(ORD(C),INTEGER): ");
  SIO.PutInt(VAL(ORD(C),INTEGER)); SIO.Nl();
  SIO.PutText("ORD(TRUE): "); SIO.PutInt(ORD(TRUE)); SIO.Nl();
  SIO.PutText("ORD(FALSE): "); SIO.PutInt(ORD(FALSE)); SIO.Nl();
END Main.

