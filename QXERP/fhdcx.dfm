object Form20: TForm20
  Left = 0
  Top = 0
  Caption = #21457#36135#21333#26597#35810
  ClientHeight = 514
  ClientWidth = 903
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 32
    Top = 35
    Width = 84
    Height = 13
    Caption = #36755#20837#26597#35810#20851#38190#23383
  end
  object Edit1: TEdit
    Left = 136
    Top = 32
    Width = 265
    Height = 21
    TabOrder = 0
  end
  object RadioGroup1: TRadioGroup
    Left = 424
    Top = 21
    Width = 313
    Height = 37
    Caption = #26597#35810#36873#39033
    Columns = 3
    ItemIndex = 0
    Items.Strings = (
      #25353#21457#36135#21333#26597#35810
      #25353#38144#21806#21592#26597#35810
      #25353#23458#25143#21517#26597#35810)
    TabOrder = 1
  end
  object StringGrid1: TStringGrid
    Left = 32
    Top = 72
    Width = 841
    Height = 417
    ColCount = 6
    FixedCols = 0
    RowCount = 1
    FixedRows = 0
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSelect]
    TabOrder = 2
    ColWidths = (
      80
      94
      385
      100
      88
      67)
  end
  object Button1: TButton
    Left = 760
    Top = 29
    Width = 75
    Height = 25
    Caption = #26597#35810
    TabOrder = 3
    OnClick = Button1Click
  end
  object ZQuery1: TZQuery
    Connection = Form1.ZConnection1
    Params = <>
    Left = 640
    Top = 392
  end
  object ZStoredProc1: TZStoredProc
    Connection = Form1.ZConnection1
    Params = <>
    Left = 456
    Top = 248
  end
end
