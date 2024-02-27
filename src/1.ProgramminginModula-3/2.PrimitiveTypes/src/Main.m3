MODULE Main;

IMPORT IO,SIO,Fmt;

PROCEDURE RepeatChar(READONLY C:CHAR;READONLY Start,End:CARDINAL) = 
BEGIN
  FOR I := Start TO End DO IO.PutChar(C) END;
  IO.Put("\n")
END RepeatChar;

BEGIN
  (* Ordinal types include things like INTEGER which have only whole parts.
     Float types are things like REAL and LONGREAL which have whole and
     fractional parts.
     BYTESIZE(T) returns the size of a data type in bytes.
     BITSIZE(T) returns the size of a data type in bits.
     ADRSIZE(T) returns the size of ADDRESS type, which is different depending on
     the system.
     FIRST(T),LAST(T) return the lowest and highest value of an ordinal
     type respectively.
     Arguments of FIRST() and LAST() must be an ordinal type,floating type,
     array type or array.
  *)
  (* Primitive Types include: CHAR,WIDECHAR,INTEGER,LONGINT,CARDINAL,LONGCARD
     REAL,LONGREAL,EXTENDED,TEXT
  *)
  IO.Put("BYTESIZE(CHAR): "); IO.PutInt(BYTESIZE(CHAR)); IO.Put("\n");
  IO.Put("BITSIZE(CHAR): "); IO.PutInt(BITSIZE(CHAR)); IO.Put("\n");
  IO.Put("ADRSIZE(CHAR): "); IO.PutInt(ADRSIZE(CHAR)); IO.Put("\n");
  IO.Put("FIRST(CHAR): "); IO.PutInt(ORD(FIRST(CHAR)));
  IO.Put(" LAST(CHAR): "); IO.PutInt(ORD(LAST(CHAR))); IO.Put("\n");
  RepeatChar('-',0,79);
  IO.Put("BYTESIZE(WIDECHAR): "); IO.PutInt(BYTESIZE(WIDECHAR)); IO.Put("\n");
  IO.Put("BITSIZE(WIDECHAR): "); IO.PutInt(BITSIZE(WIDECHAR)); IO.Put("\n");
  IO.Put("ADRSIZE(WIDECHAR): "); IO.PutInt(ADRSIZE(WIDECHAR)); IO.Put("\n");
  IO.Put("FIRST(WIDECHAR): "); IO.PutInt(ORD(FIRST(WIDECHAR)));
  IO.Put(" LAST(WIDECHAR): "); IO.PutInt(ORD(LAST(WIDECHAR))); IO.Put("\n");
  RepeatChar('-',0,79);
  IO.Put("BYTESIZE(INTEGER): "); IO.PutInt(BYTESIZE(INTEGER)); IO.Put("\n");
  IO.Put("BITSIZE(INTEGER): "); IO.PutInt(BITSIZE(INTEGER)); IO.Put("\n");
  IO.Put("ADRSIZE(INTEGER): "); IO.PutInt(ADRSIZE(INTEGER)); IO.Put("\n");
  IO.Put("FIRST(INTEGER): "); IO.PutInt(FIRST(INTEGER));
  IO.Put(" LAST(INTEGER): "); IO.PutInt(LAST(INTEGER)); IO.Put("\n");
  RepeatChar('-',0,79);
  IO.Put("BYTESIZE(LONGINT): "); IO.PutInt(BYTESIZE(LONGINT)); IO.Put("\n");
  IO.Put("BITSIZE(LONGINT): "); IO.PutInt(BITSIZE(LONGINT)); IO.Put("\n");
  IO.Put("ADRSIZE(LONGINT): "); IO.PutInt(ADRSIZE(LONGINT)); IO.Put("\n");
  IO.Put("FIRST(LONGINT): "); IO.PutLongInt(ORD(FIRST(LONGINT)));
  IO.Put(" LAST(LONGINT): "); IO.PutLongInt(ORD(LAST(LONGINT))); IO.Put("\n");
  RepeatChar('-',0,79);
  IO.Put("BYTESIZE(CARDINAL): "); IO.PutInt(BYTESIZE(CARDINAL)); IO.Put("\n");
  IO.Put("BITSIZE(CARDINAL): "); IO.PutInt(BITSIZE(CARDINAL)); IO.Put("\n");
  IO.Put("ADRSIZE(CARDINAL): "); IO.PutInt(ADRSIZE(CARDINAL)); IO.Put("\n");
  IO.Put("FIRST(CARDINAL): "); IO.PutInt(FIRST(CARDINAL));
  IO.Put(" LAST(CARDINAL): "); IO.PutInt(LAST(CARDINAL)); IO.Put("\n");
  RepeatChar('-',0,79);
  IO.Put("BYTESIZE(LONGCARD): "); IO.PutInt(BYTESIZE(LONGCARD)); IO.Put("\n");
  IO.Put("BITSIZE(LONGCARD): "); IO.PutInt(BITSIZE(LONGCARD)); IO.Put("\n");
  IO.Put("ADRSIZE(LONGCARD): "); IO.PutInt(ADRSIZE(LONGCARD)); IO.Put("\n");
  IO.Put("FIRST(LONGCARD): "); IO.PutLongInt(FIRST(LONGCARD));
  IO.Put(" LAST(LONGCARD): "); IO.PutLongInt(LAST(LONGCARD)); IO.Put("\n");
  RepeatChar('-',0,79);
  IO.Put("BYTESIZE(REAL): "); IO.PutInt(BYTESIZE(REAL)); IO.Put("\n");
  IO.Put("BITSIZE(REAL): "); IO.PutInt(BITSIZE(REAL)); IO.Put("\n");
  IO.Put("ADRSIZE(REAL): "); IO.PutInt(ADRSIZE(REAL)); IO.Put("\n");
  IO.Put("FIRST(REAL): "); IO.PutReal(FIRST(REAL));
  IO.Put(" LAST(REAL): "); IO.PutReal(LAST(REAL)); IO.Put("\n");
  RepeatChar('-',0,79);
  IO.Put("BYTESIZE(LONGREAL): "); IO.PutInt(BYTESIZE(LONGREAL)); IO.Put("\n");
  IO.Put("BITSIZE(LONGREAL): "); IO.PutInt(BITSIZE(LONGREAL)); IO.Put("\n");
  IO.Put("ADRSIZE(LONGREAL): "); IO.PutInt(ADRSIZE(LONGREAL)); IO.Put("\n");
  IO.Put("FIRST(LONGREAL): "); SIO.PutLongReal(FIRST(LONGREAL));
  IO.Put(" LAST(LONGREAL): "); SIO.PutLongReal(LAST(LONGREAL)); IO.Put("\n");
  RepeatChar('-',0,79);
  IO.Put("BYTESIZE(EXTENDED): "); IO.PutInt(BYTESIZE(EXTENDED)); IO.Put("\n");
  IO.Put("BITSIZE(EXTENDED): "); IO.PutInt(BITSIZE(EXTENDED)); IO.Put("\n");
  IO.Put("ADRSIZE(EXTENDED): "); IO.PutInt(ADRSIZE(EXTENDED)); IO.Put("\n");
  IO.Put("FIRST(EXTENDED): "); SIO.PutExtended(FIRST(EXTENDED));
  IO.Put(" LAST(EXTENDED): "); SIO.PutExtended(LAST(EXTENDED)); IO.Put("\n");
  RepeatChar('-',0,79);
  IO.Put("BYTESIZE(TEXT): "); IO.PutInt(BYTESIZE(TEXT)); IO.Put("\n");
  IO.Put("BITSIZE(TEXT): "); IO.PutInt(BITSIZE(TEXT)); IO.Put("\n");
  IO.Put("ADRSIZE(TEXT): "); IO.PutInt(ADRSIZE(TEXT)); IO.Put("\n");
  RepeatChar('-',0,79);
  IO.Put("BYTESIZE(BOOLEAN): "); IO.PutInt(BYTESIZE(BOOLEAN)); IO.Put("\n");
  IO.Put("BITSIZE(BOOLEAN): "); IO.PutInt(BITSIZE(BOOLEAN)); IO.Put("\n");
  IO.Put("ADRSIZE(BOOLEAN): "); IO.PutInt(ADRSIZE(BOOLEAN)); IO.Put("\n");
END Main.

