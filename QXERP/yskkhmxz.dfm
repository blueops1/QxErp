object Form42: TForm42
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #24212#25910#27454#23458#25143#26126#32454#26597#35810
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
    Top = 0
    Width = 916
    Height = 583
    Align = alClient
    PopupMenu = PopupMenu1
    TabOrder = 0
    ExplicitWidth = 875
    ExplicitHeight = 544
    ColWidths = (
      64
      145
      135
      134
      395)
  end
  object PopupMenu1: TPopupMenu
    Left = 520
    Top = 296
    object Execl1: TMenuItem
      Caption = #23548#20986#21040'Execl'
      OnClick = Execl1Click
    end
  end
end
