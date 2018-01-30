REM Two-dimensional Thunderbird

REM Programming elements included here were developed in background research
REM for Patrick Grim, Gary Mar and Paul St. Denis, THE PHILOSOPHICAL COMPUTER:
REM EXPLORATORY ESSAYS IN PHILOSOPHICAL COMPUTER MODELING, Bradford Books/
REM MIT Press.  You are free to use and adapt this program for research
REM purposes only, subject to the provision that this message be retained in
REM its entirety as part of your program.

1 BV = 1: BTV = 1
5 SCREEN 12
6 PALETTE
9 CLS
10 SCREEN 12
11 FOR Y = 336 TO 348: LINE (0, BV * Y)-(640, BV * Y), 0: NEXT
15 CL = 10
16 LINE (320, 0)-(640, 480), 15, BF
17 LINE (0, 320)-(640, 480), 15, BF
20 LINE (10, 10)-(10, BV * 300 + 10), 2
22 LINE (10, BV * 300 + 10)-(310, BV * 300 + 10), 2
25 X = .611: Y = .789: Z = .619
27 FOR q = 1 TO 10000
30  X = 1 - ABS(.25 * ABS(Y - Z) - X): REM INSERT #
40 Y = 1 - ABS(.25 * ABS(X - Z) - Y)
41 Z = 1 - ABS(.25 * ABS(X - Y) - Z)
42 IF T MOD 2 = 0 THEN CL = 11 ELSE CL = 12
43 IF T > 1000 THEN T = 1
44 T = T + 1
50 PSET (10 + (X * 300), 10 + BV * (300 - (Y * 300))), CL
51 CL = CL + .005
55 NEXT q
70 GOTO 70

