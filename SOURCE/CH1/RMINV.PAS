program RotatingMinerva;

   {Programming elements included here were developed in background research
  for Patrick Grim, Gary Mar, and Paul St. Denis, THE PHILOSOPHICAL COMPUTER:
  EXPLORATORY ESSAYS IN PHILOSOPHICAL COMPUTER MODELING, Bradford Books/MIT
  Press.  You are free to use and adapt this program for research purposes
  only, subject to the provision that this message be retained in its entirety
  as part of your program.}

  uses CRT, Graph;

{$I RScreen.Inc}

const
  mgx    = 270;
  mgy    = 250;
  ctx    = 300;
  cty    = 170;

  MessageColor = LightGray;
  GridColor    = LightBlue; { LightMagenta }
  PlotColor    = LightCyan; { White }

  PlotDelay    = 900;     { In MilliSeconds }

  Iterations         = 3000;  { orig. 750 }

  cx: Array [ 1..8 ] of Real = (1,1,1,1,0,0,0,0);
  cy: Array [ 1..8 ] of Real = (1,1,0,0,1,1,0,0);
  cz: Array [ 1..8 ] of Real = (1,0,1,0,1,0,1,0);

type
  tRealArray = Array [ 1..Iterations ] of Real;
  pRealArray = ^tRealArray;

var
  GraphMode,
  GraphDriver: Integer;

  sx, sy, sz,
  px, py, pz: pRealArray;

  min,
  x,y,z,
  coy,
  siy: Real;

procedure InitData;
var
  n: Word;
  t: Real;
begin
  x := 0.611;
  y := 0.789;
  z := 0.619;
  coy := Cos(0.425);
  siy := Sin(0.425);
  for n := 1 to 8
    do begin
        sx^[n] := cx[n] - 0.5;
        sy^[n] := cy[n] - 0.5;
        sz^[n] := cz[n] - 0.5;
        t := sx^[n];
        sx^[n] := (sx^[n]*coy)-(sy^[n]*siy);
        sy^[n] := (sy^[n]*coy)+(t*siy);
      end;
  for n := 9 to Iterations
    do begin
        sx^[n] := x - 0.5;
        sy^[n] := y - 0.5;
        sz^[n] := z - 0.5;
        t := sx^[n];
        sx^[n] := (sx^[n]*coy)-(sy^[n]*siy);
        sy^[n] := (sy^[n]*coy)+(t*siy);
        x := 1.0 - Abs(0.5*Abs(y-z)-x);
        if x>z then min := z else min := x;
        y := 1.0 - Abs(0.5*Abs(x-z)-y);
        z := 1.0 - Abs(0.5*Abs(x-y)-z);
      end;
end;

function InitScreen: Integer;
begin
  GraphMode := VGAHi;
  GraphDriver := EGA;
  InitGraph(GraphDriver,GraphMode,BGIPath);
  InitScreen := GraphResult;
end;

procedure RLine(x1,y1,x2,y2: Real); { This is a kludge }
begin
  Line( Trunc(x1),Trunc(y1),
        Trunc(x2),Trunc(y2));
end;

procedure DrawGrid(Color: Word);
begin
    SetColor(Color);
    RLine(px^[1],py^[1],px^[2],py^[2]);
    RLine(px^[2],py^[2],px^[6],py^[6]);
    RLine(px^[6],py^[6],px^[5],py^[5]);
    RLine(px^[5],py^[5],px^[1],py^[1]);
    RLine(px^[1],py^[1],px^[3],py^[3]);
    RLine(px^[2],py^[2],px^[4],py^[4]);
    RLine(px^[6],py^[6],px^[8],py^[8]);
    RLine(px^[5],py^[5],px^[7],py^[7]);
    RLine(px^[3],py^[3],px^[4],py^[4]);
    RLine(px^[4],py^[4],px^[8],py^[8]);
    RLine(px^[8],py^[8],px^[7],py^[7]);
    RLine(px^[7],py^[7],px^[3],py^[3]);
end;

procedure DrawData(Color: Word);
var
  n: Word;
begin
    for n := 9 to Pred(Iterations)
      do PutPixel( Trunc(px^[n]),
                   Trunc(py^[n]),
                   Color);
end;

procedure Plot;
const
  RotationIncrement = 0.19;  { orig. 0.19 }
  MaxRotation       = 6.28;  { orig. 6.28 }
var
  Color,
  n:  Word;
  coz,
  siz,
  tz: Real;
begin
  ClearDevice;
  SetColor(MessageColor);
  OutTextXY(200,440,'Press any key to exit.');
  tz := 0.0;
  Color := PlotColor;
  repeat
    coz := Cos(tz);
    siz := Sin(tz);
    for n := 1 to Iterations
      do begin
          px^[n] := (sx^[n]*coz-sz^[n]*siz)*mgx+ctx;
          py^[n] := yHi-((sy^[n])*mgy+cty);
        end;
  { Inc(Color);
    if Color=16 then Color := 1; }
    DrawData(Color);
    DrawGrid(GridColor);
    if KeyPressed
       then Break;
    Delay(PlotDelay);
    DrawData(Black);
    DrawGrid(Black);
    tz := tz + RotationIncrement;
  until tz > MaxRotation;
end;

procedure InitMemory;
begin
  GetMem(sx,SizeOf(tRealArray));
  GetMem(sy,SizeOf(tRealArray));
  GetMem(sz,SizeOf(tRealArray));
  GetMem(px,SizeOf(tRealArray));
  GetMem(py,SizeOf(tRealArray));
  GetMem(pz,SizeOf(tRealArray));
end;

procedure ClearMemory;
begin
  FreeMem(sx,SizeOf(tRealArray));
  FreeMem(sy,SizeOf(tRealArray));
  FreeMem(sz,SizeOf(tRealArray));
  FreeMem(px,SizeOf(tRealArray));
  FreeMem(py,SizeOf(tRealArray));
  FreeMem(pz,SizeOf(tRealArray));
end;

begin
  InitMemory;
  InitData;
  InitScreen;
  Plot;
  RestoreCRTMode;
  if KeyPressed
     then ReadKey;  { Cancels out the KeyPressed }
  ClearMemory;
end.
