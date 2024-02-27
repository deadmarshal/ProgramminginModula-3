MODULE Main;

IMPORT SIO;

PROCEDURE Factorial(n:CARDINAL):CARDINAL =
  BEGIN
    IF n = 0 THEN RETURN 1 (* trivial case *)
    ELSE RETURN n * Factorial(n-1) (* recursive case *)
    END
  END Factorial;

PROCEDURE Factorial2(n:CARDINAL):CARDINAL =
  BEGIN
    IF n = 0 THEN RETURN 1 END; (* else can also be omitted! *)
    RETURN n * Factorial(n-1)
  END Factorial2;
  
PROCEDURE FactorialIterative(n:CARDINAL):CARDINAL =
  VAR fact:CARDINAL := 1;
  BEGIN
    FOR I := 1 TO n DO fact := fact * I END;
    RETURN fact
  END FactorialIterative;

PROCEDURE Fibonacci(n:CARDINAL):CARDINAL =
  BEGIN
    IF n < 2 THEN RETURN n END; 
    RETURN Fibonacci(n-1) + Fibonacci(n-2)
  END Fibonacci;

PROCEDURE Reverse() =
  VAR ch:CHAR;
  BEGIN
    ch := SIO.GetChar();
    IF ch # '\n' THEN
      Reverse();
      SIO.PutChar(ch)
    END
  END Reverse;

PROCEDURE SimpleLoop(READONLY n:CARDINAL) =
  BEGIN
    IF n = 0 THEN SIO.Nl(); RETURN END;
    SIO.PutInt(n);
    SIO.PutChar(' ');
    SimpleLoop(n-1);
  END SimpleLoop;
  
VAR
  num:CARDINAL;
  
BEGIN
  (*
    The process of solving large problems by breaking them down into smaller,
    more simple problems that have identical forms.
    
    Recursion is a method of solving a computational problem where the solution
    depends on solutions to smaller instances of the same problem.
    Recursion solves such recursive problems by using functions that call
    themselves from within their own code.

    Recursive functions contain two parts:
    1) The base case(trivial case) which solves some smaller subset of the
    problem and stops the recursion.
    2) The recursive case where the function is called again to compute
    the smaller subset of the problem.
    
    NOTE: Every iterative solution can be converted to a recursive one
    and vice versa.

    NOTE: Some languages don't have looping constructs like Haskell,
    Prolog,Erlang etc... and only use recursion to for looping and
    solving problems.
  *)
  SIO.PutText("Enter a cardinal number: \n");
  num := SIO.GetInt();
  SIO.PutText("\nFactorial("); SIO.PutInt(num); SIO.PutText("):\n");
  SIO.PutInt(Factorial(num)); SIO.Nl();
  SIO.PutText("\nFactorial2("); SIO.PutInt(num); SIO.PutText("):\n");
  SIO.PutInt(Factorial2(num)); SIO.Nl();
  SIO.PutText("FactorialIterative("); SIO.PutInt(num); SIO.PutText("):\n");
  SIO.PutInt(FactorialIterative(num)); SIO.Nl();
  SIO.PutText("Enter a cardinal number: \n");
  num := SIO.GetInt();
  SIO.PutText("\nFibonacci("); SIO.PutInt(num); SIO.PutText("):\n");
  SIO.PutInt(Fibonacci(num)); SIO.Nl();
  SIO.PutText("Enter a character string: \n");
  Reverse();
  SIO.Nl();
  SimpleLoop(10);
END Main.

