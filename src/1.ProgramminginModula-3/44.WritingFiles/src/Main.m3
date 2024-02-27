MODULE Main;

IMPORT Wr,FileWr;

CONST FileName = "output.txt";

VAR wr:Wr.T;

BEGIN
  wr := FileWr.Open(FileName);
  Wr.PutText(wr,"First line\n");
  Wr.PutText(wr,"second line\n");
  Wr.PutText(wr,"last line\n");
  Wr.Close(wr)
END Main.

