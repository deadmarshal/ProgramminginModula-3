MODULE Main;

IMPORT SIO;

VAR
  a,b,res:INTEGER;
  operator:CHAR;
  
BEGIN
  (*
    case statement syntax:
    CASE expression OF
    | List1 => statement sequence1
    | List2 => statement sequence2
    .
    .
    .
    ELSE
    statement sequence
    END;

    Note: expression must be an ordinal type.
    Note: List can be a constant individual value or a range of values
    like lo..hi.
    Note: The else branch is optional.
    Note: The order of specification of individual values or range,
    contrary to the if statement is arbitrary.
    Note: If there is no else branch then a run-time error is raised,
    which is different from the if statement in that if there is no
    valid match, the if statement doesn't have any effect.

    EVAL evaluates its following expression and throws away the result.
  *)
  SIO.PutText("Basic arithmetic functions\n" &
    "Please enter two numbers and an operator: \n");
  a := SIO.GetInt();
  b := SIO.GetInt();
  EVAL SIO.GetChar();
  operator := SIO.GetChar();
  (* CASE operator OF *)
  (* | '+' => res := a + b; *)
  (* | '-' => res := a - b; *)
  (* | '*' => res := a * b; *)
  (* | 'D','d' => res := a DIV b; *)
  (* | 'M','m' => res := a MOD b; *)
  (* ELSE *)
  (*   SIO.PutText("Invalid operator!\n"); (\* res remains undefined! *\) *)
  (* END; *)
  CASE operator OF
  | '+','-','*','D','d','M','m' =>
    CASE operator OF 
    | '+' => res := a + b;
    | '-' => res := a - b;
    | '*' => res := a * b;
    | 'D','d' => res := a DIV b;
    | 'M','m' => res := a MOD b;
    END; (* inner case *)
    SIO.PutText("Result: "); SIO.PutInt(res); SIO.Nl();
  ELSE
    SIO.PutText("Invalid operator!\n");
  END; (* outer case *)

  (* Equivalent if statement: *)
  (* IF operator = '+' THEN res := a + b *)
  (* ELSIF operator = '-' THEN res := a - b *)
  (* ELSIF operator = '*' THEN res := a * b *)
  (* ELSIF (operator = 'D') OR (operator = 'd') THEN res := a DIV b *)
  (* ELSIF (operator = 'M')  OR (operator = 'm') THEN res := a MOD b *)
  (* ELSE *)
  (*   SIO.PutText("Invalid operator!\n"); *)
  (* END; *)
  (* SIO.PutText("Result: "); SIO.PutInt(res); SIO.Nl(); *)

  (* checking for characters: *)
  (* CASE SIO.GetChar() OF *)
  (* |'A'..'Z' => SIO.PutText("capital letter\n"); *)
  (* | 'a'..'z' => SIO.PutText("lower-case letter\n"); *)
  (* | '0'..'9' => SIO.PutText("number\n"); *)
  (* ELSE SIO.PutText("other\n") *)
  (* END; *)
END Main.

