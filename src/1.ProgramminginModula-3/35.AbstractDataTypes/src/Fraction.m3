MODULE Fraction;

REVEAL T = BRANDED REF RECORD
  num,den:INTEGER
END;

PROCEDURE Create(x:INTEGER;y:INTEGER := 1):T =
  BEGIN
    RETURN NEW(T,num := x,den := y);
  END Create;
  
PROCEDURE Plus(x,y:T):T =
  VAR sum := NEW(T);
  BEGIN
    IF x.den # y.den THEN
      x.num := x.num * y.den;
      y.num := y.num * x.den;
      sum.den := x.den * y.den
    ELSE
      sum.den := x.den
    END;
    sum.num := x.num + y.num;
    RETURN sum
  END Plus;
  
PROCEDURE Minus(x,y:T):T =
  BEGIN
    y.num := -y.num;
    RETURN Plus(x,y)
  END Minus;
  
PROCEDURE Times(x,y:T):T =
  VAR prod := NEW(T);
  BEGIN
    prod.num := x.num * y.num;
    prod.den := x.den * y.den;
    RETURN prod
  END Times;
  
PROCEDURE Divide(x,y:T):T =
  VAR inverse := NEW(T);
  BEGIN
    inverse.num := y.den;
    inverse.den := y.num;
    RETURN Times(x,inverse)
  END Divide;

PROCEDURE Numerator(r:T):INTEGER =
  BEGIN
    RETURN r.num
  END Numerator;
  
PROCEDURE Denominator(r:T):INTEGER =
  BEGIN
    RETURN r.den
  END Denominator;

BEGIN
END Fraction.

