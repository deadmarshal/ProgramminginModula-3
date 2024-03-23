GENERIC INTERFACE GenericStack(Elem);

TYPE
  T <: REFANY;

PROCEDURE Create(READONLY Size:CARDINAL := 1):T;
PROCEDURE Push(VAR Stack:T;Elem:Elem.T);
PROCEDURE Pop(VAR Stack:T):Elem.T; (* removes the TOS and returns it *)
PROCEDURE Peek(VAR Stack:T):Elem.T; (* returns the TOS without removing it *)
PROCEDURE Empty(VAR Stack:T):BOOLEAN;
PROCEDURE Full(VAR Stack:T):BOOLEAN;

END GenericStack.

