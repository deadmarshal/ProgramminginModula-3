MODULE Main;

IMPORT IO;

(* Note that we use = for constant assignment not := *)
CONST
  C1 = 15; (* type is deduced *)
  C2:INTEGER = 20; (* with explicit type *)
  
BEGIN
  IO.Put("C1: "); IO.PutInt(C1); IO.Put("\n");
  IO.Put("C2: "); IO.PutInt(C2); IO.Put("\n");
  (* C1 := 10; *) (* Constants are immutable! *)
END Main.

