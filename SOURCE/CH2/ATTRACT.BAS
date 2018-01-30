REM Basic attractor program used throughout Chapter Two

REM Programming elements included here were developed in background research
REM for Patrick Grim, Gary Mar and Paul St. Denis, THE PHILOSOPHICAL COMPUTER:
REM EXPLORATORY ESSAYS IN PHILOSOPHICAL COMPUTER MODELING, Bradford Books/
REM MIT Press.  You are free to use and adapt this program for research
REM purposes only, subject to the provision that this message be retained in
REM its entirety as part of your program.

10 SCREEN 12
11 x = .9
12 y = .2
20 CLS
31 PALETTE
40 FOR s = 336 TO 348: LINE (0, s)-(640, s), 0: NEXT
80 LINE (50, 0)-(50, 300), 2
90 LINE (50, 300)-(350, 300), 2
130  x = 1 - ABS((1 - y) - x)
140 y = 1 - ABS(x - y)
150 z = (1.8 + x) / 3
151 w = (1.6 + y) / 3
170 PSET (50 + (x * 300), 300 - (y * 300)), 7
180 GOTO 130


