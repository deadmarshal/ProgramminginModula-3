MODULE Main;

IMPORT SIO,Math;

TYPE 
  Shape = OBJECT
    METHODS
      area():LONGREAL;
      circumference():LONGREAL;
  END;

  Circle = Shape OBJECT
    radius:LONGREAL := 0.0D0;
    OVERRIDES
    area := CircleArea;
    circumference := CircleCircumference;
  END;

  Rectangle = Shape OBJECT
    width,length:LONGREAL := 0.0D0;
    OVERRIDES
      area := RectangleArea;
      circumference := RectangleCircumference;
  END;

(* Circle methods: *)
PROCEDURE CircleArea(self:Circle):LONGREAL = 
BEGIN
  (* A :=  PI*radius^2 *)
  RETURN (Math.Pi * (self.radius * self.radius))
END CircleArea;

PROCEDURE CircleCircumference(self:Circle):LONGREAL = 
BEGIN
  (* C := 2*PI*radius *)
  RETURN 2.0D0 * Math.Pi * self.radius;
END CircleCircumference;

(* Rectangle methods: *)
PROCEDURE RectangleArea(self:Rectangle):LONGREAL = 
BEGIN
  (* A := width * length *)
  RETURN self.width * self.length
END RectangleArea;

PROCEDURE RectangleCircumference(self:Rectangle):LONGREAL = 
BEGIN
  (* C = (2 * length) + (2 * width) *)
  RETURN (2.0D0 * self.length) + (2.0D0 * self.width);
END RectangleCircumference;

PROCEDURE TestIsType(obj:Shape) = 
BEGIN
  IF ISTYPE(obj,Circle) THEN
    SIO.PutText("obj is a Circle!\n");
  ELSIF ISTYPE(obj,Rectangle) THEN
    SIO.PutText("obj is a Rectangle!\n");
  END
END TestIsType;

PROCEDURE TestTypeCase(obj:Shape) = 
BEGIN
  TYPECASE obj OF
    Circle => SIO.PutText("obj is a Circle!\n");
  | Rectangle => SIO.PutText("obj is a Rectangle!\n");
  ELSE
    SIO.PutText("obj is of an unknown type!\n");
  END
END TestTypeCase;

VAR 
  C:Circle := NEW(Circle,radius := 5.0D0);
  R:Rectangle := NEW(Rectangle,width := 5.0D0,length := 10.0D0);

BEGIN
  (* 
     A Circle or a Rectangle is a Shape, so we can use polymorphous
     variables and procedures. To really exploit this feature, we
     need some new language constructs that will help us determine
     the dynamic type of an object or to access an object according
     to its dynamic type. NARROW() and ISTYPE() are two built-in
     functions and TYPECASE is a new statement. The dynamic type of
     a reference variable can be tested at run-time if its static
     type is a traced reference type or an object type(even untraced).

     Narrow:
     
     NARROW(r:Reference;T:ReferenceType):T;

     The second parameter of NARROW is a type, which must be
     a traced reference or an object type. NARROW tests whether
     r is contained in type T. If not, it generates a run-time error.
     If so, then x is returned unchanged, but no longer with its
     original static type, but as a T object. NARROW is typically
     used in cases where T is a subtype of the static type of r
     (so it restricts the type range to the subtype).
     For example:

     TYPE
       Super = OBJECT METHODS m1() := P1 END;
       Sub = OBJECT METHODS m2() := P2 END;
     VAR
       super := NEW(Super);  
       sub := NEW(Sub);

     super has method m1 and sub has inherited this method
     and has an additional method named m2. The following
     method invocations and assignments are ok:
     super.m1();
     sub.m1();
     sub.m2();
     super := sub; (* dynamic type of super becomes Sub *)
     
     After the last assignment, super points to a Sub object.
     Now the method m2 can also be applied to super. However,
     the compiler doesn't permit the invocation super.m2()
     because the declared static type of super is Super, which
     doesn't recognize the m2 method. The NARROW function helps
     us in this situation:

     NARROW(super,Sub).m2();

     With the NARROW function we maintain that an object(super)
     is contained in the specified type(Sub) and thus the additional
     fields and methods(m2) are present. For this reason, the compiler
     permits the above assignment; the programmer assumes liability
     that the object actually is contained in the type. If this
     assertion is false(e.g., if the assignment super := sub is
     missing), then NARROW produces a run-time error.

     Istype:
     To determine at run-time if a variable or a parameter is
     of a particular type we can use ISTYPE() function and
     TYPECASE statement.

     ISTYPE(r:Reference;T:ReferenceType):BOOLEAN;
     ISTYPE returns TRUE iff r is contained in type T.
     The type must be a traced reference or an object type.
     In the above example ISTYPE(super,Sub) would return
     FALSE before the assignment super := sub, but TRUE afterwards.

     Typecase:
     Syntax of TYPECASE is like CASE, but the values of the
     cases must be types.
     TYPECASE expression OF
     | type1(auxiliary variable1) => statement1
     | typeN(auxiliary variableN) => statementN
     ELSE
       statement0
     END;

     The type must be a traced reference or an object type.
     All typeI must be subtypes of this type. The ELSE branch
     and auxiliary variables are optional. The scope of
     variableI is statementI. Types that have no auxiliary
     variables and select the same statement can be combined
     in a list:
     typeI => statement
     .
     .
     .
     typeK => statement

     can be shortened to:
     typeI...typeK => statement

     The TYPECASE executes as follows: first the expresion is
     computed. If the result is contained in several of the enumerated
     types, then the alternative is selected that appears first
     (typeI with the smallest I). This means that we must consider the
     order of the alternatives. If type1 <: type2 <: type3, then in the
     TYPECASE statement type1 should appear first. If type3 appears first,
     then this alternative would snatch all objects of types type1 to type3.
     This means that type NULL should only appear as first and type ROOT
     only as last alternative.

     The TYPECASE differs from CASE in the following:
     1) It evaluates types instead of values
     2) It is sensitive to the order of alternatives(unlike CASE!)

     So TYPECASE resembles the IF-ELSE statement more(order matters!)

     The auxiliary variableI (if present) has typeI; it is initialized
     with the value of the expression. If the expression is contained in
     none of the alternatives, then the ELSE branch is executed if
     available; otherwise a run-time error is generated.     
  *)
  TestIsType(C);
  TestIsType(R);
  TestTypeCase(C);
  TestTypeCase(R);
END Main.

