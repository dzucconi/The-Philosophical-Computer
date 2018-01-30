{Core programming for value solids

Programming elements included here were developed in background research
for Patrick Grim, Gary Mar, and Paul St. Denis, THE PHILOSOPHICAL COMPUTER:
EXPLORATORY ESSAYS IN PHILOSOPHICAL COMPUTER MODELING, Bradford Books/
MIT Press.  You are free to use and adapt this program for research purposes
only, subject to the provision that this message be retained in its entirety
as part of your program}

program BoolFuncGraphThing;

  uses CRT,    { CRT (Keyboard) Unit }
       Space,
       Graph;  { Graphics Unit       }

const
  Number: Byte    = 4;
  Ratio: Real     = 1.00;

  BGIPath: String = '';             { directory where *.BGI file(s) are }

var
  GraphMode,
  GraphDriver:  Integer;

  DEGREE,
  Width, XWidth,
  Height, YHeight: Word;

  BoxWidth,BoxHeight,
  Aspect: Real;

function InitializeScreen: Integer;
begin
  GraphMode := VGAHi;                       { Set to 640x480 VGA mode }
  GraphDriver := EGA;                       { Set to EGA/VGA driver   }
  InitGraph(GraphDriver,GraphMode,BGIPath); { Set up graphics screen  }
  InitializeScreen := GraphResult;          { Return result           }
end;


var
  X,Y,Z: LongInt;
  X0,Y0,X1,Y1,Z1: Real;
begin
  if InitializeScreen = GrOk { did graphics-driver return "Ok"? }
    then begin
        XWidth := GetMaxX; YHeight := GetMaxY;  { get screen dimensions }
        InitializeWindow(0,0,XWidth,YHeight);
        TransformX := -0.3; TransformY := -0.5;
        RotateY := Radians(-15);
        RotateX := Radians(25);
        DEGREE := 1 ShL (Number-1);               { DEGREE = 2^Number }
        { the order of the loop is set so it moves from back to front, }
        { to keep from over-writing the images in front. one could fix }
        { it to not do this by checking the Z value for what is in front }
        { and thus allow a freer rotation of the image etc. etc. }
        for X := (DEGREE-1) downto 0
          do for Y := (DEGREE-1) downto 0
            do begin
                Z := X OR Y;                     { Or }
              { Z := X XOR Y; }                  { Exclusive-Or }
              { Z := X AND Y; }                  { And }
              { Z := NOT (X AND Y) MOD DEGREE; } { Stroke }
                X1 := (1.0/DEGREE)*X;
                Y1 := (1.0/DEGREE)*Z+(1.0/DEGREE);
                Z1 := (1.0/DEGREE)*Y;
                X0 := X1;
                repeat
                  Real3Line(X0,0,Z1,X0,Y1,Z1,Cyan);
                  Real3Line(X0,Y1,Z1,X0,Y1,Z1+(1.0/DEGREE),LightGreen);
                  X0 := X0 + UnitX;
                until X0>(X1+(1.0/DEGREE));
                Y0 := 0;
                repeat
                  Real3Line(X1-UnitX,Y0,Z1,X1-UnitX,Y0,Z1+(1.0/DEGREE),Blue);
                  Y0 := Y0 + UnitY;
                until Y0>Y1;
              end;
        ReadKey;        { wait for keypress }
        RestoreCRTMode; { restore text mode }
      end
    else begin { graphics-driver error }
      end;
end.
