object Form89: TForm89
  Left = 0
  Top = 0
  Caption = #29983#20135#35745#21010#36827#24230#36319#36394'('#21452#20987#35760#24405#21487#26597#30475#25104#21697#21644#21322#25104#21697#26126#32454#24080')'
  ClientHeight = 690
  ClientWidth = 1108
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
    Width = 1108
    Height = 690
    Align = alClient
    ColCount = 10
    RowCount = 2
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing, goRowSelect]
    PopupMenu = PopupMenu1
    TabOrder = 0
    OnDblClick = StringGrid1DblClick
    OnDrawCell = StringGrid1DrawCell
    OnSelectCell = StringGrid1SelectCell
    ColWidths = (
      64
      89
      140
      105
      108
      145
      100
      106
      106
      90)
  end
  object ZStoredProc1: TZStoredProc
    Connection = Form1.ZConnection1
    Params = <>
    Left = 376
    Top = 304
  end
  object PopupMenu1: TPopupMenu
    Left = 312
    Top = 224
    object Execl1: TMenuItem
      Caption = #23548#20986#21040'Execl'
      OnClick = Execl1Click
    end
    object N1: TMenuItem
      Caption = #29983#25104#23454#38469#29983#20135#25968#37327#21333#65288#21547#25104#21697#24211#23384#65289
      OnClick = N1Click
    end
    object N2: TMenuItem
      Caption = #29983#25104#23454#38469#29983#20135#25968#37327#21333#65288#19981#21547#25104#21697#24211#23384#65289
      OnClick = N2Click
    end
  end
end
