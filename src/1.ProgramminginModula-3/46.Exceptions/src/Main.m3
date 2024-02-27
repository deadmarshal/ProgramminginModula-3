MODULE Main;

IMPORT IO,SIO,Wr,Thread,StableError;

VAR 
  wr:Wr.T;

BEGIN
  (* 
    There are three kinds of errors:
    1) Programming errors: Errors due to incorrect algorithm commited by the
    programmer which can only be prevented by careful planning.
    2) Run-time errors: These are programming errors detected by the
    environment system of the language. For example: accessing an array element
    with an index beyond the index range, assigning a negative value to a 
    CARDINAL variable, dereferencing a NIL pointer, overflow in REAL arithmetic
    and etc...
    3) Exceptions: We speak of exceptions in the context of an error situation
    detected by a program itself(rather than by the underlying language 
    environment,operating system or hardware). On detection of such an error
    situation, the program explicitly generates an exception.
    
    There are two basic operations on exceptions: raising and handling.
    An exception is raised by a RAISE statement and intercepted and handled
    by a TRY-EXCEPT statement.

    Declaration of exceptions:
    EXCEPTION somename(Type)
    Type is optional and denotes the parameter of an exception if desired.
    Exporting the EXCEPTION declaration in an interface allows the clients to 
    raise the exception themselves.

    Generation of exception:
    RAISE Identifier(Type)
    Type is optional and can be omitted. The RAISE statement raises an exception
    and begins searching for a handler.

    To handle a statement that may produce a given exception we surround it 
    within a TRY-EXCEPT statement and specify a list of handlers:
    TRY 
      guarded statements
    EXCEPT
      exception1(parameter1) => handler1
      .
      .
      .
      exceptionN(parameterN) => handlerN
    ELSE
      handler0
    END;

    The TRY-EXCEPT statement executes as follows:
    1) If no exception occurs nothing happens and execution is continued after
    the TRY-EXCEPT statement.
    2) If an exception does occur in the guarded statements, then the statement
    sequence terminates and control passes to the EXCEPT branch.
    If exceptionI occured, then the variable parameterI is set to the value 
    of the expression of the parameter of the RAISE statement, and execution
    resumes at handlerI. handlerI is a statement sequence, and also the scope
    of the variable parameterI. The type of this variable is the same as was
    specified on declaration of the exception.
    3) If an exception occurs and it doesn't appear in the list, then handler0
    of the else branch executes, the exception condition is reset, and 
    execution continues after the TRY-EXCEPT statement.
    4) If an exception occurs inside a procedure which has a RAISES set then
    the exception is delegated to the procedure that called the procedure
    (caller). For example:
    PROCEDURE Foo() RAISES {Error};
    If there's no ELSE branch, then either the exception is delegated or the 
    program terminates with a run-time error.

    The occurrence of an exception causes the immediate termination of the
    current procedure and all other procedures in the invocation chain that
    propagate the exception. 

    To release some allocated resource even when an exception occurs we can use 
    the TRY-FINALLY statement.
    
    reserve resource
    TRY
      process it
    FINALLY
      release resource
    END;

    Delegation of the exception is delayed by this statement: after the 
    occurence of exception, the guarded statements are aborted, and the part 
    after finally executes, then the search for a handler starts. The FINALLY
    branch always executes, even if no exception occurs.
  *)
  wr := IO.OpenWrite("output.txt");
  IF wr = NIL THEN StableError.Halt("Failed opening file to write!\n") END;
  SIO.PutText("Hello world!",wr);
  TRY
    Wr.Close(wr)
  EXCEPT
  | Wr.Failure => SIO.PutText("Failed closing file!\n")
  | Thread.Alerted => SIO.PutText("Thread.Alerted!\n")
  ELSE
    SIO.PutText("Some other exception!\n")
  END;
  
  (* Another way: *)
  (* TRY TRY S1 FINALLY S2 END EXCEPT Handlers END *)
  wr := IO.OpenWrite("output.txt");
  IF wr = NIL THEN StableError.Halt("Failed opening file to write!\n") END;
  TRY
    TRY
      SIO.PutText("Hello world!",wr)
    FINALLY
      Wr.Close(wr)
    END;
  EXCEPT
  | Wr.Failure => SIO.PutText("Failed closing file!\n")
  | Thread.Alerted => SIO.PutText("Thread.Alerted!\n")
  ELSE
    SIO.PutText("Some other exception!\n")
  END;

  (* TRY TRY S1 EXCEPT Handlers FINALLY S2 END *)
  wr := IO.OpenWrite("output.txt");
  IF wr = NIL THEN StableError.Halt("Failed opening file to write!\n") END;
  TRY
    TRY
      SIO.PutText("Hello world!",wr)
    EXCEPT
    | Wr.Failure => SIO.PutText("Failed opening file to write!\n")
    | Thread.Alerted => SIO.PutText("Thread.Alerted!\n")
    ELSE
      SIO.PutText("Some other exception!\n")
    END
  FINALLY
    Wr.Close(wr)
  END;
END Main.

