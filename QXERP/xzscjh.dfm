object Form36: TForm36
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #26032#35745#21010#21333
  ClientHeight = 536
  ClientWidth = 934
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
  object Edit1: TEdit
    Left = 152
    Top = 24
    Width = 249
    Height = 21
    TabOrder = 0
    OnKeyDown = Edit1KeyDown
  end
  object StringGrid1: TStringGrid
    Left = 32
    Top = 64
    Width = 873
    Height = 145
    ColCount = 4
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSelect]
    TabOrder = 1
    OnSelectCell = StringGrid1SelectCell
    ColWidths = (
      64
      93
      92
      584)
  end
  object StringGrid2: TStringGrid
    Left = 16
    Top = 232
    Width = 465
    Height = 217
    ColCount = 6
    FixedCols = 0
    RowCount = 2
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSelect]
    TabOrder = 2
    OnSelectCell = StringGrid2SelectCell
    ColWidths = (
      45
      64
      141
      47
      61
      68)
  end
  object StringGrid3: TStringGrid
    Left = 528
    Top = 232
    Width = 377
    Height = 217
    FixedCols = 0
    RowCount = 2
    TabOrder = 3
    OnSelectCell = StringGrid3SelectCell
    ColWidths = (
      36
      55
      132
      59
      57)
  end
  object Button1: TButton
    Left = 487
    Top = 288
    Width = 35
    Height = 33
    Caption = '+'
    TabOrder = 4
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 487
    Top = 344
    Width = 35
    Height = 33
    Caption = '--'
    TabOrder = 5
    OnClick = Button2Click
  end
  object ZStoredProc1: TZStoredProc
    Connection = Form1.ZConnection1
    Params = <>
    Left = 520
    Top = 16
  end
end
