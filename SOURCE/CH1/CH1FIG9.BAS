REM Basic program for web diagrams, here instantiated for the Modest Liar,
REM with notes on the Emphatic Liar

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

150  REM Draws function and Y = X:

160  FOR N = 0 TO 1 STEP .5 / GRIDX
170    X# = N
180  Y# = SQR(1 - X#)
190    PSET (X# * GRIDX + 5 + 10, 10 + GRIDY - (Y# * GRIDY)), 3
200    PSET (X# * GRIDX + 5 + 10, 10 + GRIDY - (X# * GRIDY)), 4
210  NEXT

211 REM  Next line sets initial value, as in variations in Fig. 6:

212  X# = .3
230  FOR N = 1 TO ITERATIONS

231 REM The following line sets the plotted function.  The Emphatic
232 REM Liar uses Y# = (1-X#)^2:

234  Y# = SQR(1 - X#)
245   FOR p = 1 TO 1000: NEXT p
250    POINT1X = X# * GRIDX + 5 + 10: POINT1Y = 10 + GRIDY - PREVIOUSY# * GRIDY
260    POINT2X = X# * GRIDX + 5 + 10: POINT2Y = 10 + GRIDY - Y# * GRIDY
270    POINT3X = Y# * GRIDX + 5 + 10: POINT3Y = 10 + GRIDY - Y# * GRIDY
280    LINE (POINT1X, POINT1Y)-(POINT2X, POINT2Y), 15
290    LINE (POINT2X, POINT2Y)-(POINT3X, POINT3Y), 15
300    PREVIOUSY# = Y#
310    X# = Y#
311 FOR p = 1 TO 5000: NEXT
320  NEXT N

