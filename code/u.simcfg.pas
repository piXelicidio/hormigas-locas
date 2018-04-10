unit u.simcfg;
//defaults, globals, types (fight against hardcoding)...
interface

uses px.vec2d, u.frameTimer;

const
  CFG_MaxScanDirs = 8; //Max Index of scan directions of cell neibors..

type

  TCellTypes = (ctFood, ctCave, ctGrass, ctBlock, ctGround); //ctBlock and ctGround don't need class
  //add more ant interests between ctFood and ctCave;
  TAntInterests = ctFood..ctCave;

const
  //to help to scan the grid, steps to check middle and all 8 neibors of a cell in 0,0
  CFG_GridScan :array[0..CFG_MaxScanDirs] of
    TVec2di =  ( (x: 0; y: 0),
                 (x:-1; y:-1),
                 (x: 0; y:-1),
                 (x: 1; y:-1),
                 (x:-1; y: 0),
                 (x: 1; y: 0),
                 (x:-1; y: 1),
                 (x: 0; y: 1),
                 (x: 1; y: 1) ) ;

  CFG_passLevelGround = 0;
  CFG_passLevelBlock = 1;
  CFG_passLevelOut = high(integer);

  CFG_antPositionMemorySize = 15;

type

  PSimCfg = ^TSimCfg;
  TSimCfg = record
    windowW  :integer;
    windowH  :integer;
    numAnts  :integer;
    numDebugAnts :integer;
    antMaxSpeed :single;
    antErratic :single;
    antAccel :single;
    antRadialScanNum :integer;
    mapW  :integer;
    mapH  :integer;
    mapCellSize :integer;
  end;

var
  cfg           :TSimCfg;
  frameTimer    :TFrameTimer;

implementation

initialization

  with cfg do
  begin
    windowW := 1280;
    windowH := 720;
    numAnts := 300;
    numDebugAnts := 3;
    antMaxSpeed := 1.2;
    antErratic := 0.2;
    antAccel := 0.1;
    antRadialScanNum := 16;
    mapW := 18;
    mapH := 10;
    mapCellSize := 64;
  end;

  frameTimer := TFrameTimer.create;
finalization
  frameTimer.Free;
end.
