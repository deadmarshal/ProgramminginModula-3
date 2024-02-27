MODULE Main;

IMPORT SIO;

CONST
  Conv = ORD('A') - ORD('a');

VAR
  C:CHAR;
  I:INTEGER;
  
BEGIN
  (*
    If statement syntax:
    IF b1 THEN statement sequence
    ELSIF b2 THEN statement sequence
    .
    .
    .
    ELSE statement sequence
    END;

    Note: if statements can also be nested.
    
    Short circuiting: if the left operand of a logical OR operator
    is TRUE, or if the left operand of a logical AND operator
    is FALSE, then the right operand is not checked anymore because the
    it is no longer relevant. For example:
    IF TRUE OR FALSE THEN ... END;
    right operand of OR is not checked, because left operand
    is TRUE, the result is definitely TRUE.
    IF FALSE AND TRUE THEN ... END;
    right hand side of AND is not checkd, since left hand side
    is FALSE, the result is definitely FALSE.
  *)
  SIO.PutText("Please enter a character:\n");
  C := SIO.GetChar();
  IF (C >= 'a') AND (C <= 'z') THEN (* if lowercase *)
    C := VAL(ORD(C) + Conv,CHAR); (* convert C to uppercase *)
  END;
  SIO.PutChar(C); SIO.Nl();

  SIO.PutText("Please enter an integer:\n");
  I := SIO.GetInt();
  IF I < 0 THEN
    SIO.PutInt(I); SIO.PutText(" is negative.\n")
  ELSIF (I >= 0) AND (I <= 9) THEN
    SIO.PutInt(I); SIO.PutText(" is a one-digit number.\n")
  ELSIF (I >= 10) AND (I <= 99) THEN
    SIO.PutInt(I); SIO.PutText(" is a two-digit number.\n")
  ELSE
    SIO.PutInt(I); SIO.PutText(" is a three or more digit number.\n")
  END; 
END Main.

