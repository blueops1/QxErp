object Form97: TForm97
  Left = 0
  Top = 0
  Caption = #20219#21153#21333#20998#21333#26597#35810
  ClientHeight = 618
  ClientWidth = 986
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
    Width = 986
    Height = 618
    Align = alClient
    ColCount = 6
    FixedCols = 0
    RowCount = 2
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing, goRowSelect]
    PopupMenu = PopupMenu1
    TabOrder = 0
    ExplicitWidth = 755
    ExplicitHeight = 571
    ColWidths = (
      163
      107
      108
      107
      100
      105)
  end
  object ZStoredProc1: TZStoredProc
    Connection = Form1.ZConnection1
    Params = <>
    Left = 144
    Top = 104
  end
  object PopupMenu1: TPopupMenu
    Left = 320
    Top = 224
    object Execl1: TMenuItem
      Caption = #23548#20986#21040'Execl'
      OnClick = Execl1Click
    end
  end
end
