MODULE Main;

IMPORT SIO,IntStack,TextStack;

VAR
  Stack:IntStack.T := IntStack.Create(5);
  Stack2:TextStack.T := TextStack.Create(5);
  
BEGIN
  SIO.PutText("Generic stacks:\n");
  SIO.PutText("IntStack:\n");
  FOR I := 1 TO 5 DO IntStack.Push(Stack,I) END;
  FOR I := 1 TO 5 DO
    SIO.PutInt(IntStack.Pop(Stack));
    SIO.Nl();
  END;

  SIO.PutText("TextStack:\n");  
  TextStack.Push(Stack2,"Hello");
  TextStack.Push(Stack2,"World");
  TextStack.Push(Stack2,"John");
  TextStack.Push(Stack2,"Doe");
  TextStack.Push(Stack2,"Mary");
  FOR I := 1 TO 5 DO
    SIO.PutText(TextStack.Pop(Stack2) & "\n");
  END;
END Main.

