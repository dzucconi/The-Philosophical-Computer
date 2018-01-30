REM Rug diagram with two sentence letters, diagonal enumeration

REM Programming elements included here were developed in background research
REM for Patrick Grim, Gary Mar and Paul St. Denis, THE PHILOSOPHICAL COMPUTER:
REM EXPLORATORY ESSAYS IN PHILOSOPHICAL COMPUTER MODELING, Bradford Books/
REM MIT Press.  You are free to use and adapt this program for research
REM purposes only, subject to the provision that this message be retained in
REM its entirety as part of your program.

DIM t(480)
t(0) = 12
t(1) = 10
size = 4
n = 1
sh = 10
SCREEN 12: size = 7
5 y = p: x = 0: horizontal = 1
10 IF n < 479 THEN n = n + 1
t(n) = 15 - (t(x) AND t(y)): REM Formula for NAND
LINE (x * size + sh, y * size + sh)-(x * size + size + sh, y * size + size + sh), t(n), BF
IF n * size <= 640 THEN
LINE ((n - 1) * size + sh, 0)-((n - 1) * size + size + sh, size), t(n - 1), BF
LINE (0, (n - 1) * size + sh)-(size, (n - 1) * size + size + sh), t(n - 1), BF
END IF
IF (x * size) > 640 AND (y * size) > 480 THEN END
IF y = 0 THEN p = p + 1: GOTO 5
x = x + 1
y = y - 1
GOTO 10
     

