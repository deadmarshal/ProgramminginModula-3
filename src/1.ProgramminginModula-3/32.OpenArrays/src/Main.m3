MODULE Main;

FROM SIO IMPORT GetText,GetInt,PutText,PutInt,PutChar,Nl;

TYPE
  OneDim = REF ARRAY OF INTEGER;
  (* reference to a two-dimensional array *)
  TwoDim = REF ARRAY OF ARRAY OF INTEGER;
  (* reference to an array where each element
     is a reference to an array *)
  Other = REF ARRAY OF REF ARRAY OF INTEGER;
  
  Class = REF ARRAY OF Student;
  Student = RECORD
    FirstName,LastName:TEXT := "";
    Age:CARDINAL := 0;
  END;

VAR
  One:OneDim;
  class:Class;
  n:CARDINAL;

(* NOTE: ARRAY OF INTEGER is an open array type!
   we can use this feature to pass array of any length
   to the procedure.
   for 2 or more dimensions we would write:
   ARRAY OF ARRAY OF INTEGER;
   etc...
*)
PROCEDURE PrintArray(VAR A:ARRAY OF INTEGER) =
  BEGIN
    FOR I := FIRST(A) TO LAST(A) DO
      PutInt(A[I]); PutChar(' ')
    END;
    Nl()
  END PrintArray;
  
BEGIN
  (*
    Open Arrays:
    Array syntax allows us to leave the type of the index undefined,or open,
    in the declaration of array types:
    TYPE
      Vector = ARRAY OF REAL;
      Matrix = ARRAY OF ARRAY OF INTEGER;

    An open array can be used in certain contexts:
    1) as formal parameter of a procedure
    2) as reference type
    3) as element type of another array
    4) as type in a array constructor

    This means that open arrays can only be created with a reference,
    and NEW. for example REF Matrix.
    We have to supply as parameters the sizes of open dimensions
    sequentially. for example:
    vector := NEW(REF Vector,n);
    matrix := NEW(REF Matrix,n,n);

    If an open dimension acquires size n at run-time,then its index type
    is [0..n-1], which is a subrange of INTEGER. This means that
    FIRST(dynamic_array) is always 0.
  *)
  One := NEW(OneDim,5);
  FOR I := FIRST(One^) TO LAST(One^) DO One[I] := I*2 END;
  PrintArray(One^);
  
  PutText("Enter the number of students and their names:\n");
  n := GetInt();
  class := NEW(Class,n);
  FOR I := FIRST(class^) TO LAST(class^) DO
    WITH c = class[I] DO
      PutText("\nEnter first name: ");
      c.FirstName := GetText(len := 30);
      PutText("\nEnter last name: ");
      c.LastName := GetText(len := 30);
      PutText("\nEnter age: ");
      c.Age := GetInt()
    END
  END;

  FOR I := FIRST(class^) TO LAST(class^) DO
    WITH c = class[I] DO
      PutText(c.FirstName & "\n");
      PutText(c.LastName & "\n");
      PutInt(c.Age);
      Nl()
    END
  END;
END Main.

