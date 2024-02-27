MODULE Main;

IMPORT Rd,FileRd,SIO;

CONST FileName = "input.txt";

VAR 
  rd:Rd.T;
  t:TEXT;

BEGIN
  (*
    There are two modes of reading/writing files:
    1) sequential
    2) direct
    In first case we r/w files sequentially one after the other.
    In the second case we have the freedom to jump to different places
    in the file.
    So the difference lies in positioning. The Operating System maintains
    a pointer to the file, and in the first case it is automatically
    incremented by the OS, but in the second case we can position the
    pointer anywhere ourselves.

    File operations include:
    1) Opening or creating a file:
    We can open an existing file and if the file doesn't exist the OS
    will create it for us. We can also open a file in append mode, where
    the data is simply appended to an existing file.
    2) Reading or writing to a file
    3) Test for end of file(EOF)
    4) Set r/w position:
    Some systems allow us to position the file pointer explicitly.
    5) Closing a file:
    A file must be closed due to file buffering in main memory.

    There are two file types:
    1) Text files
    2) Binary files
  *)
  rd := FileRd.Open(FileName);
  WHILE NOT Rd.EOF(rd) DO 
    t := Rd.GetLine(rd);
    SIO.PutText(t); SIO.Nl()
  END;
  Rd.Close(rd)
END Main.

