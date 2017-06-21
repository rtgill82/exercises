REM
REM Created:  Tue 20 Jun 2017 08:03:58 PM PDT
REM Modified: Wed 21 Jun 2017 11:13:01 AM PDT
REM
REM Copyright 2017 (C) Robert Gill
REM
REM Written for RFO BASIC! dialect.
REM

GOTO Start

Factorial:
LET Product = 1
FOR I = Num TO 2 STEP -1
LET Product = I * Product
NEXT I
PRINT USING$("", "%d", INT(Product))
RETURN

REM Recursivity in BASIC?
REM Can this really be considered recursive?
RecursiveFactorial:
LET Product = 1
LET I = Num
Recurse:
LET Product = I * Product
LET I = I - 1 
IF I <> 1 THEN
  GOSUB Recurse
ELSE
  PRINT USING$("", "%d", INT(Product))
  RETURN
ENDIF
RETURN

Start:
INPUT "Enter a number:", Num
GOSUB Factorial
GOSUB RecursiveFactorial
