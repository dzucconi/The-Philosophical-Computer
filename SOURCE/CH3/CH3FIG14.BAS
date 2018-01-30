REM Enumeration of single-letter propositional calculus showing formula length
REM and value.  Key press advanced series

REM Programming elements included here were developed in background research
REM for Patrick Grim, Gary Mar and Paul St. Denis, THE PHILOSOPHICAL COMPUTER:
REM EXPLORATORY ESSAYS IN PHILOSOPHICAL COMPUTER MODELING, Bradford Books/
REM MIT Press.  You are free to use and adapt this program for research
REM purposes only, subject to the provision that this message be retained in
REM its entirety as part of your program.

true = 1
DIM p(15000) AS INTEGER
DIM t(15000) AS INTEGER
p(0) = 1
t(0) = 2
size = 4
SCREEN 12
5 y = p: x = 0: horizontal = true
10 px = n - (mt * 640)
LOCATE 1, 1
PRINT "Press any key to advance series"
IF px = 640 THEN mt = mt + 1: GOSUB 300: CLS
n = n + 1
le = 3 + p(x) + p(y)
cl = 3 - (t(x) AND t(y))
IF n < 15000 THEN p(n) = le: t(n) = cl
LINE (px, 480)-(px, 480 - le), cl + 1
IF x = p THEN horizontal = false
IF y = 0 THEN p = p + 1: GOTO 5
IF horizontal = true THEN x = x + 1 ELSE y = y - 1
GOTO 10
300 IF INKEY$ = "" THEN GOTO 300
RETURN

