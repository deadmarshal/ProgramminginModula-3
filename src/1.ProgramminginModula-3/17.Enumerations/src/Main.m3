MODULE Main;

IMPORT SIO;

TYPE
  Days = {Monday,Tuesday,Wednesday,Thursday,
          Friday,Saturday,Sunday};
  
VAR
  day:Days;
  ord:INTEGER;
  
BEGIN
  (*
    Enumerations are a list of names (identifiers).
    NOTE: An empty enumeration is declared with {},
    and can be useful to represent a list of something that
    is empty.
    BOOLEAN is defined as {FALSE,TRUE};
    NOTE: First identifier in the enumeration list
    has ordinal value of 0 and so on, so relational
    operations(=,#,<,>,>=,<=) are also defined for enumerations.
    NOTE: FIRST(),LAST(),NUMBER(),INC(),DEC(),ORD(),VAL() are all
    defined for enumerations since it is an ordinal type.
  *)

  (* Iterating enumeration: *)
  FOR day := FIRST(Days) TO LAST(Days) DO
    SIO.PutInt(ORD(day));
    SIO.PutChar(' ');
  END;
  SIO.Nl();
  
  REPEAT
    SIO.PutText("Please enter an ordinal number for a weekday: ");
    ord := SIO.GetInt()
  UNTIL (ord >= ORD(FIRST(Days))) AND (ord <= ORD(LAST(Days)));

  day := VAL(ord,Days);
  CASE day OF
  | Days.Monday    => SIO.PutText("Monday");
  | Days.Tuesday   => SIO.PutText("Tuesday");
  | Days.Wednesday => SIO.PutText("Wednesday");
  | Days.Thursday  => SIO.PutText("Thursday");
  | Days.Friday    => SIO.PutText("Friday");
  | Days.Saturday  => SIO.PutText("Saturday");
  | Days.Sunday    => SIO.PutText("Sunday");
  END;
END Main.

