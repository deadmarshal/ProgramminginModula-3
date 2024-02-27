MODULE Main;

IMPORT SIO;

BEGIN
  (*
    Type equivalence:
    Modula-3 employs structural equivalence of types. Two types are equivalent
    if their expanding results in the same type. Expanding means that all
    constant expressions are replaced by their values and all types names
    are replaced by their definitions.
    CONST
      N = 10;
    TYPE
      T1 = [1..10]; (* equivalent to T2,T3,T4 *)
      T2 = [1..N];  (* equivalent to T1,T3,T4 *)
      T3 = [1..2 * 2 * 2 + 2]; (* equivalent to T1,T2,T4 *)
      T4 = T1; (* equivalent to T1,T2,T3 *)
      T5 = {a,b,c}; (* equivalent to T6 *)
      T6 = {a,b,c}; (* equivalent to T5 *)
      T7 = {a,b,d}; (* not equivalent to the other types *)

    Many programming languages like Pascal and Modula-2, employ
    name equivalence. Here types are equivalent only if they are
    explicitly declared as such; from this perspective only T1
    and T4 are name equivalent, all others are considered
    different types.
    
    Subtypes:
    Modula-3 supports a general concept of subtyping. We use the
    special symbol "<:" to specify the subtype relationship.
    If Sub and Super are two types and the relationship Sub <: Super
    exits, then all values of Sub are also values of Super.
    In this case Sub is a subtype of Super, and Super is the supertype
    of Sub.
    In Modula-3 a type can have any number of subtypes, but only one
    supertype. (There are also programming languages where a type can
    have multiple supertypes).
    The subtype relationship is often called the Is-a relationship:
    A value of a subtype is a value of the supertype. Given the
    relationship Workdays <: Weekdays, then all Workdays are Weekdays.
    The subrange types are actually not independent types,but subtypes
    of their base types. The following rules apply to subranges:
    [u..o] <: B whereby B is the common base type of u and o
    [u..o] <: [U..O] if [u..o] is a subset of [U..O]
    for example:
    TYPE
      SubR1 = [3..8];
      SubR2 = [0..2];
    Neither of the ranges is the subset of the other and they are disjunct.
    An assignment involving a variable of these types to the other is not
    permitted.
    But if the ranges overlap, for example:
    Days = {Monday,Tuesday,Wednesday,Thursday,
            Friday,Saturday,Sunday};
    Workdays <: Days;
    Weekend  <: Days;
    WorkDays and Weekend are subtypes of the same base type, but don't
    share a subtype relationship to one another(neither range is the subset
    of the other). We can still make an assignment between variables of these
    types because the ranges overlap. However, such an assignment can produce
    an error if the assigned value is not in the range of the target variable.
    In general, variable of ordinal types whose ranges overlap can be assigned
    to one another.

    Reflexivity and transitivity:
    The subtype relationship is reflexive and transitive:
    T <: T
    T <: U ^ U <: V => T <: V
    In words, every type is its own subtype and supertype. In addition,
    if type T is a subtype of U, and U is a subtype of V, then T is also
    a subtype of V.
    For example, let T1 = [1..100],T2 = [10..80],T3 = [30..50].
    Then T3 <: T2 and T2 <: T1. This implies that T3 <: T1.
    However, T <: U and U <: T doesn't imply that U and T are equal.

    Operations on subtypes:
    All operations defined for a supertype are also defined for the subtype.
    This means that for operands of a subrange type all operations of the
    corresponding base type apply. For example, for operands of type
    T1 = [1..100] we can employ all INTEGER operations.
    In general it is possible to define additional operations for subtypes.
    We will see this when talking about object types.

    Assignment compatibility:
    An expression A of type R is assignment compatible with a
    variable of type L (i.e. var:L := A is legal) if one of the
    following conditions applies:
    1) R and L are equivalent, or
    2) R <: L or
    3) R and L are ordinal types that overlap in at least one value,
    and the value of A is in the range of L, or
    4) L <: R and R is an array type or a reference type for which
    certain conditions apply.
    
    Rule 1 states that if the types are the same, then any value
    of the one expression is a possible value of the other expression.
    Rule 2 expresses the fact that in the subtype relationship all values
    of the subtype are also values of the supertype.
    Examples of rules 2 and 3 include Workday and Days as we explained
    above.

    Violations of rules 3 and 4 can be checked in part at compile-time.
    Otherwise they can be checked at run-time when the current values are
    known.

    Expression compatibility:
    In Modula-3, for expressions of the form operand1 operator operand2,
    the operands must share a common supertype(an exception is the IN
    operation). Before evaluation of the expression, the operands are
    converted to this common type. For types that have no subtype
    relationship with the other types(e.g. REAL), this means that
    both operands must be of the same type. However,
    CARDINAL <: INTEGER; therefore INTEGERs can be added to CARDINALs.
    The following example is correct, because the addition of s1 and s2
    takes place in the range of INTEGER:
    VAR
      s1:[1..2] := 2;
      s2:[3..4] := 3;
      i:INTEGER;
    BEGIN
      i := s1 + s2; (* Type of the expression s1+s2 is INTEGER *)

    To mix REALs and INTEGERs in an expression, we must use the
    conversion functions. In Modula-3 expressions there is no
    implicit type conversion, but there is explicit type converion.
    The lack of implicit type conversion helps to minimize
    programming errors.

    Result type:
    The result type of an expression(called the type of the expression)
    with two operands is not necessarily the type of its operands. The
    results depend on the operator. Addition, for example maps all
    INTEGER subranges to a result of type INTEGER(even if both operands
    have the same subrange type). The relational operator map all permitted
    operand types to the result type BOOLEAN.
    The rules of type equivalence together with compatibility rules form
    the basic framework of the type system.

    Subtype rule for references:
    NULL <: REF T <: REFANY
    NULL <: UNTRACED REF T <: ADDRESS
    In words, all traced references are subtypes of REFANY(and all
    untraced references are subtypes of ADDRESS).
    This REFANY(or ADDRESS) is the supertype,the root, of all
    reference types. NULL is the subtype of all references.
    The only value in its range is NIL. This means that every
    reference type contains NIL. Thus we can assign NIL to any
    reference variable.

    Subtype rule for arrays:
    Array type Sub is a subtype of array type Super if they have the
    same number of dimensions, and share the same base type(element
    type in the last dimension), and if for each dimension either
    both are open arrays or Sub is fixed(fixed number of elements)
    and Super open, or both are fixed and have the same number of
    elements.
    Thus an open dimension is always a supertype of a corresponding
    fixed dimension.
    For Example:
    TYPE
      FixedMatrix = ARRAY[1..100],[1..100] OF REAL;
      FixedVector = ARRAY[1..100] OF REAL;
      SmallVector = ARRAY[1..50] OF REAL;
      Matrix = ARRAY OF ARRAY OF REAL;
      Vector = ARRAY OF REAL;
    VAR
      v:REF Vector := NEW(REF Vector,100;
      m:REF Matrix := NEW(REF Matrix,100,100);
      fv:FixedVector;
      sv:SmallVector;
      fm:FixedMatrix;
    BEGIN
    v^ := fv;
    m^ := fm;
    fv := v^;
    fm := m^;
    v^ := sv; (* run-time error due to different structure *)

    FixedMatrix <: Matrix
    FixedVector <: Vector
    SmallVector <: Vector

    Assignment compatibility of arrays:
    Rules 2 and 4 apply for the assignment compatibility of arrays,
    but they are always restricted by an additional rule:
    Assignment compatible arrays must have the same shape.
    Hence the run-time error of v^ := sv;

    We also have some rules for object types which will be
    discussed later.
  *)
  
END Main.

