REM Cellular automata generation of the Sierpinski tautology gasket

REM Programming elements included here were developed in background research
REM for Patrick Grim, Gary Mar and Paul St. Denis, THE PHILOSOPHICAL COMPUTER:
REM EXPLORATORY ESSAYS IN PHILOSOPHICAL COMPUTER MODELING, Bradford Books/
REM MIT Press.  You are free to use and adapt this program for research
REM purposes only, subject to the provision that this message be retained in
REM its entirety as part of your program.

SCREEN 12
size = 20
DIM r1(17), r2(17), r3(17), r4(17)
10 DIM a(2, 2, 2, 2)
FOR w = 0 TO 1
FOR x = 0 TO 1
FOR y = 0 TO 1
FOR z = 0 TO 1
n = n + 1
r1(n) = w
r2(n) = x
r3(n) = y
r4(n) = z
a(w, x, y, z) = n
NEXT
NEXT
NEXT
NEXT
LINE (0, 360)-(640, 480), 15, BF
LINE (360, 0)-(640, 480), 15, BF
FOR p = 1 TO 5000: NEXT
FOR n = 1 TO 16
FOR x = 1 TO 16
FOR y = 1 TO 16
c = a(1 - (r1(x) * r1(y)), 1 - (r2(x) * r2(y)), 1 - (r3(x) * r3(y)), 1 - (r4(x) * r4(y)))
cl = 15
IF c = n THEN cl = 1
LINE (x * size, y * size)-(x * size + size, y * size + size), cl, BF
NEXT
NEXT
25 FOR p = 1 TO 5000
27 NEXT p
NEXT


