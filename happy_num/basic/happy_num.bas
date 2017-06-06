REM
REM Created:  Mon 05 Jun 2017 06:40:06 PM PDT
REM Modified: Mon 05 Jun 2017 06:41:48 PM PDT
REM
REM Find the first 8 happy numbers
REM Author: Robert Gill <locke@sdf.lonestar.org>
REM Copyright 2017 (C) Robert Gill
REM   All rights reserved.
REM
REM Written for RFO BASIC! dialect.
REM

LET Found = 0
LET Num = 2
LET Sum = 0

GOTO Start

IsHappyNum:
LET SumNum = Num
DO
  GOSUB SumSqrDigits
  LET SumNum = Sum
UNTIL Sum = 1 | Sum < 10
RETURN

SumSqrDigits:
LET Sum = 0
DO
  LET Sum = Sum + MOD(SumNum, 10)^2
  LET SumNum = FLOOR(SumNum / 10)
UNTIL SumNum = 0
RETURN

Start:
WHILE Found < 8
GOSUB IsHappyNum
IF Sum = 1 THEN
  LET Found = Found + 1
  PRINT USING$("","%d",INT(Num)); ~
        " is a Happy Number!"
END IF
LET Num = Num + 1
REPEAT
