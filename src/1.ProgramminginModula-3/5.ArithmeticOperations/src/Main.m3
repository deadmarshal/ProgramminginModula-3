MODULE Main;

IMPORT SIO;

VAR
  x,y:INTEGER;
  xr,yr:REAL;

BEGIN
  SIO.PutText("Basic arithmetic operations: \n");
  SIO.PutText("Please enter two integers: \n");
  x := SIO.GetInt(); (* We'll learn about error handling later! *)
  y := SIO.GetInt();
  SIO.PutInt(x); SIO.PutText(" + "); SIO.PutInt(y); SIO.PutText(" = ");
  SIO.PutInt(x + y); SIO.Nl();
  SIO.PutInt(x); SIO.PutText(" - "); SIO.PutInt(y); SIO.PutText(" = ");
  SIO.PutInt(x - y); SIO.Nl();
  SIO.PutInt(x); SIO.PutText(" * "); SIO.PutInt(y); SIO.PutText(" = ");
  SIO.PutInt(x * y); SIO.Nl();
  SIO.PutInt(x); SIO.PutText(" DIV "); SIO.PutInt(y); SIO.PutText(" = ");
  SIO.PutInt(x DIV y); SIO.Nl();
  SIO.PutInt(x); SIO.PutText(" MOD "); SIO.PutInt(y); SIO.PutText(" = ");
  SIO.PutInt(x MOD y); SIO.Nl();

  (* INC(x) is the same as x := x + 1; but x is evaluated once! *)
  (* INC(x,n) is the same as x := x + n; but x is evaluated once! *)
  (* So using INC() and DEC() is slightly more efficient! *)
  SIO.PutText("INC(x): "); INC(x); SIO.PutInt(x); SIO.Nl();
  SIO.PutText("INC(y): "); INC(y); SIO.PutInt(y); SIO.Nl();
  SIO.PutText("DEC(x): "); DEC(x); SIO.PutInt(x); SIO.Nl();
  SIO.PutText("DEC(y): "); DEC(y); SIO.PutInt(y); SIO.Nl();
  SIO.PutText("INC(x,5): "); INC(x,5); SIO.PutInt(x); SIO.Nl();
  SIO.PutText("INC(y,5): "); INC(y,5); SIO.PutInt(y); SIO.Nl();
  SIO.PutText("DEC(x,5): "); DEC(x,5); SIO.PutInt(x); SIO.Nl();
  SIO.PutText("DEC(y,5): "); DEC(y,5); SIO.PutInt(y); SIO.Nl();
  SIO.PutText("ABS(x): "); SIO.PutInt(ABS(x)); SIO.Nl();
  SIO.PutText("ABS(y): "); SIO.PutInt(ABS(y)); SIO.Nl();
  SIO.PutText("MIN(x,y): "); SIO.PutInt(MIN(x,y)); SIO.Nl();
  SIO.PutText("MAX(x,y): "); SIO.PutInt(MAX(x,y)); SIO.Nl();
    
  SIO.PutText("Please enter two reals: \n");
  xr := SIO.GetReal();
  yr := SIO.GetReal();
  SIO.PutReal(xr); SIO.PutText(" + "); SIO.PutReal(yr); SIO.PutText(" = ");
  SIO.PutReal(xr + yr); SIO.Nl();
  SIO.PutReal(xr); SIO.PutText(" - "); SIO.PutReal(yr); SIO.PutText(" = ");
  SIO.PutReal(xr - yr); SIO.Nl();
  SIO.PutReal(xr); SIO.PutText(" * "); SIO.PutReal(yr); SIO.PutText(" = ");
  SIO.PutReal(xr * yr); SIO.Nl();
  SIO.PutReal(xr); SIO.PutText(" / "); SIO.PutReal(yr); SIO.PutText(" = ");
  SIO.PutReal(xr / yr); SIO.Nl();
  SIO.PutReal(xr); SIO.PutText(" MOD "); SIO.PutReal(yr); SIO.PutText(" = ");
  SIO.PutReal(xr MOD yr); SIO.Nl();
  SIO.PutText("ABS(xr): "); SIO.PutReal(ABS(xr)); SIO.Nl();
  SIO.PutText("ABS(yr): "); SIO.PutReal(ABS(yr)); SIO.Nl();
  SIO.PutText("MIN(x,y): "); SIO.PutReal(MIN(xr,yr)); SIO.Nl();
  SIO.PutText("MAX(x,y): "); SIO.PutReal(MAX(xr,yr)); SIO.Nl();
END Main.

