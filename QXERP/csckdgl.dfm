object Form66: TForm66
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #20135#21697#27979#35797#20986#24211#21333#26597#35810
  ClientHeight = 547
  ClientWidth = 936
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
  object RadioGroup1: TRadioGroup
    Left = 72
    Top = 8
    Width = 273
    Height = 49
    Caption = #26597#35810#36873#39033
    Columns = 4
    ItemIndex = 0
    Items.Strings = (
      #26410#36864#22238
      #24050#36864#22238
      #19981#36864#22238
      #20840#37096)
    TabOrder = 0
    OnClick = RadioGroup1Click
  end
  object StringGrid1: TStringGrid
    Left = 0
    Top = 73
    Width = 936
    Height = 474
    Align = alBottom
    ColCount = 8
    FixedCols = 0
    RowCount = 2
    TabOrder = 1
    OnDblClick = StringGrid1DblClick
    OnSelectCell = StringGrid1SelectCell
    ColWidths = (
      64
      87
      96
      108
      105
      115
      86
      225)
  end
  object ZStoredProc1: TZStoredProc
    Connection = Form1.ZConnection1
    Params = <>
    Left = 552
    Top = 296
  end
end
