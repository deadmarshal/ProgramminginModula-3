MODULE Main;

IMPORT SIO;

PROCEDURE One() = 
BEGIN
  Two();
  SIO.PutText("Inside procedure One");
  SIO.Nl()
END One;

PROCEDURE Two() = 
VAR a,b,c:INTEGER := 0;
BEGIN
  Three();
  SIO.PutText("Inside procedure Two");
  SIO.Nl()
END Two;

PROCEDURE Three() = 
BEGIN
  SIO.PutText("Inside procedure Three");
  SIO.Nl()
END Three;

BEGIN
  One();
END Main.
