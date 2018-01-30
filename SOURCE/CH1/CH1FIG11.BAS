REM Web diagram for the Chaotic Liar

REM Programming elements included here were developed in background research
REM for Patrick Grim, Gary Mar and Paul St. Denis, THE PHILOSOPHICAL COMPUTER:
REM EXPLORATORY ESSAYS IN PHILOSOPHICAL COMPUTER MODELING, Bradford Books/
REM MIT Press.  You are free to use and adapt this program for research
REM purposes only, subject to the provision that this message be retained in
REM its entirety as part of your program.

9  SCREEN 12: CLS
10 SCREENSIZEX = 250
20 SCREENSIZEY = 250
21 vsize = 220
22 hsize = 220
30 ITERATIONS = 150
35 DEF FNS# (X#) = 1 - X#: REM INSERT S(X)
40 DEF FNF# (X#) = (1 - ABS((FNS#(X#)) - X#)) + (((RND) - .5) * 1E-16)
50 GRIDX = SCREENSIZEX - 10
60 GRIDY = SCREENSIZEY - 10
80 REM 0 FIXED POINT, .5,1 -> 0, .1.,2,.3,.4,.7,.8,.9 PERIOD 2
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
180  Y# = FNF#(X#)
190    PSET (X# * GRIDX + 5 + 10, 10 + GRIDY - (Y# * GRIDY)), 3
200    PSET (X# * GRIDX + 5 + 10, 10 + GRIDY - (X# * GRIDY)), 4
210  NEXT
220    LOCATE 22, 15: X# = .314
226 FOR P = 1 TO 5000: NEXT P
230  FOR N = 1 TO ITERATIONS

237  REM  Note small 'grit' added to compensate for the fact of computer round-off
238  REM  errors.  Although the function is provably chaotic, such errors will otherwise
239  REM  drive its graph to 0.  Here we are obliged to discussion with John Milnor.

240  Y# = FNF#(X#) + .000001
245   FOR P = 1 TO 1000: NEXT P
250    POINT1X = X# * GRIDX + 5 + 10: POINT1Y = 10 + GRIDY - PREVIOUSY# * GRIDY
260    POINT2X = X# * GRIDX + 5 + 10: POINT2Y = 10 + GRIDY - Y# * GRIDY
270    POINT3X = Y# * GRIDX + 5 + 10: POINT3Y = 10 + GRIDY - Y# * GRIDY
280    LINE (POINT1X, POINT1Y)-(POINT2X, POINT2Y)
290    LINE (POINT2X, POINT2Y)-(POINT3X, POINT3Y)
300    PREVIOUSY# = Y#
310    X# = Y#
320  NEXT N

