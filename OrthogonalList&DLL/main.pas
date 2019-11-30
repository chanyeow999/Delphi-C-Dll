unit main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, dll;

type
  TForm2 = class(TForm)
    btn1: TButton;
    mmo1: TMemo;
    btn2: TButton;
    btn3: TButton;
    btn4: TButton;
    btn5: TButton;
    lbl1: TLabel;
    edt1: TEdit;
    btn6: TButton;
    lbl2: TLabel;
    edt2: TEdit;
    edt3: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure btn3Click(Sender: TObject);
    procedure btn4Click(Sender: TObject);
    procedure btn5Click(Sender: TObject);
    procedure btn6Click(Sender: TObject);
  private
    FScene: TScene;

    function AddNode(const Key: string; const X, Y: Integer): PEntityNode;
    function GetNode(const key: string): PEntityNode;
  public
    procedure print(pNode: PEntityNode);
  end;

var
  Form2: TForm2;

procedure GPrint(pNode: PEntityNode);

implementation

{$R *.dfm}

procedure GPrint(pNode: PEntityNode);
begin
  Form2.print(pNode);
end;

function TForm2.AddNode(const Key: string; const X, Y: Integer): PEntityNode;
var
  addNode: PAddNode;
begin
  New(addNode);
  addNode.Key := PChar(Key);
  addNode.lenKey := ByteLength(Key);
  addNode.X := X;
  addNode.Y := Y;
  Result := FScene.Add(addNode);
  Dispose(addNode);
end;

procedure TForm2.btn1Click(Sender: TObject);
begin
  mmo1.Lines.Add('-ADD-');
  print(AddNode('a', 1, 5));
  print(AddNode('f', 6, 6));
  print(AddNode('c', 3, 1));
  print(AddNode('b', 2, 2));
  print(AddNode('e', 5, 3));
  print(AddNode('center', 3, 3));
end;

procedure TForm2.btn2Click(Sender: TObject);
var
  pNode: PEntityNode;
  key: string;
  x, y: Integer;
  sl: TStrings;
begin
  mmo1.Lines.Add('');
  mmo1.Lines.Add('-MOVE-');

  sl := TStringList.Create;
  try
    sl.DelimitedText := Trim(edt3.Text);
    sl.Delimiter := ',';
    key := sl[0];
    x := StrToIntDef(sl[1], 0);
    y := StrToIntDef(sl[2], 0);
  finally
    sl.Free;
  end;
  pNode := FScene.Move(PChar(key), ByteLength(key), x, y);
  if Assigned(pNode) then
    print(pNode);
end;

procedure TForm2.btn3Click(Sender: TObject);
begin
  mmo1.Lines.Add('');
  mmo1.Lines.Add('-PRINTX-');
  FScene.PrintAll(True);
end;

procedure TForm2.btn4Click(Sender: TObject);
begin
  mmo1.Lines.Add('');
  mmo1.Lines.Add('-PRINTY-');
  FScene.PrintAll(False);
end;

procedure TForm2.btn5Click(Sender: TObject);
var
  pNode: PEntityNode;
begin
  mmo1.Lines.Add('');
  mmo1.Lines.Add('-GetNode-');
  pNode := GetNode(Trim(edt1.Text));
  if Assigned(pNode) then
    print(pNode);
end;

procedure TForm2.btn6Click(Sender: TObject);
var
  key: string;
  boRet: Boolean;
begin
  mmo1.Lines.Add('');
  mmo1.Lines.Add('-DELETE-');
  key := Trim(edt2.Text);

  boRet := FScene.Leave(PChar(key), ByteLength(key));
  if boRet then
    mmo1.Lines.Add(Format('DELETE %s success', [key]))
  else
    mmo1.Lines.Add(Format('DELETE %s failed', [key]))
end;

procedure TForm2.FormCreate(Sender: TObject);
var
  rcd: TCallBackFuncRcd;
begin
  FScene := NewScene;

  if not FScene.Init then
  begin
    mmo1.Lines.Add('初始化失败。。。');
    Exit;
  end;

  rcd.print := @GPrint;
  FScene.registerCallBack(rcd);
end;

procedure TForm2.FormDestroy(Sender: TObject);
begin
  FScene.Free;
end;

function TForm2.GetNode(const key: string): PEntityNode;
begin
  Result := FScene.Get(PChar(key), ByteLength(key));
end;

procedure TForm2.print(pNode: PEntityNode);
var
  lvKey: string;
begin
  if not Assigned(pNode) then
  begin
    mmo1.Lines.Add('Print-->节点不存在');
    Exit;
  end;

  SetString(lvKey, PChar(pNode.Key), pNode.lenKey div 2);
  mmo1.Lines.Add(Format('%s - (%d, %d)', [lvKey, pNode.x, pNode.y]));
end;

end.
