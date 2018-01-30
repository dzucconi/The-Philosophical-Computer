REM Basic escape-time diagram, used with variations throughout chapter.
REM Here as for Fig. 19

REM Programming elements included here were developed in background research
REM for Patrick Grim, Gary Mar and Paul St. Denis, THE PHILOSOPHICAL COMPUTER:
REM EXPLORATORY ESSAYS IN PHILOSOPHICAL COMPUTER MODELING, Bradford Books/
REM MIT Press.  You are free to use and adapt this program for research
REM purposes only, subject to the provision that this message be retained in
REM its entirety as part of your program.

5 SCREEN 12: CLS
DIM PLY(480)
10 SCREENSIZEX = 480
20 SCREENSIZEY = 480
30 ITERATIONS = 16

31 REM Defines the area covered:
40 XCORNER = 0
50 ycorner = 0
60 side = 1

61 REM  Basic formulae:

70 DEF FNFUM (M, N) = 1 - ABS(M - N)
80 DEF FNFUN (M, N) = 1 - ABS((1 - M) - N)
90 GAPX = side / SCREENSIZEX
100 GAPY = side / SCREENSIZEY
110 REM Main
120 FOR PLOTPOINT = 1 TO SCREENSIZEX * SCREENSIZEY
130 x = INT(PLOTPOINT / SCREENSIZEY): y = PLOTPOINT - (SCREENSIZEY * x)
140 M = x * GAPX + XCORNER: N = y * GAPY + ycorner
150 FOR COUNT = 1 TO ITERATIONS
160 TEMPM = M
170 M = FNFUM(M, N)
180 N = FNFUN(TEMPM, N)
190 IF SQR((M ^ 2) + (N ^ 2)) > 1 THEN GOTO 198
195 NEXT COUNT
198 PSET (x, y), COUNT
200 IF (COUNT <> PREVIOUSCOUNT) OR COUNT <> PLY(y) THEN PSET (x, y), 0
210 PREVIOUSCOUNT = COUNT: PLY(y) = COUNT
220 NEXT PLOTPOINT
230 GOTO 230

