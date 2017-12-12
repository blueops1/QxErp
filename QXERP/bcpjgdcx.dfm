object Form55: TForm55
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #21322#25104#21697#21152#24037#21333#26597#35810
  ClientHeight = 547
  ClientWidth = 998
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
    Left = 64
    Top = 29
    Width = 60
    Height = 13
    Caption = #21152#24037#21830#21517#31216
  end
  object ComboBox1: TComboBox
    Left = 144
    Top = 26
    Width = 393
    Height = 21
    DropDownCount = 16
    TabOrder = 0
    OnKeyDown = ComboBox1KeyDown
  end
  object Button1: TButton
    Left = 560
    Top = 24
    Width = 75
    Height = 25
    Caption = #26597#35810
    TabOrder = 1
    OnClick = Button1Click
  end
  object RadioGroup1: TRadioGroup
    Left = 649
    Top = 18
    Width = 216
    Height = 41
    Caption = #26597#35810#36873#39033
    Columns = 3
    ItemIndex = 0
    Items.Strings = (
      #26410#23436#25104
      #24050#23436#25104
      #20840#37096)
    TabOrder = 2
  end
  object StringGrid1: TStringGrid
    Left = 0
    Top = 65
    Width = 998
    Height = 482
    Align = alBottom
    ColCount = 10
    RowCount = 2
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing, goRowSelect]
    PopupMenu = PopupMenu1
    TabOrder = 3
    OnDblClick = StringGrid1DblClick
    OnSelectCell = StringGrid1SelectCell
    ColWidths = (
      49
      77
      74
      81
      79
      80
      180
      71
      66
      195)
  end
  object ZStoredProc1: TZStoredProc
    Connection = Form1.ZConnection1
    Params = <>
    Left = 424
    Top = 184
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
