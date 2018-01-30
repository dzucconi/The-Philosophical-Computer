REM A variation on the program for a `time-series' graph, here instantiated for
REM the Chaotic Liar

REM Programming elements included here were developed in background research
REM for Patrick Grim, Gary Mar and Paul St. Denis, THE PHILOSOPHICAL COMPUTER:
REM EXPLORATORY ESSAYS IN PHILOSOPHICAL COMPUTER MODELING, Bradford Books/
REM MIT Press.  You are free to use and adapt this program for research
REM purposes only, subject to the provision that this message be retained in
REM its entirety as part of your program.

1 BTV = 1: BV = 1
20 PALETTE 1, 5: PALETTE 0, 1
30 REM LOCATE BTV*,15: PRINT "TIME SERIES DIAGRAM FOR THE SIMPLE LIAR"
40 REM LOCATE btv*2,1: PRINT "Xo=";:INPUT A: IF A = 7 THEN A = .314
50 SCREEN 12: REM CLS
60 PALETTE 1, 5: PALETTE 0, 1

64 REM a = sets initial value:

65 a = .314
100 LINE (20, BV * 20)-(20, BV * 220), 2
110 FOR Y = 20 TO 220 STEP 20
120 LINE (20, Y)-(30, Y), 2
130 NEXT
140 LINE (30, BV * 230)-(530, BV * 230), 2
150 FOR X = 30 TO 530 STEP 50
160 LINE (X, 230)-(X, 220), 2
161 LINE (0, 245)-(640, 480), 15, BF
162 LINE (550, 0)-(640, 480), 15, BF
172 NEXT
180 FOR X = 30 TO 480 STEP 50

181 REM  Here the a = formula sets the function graphed:

190 PY = 220 - (a * 200): a = 1 - ABS((1 - a) - a)
200 Y = 220 - (a * 200)
210 LINE (X, BV * PY)-(X + 50, BV * Y)
211 FOR P = 1 TO 15000: NEXT
230 NEXT


