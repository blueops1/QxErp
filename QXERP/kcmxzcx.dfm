object Form45: TForm45
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #23384#24211#29289#36164#26126#32454#26597#35810
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
    ColCount = 6
    PopupMenu = PopupMenu1
    TabOrder = 0
    OnDblClick = StringGrid1DblClick
    OnSelectCell = StringGrid1SelectCell
    ExplicitLeft = 480
    ExplicitTop = 224
    ExplicitWidth = 320
    ExplicitHeight = 120
    ColWidths = (
      64
      131
      96
      93
      124
      286)
  end
  object ZStoredProc1: TZStoredProc
    Connection = Form1.ZConnection1
    Params = <>
    Left = 536
    Top = 304
  end
  object PopupMenu1: TPopupMenu
    Left = 408
    Top = 288
    object Execl1: TMenuItem
      Caption = #23548#20986#21040'Execl'
      OnClick = Execl1Click
    end
  end
end
