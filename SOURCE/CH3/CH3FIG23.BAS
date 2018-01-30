REM Basic program for color connectives display, here as in Chapter 3,
REM Fig 23

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
FOR x = 0 TO 16
FOR y = 0 TO 16
cl = a(((1 - r1(x)) * (1 - r1(y))), ((1 - r2(x)) * (1 - r2(y))), ((1 - r3(x)) * (1 - r3(y))), ((1 - r4(x)) * (1 - r4(y))))
IF cl = 16 THEN cl = 0
IF x = 0 THEN cl = y
IF y = 0 THEN cl = x
IF x = 0 AND y = 0 THEN cl = 15
IF x = 0 AND y = 16 OR y = 0 AND x = 16 THEN cl = 0
LINE ((x + 1) * size, (y + 1) * size)-((x + 1) * size + size, (y + 1) * size + size), (cl) MOD 16, BF
NEXT
NEXT


