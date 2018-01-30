REM Basic program for `time-series' graph

REM Programming elements included here were developed in background research
REM for Patrick Grim, Gary Mar and Paul St. Denis, THE PHILOSOPHICAL COMPUTER:
REM EXPLORATORY ESSAYS IN PHILOSOPHICAL COMPUTER MODELING, Bradford Books/
REM MIT Press.  You are free to use and adapt this program for research
REM purposes only, subject to the provision that this message be retained in
REM its entirety as part of your program.

SCREEN 12
iterations = 11

REM Changing firstValue will generate the Liar with different initial values,
REM as in Fig. 4 of Chapter One:

firstValue = 1
hsize = 400
vSize = 200
markSize = 10
hlocation = 20
vLocation = 20
LINE (0, vSize + 35)-(640, 480), 15, BF
LINE (hsize + 35, 0)-(640, 480), 15, BF
LINE (hlocation, vLocation)-(hlocation, vLocation + vSize), 2
LINE (hlocation + markSize, vLocation + vSize + markSize)-(hlocation + markSize + hsize, vLocation + vSize + markSize), 2
FOR n = 0 TO 10
LINE (hlocation, vLocation + (n / 10) * vSize)-(hlocation + markSize, vLocation + (n / 10) * vSize), 2
NEXT
FOR n = 0 TO iterations - 1
LINE (hlocation + markSize + (n / (iterations - 1)) * hsize, vLocation + vSize + markSize)-(hlocation + markSize + (n / (iterations - 1)) * hsize, vLocation + vSize), 2
NEXT
lastValue = firstValue
FOR n = 0 TO iterations - 2

REM  Changing thisValue will change the function graphed:

x = lastValue
thisValue = 1 - x

FOR p = 1 TO 5000: NEXT
LINE (hlocation + markSize + (n / (iterations - 1)) * hsize, vLocation + vSize - (lastValue * vSize))-(hlocation + markSize + ((n + 1) / (iterations - 1)) * hsize, vLocation + vSize - (thisValue * vSize))
lastValue = thisValue
NEXT
50 GOTO 50


