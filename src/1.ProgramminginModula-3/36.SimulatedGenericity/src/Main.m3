MODULE Main;

IMPORT SIO;

TYPE
  Student = REF RECORD FirstName,LastName:TEXT END;
  Address = REF RECORD street:TEXT; number:CARDINAL END;

VAR
  r1:Student;
  r2 := NEW(Student,FirstName := "John",LastName := "Doe");
  adr := NEW(Address,street := "Washington",number := 30);
  any:REFANY;
  
BEGIN
  (*
    Simulated genericity:
    In rules of assignment compatibility, rule 2 (R <: L) states that
    the type of the right side of an assignment must be a subtype of
    the left side. So we can assign any reference to a variable of type
    REFANY. As we know, for value parameters the actual parameter must be
    assignment compatible with the formal parameter. Thus if we define
    a procedure with formal parameters of REFANY, we can invoke this
    procedure with actual parameters of any reference type. This allows
    us to create procedures that work with different types. This is a
    specialized and restricted version of genericity.
    A component(e.g., a module or a procedure) is generic if its services are
    type independent, but still type-safe. The most common solution is to
    provide the component with type parameters which are then made concrete
    on use. For this purpose Modula-3 provides the generic module, which can
    be parameterized with module names(we'll talk about this later).
    The use of REFANY parameters amounts to a 'cheap' imitation of genericity,
    and only works for reference types. 

    Rule 4 of the assignment compatibility states that in the case of references
    and arrays a value of a supertype can be assigned to a variable of a subtype
    if certain conditions are met.
    Below, it is clear that we can assign r2 to the variable any without problems
    because Student <: REFANY. The statements r1 := any and adr := any
    can be legal according to rule 4.
    Assignment can be done because any contains a value of type Student,
    which is assignment compatible with r1.
    This is not the case for adr := any. any still points to student data
    and can't be assigned to a variable of type Address.
    A value of a supertype Super can be assigned to a variable of subtype Sub
    if it falls in the range of Sub. This condition can be tested at run-time.
    We can also say that after the assignment any := r2 the variable any has
    changed not only its value but also its type. Its actual type
    (dynamic type) has changed from REFANY to Student(this is called narrowing).
    We also distinguish between the declared(static) and the actual type.
    The actual type of the expression on the right side of the assignment
    must always be assignment compatible with the declared type of the variable
    on the left side(the actual type of the variable is irrevelant since it is
    overwritten by the assignment).
    Rule 4 is closely related to rule 3, which relates to subranges. We can
    assign a value of type Day to a variable of type Workday iff the value
    falls in the range of Workdays.
  *)
  any := r2;
  r1 := any;
  (* adr := any; *) (* run-time error! *)
END Main.

