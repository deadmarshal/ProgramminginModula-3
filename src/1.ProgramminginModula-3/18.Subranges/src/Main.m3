MODULE Main;

IMPORT SIO;

TYPE
  WorkHours = [8..18];
  Hours = [0..24];

VAR
  hour:Hours;
  workhour:WorkHours;
  
BEGIN
  (*
    Subranges are used to restrict the range of
    an ordinal type. The base type that we want
    to restrict is called the base type.
    Subranges are not distinct types, but subtypes
    of the base type.
    subrange syntax:
    SubRangeType = [const_expression..const_expression];
    NOTE: if the lower bound is greater than the upper bound,
    then the subrange is empty.
    NOTE: CARDINAL is defined as [0..LAST(INTEGER)];
  *)

  (* Iterating subranges *)
  FOR wh := FIRST(WorkHours) TO LAST(WorkHours) DO
    SIO.PutInt(wh);
    SIO.PutChar(' ');
  END;
  SIO.Nl();
  
  hour := LAST(WorkHours);
  workhour := hour;
  INC(hour);
  (* workhour := hour; *) (* run-time error since 19 is not in the range [8..18] *)
END Main.

