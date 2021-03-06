REM Rug diagram using diagonal enumeration, here as in Chapter 3, Figure 4

REM Programming elements included here were developed in background research
REM for Patrick Grim, Gary Mar and Paul St. Denis, THE PHILOSOPHICAL COMPUTER:
REM EXPLORATORY ESSAYS IN PHILOSOPHICAL COMPUTER MODELING, Bradford Books/
REM MIT Press.  You are free to use and adapt this program for research
REM purposes only, subject to the provision that this message be retained in
REM its entirety as part of your program.
DIM t(480)

t(0) = 2: sh = 10
SCREEN 12: size = 5
5 y = p: x = 0: horizontal = 1
10 IF n < 479 THEN n = n + 1
t(n) = 3 - (t(x) AND t(y)): REM generates values for NAND.  Use 3 - (t(x) OR t(y)) for NOR
LINE (x * size + sh, y * size + sh)-(x * size + size + sh, y * size + size + sh), t(n) + 1, BF
IF n * size <= 640 THEN
LINE ((n - 1) * size + sh, 0)-((n - 1) * size + size + sh, size), t(n - 1) + 1, BF
LINE (0, (n - 1) * size + sh)-(size, (n - 1) * size + size + sh), t(n - 1) + 1, BF
END IF
IF (x * size) > 480 AND (y * size) > 640 THEN END
IF y = 0 THEN p = p + 1: GOTO 5
x = x + 1
y = y - 1
GOTO 10
     

