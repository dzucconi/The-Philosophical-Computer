REM The Sierpinski gasket as a tautology value space

REM Programming elements included here were developed in background research
REM for Patrick Grim, Gary Mar and Paul St. Denis, THE PHILOSOPHICAL COMPUTER:
REM EXPLORATORY ESSAYS IN PHILOSOPHICAL COMPUTER MODELING, Bradford Books/
REM MIT Press.  You are free to use and adapt this program for research
REM purposes only, subject to the provision that this message be retained in
REM its entirety as part of your program.

SCREEN 12
cen = 100
LINE (0, 0)-(700, 700), 16, BF
FOR x = 0 TO 255
FOR y = 0 TO 255 - x
IF x = 0 THEN PSET (x + cen, y + 5 + cen), y MOD 16
IF y = 0 THEN PSET (x + 5 + cen, y + cen), x MOD 16
IF (x AND y) = 0 THEN PSET (x + 5 + cen, y + 5 + cen), 0
NEXT
NEXT

