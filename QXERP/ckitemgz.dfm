object Form35: TForm35
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #24211#23384#29289#36164#20272#20540
  ClientHeight = 539
  ClientWidth = 967
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
    Width = 967
    Height = 539
    Align = alClient
    ColCount = 10
    RowCount = 2
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSelect]
    PopupMenu = PopupMenu1
    TabOrder = 0
    OnDblClick = StringGrid1DblClick
    OnSelectCell = StringGrid1SelectCell
    ColWidths = (
      55
      64
      144
      80
      137
      94
      105
      72
      71
      93)
  end
  object ZStoredProc1: TZStoredProc
    Connection = Form1.ZConnection1
    Params = <>
    Left = 520
    Top = 328
  end
  object PopupMenu1: TPopupMenu
    Left = 344
    Top = 288
    object Execl1: TMenuItem
      Caption = #23548#20986#21040'Execl'
      OnClick = Execl1Click
    end
  end
end
