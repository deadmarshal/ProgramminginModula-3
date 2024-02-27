MODULE Fraction;

PROCEDURE Init(VAR r:T;num:INTEGER;den:INTEGER := 1) =
  BEGIN
    r.num := num;
    r.den := den
  END Init;
  
PROCEDURE Plus(x,y:T):T =
  VAR sum:T;
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
  VAR prod:T;
  BEGIN
    prod.num := x.num * y.num;
    prod.den := x.den * y.den;
    RETURN prod
  END Times;
  
PROCEDURE Divide(x,y:T):T =
  VAR inverse:T;
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

