MODULE Main;

FROM SIO IMPORT GetText,GetInt,PutText,PutInt,Nl;

TYPE
  Class = REF ARRAY OF REF Student;
  Student = RECORD
    FirstName,LastName:TEXT := "";
    Age:CARDINAL := 0;
  END;
  
VAR
  class:Class;
  n:CARDINAL;
 
BEGIN
  (*
    Array of references:
    We can also store references to records in arrays.
    This makes sense if the records are very large, and when
    we want to move the records in the array(for example for sorting),
    we can just swap the place of pointers instead of copying
    the whole record data. Tough the disadvantages of this
    method is that we have to allocate each pointer in the
    array, and accessing the data becomes one step more
    indirect. So this method is mostly recommended for large
    records.
  *)
  PutText("Enter the number of students and their names:\n");
  n := GetInt();
  class := NEW(Class,n);
  FOR I := FIRST(class^) TO LAST(class^) DO
    WITH c = class[I] DO
      c := NEW(REF Student);
      PutText("\nEnter first name: ");
      c.FirstName := GetText(len := 30);
      PutText("\nEnter last name: ");
      c.LastName := GetText(len := 30);
      PutText("\nEnter age: ");
      c.Age := GetInt();
      (* Using the ^ operator explicitly: class^[I]^.FirstName *)
    END
  END;
  FOR I := FIRST(class^) TO LAST(class^) DO
    WITH c = class[I] DO
      PutText(c.FirstName & "\n");
      PutText(c.LastName & "\n");
      PutInt(c.Age);
      Nl()
    END
  END
END Main.

