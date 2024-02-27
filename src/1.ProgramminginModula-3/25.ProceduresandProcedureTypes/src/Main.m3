MODULE Main;

IMPORT SIO;

TYPE
  Proc = PROCEDURE(t:TEXT := "I am more equal!\n");

VAR 
  res:CARDINAL;
  a:Proc;
  
(* Pure (Proper) procedure: *)
PROCEDURE Hello() = 
BEGIN 
  SIO.PutText("Hello!\n");
END Hello;

(* function procedure: *)
(* a and b are called formal parameters. *)
PROCEDURE Add(a,b:CARDINAL):CARDINAL = 
BEGIN
  RETURN a+b;
END Add;

PROCEDURE P(t:TEXT := "I am even more equal!\n") =
  BEGIN
    SIO.PutText(t)
  END P;

BEGIN
  (*
    Procedures are only declared once. Procedure declaration is like declaring
    a constant, but this time we associate a name to a block instead of a literal.
    A procedure declaration consists of a procedure head and body. The procedure 
    head contains the procedure name and the signature. The signature contains
    the formal parameters and in the case of functions the return type too. 
    The scope of a formal parameter is the block of the procedure in whose 
    signature it is defined. The procedure body's statements are executed when the 
    procedure is called. We are only allowed to omit the procedure body inside 
    interfaces. 
    The formal parameter consists of parameter's name, type, passing mode, and 
    default value. The identifier (i.e. procedure name) after the PROCEDURE keyword
    and after the END must be the same.
    The return type of a function procedure can be anything except an open array.
    Functions must contain at least one RETURN statement that specifies the return 
    value of the function. 
    In case of Hello procedure below where the formal parameter is empty, we need
    the parantheses. Also we need the empty parantheses when calling the procedure,
    but parantheses can be omitted for a procedure variable (which we'll see later).
    The invocation of a procedure is a statement, but the invocation of a function
    is an expression. 
    We can also have the RETURN statement in procedures to return early from a 
    procedure.
    It is recommended to possibly use one RETURN statement in PROCEDUREs 
    as it is more efficient.
    A procedure can call another procedure. If so then we have a chain of procedure
    calls. The last member of the chain is the active procedure and others are 
    suspended until the last procedure returns and others get activated one by one.
    This chain of procedure calls is implemented via a stack (which we'll see later).
    NOTE: A procedure body is not run until we call the procedure.
    NOTE: Formal parameters and actual parameters are also called
    parameters and arguments respectively.

    Procedure Types:
    We can use the procedure head to declare a type, and make variables of
    this type. (This is also called function pointers in languages like C).
    NIL is a special value that means "no procedure" or empty. It can assigned
    to variables of procedure types and pointers.
    
    Procedure type Operations:
    1) Assignment:
    An expression of a procedure type can be assigned to a procedure variable if the
    value of the expression is in the range of the type of the variable.
    An expression of a procedure type PE can be assigned to a procedure
    variable pv if either PE = NIL or the following conditions apply:
    1. The number of parameters of PE and pv are equal, and the corresponding
    parameters have the same type and are passed in the same way.
    2. Both have the same result type or no result type.
    3. The set of exceptions generate by PE is a subset of the set of exceptions
    of pv.

    If the above rules are fulfilled, we say that type PE is covered by the
    type of pv. So, if the signatures of two procedure types are the same,
    then they are equivalent and assignment compatible.
    If they contain different parameter names and/or default values,
    then they are not equivalent, but still assignment compatible.
    Parameter names and default values have no influence on the
    value of a procedure.

    NOTE: Procedure constants that are assigned to a procedure
    variable must be global, meaning they can't be nested in any block!
    
    2) Relational operations:
    Assignment compatible procedures can be tested for (in)equality.
  *)
  
  (* Calling Procedures (Procedure Invocation): *)
  Hello();
  res := Add(3,5); (* 3 and 5 are actual parameters. *)
  SIO.PutInt(res); SIO.Nl();

  a := P; (* P has a different type from a, but it's assignable to a *)
  IF a = P THEN SIO.PutText("They are equal!\n") END;
  a(); (* The respective default values are *)
  P(); (* determined by the respective signatures! *)
END Main.

