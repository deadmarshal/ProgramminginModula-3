MODULE Main;

IMPORT SIO;

TYPE
  Colors = {Red,Green,Blue};
  
  Point = RECORD
    x,y:INTEGER;
    color:Colors;
  END;
  
  Student = RECORD
    (* Fields are declared like variables.
       Fields can have default values like FirstName := "";
       if any field is not initialized, then the default value
       is used instead.
       It is better to default initialize your records if possible.
    *)
    FirstName,LastName:TEXT := "";
    (* Age is defined as CARDINAL since there's no negative age! *)
    Age:CARDINAL := 0;
  END;
  
VAR
  (* s1 is declared but not initialized! *)
  s1:Student;
  (* s2 is positionally initialized *)
  s2:Student := Student{"John","Doe",23};
  (* s3 is intialized using field names *)
  s3:Student := Student{FirstName := "Mary",
                        LastName := "Johnson",
                        Age := 19};
  (* s4 is mixed initialized *)
  s4:Student := Student{"Foo",
                        LastName := "Bar",
                        Age := 17};
  p:Point := Point{5,3,Colors.Blue};
  
BEGIN
  (*
    Record syntax:
    Somename = RECORD
    field1:T1;
    field2:T2;
    field3,field4:T3;
    .
    .
    .
    END;
    Records are a collection of heterogenous data put together
    under a name. Each data element in the record is called a
    field or component. Fields are accessed via the . syntax
    as in recordname.fieldname; (which is called qualified identifier).
    NOTE: Nested records are also possible.
    Record values can be defined with record constructors.
    
    Record constructors syntax:
    There are 3 ways to define a record with record constructors:
    1) Positional specification:
    Student{"John","Doe",23};
    2) Specification by name:
    Student{FirstName := "John",LastName:= "Doe",Age := 23};
    3) Mixed specification:
    For a mixed specification positionals must come first:
    Student{"John",LastName:= "Doe", Age := 23};
    in above Age can't be specified by position anymore!
    
    NOTE: We can have Arrays of Structures(AoS) or
    Structure of Arrays(SoA). Records are called Structures in C,
    so these names are common, but we can use AoR and RoA in our case.
    Record Padding: CPUs access data better when they are aligned on
    a boundary which is powers of 2. So the compiler tries to pad the
    record if needed for better CPU memory access. For example:
    Name = RECORD
      one:INTEGER;
      two:CHAR;
      three:INTEGER;
    END;
    If we assume that CHAR is 1 byte and INTEGER is 4 bytes,
    then the compiler allocates 12 bytes in total for this record.
    (though it depends on the compiler! this is just an example)
    So CHAR in this case takes 4 bytes not 1.
    NOTE: There are also records which don't have padding called
    packed records, which we'll see later.
    Operations on records:
    1) assignment
    Records can be assigned to one another if all their fields have the
    same name and types and have been declared in the same order in the
    record. This is called structural equivalence. In the following
    T1 and T2 are equivalent but different from T3 (the fields of
    T3 have the same types but different names).
    T1 = RECORD
      a:INTEGER;
      b:REAL;
    END;
    
    T2 = RECORD
      a:INTEGER;
      b:REAL;    
    END;
    
    T3 = RECORD
      x:INTEGER;
      y:REAL;
    END;

    NOTE: The default initializations belong to the record type, thus
    the following types are different and not assignment compatible:
    T4 = RECORD a:CARDINAL := 0 END;
    T5 = RECORD a:CARDINAL END;

    NOTE: On record assignment, all fields of the RHS record are
    copied to the LHS one.
    NOTE: If there are any pointers in the records, they are
    shallow copied, not deep copied!

    2) Relational operations
    Assignment compatible records can be tested for (in)equality.
  *)
  
  SIO.PutText("Records:\n");
  SIO.PutText("s1: ");
  SIO.PutText(s1.FirstName); SIO.PutChar(' ');
  SIO.PutText(s1.LastName); SIO.PutChar(' ');
  SIO.PutInt(s1.Age);
  SIO.Nl();
  SIO.PutText("s2: ");
  SIO.PutText(s2.FirstName); SIO.PutChar(' ');
  SIO.PutText(s2.LastName); SIO.PutChar(' ');
  SIO.PutInt(s2.Age);
  SIO.Nl();
  SIO.PutText("s3: ");
  SIO.PutText(s3.FirstName); SIO.PutChar(' ');
  SIO.PutText(s3.LastName); SIO.PutChar(' ');
  SIO.PutInt(s3.Age);
  SIO.Nl();
  SIO.PutText("s4: ");
  SIO.PutText(s4.FirstName); SIO.PutChar(' ');
  SIO.PutText(s4.LastName); SIO.PutChar(' ');
  SIO.PutInt(s4.Age);
  SIO.Nl();
END Main.

