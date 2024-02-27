MODULE Main;

IMPORT SIO;

CONST
  vowels:ARRAY[1..5] OF CHAR =
    ARRAY[1..5] OF CHAR{'a','e','i','o','u'};
  (* in names array, if we put a .. as the last element,
     the last expression before the .., here "", is used for the rest of the
     elements to fill the array. Here we initialized first 3 elements,
     and all other 17 elements are blank.
     .. syntax can only be used in fixed array constructors.
     fixed array constructors are like:
     ARRAY[lo..hi] OF T{}
     open array constructor is like:
     ARRAY OF T{}
  *)
  names = ARRAY[1..20] OF TEXT{"John","Mary","Jack","",..};
  (* wrong = ARRAY[1..10] OF INTEGER{1,3,4}; *)
  
TYPE
  One = ARRAY[1..20] OF REAL;
  Two = ARRAY['A'..'Z'] OF INTEGER; (* 26 elements *)
  TwoDimensional = ARRAY[1..20],[1..40] OF CARDINAL;
  TwoDimensional2 = ARRAY[1..20] OF ARRAY [1..40] OF CARDINAL;
  (* TwoDimensional and TwoDimensional2 are the same type written differently! *)
  NegativeIndices = ARRAY[-5..5] OF INTEGER;
  Array1 = ARRAY[1..50] OF INTEGER;
  Array2 = ARRAY[1..10] OF INTEGER;
  
VAR
  a1:One;
  a2:Two;
  a3:TwoDimensional;
  a4:TwoDimensional2;
  (* a5 := ARRAY OF CHAR{'a','b','c'}; *) (* variable can't be an open array! *)
  (* but open array constructor can be assigned to a fixed array type! *)
  a6:ARRAY[0..4] OF INTEGER := ARRAY OF INTEGER{1,2,3,4,5};
  (* Multi-dimensional arrays: *)
  a7:ARRAY[0..2],[0..3] OF CARDINAL := ARRAY[0..2],[0..3] OF CARDINAL{
  ARRAY[0..3] OF CARDINAL{1,2,3,4},
  ARRAY[0..3] OF CARDINAL{5,6,7,8},
  ARRAY[0..3] OF CARDINAL{9,10,11,12}
  };

  a8 := ARRAY[0..2],[0..3] OF CARDINAL{
  ARRAY OF CARDINAL{1,2,3,4},
  ARRAY OF CARDINAL{5,6,7,8},
  ARRAY OF CARDINAL{9,10,11,12}
  };

  (* a9:ARRAY[0..2],[0..3] OF CARDINAL := ARRAY OF CARDINAL{ *)
  (* ARRAY OF CARDINAL{1,2,3,4}, *)
  (* ARRAY OF CARDINAL{5,6,7,8}, *)
  (* ARRAY OF CARDINAL{9,10,11,12} *)
  (* }; *)

  a10 := Array1{0,..};
  a11 := Array2{1,..};
  
  last:INTEGER;
  
BEGIN
  (*
    An array is a collection of elements of the same type
    (homogeneous), which are placed contiguously in memory.
    Array's elements are accessed via an index
    (which can also be negative and have to be an ordinal type).
    A static array have a fixed length that must be known at compile time.
    We will see how to do dynamic arrays that can have any length
    at run-time later.
    An array with one dimension is called a unidimensional array.
    An array with multiple dimensions is called a multi-dimensional array.
    Array constructors are used to initialize an array, and they can be
    assigned to array constants and array variables.
    
    Operations on arrays:
    Assignment:
    Two arrays can be assigned to each other if they have the same base type
    and same shape(same number of elements in each dimension).
    Arrays can be compared with = and # relational operators, comparison
    is done element by element.
    FIRST(),LAST() functions return the first and last index of the array
    and can be used for example for looping.
    NUMBER() returns the size of the array.
    
    The procedure SUBARRAY(a:Array;from,count:CARDINAL)
    can be used to get a subarray of an array. SUBARRAY returns
    a variable whose type is array of the element type of a.
    SUBARRAY() returns part of the array itself, not a copy thereof.
    We can also assign overlapping ranges whithin an array to one another.
    
    Two methods for getting the middle index of the array:
    1. mid := (start + end) DIV 2;
    2. mid := start + (end - start) DIV 2;
    NOTE: (end – start) may overflow if end < 0 or start < 0.
    2nd method avoid this overflow and is better than 1st.
    NOTE: open arrays can be used for formal procedure parameters.
    NOTE: In arrayname[I], the [] is the called subscript notation,
    which can be used to index arrays.
  *)
  
  (* Iterating 1D array: *)
  FOR I := FIRST(vowels) TO LAST(vowels) DO
    SIO.PutChar(vowels[I]);
    SIO.PutChar(' ');
  END;
  SIO.Nl();

  last := FIRST(vowels) + (LAST(vowels) - FIRST(vowels)) DIV 2;
  FOR I := FIRST(vowels) TO last DO
    SIO.PutChar(vowels[I]);
    SIO.PutChar(' ');
  END;
  SIO.Nl();
  
  (* Iterating 2D array: *)
  FOR I := FIRST(a8) TO LAST(a8) DO
    FOR J := FIRST(a8[I]) TO LAST(a8[I]) DO
      SIO.PutInt(a8[I,J]);
      SIO.PutChar(' ')
    END;
    SIO.Nl()
  END;
  SIO.Nl();

  IF a7 = a8 THEN SIO.PutText("a7 and a8 are equal!\n") END;

  SIO.PutText("a10: ");
  FOR I := FIRST(a10) TO LAST(a10) DO
    SIO.PutInt(a10[I]);
    SIO.PutChar(' ')
  END;
  SIO.Nl();
  
  (* Copy a11 to a10 starting at index 11: *)
  SUBARRAY(a10,10,NUMBER(a11)) := a11;

  SIO.PutText("a10: ");
  FOR I := FIRST(a10) TO LAST(a10) DO
    SIO.PutInt(a10[I]);
    SIO.PutChar(' ')
  END;
  SIO.Nl();
  
  (* Replace a10 indices 11..15: *)
  FOR I := 0 TO 4 DO SUBARRAY(a10,10,5)[I] := I * 3 END;

  SIO.PutText("a10: ");
  FOR I := FIRST(a10) TO LAST(a10) DO
    SIO.PutInt(a10[I]);
    SIO.PutChar(' ')
  END;
  SIO.Nl();
  
  (* Shifts 5 values from index 11 by 1 element: *)
  SUBARRAY(a10,11,5) := SUBARRAY(a10,10,5);

  SIO.PutText("a10: ");
  FOR I := FIRST(a10) TO LAST(a10) DO
    SIO.PutInt(a10[I]);
    SIO.PutChar(' ')
  END;
  SIO.Nl();
END Main.

