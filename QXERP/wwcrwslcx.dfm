object Form96: TForm96
  Left = 0
  Top = 0
  Caption = #26410#21015#20837#29983#20135#35745#21010#20219#21153#25968#37327#26126#32454#26597#35810
  ClientHeight = 571
  ClientWidth = 755
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
    Width = 755
    Height = 571
    Align = alClient
    ColCount = 6
    RowCount = 2
    PopupMenu = PopupMenu1
    TabOrder = 0
    ExplicitWidth = 530
    ExplicitHeight = 517
    ColWidths = (
      64
      101
      163
      114
      100
      127)
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
