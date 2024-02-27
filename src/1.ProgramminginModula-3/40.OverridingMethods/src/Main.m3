MODULE Main;

IMPORT SIO,Math,Fmt;

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

VAR
  C:Circle := NEW(Circle,radius := 5.0D0);
  R:Rectangle := NEW(Rectangle,width := 5.0D0,length := 10.0D0);

BEGIN
  (* 
    Overriding means that a subclass has a method with the same name as the 
    superclass. This feature can be used for writing polymorphous procedures
    where the procedure parameter is Shape and the correct 
    corresponding method of the subclass is called according to what type of 
    subclass object(here Circle or Rectangle) is passed to the procedure.
    So we can have a single procedure that takes any Shape object
    (any type that is in the class hierarchy of Shape).
  *)
  SIO.PutText(Fmt.F("Area of circle: %s\nCircumference of circle: %s\n\n",
                    Fmt.LongReal(C.area()),Fmt.LongReal(C.circumference())));
  SIO.PutText(Fmt.F("Area of rectangle: %s\nCircumference of rectangle: %s\n\n",
                    Fmt.LongReal(C.area()),Fmt.LongReal(R.circumference())));
END Main.
