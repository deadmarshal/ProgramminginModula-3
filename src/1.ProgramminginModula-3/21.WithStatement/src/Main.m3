MODULE Main;

IMPORT SIO;

TYPE
  Student = RECORD
    FirstName,LastName:TEXT := "";
    Age:CARDINAL := 0;
  END;

VAR
  student1:Student := Student{"John","Doe",20};
  
BEGIN
  (* With statement:
     With statement allows us to use aliases for complex selectors
     that we need more than once. They make the source code
     more compact and readable and also it is more efficient since
     certain internal access computations associated with the selectors
     for record components(fields) and array indexing only have to be
     carried out once.
     With statement syntax:
     WITH binding(identifier) = expression DO
     statement sequence
     .
     .
     .
     END;
     NOTE: There can be multiple bindings separated by commas.
     NOTE: If the expression returns a value, then the identifier
     will get this value and it is readonly(immutable). If the
     expression yield a mutable variable, then the identifier is
     just an alias for that variable.
  *)
  WITH s = student1 DO
    (* In this block s is an alias to student1 *)
    SIO.PutText(s.FirstName & " ");
    SIO.PutText(s.LastName & " ");
    SIO.PutInt(s.Age); SIO.Nl();
  END;
END Main.

