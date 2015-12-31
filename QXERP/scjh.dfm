object Form17: TForm17
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = #29983#20135#35745#21010#21333#26597#35810
  ClientHeight = 639
  ClientWidth = 1021
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label12: TLabel
    Left = 21
    Top = 22
    Width = 65
    Height = 18
    AutoSize = False
    Caption = #39033#30446#21517#31216
  end
  object ComboBox1: TComboBox
    Left = 92
    Top = 19
    Width = 565
    Height = 21
    DropDownCount = 16
    TabOrder = 0
    OnKeyDown = ComboBox1KeyDown
  end
  object Button6: TButton
    Left = 698
    Top = 17
    Width = 72
    Height = 25
    Caption = #26597#35810
    TabOrder = 1
    OnClick = Button6Click
  end
  object Button1: TButton
    Left = 808
    Top = 17
    Width = 75
    Height = 25
    Caption = #29983#25104#21457#36135#21333
    TabOrder = 2
    OnClick = Button1Click
  end
  object StringGrid1: TStringGrid
    Left = 0
    Top = 56
    Width = 1021
    Height = 193
    Align = alCustom
    ColCount = 10
    DefaultColWidth = 200
    FixedCols = 0
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goColSizing, goRowSelect]
    PopupMenu = PopupMenu1
    TabOrder = 3
    OnSelectCell = StringGrid1SelectCell
    ColWidths = (
      52
      85
      301
      72
      70
      73
      72
      73
      165
      200)
  end
  object StringGrid2: TStringGrid
    Left = 0
    Top = 255
    Width = 1021
    Height = 384
    Align = alBottom
    ColCount = 10
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing]
    PopupMenu = PopupMenu2
    TabOrder = 4
    ColWidths = (
      64
      88
      103
      95
      105
      103
      96
      81
      129
      96)
  end
  object Button2: TButton
    Left = 923
    Top = 17
    Width = 75
    Height = 25
    Caption = #25171#21360#35745#21010#21333
    TabOrder = 5
    OnClick = Button2Click
  end
  object ZStoredProc1: TZStoredProc
    Connection = Form1.ZConnection1
    Params = <>
    Left = 640
    Top = 344
  end
  object PopupMenu1: TPopupMenu
    Left = 680
    Top = 176
    object Execl1: TMenuItem
      Caption = #23548#20986#21040'Execl'
      OnClick = Execl1Click
    end
  end
  object PopupMenu2: TPopupMenu
    Left = 536
    Top = 384
    object MenuItem1: TMenuItem
      Caption = #23548#20986#21040'Execl'
      OnClick = MenuItem1Click
    end
  end
end
