object Form46: TForm46
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #20986#20837#24211#21333#21450#26126#32454#26597#35810
  ClientHeight = 583
  ClientWidth = 916
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
    Top = 49
    Width = 916
    Height = 534
    Align = alClient
    PopupMenu = PopupMenu1
    TabOrder = 0
    ColWidths = (
      64
      128
      141
      178
      219)
  end
  object Memo2: TMemo
    Left = 0
    Top = 0
    Width = 916
    Height = 49
    Align = alTop
    TabOrder = 1
  end
  object ZStoredProc1: TZStoredProc
    Connection = Form1.ZConnection1
    Params = <>
    Left = 424
    Top = 288
  end
  object PopupMenu1: TPopupMenu
    Left = 312
    Top = 224
    object Execl1: TMenuItem
      Caption = #23548#20986#21040'Execl'
      OnClick = Execl1Click
    end
  end
end
