object Form2: TForm2
  Left = 0
  Top = 0
  Caption = 'Form2'
  ClientHeight = 609
  ClientWidth = 709
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object lbl1: TLabel
    Left = 25
    Top = 90
    Width = 22
    Height = 13
    Caption = 'Key:'
  end
  object lbl2: TLabel
    Left = 26
    Top = 234
    Width = 21
    Height = 13
    Caption = 'key:'
  end
  object btn1: TButton
    Left = 32
    Top = 8
    Width = 75
    Height = 25
    Caption = 'ADD'
    TabOrder = 0
    OnClick = btn1Click
  end
  object mmo1: TMemo
    Left = 180
    Top = 0
    Width = 529
    Height = 609
    Align = alRight
    ScrollBars = ssBoth
    TabOrder = 1
  end
  object btn2: TButton
    Left = 32
    Top = 128
    Width = 75
    Height = 25
    Caption = 'MOVE'
    TabOrder = 2
    OnClick = btn2Click
  end
  object btn3: TButton
    Left = 32
    Top = 274
    Width = 75
    Height = 25
    Caption = 'PrintX'
    TabOrder = 3
    OnClick = btn3Click
  end
  object btn4: TButton
    Left = 32
    Top = 321
    Width = 75
    Height = 25
    Caption = 'PrintY'
    TabOrder = 4
    OnClick = btn4Click
  end
  object btn5: TButton
    Left = 32
    Top = 56
    Width = 75
    Height = 25
    Caption = 'Get'
    TabOrder = 5
    OnClick = btn5Click
  end
  object edt1: TEdit
    Left = 53
    Top = 87
    Width = 121
    Height = 21
    TabOrder = 6
    Text = 'center'
  end
  object btn6: TButton
    Left = 32
    Top = 200
    Width = 75
    Height = 25
    Caption = 'DELETE'
    TabOrder = 7
    OnClick = btn6Click
  end
  object edt2: TEdit
    Left = 53
    Top = 231
    Width = 121
    Height = 21
    TabOrder = 8
    Text = 'a'
  end
  object edt3: TEdit
    Left = 56
    Top = 160
    Width = 121
    Height = 21
    TabOrder = 9
    Text = 'b,2,3'
  end
end
