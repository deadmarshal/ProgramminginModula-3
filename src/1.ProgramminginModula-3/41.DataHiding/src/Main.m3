MODULE Main;

IMPORT SIO,Fmt,Person;

VAR
  (* Now Person.T is opaque and we can't allocate it with NEW. So we use the
    Create function to allocate a new Person.T type: *)
  p:Person.T := Person.Create("John","Doe",30);
  
BEGIN
  SIO.PutText(p.getFirstName() & " " & p.getLastName() & "  " &
              Fmt.Int(p.getAge()) & "\n");
END Main.
