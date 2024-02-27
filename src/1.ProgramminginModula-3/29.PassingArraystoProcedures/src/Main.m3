MODULE Main;

IMPORT SIO;

TYPE
  OneDim = ARRAY[0..4] OF INTEGER;
  TwoDim = ARRAY[0..1],[0..2] OF INTEGER;
  Other = ARRAY[0..0] OF INTEGER; (* array with 1 element! *)
  
VAR
  One:OneDim := ARRAY[0..4] OF INTEGER{10,20,30,40,50};
  Two:TwoDim := ARRAY[0..1],[0..2] OF INTEGER{
  ARRAY[0..2] OF INTEGER{1,2,3},
  ARRAY[0..2] OF INTEGER{4,5,6}};

(* also: PROCEDURE PrintArray(VAR A:ARRAY[0..4] OF INTEGER) *)
PROCEDURE PrintArray(READONLY A:OneDim) =
  BEGIN
    FOR I := FIRST(A) TO LAST(A) DO
      SIO.PutInt(A[I]); SIO.PutChar(' ')
    END;
    SIO.Nl()
  END PrintArray;

PROCEDURE PrintMatrix(READONLY A:TwoDim) =
  BEGIN
    FOR I := FIRST(A) TO LAST(A) DO
      FOR J := FIRST(A[I]) TO LAST(A[I]) DO
        SIO.PutInt(A[I,J]); SIO.PutChar(' ')
      END;
      SIO.Nl()
    END;
  END PrintMatrix;
  
BEGIN
  (*
    It is preferable to pass array with either the VAR or READONLY
    parameter passing modes. If the parameter passing mode is
    not specified(VALUE) then the whole array will be copied
    to the stack of the procedure and can be expensive for
    huge arrays.
    NOTE: For passing arrays of any size to a procedure,
    instead of passing a static array, we can use
    open arrays as the formal procedure type,
    as we'll see later.
  *)
  PrintArray(One);
  PrintMatrix(Two)
END Main.

