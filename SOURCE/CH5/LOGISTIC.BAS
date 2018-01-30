1 REM The Logistic Equation
2 REM Programming elements included here were developed in background
3 REM research for Patrick Grim, Gary Mar and Paul St. Denis, THE
4 REM PHILOSOPHICAL COMPUTER: EXPLORATORY ESSAYS IN PHILOSOPHICAL
5 REM COMPUTER MODELING, Bradford Books/MIT Press.  You are free to use
6 REM and adapt this program for research purposes only, subject to the
7 REM provision that this message be retained in its entirety as part
8 REM of your program.
9  SCREEN 12: CLS
10 SCREENSIZEX = 250
20 SCREENSIZEY = 250
21 vsize = 220
22 hsize = 220
30 ITERATIONS = 150
50 GRIDX = SCREENSIZEX - 10
60 GRIDY = SCREENSIZEY - 10
81 LINE (0, vsize + 45)-(640, 480), 15, BF
82 LINE (hsize + 45, 0)-(640, 480), 15, BF
90 LINE (10, 10)-(10, 10 + GRIDY), 2
100 LINE (10, 10 + GRIDY + 5)-(10 + GRIDX + 5, 10 + GRIDY + 5), 2
110  FOR N = 0 TO 10
120    LINE (11, N * (GRIDY / 10) + 10)-(15, N * (GRIDY / 10) + 10), 2
130    LINE (N * (GRIDX / 10) + 5 + 10, GRIDY + 10)-(N * (GRIDX / 10) + 5 + 10, GRIDY + 5 + 10), 2
140  NEXT
150  REM Draws function and Y = X
160  FOR N = 0 TO 1 STEP .5 / GRIDX
170    X# = N
180  Y# = 1 - ((1 - X#) - X#) ^ 2
190    PSET (X# * GRIDX + 5 + 10, 10 + GRIDY - (Y# * GRIDY)), 3
200    PSET (X# * GRIDX + 5 + 10, 10 + GRIDY - (X# * GRIDY)), 4
210  NEXT
220    LOCATE 22, 15: X# = .312: REM INPUT X#: IF X# = 7 THEN X# = .314
230  FOR N = 1 TO ITERATIONS
240  Y# = 1 - ((1 - X#) - X#) ^ 2
245   FOR P = 1 TO 2000: NEXT P
250    POINT1X = X# * GRIDX + 5 + 10: POINT1Y = 10 + GRIDY - PREVIOUSY# * GRIDY
260    POINT2X = X# * GRIDX + 5 + 10: POINT2Y = 10 + GRIDY - Y# * GRIDY
270    POINT3X = Y# * GRIDX + 5 + 10: POINT3Y = 10 + GRIDY - Y# * GRIDY
280    LINE (POINT1X, POINT1Y)-(POINT2X, POINT2Y)
290    LINE (POINT2X, POINT2Y)-(POINT3X, POINT3Y)
300    PREVIOUSY# = Y#
310    X# = Y#
320  NEXT N

