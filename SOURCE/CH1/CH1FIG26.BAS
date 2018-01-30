REM Two-dimensional version of Minerva

REM Programming elements included here were developed in background research
REM for Patrick Grim, Gary Mar and Paul St. Denis, THE PHILOSOPHICAL COMPUTER:
REM EXPLORATORY ESSAYS IN PHILOSOPHICAL COMPUTER MODELING, Bradford Books/
REM MIT Press.  You are free to use and adapt this program for research
REM purposes only, subject to the provision that this message be retained in
REM its entirety as part of your program.

1 BV = 1: BTV = 1
4 iterations = 10000
5 SCREEN 12
6 PALETTE
9 CLS
10 SCREEN 12
11 FOR Y = 336 TO 348: LINE (0, BV * Y)-(640, BV * Y), 0: NEXT
15 cl = 10
16 LINE (320, 0)-(640, 480), 15, BF
17 LINE (0, 320)-(640, 480), 15, BF
18 REM framing adjusted for purposes of exposition:
20 LINE (10, 20)-(10, BV * 300 + 10), 2
22 LINE (10, BV * 300 + 10)-(300, BV * 300 + 10), 2
25 X = .611: Y = .789: Z = .611
27 FOR q = 1 TO iterations
30  X = 1 - ABS(.5 * ABS(Y - Z) - X): REM INSERT #
40 Y = 1 - ABS(.5 * ABS(X - Z) - Y)
41 Z = 1 - ABS(.5 * ABS(X - Y) - Z)
50 PSET ((X * 300), 20 + BV * (300 - (Y * 300))), cl
51 cl = cl + .0009
52 IF cl = 15.0009 THEN cl = 3
55 NEXT q
56 IF INKEY$ = "g" THEN GOTO 27 ELSE GOTO 56
70 GOTO 70

