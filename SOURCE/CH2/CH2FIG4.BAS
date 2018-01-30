REM Web diagrams with background reputation shadows, here for the Half-Sayer

REM Programming elements included here were developed in background research
REM for Patrick Grim, Gary Mar and Paul St. Denis, THE PHILOSOPHICAL COMPUTER:
REM EXPLORATORY ESSAYS IN PHILOSOPHICAL COMPUTER MODELING, Bradford Books/
REM MIT Press.  You are free to use and adapt this program for research
REM purposes only, subject to the provision that this message be retained in
REM its entirety as part of your program.

10  SCREEN 12: CLS
20 SCREENSIZEX = 240
30 SCREENSIZEY = 240
40 ITERATIONS = 100
41 x0 = .5: REM initial value
42 r = .96: REM background reliability
45 z = r
49 CLS
80 gridx = SCREENSIZEX - 10
90 gridy = SCREENSIZEY - 10
91 LINE (250, 0)-(640, 480), 15, BF
92 LINE (0, 250)-(640, 480), 15, BF
100 REM Draw Markers
110 LINE (5, 5)-(5, 5 + gridy), 2
120 LINE (5 + 5, gridy + 5 + 5)-(gridx + 5 + 5, gridy + 5 + 5), 2
130  FOR N = 0 TO 10
140    LINE (1 + 5, 5 + N * (gridy / 10))-(5 + 5, 5 + N * (gridy / 10)), 2
150    LINE (5 + N * (gridx / 10) + 5, 5 + gridy)-(5 + N * (gridx / 10) + 5, 5 + gridy + 5), 2
160  NEXT
170  REM Draws function and Y = X
180 FOR N = 0 TO 1 STEP .5 / gridx
181 X = N
200 y = (1 - ABS(.5 * X - X)): REM half-sayer formula
210    PSET (X * gridx + 5 + 5, 5 + gridy - (y * gridy)), 3
220    PSET (X * gridx + 5 + 5, 5 + gridy - (X * gridy)), 4
222 r = ((2 * z) + y) / 3
223 PSET (X * gridx + 5 + 5, gridy - (r * gridy) + 5), 5
224 py = y
230  NEXT
261 X = x0
270  FOR N = 1 TO ITERATIONS
281 IF X > 1 - X THEN min(X, 1 - X) = 1 - X ELSE min(X, 1 - X) = X
282 IF X > 1 - X THEN MAX(X, 1 - X) = X ELSE MAX(X, 1 - X) = 1 - X
290  y = 1 - ABS(.5 * X - X): REM half-sayer formula
300    FOR P = 1 TO 1000: NEXT P
310    POINT1X = X * gridx + 5 + 5: POINT1Y = 5 + gridy - PREVIOUSY * gridy
320    POINT2X = X * gridx + 5 + 5: POINT2Y = 5 + gridy - y * gridy
330    POINT3X = y * gridx + 5 + 5: POINT3Y = 5 + gridy - y * gridy
331 cl = 15
337 t = t + 1
340    LINE (POINT1X, POINT1Y)-(POINT2X, POINT2Y), cl
350    LINE (POINT2X, POINT2Y)-(POINT3X, POINT3Y), cl
360    PREVIOUSY = y
370    X = y
371 FOR L = 1 TO 5000: NEXT L
380  NEXT N
400   LOCATE 22, 45: IF INKEY$ = "" THEN GOTO 400

