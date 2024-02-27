INTERFACE Person;

TYPE
  (* T <: Public; *)
  (* REFANY is an opaque type so we can't allocate it with NEW(),
     this ensures that the client cannot allocate a new object. *)
  T <: REFANY;
  Public = OBJECT
    METHODS
      getFirstName():TEXT;
      getLastName():TEXT;
      getAge():CARDINAL;
  END;

PROCEDURE Create(READONLY FirstName,LastName:TEXT := "";
                 READONLY Age:CARDINAL := 0):T;

END Person.
