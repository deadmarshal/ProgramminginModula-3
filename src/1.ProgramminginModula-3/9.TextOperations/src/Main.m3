MODULE Main;

IMPORT SIO,Text;

VAR
  t1:TEXT := "Hello";
  t2:TEXT := " world";
  t3:TEXT := "";
  
BEGIN
  (* TEXT is enclosed in double quotes. CHARs are enclosed in single quotes.
     TEXT can be empty to in which case it is written as two empty double quotes "".
     & is an infix operator which concatenates two TEXTs and returns a new TEXT.
     = and # operators only check for equality between pointers of TEXT, NOT the
     actual contents. If you want to check if two TEXTs have equal contents use
     the Text.Equal() function in the Text interface.
     Text.Length() can be used to obtain the length of a TEXT.
     Text.GetChar() can be used to get a character at a specific index.
     Text.FromChar() converts a CHAR to a TEXT of length 1.
     Text.Empty() determines if a TEXT is empty (its length is 0).
  *)
  t3 := t1 & t2;
  SIO.PutText(t3 & "\n");
  t3 := t1;
  IF t1 = t3 THEN SIO.PutText("t1 and t3 pointers are equal!\n") END;
  IF Text.Equal(t1,t3) THEN
    SIO.PutText("t1 and t3 have the same contents!\n")
  END;
  SIO.PutText("Length of t1: "); SIO.PutInt(Text.Length(t1)); SIO.Nl();
  t3 := t2 & Text.FromChar('s');
  SIO.PutText(t3 & "\n");
  SIO.PutText("First character of t1: ");
  SIO.PutChar(Text.GetChar(t1,0)); SIO.Nl();
  SIO.PutText("Is t1 empty? "); SIO.PutBool(Text.Empty(t1)); SIO.Nl();
END Main.

