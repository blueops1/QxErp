object Form34: TForm34
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #24211#23384#26448#26009#29289#36164#26597#35810
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
  object Label1: TLabel
    Left = 58
    Top = 17
    Width = 72
    Height = 13
    Caption = #36873#25321#29289#21697#31867#22411
  end
  object Label2: TLabel
    Left = 383
    Top = 17
    Width = 72
    Height = 13
    Caption = #36873#25321#29289#21697#21517#31216
  end
  object StringGrid1: TStringGrid
    Left = 0
    Top = 49
    Width = 916
    Height = 534
    Align = alBottom
    ColCount = 9
    RowCount = 2
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSelect]
    PopupMenu = PopupMenu1
    TabOrder = 0
    OnDblClick = StringGrid1DblClick
    OnDrawCell = StringGrid1DrawCell
    OnSelectCell = StringGrid1SelectCell
    ExplicitTop = 50
    ColWidths = (
      55
      64
      144
      80
      137
      94
      105
      72
      71)
  end
  object ComboBox1: TComboBox
    Left = 136
    Top = 14
    Width = 171
    Height = 21
    TabOrder = 1
    OnKeyDown = ComboBox1KeyDown
    OnSelect = ComboBox1Select
  end
  object ComboBox2: TComboBox
    Left = 469
    Top = 14
    Width = 177
    Height = 21
    TabOrder = 2
  end
  object Button1: TButton
    Left = 736
    Top = 12
    Width = 89
    Height = 25
    Caption = #26597#35810
    TabOrder = 3
    OnClick = Button1Click
  end
  object ZStoredProc1: TZStoredProc
    Connection = Form1.ZConnection1
    Params = <>
    Left = 520
    Top = 328
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
