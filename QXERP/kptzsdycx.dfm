object Form78: TForm78
  Left = 0
  Top = 0
  Caption = #24320#31080#36890#30693#20070#25171#21360#26597#35810'('#21452#20987#35760#24405#34892','#36827#20837#25171#21360#30028#38754')'
  ClientHeight = 521
  ClientWidth = 1022
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
    Width = 1022
    Height = 521
    Align = alClient
    ColCount = 7
    FixedCols = 0
    RowCount = 2
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing, goRowSelect]
    TabOrder = 0
    OnDblClick = StringGrid1DblClick
    OnSelectCell = StringGrid1SelectCell
    ColWidths = (
      54
      83
      91
      381
      96
      89
      188)
  end
  object ZStoredProc1: TZStoredProc
    Connection = Form1.ZConnection1
    Params = <>
    Left = 536
    Top = 288
  end
end
