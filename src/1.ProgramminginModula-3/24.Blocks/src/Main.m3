MODULE Main;

IMPORT SIO;

VAR
  a,b,res:CARDINAL;
  
BEGIN
  (*
    A block is a scope of series of declarations. Till now we only saw one 
    block per module (called the module/global/main block),
    and variables and declarations are only visible within that block.
    We can also restrict the scope of local declarations with nested blocks. 
    NOTE: A block is a statement syntactically.
    Variables,types and constants are allocated when their block is entered and 
    deallocated when their block ends. Global variables,types,constants live 
    throughout the entire program.
  *)
  SIO.PutText("Enter two numbers:\n");
  a := SIO.GetInt();
  b := SIO.GetInt();
  VAR 
    x:CARDINAL := a; (* local to this block *)
    y:CARDINAL := b; (* local to this block *)
  BEGIN
    WHILE x # y DO (* x and y only visible in this block, a,b,res are global! *)
      IF x > y THEN x := x - y ELSE y := y - x END;
    END;
    res := x;
  END;
  (* if for example our res variable was declared where x and y are, we would
  not have access to it here, because by now it would've been deallocated! *)
  SIO.PutInt(res) 
END Main.

