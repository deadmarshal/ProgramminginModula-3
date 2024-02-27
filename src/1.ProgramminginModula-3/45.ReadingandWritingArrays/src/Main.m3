MODULE Main;

IMPORT Rd,Wr,FileRd,FileWr,SIO,Fmt,Scan,Text;

CONST FileName = "myfile.txt";

PROCEDURE PutRealArray(wr:Wr.T;READONLY r:ARRAY OF REAL) =
BEGIN
  FOR I := FIRST(r) TO LAST(r) DO
    (* Fmt.Real() converts a REAL value to TEXT. *)
    Wr.PutText(wr,Fmt.Int(I) & " " & Fmt.Real(r[I]) & "\n")
  END;
END PutRealArray;

PROCEDURE GetRealArray(rd:Rd.T;VAR r:ARRAY OF REAL) =
VAR 
  i,delimiter:CARDINAL;
  t:TEXT;
BEGIN
  WHILE NOT Rd.EOF(rd) DO 
    t := Rd.GetLine(rd);
    (* Text.FindChar(t,c) searches for a character and returns its position,
      if the character is not found -1 is returned. *)
    (* between index and value *)
    delimiter := Text.FindChar(t,' ');
    (* Text.Sub(t,p,l) starting at position p, it extracts from t,
      l characters and returns them as TEXT. *)
    (* index: *) 
    i := Scan.Int(Text.Sub(t,0,delimiter));
    (* Scan.Real() converts a TEXT value to a REAL value. *)
    (* value: *)
    r[i] := Scan.Real(Text.Sub(t,delimiter+1,Text.Length(t)-delimiter-1));
  END;
END GetRealArray;

VAR 
  WriteArray:ARRAY[0..4] OF REAL := ARRAY OF REAL{1.5,5.2,6.7,9.6,7.2};
  ReadArray:ARRAY[0..4] OF REAL;
  rd:Rd.T;
  wr:Wr.T;

BEGIN
  (* Reading and writing an array from/to a file *)
  SIO.PutText("Writing array to file...\n");
  wr := FileWr.Open(FileName);
  PutRealArray(wr,WriteArray);
  Wr.Close(wr);
  rd := FileRd.Open(FileName);
  GetRealArray(rd,ReadArray);
  Rd.Close(rd);
  SIO.PutText("Reading array from file:\n");
  FOR I := FIRST(ReadArray) TO LAST(ReadArray) DO 
    SIO.PutReal(ReadArray[I]); SIO.Nl()
  END
END Main.

