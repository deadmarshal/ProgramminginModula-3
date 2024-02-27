MODULE Main;

IMPORT IO,SIO;

(* Global variables: *)
(*
Global variables are default initialized:
0 for Ordinal types
0.0 for Float types
'' (NUL) for CHAR types
NIL for pointer types
etc...
*)

VAR
  (* We can either initialize variables in here like A:CHAR := 'A'
     or inside the main block. *)
  (* These are called variable declaration. If we also initialize them
     then we are both declaring and initializing the variables. *)
  (* Unused variables are reported with a warning message. We can
     tell the compiler that we do not intend to use a variable
     by using a PRAGMA. (which we'll talk about later.) *)
  A:CHAR;
  B:WIDECHAR;
  C:INTEGER;
  D:LONGINT;
  E:CARDINAL;
  F:LONGCARD;
  G:REAL;
  H:LONGREAL;
  I:EXTENDED;
  J:TEXT;
  K:BOOLEAN;
  
BEGIN
  A := 'A';
  B := W'Z'; (* WIDECHARs are indicated by prepending a W *)
  C := 15;
  D := 20L; (* LONG types are indicated with a L *)
  E := 25;
  F := 30L;
  G := 40.7;
  H := 14.56D0; (* D0 indicates LONGREAL (D stands for double precision) *)
  I := 56.4X0; (* X0 indicates EXTENDED *)
  (* We can also use the scientific notation like:
     1.5e2 (150 REAL) and -1.5x+2 (-150 EXTENDED)
     'DdEeXx' are all allowed.
  *)
  J := "Hello!";
  K := TRUE;
  IO.PutChar(A); IO.Put("\n");
  IO.PutWideChar(B); IO.Put("\n");
  IO.PutInt(C); IO.Put("\n");
  IO.PutLongInt(D); IO.Put("\n");
  IO.PutInt(E); IO.Put("\n");
  IO.PutLongInt(F); IO.Put("\n");
  IO.PutReal(G); IO.Put("\n");
  SIO.PutLongReal(H); IO.Put("\n");
  SIO.PutExtended(I); IO.Put("\n");
  IO.Put(J); IO.Put("\n");
  SIO.PutBool(K); IO.Put("\n");
END Main.

