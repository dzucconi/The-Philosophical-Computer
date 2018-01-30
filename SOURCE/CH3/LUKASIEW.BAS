REM Basic program for Lukasiewicz connective wire diagrams

REM Programming elements included here were developed in background research
REM for Patrick Grim, Gary Mar and Paul St. Denis, THE PHILOSOPHICAL COMPUTER:
REM EXPLORATORY ESSAYS IN PHILOSOPHICAL COMPUTER MODELING, Bradford Books/
REM MIT Press.  You are free to use and adapt this program for research
REM purposes only, subject to the provision that this message be retained in
REM its entirety as part of your program.

1 PALETTE
21 REM Possible formulae for substitution:
20 DEF FNMAX (P, Q) = ((P + Q) + ABS(P - Q)) / 2
30 DEF FNMIN (X, Y) = 1 - FNMAX(1 - X, 1 - Y)
40 DEF FNLOR (P, Q) = FNMIN(1, P + Q)
50 DEF FNLIF (P, Q) = FNMIN(1, 1 - P + Q)
60 DEF FNLAN (P, Q) = FNMAX(0, P + Q - 1)
70 SCREEN 12: CLS : RANDOMIZE TIMER
75 LINE (0, 100)-(640, 440), 0, BF
80 MGX = 190 + 50: MGY = 190 + 50: CTX = 300: CTY = 170: CL = 3
90 DIM SX(9): DIM SY(9): DIM SZ(9): CL = 2
100 DIM SSX(11, 11): DIM SSY(11, 11): DIM ASZ(11, 11)
110 DIM PX(9): DIM PY(9): DIM PZ(9)
120 DIM SPX(11, 11): DIM SPY(11, 11): DIM SPZ(11, 11)
130 X = .3: Y = .6: COY = COS(.125): SIY = SIN(.125)
140 FOR N = 1 TO 8
150 READ SX(N)
160 READ SY(N)
170 READ SZ(N)
180 SX(N) = SX(N) - .5: SY(N) = SY(N) - .5: SZ(N) = SZ(N) - .5
190 PX = SX(N): SX(N) = (SX(N) * COY - SY(N) * SIY)
200 SY(N) = (SY(N) * COY + PX * SIY)
210 NEXT
220 FOR CX = 0 TO 10
230 FOR CY = 0 TO 10
240 P = CX / 10
250 Q = CY / 10
260 GOSUB 1001: P = 1 - P: Q = 1 - Q: Y = 1 - Y
270 SSX(CX, CY) = P - .5
280 SSY(CX, CY) = Y - .5
290 SSZ(CX, CY) = Q - .5
300 PX = SSX(CX, CY): SSX(CX, CY) = (SSX(CX, CY) * COY - SSY(CX, CY) * SIY)
310 SSY(CX, CY) = (SSY(CX, CY) * COY + PX * SIY)
320 NEXT: NEXT
340 TZ = 1.35
350 COZ = COS(TZ): SIZ = SIN(TZ)
360 FOR N = 1 TO 8
370 PX(N) = (SX(N) * COZ - SZ(N) * SIZ) * MGX + CTX
380 PY(N) = (SY(N)) * MGY + CTY: NEXT
390 FOR CX = 0 TO 10
400 FOR CY = 0 TO 10
410 SPX(CX, CY) = (SSX(CX, CY) * COZ - SSZ(CX, CY) * SIZ) * MGX + CTX
420 SPY(CX, CY) = (SSY(CX, CY)) * MGY + CTY
430 NEXT: NEXT
440 REM LINE(45,30)-(540,310),0,BF
460 LINE (PX(1), PY(1))-(PX(2), PY(2)), 2
470 LINE (PX(2), PY(2))-(PX(6), PY(6)), 2
480 LINE (PX(6), PY(6))-(PX(5), PY(5)), 2
490 LINE (PX(5), PY(5))-(PX(1), PY(1)), 2
510 LINE (PX(2), PY(2))-(PX(4), PY(4)), 2
520 LINE (PX(6), PY(6))-(PX(8), PY(8)), 2
530 LINE (PX(5), PY(5))-(PX(7), PY(7)), 2
550 LINE (PX(4), PY(4))-(PX(8), PY(8)), 2
560 LINE (PX(8), PY(8))-(PX(7), PY(7)), 2
590 FOR M = 0 TO 10
600 FOR N = 0 TO 10
610 LBX = N - 1: LBY = N - 1: IF LBX < 0 THEN 630
620 LINE (SPX(N, M), SPY(N, M))-(SPX(LBX, M), SPY(LBY, M)), 13
630 LBX = N + 1: LBY = N + 1: IF LBX > 10 THEN 650
640 LINE (SPX(N, M), SPY(N, M))-(SPX(LBX, M), SPY(LBY, M)), 13
650 LBX = (M - 1): LBY = M - 1: IF LBX < 0 THEN 670
660 LINE (SPX(N, M), SPY(N, M))-(SPX(N, LBX), SPY(N, LBY)), 13
670 LBX = M + 1: LBY = M + 1: IF LBX > 10 THEN 690
680 LINE (SPX(N, M), SPY(N, M))-(SPX(N, LBX), SPY(N, LBY)), 13
690 NEXT: NEXT
691 LINE (PX(1), PY(1))-(PX(3), PY(3)), 14
692 LINE (PX(3), PY(3))-(PX(4), PY(4)), 14
693 LINE (PX(7), PY(7))-(PX(3), PY(3)), 14
695 GOTO 695
700 IF INKEY$ = "" THEN 700 ELSE RUN
710 DATA 1,1,1
720 DATA 1,1,0
730 DATA 1,0,1
740 DATA 1,0,0
750 DATA 0,1,1
760 DATA 0,1,0
770 DATA 0,0,1
780 DATA 0,0,0
1001 REM: Main formula:
1002 Y = FNLOR(P, Q)
1005 REM mccaluly IF X>Z THEN Y = 1 ELSE Y=Z
1007 LOCATE 23, 18: PRINT "(0,0)"
1008 LOCATE 23, 62: PRINT "(1,0)"
1009 LOCATE 21, 9: PRINT "(0,1)"
1010 LOCATE 1, 1: PRINT "L OR"
1110 RETURN

