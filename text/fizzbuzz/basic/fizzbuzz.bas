REM
REM Created:  Wed 07 Jun 2017 12:01:58 AM PDT
REM Modified: Wed 07 Jun 2017 12:16:21 AM PDT
REM
REM Author: Robert Gill <locke@sdf.lonestar.org>
REM Copyright 2017 (C) Robert Gill
REM
REM Written for RFO BASIC! dialect.
REM

FOR Count = 1 TO 100
  LET M3 = MOD(Count, 3)
  IF M3 = 0 THEN PRINT "Fizz";
  LET M5 = MOD(Count, 5)
  IF M5 = 0 THEN PRINT "Buzz";
  LET Both = M3 & M5
  IF Both <> 0 THEN ~
    PRINT USING$("","%d",INT(Count));
  PRINT
NEXT
