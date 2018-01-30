{============================================================================
  
  This draws a graph of all possible Tic-Tac-Toe games, and lets one navigate
  'deeper' into the diagram by clicking on one of the nine play areas.

  Programming elements included here were developed in background research for
  Patrick Grim, Gary Mar, and Paul St. Denis, THE PHILOSOPHICAL COMPUTER:
  EXPLORATORY ESSAYS IN PHILOSOPHICAL COMPUTER MODELING, Bradford Books/
  MIT Press.  You are free to use and adapt this program for research purposes
  only, subject to the provision that this message be retained in its entirety
  as part of your program.

  Tic.Pas v1.1.0, Fractal Tic-Tac-Toe Move Plotter (18 January 1995)
  by Robert Rothenburg Walking-Owl

  ===========================================================================}

program TicTacToe;

  uses CRT, Graph;

const
  PathBGI = '';               { path of EGAVGA.BGI file }

  InitLevel = 1;
  MaxDepth =  4;
  { MaxDepth = 4 seems to be most aesthetic for 640x480, scale = 1 }

  ShowGrid: Boolean = True;  { if True, shows grid }
  MarkWins: Boolean = True;  { if True, wins are marked }

  InitWidth = 480;

  Scale = 1.0; X_Shift = 0; Y_Shift = 1;

  BoardColor  = DarkGray;
  X_MarkColor = Blue;
  O_MarkColor = Red;
  ScoreColor  = Yellow;

var
  GraphMode,
  GraphDriver: Integer;

function InitializeScreen: Integer;
begin
  GraphMode := VGAHi;
  GraphDriver := EGA;
  InitGraph(GraphDriver,GraphMode,PathBGI);
  InitializeScreen := GraphResult;
end;

function InitMouse: Boolean; assembler;
asm
          mov   ax, 0           { Initialize the Mouse }
          int   33h
          or    ax, ax
          jz    @NoMouse
          mov   ax, 7           { Set mouse limits     }
          xor   cx, cx
          mov   dx, InitWidth
          int   33h
          mov   ax, 8
          xor   cx, cx
          mov   dx, InitWidth
          int   33h
          mov   ax, 1           { show mouse cursor }
          int   33h
@NoMouse:
end;

procedure DoneMouse; assembler;
asm
          mov   ax, 2           { hide mouse cursor }
          int   33h
end;

function GetMouseStatus(var X,Y): Word; assembler;
asm
          mov   ax, 3           { get mouse info }
          int   33h
          les   di, Y
          mov   es:[di], dx
          mov   es:[di+2], cx
          mov   ax, bx
end;

type
  TSquare = ( EmptySquare, X_Mark, O_Mark );
  TBoard  = Array [ 0..2, 0..2 ] of TSquare;
  TMoveL  = Array [ 0..2, 0..2 ] of Byte;

procedure CleanBoard(var Board: TBoard; var MoveL: TMoveL);
var
  Row,Col: Byte;
begin
  for Row := 0 to 2
    do for Col := 0 to 2
      do begin
        Board[Col,Row] := EmptySquare;
        MoveL[Col,Row] := 0;
      end;
end;

const
  MoveLevel: Byte = 0;

procedure GraphBoard(Level: Byte; Board: TBoard; MoveL: TMoveL;
                     Current: TSquare; X,Y: Integer; Width: Real);

  procedure X_MarkGraph(SqX,SqY,Width: Integer);
  begin
    if ((SqX+Width)>=0) and ((SqY+Width)>=0)  { only draw if in picture }
      then begin
        SetColor(X_MarkColor);
        Line(SqX,SqY,SqX+Width,SqY+Width);
        Line(SqX,SqY+Width,SqX+Width,SqY);
      end;
  end;

  procedure O_MarkGraph(SqX,SqY,Width: Integer);
  var
    Radius: Word;
  begin
    if ((SqX+Width)>=0) and ((SqY+Width)>=0)  { only draw if in picture }
      then begin
        Radius := Pred(Round(Width/2.0));
        SetColor(O_MarkColor);
        Circle(SqX+Radius,SqY+Radius,Radius);
      end;
  end;

  function SomebodyWon(var B: TBoard): Boolean;
  begin
    SomeBodyWon :=
     ((B[0,0]<>EmptySquare) and (B[0,0]=B[0,1]) and (B[0,1]=B[0,2])) or
     ((B[1,0]<>EmptySquare) and (B[1,0]=B[1,1]) and (B[1,1]=B[1,2])) or
     ((B[2,0]<>EmptySquare) and (B[2,0]=B[2,1]) and (B[2,1]=B[2,2])) or
     ((B[0,0]<>EmptySquare) and (B[0,0]=B[1,0]) and (B[1,0]=B[2,0])) or
     ((B[0,1]<>EmptySquare) and (B[0,1]=B[1,1]) and (B[1,1]=B[2,1])) or
     ((B[0,2]<>EmptySquare) and (B[0,2]=B[1,2]) and (B[1,2]=B[2,2])) or
     ((B[1,1]<>EmptySquare) and (B[0,0]=B[1,1]) and (B[0,0]=B[2,2])) or
     ((B[1,1]<>EmptySquare) and (B[0,2]=B[1,1]) and (B[0,2]=B[2,0]));
  end;

