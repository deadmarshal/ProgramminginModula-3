MODULE Main;

IMPORT SIO;

CONST
  All  = TSet{1..16};
  Null = TSet{};
  Some = TSet{1,3,5..8,14..16};
  Half = TSet{FIRST(Range)..LAST(Range) DIV 2};
  
TYPE
  Range = [1..16];
  TSet = SET OF Range;
  TSet1 = SET OF [1..2];
  TSet2 = SET OF [2..3];
    
VAR
  r1:Range := 11;
  r2:Range := 13;
  ss := TSet{r1,12,r2};
  s1 := TSet1{2};
  s2 := TSet2{2};
  set1,set2,set3 := TSet{};

PROCEDURE PrintSet(READONLY s:TSet;READONLY First,Last:INTEGER) =
  BEGIN
    FOR e := First TO Last DO
      IF e IN s THEN SIO.PutInt(e); SIO.PutChar(' ') END
    END;
    SIO.Nl()
  END PrintSet;
    
BEGIN
  (*
    https://en.wikipedia.org/wiki/Set_(mathematics)
    Sets are unordered collection of elements and can't be indexed.
    We can insert an element to a set or test whether a certain
    element is contained in the set or not.
    Set syntax:
    Somename = SET OF T;
    NOTE: T must be an ordinal type.
    NOTE: Since the base type(T) itself represents a value set,
    the range of a set is a power set(a set of sets).
    This power set represents all of possible sets of the base type.
    If we create a set over the range [0..1], then the following values
    are contained in the range of the power set:
    {},{0},{1},{0,1}
    NOTE: {} is the empty set.
    NOTE: An element can occur only once in a set so {0,1,1} = {0,1}
    NOTE: If the cardinality(number of possible values) of the base type is N,
    then the cardinality of the formed set is 2^N.
    NOTE: internally each element of a set is represented by a bit, 0 means
    the set doesn't contain the element, and 1 means it does.

    Set constructors:
    Setname{e1,e2,e3,e4..e5}
    examples include: {1,3,5,6,10,11}, {1..5,6..10}, {10..20,1..5}
     
    Operations on sets:
    1) Set operations (in operations.org file)
    2) Relational operations (in operations.org file)
    3) Assignment:
    A set value can be assigned to a set variable iff their base types
    are equivalent. s1 and s2 are not equivalent!
    s1's possible values: {},{1},{2},{1,2}
    s2's possible values: {},{2},{3},{2,3}

    Comparison of arrays,records,sets:
    1) Size:
    All constructors are static in the sense that their size or
    the number of elements that they accomodate is known at compile-time.
    2) Element types:
    Arrays and sets are homogeneous structures. They store
    values of a single element type. Records are heterogenous structures. They
    combine elements(component) of different types.
    3) Access to elements:
    Access to record components is static; which component is selected in
    an expression is known at compile-time. It's not possible to make
    computations at run-time to determine which element will be accessed.
    Arrays are dynamically indexed: at run-time we can compute which element
    to select.
    We can't directly access elements of a set. It is only possible to test
    whether an element is contained in the set.
    4) Order of elements:
    The sequence of the components of a record and an array are staticaly fixed.
    The index elements of an array are ordered. The elements can be resorted
    dynamically by swapping their values. The elements of a set are not ordered.
  *)
  
  (* s1 := s2; *) (* TSet1 is not compatible with TSet2 *)
  FOR e := FIRST(Range) TO LAST(Range) BY 2 DO
    set1 := set1 + TSet{e} (* set1 := {1,3,5,7,9,11,13,15} *)
  END;
  set2 := Half - set1; (* set2 := {2,4,6,8} *)
  SIO.PutText("set2: "); PrintSet(set2,FIRST(Range),LAST(Range));
  set1 := set1 - Half + set2; (* set1 := {2,4,6,8,9,11,13,15} *)
  SIO.PutText("set1: "); PrintSet(set1,FIRST(Range),LAST(Range));
  set3 := set1 * set2; (* set3 := {2,4,6,8} *)
  SIO.PutText("set3: "); PrintSet(set3,FIRST(Range),LAST(Range));
  set3 := set1 + set2; (* set3 := {2,4,6,8,9,11,13,15} *)
  SIO.PutText("set3: "); PrintSet(set3,FIRST(Range),LAST(Range));
  set3 := set1 / set2; (* set3 := {9,11,13,15} *)
  SIO.PutText("set3: "); PrintSet(set3,FIRST(Range),LAST(Range));
  set3 := set1 - set2; (* set3 := {9,11,13,15} *)
  SIO.PutText("set3: "); PrintSet(set3,FIRST(Range),LAST(Range));
END Main.

