INTERFACE Fraction;

TYPE
  T = RECORD
    num,den:INTEGER;
  END;

PROCEDURE Init(VAR r:T;num:INTEGER;den:INTEGER := 1);
PROCEDURE Plus(x,y:T):T;
PROCEDURE Minus(x,y:T):T;
PROCEDURE Times(x,y:T):T;
PROCEDURE Divide(x,y:T):T;

PROCEDURE Numerator(r:T):INTEGER;
PROCEDURE Denominator(r:T):INTEGER;
  
END Fraction.

