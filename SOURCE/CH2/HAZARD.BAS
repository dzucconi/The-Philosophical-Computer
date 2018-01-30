REM General form of epistemic hazard map

REM Programming elements included here were developed in background research
REM for Patrick Grim, Gary Mar and Paul St. Denis, THE PHILOSOPHICAL COMPUTER:
REM EXPLORATORY ESSAYS IN PHILOSOPHICAL COMPUTER MODELING, Bradford Books/
REM MIT Press.  You are free to use and adapt this program for research
REM purposes only, subject to the provision that this message be retained in
REM its entirety as part of your program.

10 DEF FNR (A, B) = ((2 * A) + B) / 3
20 DEF FNP (V, A) = (1 - ABS(V - A))
30 SCREEN 12: CLS
40 SCREENSIZEX = 400
50 screensizey = 400
60 ST = 256: SP = 256
65 iterations = 100
80 XCORNER = 0
90 YCORNER = 0
100 SIDE = 1: DIM R1(40)
110 GAPX = SIDE / SCREENSIZEX
120 GAPY = SIDE / screensizey
140 FOR PLOTPOINT = ST TO SCREENSIZEX * screensizey STEP SP
150 x = INT(PLOTPOINT / screensizey): y = PLOTPOINT - (screensizey * x)
160 I(1) = x * GAPX + XCORNER: I(2) = y * GAPY + YCORNER: PI(1) = I(1): PI(2) = I(2)
165 max = 0: min = 1
170 FOR count = 1 TO iterations
400 I(1) = FNP((1 - (I(2))), I(1))
410 I(2) = FNP(.5 * I(1), I(2))
180 IF max < I(1) THEN max = I(1)
185 IF min > I(1) THEN min = I(1)
186 NEXT
187 G = max - min
188 IF G > .9 THEN PSET (x, screensizey - y), 15: GOTO 390
192 IF G > .8 THEN PSET (x, screensizey - y), 14: GOTO 390
193 IF G > .7 THEN PSET (x, screensizey - y), 13: GOTO 390
194 IF G > .6 THEN PSET (x, screensizey - y), 12: GOTO 390
195 IF G > .5 THEN PSET (x, screensizey - y), 11: GOTO 390
196 IF G > .4 THEN PSET (x, screensizey - y), 10: GOTO 390
197 IF G > .3 THEN PSET (x, screensizey - y), 9: GOTO 390
198 IF G > .2 THEN PSET (x, screensizey - y), 8: GOTO 390
199 IF G > .1 THEN PSET (x, screensizey - y), 7: GOTO 390
200 IF G >= 0 THEN PSET (x, screensizey - y), 6: GOTO 390
201 GOTO 390
390 NEXT PLOTPOINT: ST = ST / 2: SP = 2 * ST: GOTO 140


