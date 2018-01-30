REM Basic program for computational spread

REM Programming elements included here were developed in background research
REM for Patrick Grim, Gary Mar and Paul St. Denis, THE PHILOSOPHICAL COMPUTER:
REM EXPLORATORY ESSAYS IN PHILOSOPHICAL COMPUTER MODELING, Bradford Books/
REM MIT Press.  You are free to use and adapt this program for research
REM purposes only, subject to the provision that this message be retained in
REM its entirety as part of your program.

0 I(1) = I(6)
10 DEF FNR (A, B) = ((2 * A) + B) / 3
20 DEF FNP (V, A) = (1 - ABS(V - A))
30 SCREEN 12: CLS
40 SCREENSIZEX = 350
50 SCREENSIZEY = 350
60 ST = 256: SP = 256
70 ITERATIONS = 20
80 XCORNER = 0
90 YCORNER = 0
100 SIDE = 1: DIM R1(40)
110 GAPX = SIDE / SCREENSIZEX
120 GAPY = SIDE / SCREENSIZEY
140 FOR PLOTPOINT = ST TO SCREENSIZEX * SCREENSIZEY STEP SP
150 x = INT(PLOTPOINT / SCREENSIZEY): y = PLOTPOINT - (SCREENSIZEY * x)
160 I(1) = x * GAPX + XCORNER: I(2) = y * GAPY + YCORNER: PI(1) = I(1): PI(2) = I(2)
165 MAX = 0: MIN = 1
170 FOR COUNT = 10 TO ITERATIONS
180 GOSUB 400: IF MAX < I(3) THEN MAX = I(3)
185 IF MIN > I(3) THEN MIN = I(3)
186 NEXT
187 g = (MAX - MIN)
190 IF g < .1 THEN PSET (x, y), 5: GOTO 390
191 IF g < .15 THEN PSET (x, y), 3: GOTO 390
192 IF g < .2 THEN PSET (x, y), 12: GOTO 390
193 IF g < .25 THEN PSET (x, y), 10: GOTO 390
198 IF g < .3 THEN PSET (x, y), 3: GOTO 390
199 IF g < .35 THEN PSET (x, y), 4: GOTO 390
200 IF g < .4 THEN PSET (x, y), 5: GOTO 390
194 IF g < .45 THEN PSET (x, y), 9: GOTO 390
195 IF g < .6 THEN PSET (x, y), 11: GOTO 390
196 IF g < .75 THEN PSET (x, y), 13: GOTO 390
197 GOTO 390
310 PSET (x, y), 2 + ((MAX - MIN) * 15)
390 NEXT PLOTPOINT: ST = ST / 2: SP = 2 * ST: GOTO 140
400 I(6) = FNP((1 - I(2)), I(1))
410 I(2) = FNP(.5 * I(1), I(2))
420 I(1) = I(6)
450 I(3) = ((2 * PI(1)) + (I(1))) / 3
460 I(4) = ((2 * PI(2)) + (I(2))) / 3
480 RETURN
1000 LOCATE 1, 1: FOR A = 1 TO 5: PRINT I(A); : NEXT: RETURN

