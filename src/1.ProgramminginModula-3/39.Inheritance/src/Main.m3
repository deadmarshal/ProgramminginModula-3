MODULE Main;

IMPORT SIO,Fmt;

TYPE 
  Person = OBJECT
    FirstName,LastName:TEXT;
    Age:CARDINAL;
    METHODS
      init():Person := InitPerson;
      getFirstName():TEXT := GetFirstName;
      getLastName():TEXT := GetLastName;
      getAge():CARDINAL := GetAge;
      setFirstName(READONLY FirstName:TEXT := "") := SetFirstName;
      setLastName(READONLY LastName:TEXT := "") := SetLastName;
      setAge(READONLY Age:CARDINAL := 0) := SetAge;
  END;

  Student = Person OBJECT
    GPA:REAL;
    METHODS
    init():Student := InitStudent;
    getGPA():REAL := GetGPA;
    setGPA(READONLY GPA:REAL := 0.0) := SetGPA;
  END;

(* Person methods: *)
(* The Init method initializes the fields of an object. In other languages
  sometimes this is called a constructor. *)
PROCEDURE InitPerson(self:Person):Person = 
BEGIN
  self.FirstName := "";
  self.LastName := "";
  self.Age := 0;
  RETURN self
END InitPerson;

PROCEDURE GetFirstName(self:Person):TEXT = 
BEGIN
  RETURN self.FirstName
END GetFirstName;

PROCEDURE GetLastName(self:Person):TEXT = 
BEGIN
  RETURN self.LastName
END GetLastName;

PROCEDURE GetAge(self:Person):CARDINAL = 
BEGIN
  RETURN self.Age
END GetAge;

PROCEDURE SetFirstName(self:Person;READONLY FirstName := "") = 
BEGIN
  self.FirstName := FirstName
END SetFirstName;

PROCEDURE SetLastName(self:Person;READONLY LastName := "") = 
BEGIN
  self.LastName := LastName
END SetLastName;

PROCEDURE SetAge(self:Person;READONLY Age:CARDINAL := 0) = 
BEGIN
  self.Age := Age
END SetAge;

(* Student methods *)
PROCEDURE InitStudent(self:Student):Student = 
BEGIN
  self.FirstName := "";
  self.LastName := "";
  self.Age := 0;
  self.GPA := 0.0;
  RETURN self
END InitStudent;

PROCEDURE GetGPA(self:Student):REAL = 
BEGIN
  RETURN self.GPA
END GetGPA;

PROCEDURE SetGPA(self:Student;READONLY GPA:REAL := 0.0) = 
BEGIN
  self.GPA := GPA
END SetGPA;

VAR
  p:Person := NEW(Person).init();
  (* We can also initialize an object in NEW bindings: *)
  s:Student := NEW(Student,FirstName := "John",LastName := "Doe",
                   Age := 16,GPA := 17.6);

BEGIN
  (* 
    Student inherits all fields and methods of Person and adds some of its own!
  *)
  SIO.PutText("First name: " & s.getFirstName() & "\n" &
    "Last name: " & s.getLastName() & "\n" &
    "Age: " & Fmt.Int(s.getAge()) & "\n" &
    "GPA: " & Fmt.Real(s.getGPA()) & "\n");
END Main.
