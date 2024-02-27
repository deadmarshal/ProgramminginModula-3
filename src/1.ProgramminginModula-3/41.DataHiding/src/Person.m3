MODULE Person;

REVEAL T = Public BRANDED OBJECT
    FirstName,LastName:TEXT := "";
    Age:CARDINAL := 0;
    OVERRIDES
      getFirstName := GetFirstName;
      getLastName := GetLastName;
      getAge := GetAge;
  END;

(* Default initialization(similar to default constructor of C++): *)
(* PROCEDURE Init():T = 
VAR self:NEW(T,FirstName := "",LastName := "",Age := 0);
BEGIN
  RETURN self
END Init; *)

(* We can also initialize an object with given parameters(this version is
  like constuctors of C++ with arguments): *)
PROCEDURE Create(READONLY FirstName,LastName:TEXT := "";
                 READONLY Age:CARDINAL := 0):T =
VAR self:T := NEW(T);
BEGIN
  self.FirstName := FirstName;
  self.LastName := LastName;
  self.Age := Age;
  RETURN self
END Create;

PROCEDURE GetFirstName(self:T):TEXT = 
BEGIN
  RETURN self.FirstName
END GetFirstName;

PROCEDURE GetLastName(self:T):TEXT = 
BEGIN
  RETURN self.LastName
END GetLastName;

PROCEDURE GetAge(self:T):CARDINAL = 
BEGIN
  RETURN self.Age
END GetAge;

BEGIN

END Person.
