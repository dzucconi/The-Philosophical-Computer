REM Web diagram applied to half-sayer

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

41 REM initial value:
42 x0 = .234
49 CLS
50 LINE (250, 0)-(640, 480), 15, BF
51 LINE (0, 250)-(640, 480), 15, BF
80 gridx = SCREENSIZEX - 10
90 gridy = SCREENSIZEY - 10
100 REM Draw Markers
110 LINE (5, 5)-(5, 5 + gridy), 2
120 LINE (5 + 5, 5 + gridy + 5)-(5 + gridx + 5, 5 + gridy + 5), 2
130  FOR N = 0 TO 10
140    LINE (6, 5 + N * (gridy / 10))-(10, 5 + N * (gridy / 10)), 2
150    LINE (N * (gridx / 10) + 10, gridy + 5)-(N * (gridx / 10) + 10, gridy + 10), 2
160  NEXT
170  REM Draws function and Y = X
180 FOR N = 0 TO 1 STEP .5 / gridx
181 x = N

182 REM: Half-sayer formula:
200 y = (1 - ABS(.5 * x - x))
210    PSET (x * gridx + 5 + 5, 5 + gridy - (y * gridy)), 3
220    PSET (5 + x * gridx + 5, 5 + gridy - (x * gridy)), 4
230  NEXT
268 x = x0
270  FOR N = 1 TO ITERATIONS

280 REM: Half-sayer formula:
290  y = (1 - ABS(.5 * x - x))
300    FOR P = 1 TO 1000: NEXT P
310    POINT1X = x * gridx + 5 + 5: POINT1Y = 5 + gridy - PREVIOUSY * gridy
320    POINT2X = x * gridx + 5 + 5: POINT2Y = 5 + gridy - y * gridy
330    POINT3X = y * gridx + 5 + 5: POINT3Y = 5 + gridy - y * gridy
331 cl = 15
337 t = t + 1
340    LINE (POINT1X, POINT1Y)-(POINT2X, POINT2Y), cl
350    LINE (POINT2X, POINT2Y)-(POINT3X, POINT3Y), cl
360    PREVIOUSY = y
370    x = y
375 FOR P = 1 TO 5000: NEXT
380  NEXT N
400   LOCATE 22, 45: IF INKEY$ = "" THEN GOTO 400

