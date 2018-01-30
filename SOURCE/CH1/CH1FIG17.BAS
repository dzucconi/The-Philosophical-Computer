REM The ovals attractor

REM Programming elements included here were developed in background research
REM for Patrick Grim, Gary Mar and Paul St. Denis, THE PHILOSOPHICAL COMPUTER:
REM EXPLORATORY ESSAYS IN PHILOSOPHICAL COMPUTER MODELING, Bradford Books/
REM MIT Press.  You are free to use and adapt this program for research
REM purposes only, subject to the provision that this message be retained in
REM its entirety as part of your program.

10 SCREEN 12
20 CLS
30 SCREEN 12
31 PALETTE
40 FOR Y = 336 TO 348: LINE (0, Y)-(640, Y), 0: NEXT
41 LINE (0, 220)-(640, 480), 15, BF
42 LINE (220, 0)-(640, 480), 15, BF
80 LINE (10, 10)-(10, 210), 2
90 LINE (10, 210)-(210, 210), 2

91 REM Initial values:

120 X = .8: Y = .3

122 REM Formulae for recomputations:

130  X = 1 - ABS((.5 * Y) - X)
140 Y = 1 - ABS((1 - X) - Y)
170 PSET ((X * 200) + 10, 200 - (Y * 200) + 10), 15
181 GOTO 130
190 REM NEXT D
200 REM NEXT Y1: NEXT X1
210 GOTO 210

