REM Time series graph for the Minimalist, with background reliabilities

REM Programming elements included here were developed in background research
REM for Patrick Grim, Gary Mar and Paul St. Denis, THE PHILOSOPHICAL COMPUTER:
REM EXPLORATORY ESSAYS IN PHILOSOPHICAL COMPUTER MODELING, Bradford Books/
REM MIT Press.  You are free to use and adapt this program for research
REM purposes only, subject to the provision that this message be retained in
REM its entirety as part of your program.

10 CLS
20 R = .96: REM background reliability
25 P = .66: REM initial accuracy estimate for the Minimalist
26 Z = R
30 SCREEN 12: CLS
80 LINE (20, 20)-(20, 220), 2
90 FOR Y = 20 TO 220 STEP 20
100 LINE (20, Y)-(30, Y), 2
110 NEXT
120 LINE (30, 230)-(490, 230), 2
130 FOR x = 30 TO 490 STEP 20
140 LINE (x, 230)-(x, 220), 2
141 NEXT
142 LINE (0, 250)-(640, 480), 15, BF
143 LINE (510, 0)-(640, 480), 15, BF
160 FOR x = 30 TO 480 STEP 20
170 PY = 220 - (R * 200)
175 YW = 220 - (P * 200)
176 LET S = P
177 REM: Definition of Min:
178 IF P > 1 - P THEN min(P, 1 - P) = 1 - P ELSE min(P, 1 - P) = P
180 P = 1 - ABS(min(P, 1 - P) - P): REM Minimalist formula
190 R = ((2 * Z) + P) / 3: REM reliability update
200 Y = 220 - (R * 200): REM y for y assignment to current rep
201 YY = 220 - (P * 200)
210 LINE (x, PY)-(x + 20, Y), 15
215 LINE (x, YW)-(x + 20, YY), 5
220 FOR L = 1 TO 5000: NEXT L
230 NEXT

