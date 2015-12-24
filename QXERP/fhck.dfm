object Form62: TForm62
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #21457#36135#20986#24211#26597#35810
  ClientHeight = 499
  ClientWidth = 852
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
    Width = 852
    Height = 499
    Align = alClient
    ColCount = 6
    FixedCols = 0
    RowCount = 1
    FixedRows = 0
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSelect]
    TabOrder = 0
    OnDblClick = StringGrid1DblClick
    OnSelectCell = StringGrid1SelectCell
    ExplicitTop = 1
    ExplicitWidth = 841
    ExplicitHeight = 417
    ColWidths = (
      80
      94
      385
      100
      88
      67)
  end
  object ZStoredProc1: TZStoredProc
    Connection = Form1.ZConnection1
    Params = <>
    Left = 680
    Top = 336
  end
end
