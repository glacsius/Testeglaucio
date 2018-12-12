object frmCalculadora: TfrmCalculadora
  Left = 0
  Top = 0
  Caption = 'frmCalculadora'
  ClientHeight = 299
  ClientWidth = 635
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Edit1: TEdit
    Left = 50
    Top = 105
    Width = 121
    Height = 21
    TabOrder = 0
    Text = '0'
  end
  object Edit2: TEdit
    Left = 50
    Top = 132
    Width = 121
    Height = 21
    TabOrder = 1
    Text = '0'
  end
  object Button1: TButton
    Left = 50
    Top = 169
    Width = 121
    Height = 25
    Caption = 'Somar'
    TabOrder = 2
    OnClick = Button1Click
  end
  object Memo1: TMemo
    Left = 376
    Top = 0
    Width = 259
    Height = 299
    Align = alRight
    Lines.Strings = (
      'Memo1')
    TabOrder = 3
    ExplicitLeft = 219
  end
  object Button2: TButton
    Left = 50
    Top = 209
    Width = 121
    Height = 25
    Caption = 'Somar com thread'
    TabOrder = 4
    OnClick = Button2Click
  end
end
