object Form95: TForm95
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #35745#21010#21333#32467#26463#22788#29702
  ClientHeight = 565
  ClientWidth = 531
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object StringGrid1: TStringGrid
    Left = 0
    Top = 0
    Width = 531
    Height = 481
    Align = alTop
    RowCount = 2
    TabOrder = 0
    ColWidths = (
      64
      103
      127
      103
      84)
  end
  object Button1: TButton
    Left = 192
    Top = 515
    Width = 139
    Height = 25
    Caption = #25209#37327#22788#29702#24050#32467#26463#20219#21153#21333
    TabOrder = 1
    OnClick = Button1Click
  end
  object ZStoredProc1: TZStoredProc
    Connection = Form1.ZConnection1
    Params = <>
    Left = 144
    Top = 104
  end
end
