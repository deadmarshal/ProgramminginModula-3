INTERFACE Fraction;

TYPE
  T <: REFANY;

PROCEDURE Create(x:INTEGER;y:INTEGER := 1):T;
PROCEDURE Plus(x,y:T):T;
PROCEDURE Minus(x,y:T):T;
PROCEDURE Times(x,y:T):T;
PROCEDURE Divide(x,y:T):T;

PROCEDURE Numerator(r:T):INTEGER;
PROCEDURE Denominator(r:T):INTEGER;
  
END Fraction.

