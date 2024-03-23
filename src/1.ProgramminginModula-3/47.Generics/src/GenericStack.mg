GENERIC MODULE GenericStack(Elem);

FROM StableError IMPORT Halt;

REVEAL T = BRANDED REF RECORD
  Data:REF ARRAY OF Elem.T := NIL;
  Top:CARDINAL := 0;
END;

PROCEDURE Create(READONLY Size:CARDINAL := 1):T =
  VAR Ret:T := NEW(T,Data := NEW(REF ARRAY OF Elem.T,Size),Top := 0);
  BEGIN
    RETURN Ret
  END Create;
  
PROCEDURE Push(VAR Stack:T;Elem:Elem.T) =
  BEGIN
    IF Full(Stack) THEN Halt("Stack is full!\n") END;
    Stack.Data[Stack.Top] := Elem;
    INC(Stack.Top)
  END Push;
  
PROCEDURE Pop(VAR Stack:T):Elem.T =
  BEGIN
    IF Stack.Top > 0 THEN DEC(Stack.Top) END;
    RETURN Stack.Data[Stack.Top]
  END Pop;
  
PROCEDURE Peek(VAR Stack:T):Elem.T =
  BEGIN
    RETURN Stack.Data[Stack.Top]
  END Peek;
  
PROCEDURE Empty(VAR Stack:T):BOOLEAN =
  BEGIN
    RETURN Stack.Top = 0
  END Empty;
  
PROCEDURE Full(VAR Stack:T):BOOLEAN =
  BEGIN
    RETURN Stack.Top >= NUMBER(Stack.Data^)
  END Full;

BEGIN
  
END GenericStack.

