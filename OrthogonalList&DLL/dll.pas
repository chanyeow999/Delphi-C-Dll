unit dll;

interface

type
  PEntityNode = ^TEntityNode;
  TEntityNode = packed record
    xPrev   : PEntityNode;
    xNext   : PEntityNode;
    yPrev   : PEntityNode;
    yNext   : PEntityNode;
    Key     : Pointer;
    lenKey  : Integer;
    X       : Integer;
    Y       : Integer;
  end;

  PAddNode = ^TAddNode;
  TAddNode = packed record
    Key     : Pointer;
    lenKey  : Integer;
    X       : Integer;
    Y       : Integer;
  end;

  TCallBackFuncRcd = record
    print: Pointer;
  end;

type
  TScene = class
  public
    function Init: Boolean; virtual; stdcall; abstract;
    procedure Free; virtual; stdcall; abstract;
    procedure registerCallBack(rcd: TCallBackFuncRcd);virtual; stdcall; abstract;
    function Add(const node: PAddNode): PEntityNode; virtual; stdcall; abstract;
    function Get(const key: Pointer; const lenKey: Integer): PEntityNode; virtual; stdcall; abstract;
    function Leave(const key: Pointer; const lenKey: Integer): Boolean; virtual; stdcall; abstract;
    function Move(const key: Pointer; const lenKey: Integer; const x, y: Integer): PEntityNode; virtual; stdcall; abstract;
    procedure PrintAll(const isPrintX: Boolean);virtual; stdcall; abstract;
    procedure PrintAOI(const node: PEntityNode; xArea, yArea: Integer); virtual; stdcall; abstract;
  end;

function NewScene(): TScene; stdcall;


implementation

function NewScene(): TScene; external 'Scene.dll';

end.