var
  SqWidth: Real;
  SqX,
  SqY:     Integer;
  MX,MY,
  Row,Col: Word;
  NextMov: TSquare;
  C:       Char;
  Winner:  Boolean;
begin
{ if Level=0 then InitMouse; }
  case Current of
    X_Mark: NextMov := O_Mark;
    O_Mark: NextMov := X_Mark;
  end;
  SqWidth := Width/3.0;
  Winner := SomebodyWon(Board);
  if Winner
      then begin
        if MarkWins
          then begin
       {$ifndef SameColorWin}
            case Current of
              X_Mark: SetColor(Cyan);
              O_Mark: SetCOlor(Yellow);
            end;
            for Col := X to Pred(X+Round(Width))
              do Line(Col,Y,Col,Pred(Y+Round(Width)));
           end;
        {   case Current of
             X_Mark: X_MarkGraph(X,Y,Round(Width));
             O_Mark: O_MarkGraph(X,Y,Round(Width));
           end;    }
       {$else}
           case Current of
             X_Mark: SetColor(X_MarkColor);
             O_Mark: SetColor(O_MarkColor);
           end;
            for Col := X to Pred(X+Round(Width))
              do Line(Col,Y,Col,Pred(Y+Round(Width)));
           end;
       {$endif}
      end;
  {  else} if (Level<=MaxDepth)
    then for Row := 0 to 2
   do begin
      SqX := X+Round(SqWidth*Row);
      SqY := Y+Round(SqWidth*Row);
      if (Row<>0) and ShowGrid
        then begin
          SetColor(BoardColor);
          Line(SqX,Y,SqX,Y+Round(Width));
          Line(X,SqY,X+Round(Width),SqY);
        end;
      for Col := 0 to 2
        do begin
            SqX := X+Round(SqWidth*Col);
            case Board[Col,Row] of
              X_Mark: X_MarkGraph(SqX,SqY,Round(SqWidth));
              O_Mark: O_MarkGraph(SqX,SqY,Round(SqWidth));
              else if not Winner
               then begin
                Board[Col,Row] := NextMov;
                GraphBoard(Succ(Level),Board,MoveL,
                           NextMov,SqX,SqY,SqWidth);
                Board[Col,Row] := EmptySquare; { reset mark ;}
               end;
            end;
            if KeyPressed {or (GetMouseStatus(MX,MY)<>0) } then Break;
          end;
      if KeyPressed {or (GetMouseStatus(MX,MY)<>0)} then Break;
    end;
  if Level=0
    then begin
       if InitMouse
          then begin
              if KeyPressed then ReadKey;
              repeat
                if GetMouseStatus(MX,MY)<>0 { button pressed }
                  then begin
                     if MX>(2*SqWidth) then MX := 2
                     else if MX>(SqWidth) then MX := 1
                     else MX := 0;
                     if MY>(2*SqWidth) then MY := 2
                     else if MY>(SqWidth) then MY := 1
                     else MY := 0;
                     if (MoveL[MX,MY]=0) and not Winner
                       then begin
                     DoneMouse;  ClearDevice;
                     Board[MX,MY]:=NextMov;
                     Inc(MoveLevel); MoveL[MX,MY] := MoveLevel;
                     for MY := 0 to 2 do for MX := 0 to 2
                       do begin
                          C := Chr(MoveL[MX,MY]+Ord('0'));
                          if C='0' then begin C:='?'; SetColor(White); end
                          else if ((MoveL[MX,MY] and 1)<>0)
                          then SetColor(X_MarkColor)
                          else SetColor(O_MarkColor);
                          OutTextXY(Round(Width)+100+(16*MX),1+(16*MY),C);
                        end;
                     GraphBoard(0,Board,MoveL,NextMov,X,Y,Width);
                      end;
                    end;
              until KeyPressed;
              DoneMouse;
            end;
      end;
end;

var
  Status: Integer;
  Board:  TBoard;
  MoveL:  TMoveL;
begin
  Status := InitializeScreen;
  if Status<>grOk
    then begin { Unable to initialize graphics screen }
        WriteLn(GraphErrorMsg(Status));
      end
    else begin
        CleanBoard(Board,MoveL);
        GraphBoard(0,Board,MoveL,
                   O_Mark,-X_Shift,-Y_Shift,InitWidth*Scale);
        ReadKey;
        RestoreCRTMode;
      end;
end.
