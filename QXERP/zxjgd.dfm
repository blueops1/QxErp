object Form50: TForm50
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #26032#22686#21322#25104#21697#21152#24037#21333
  ClientHeight = 542
  ClientWidth = 872
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
  object Bevel1: TBevel
    Left = 14
    Top = 127
    Width = 832
    Height = 346
    Shape = bsFrame
    Style = bsRaised
  end
  object Label2: TLabel
    Left = 330
    Top = 150
    Width = 48
    Height = 13
    Caption = #21152#24037#25968#37327
  end
  object Label3: TLabel
    Left = 505
    Top = 150
    Width = 48
    Height = 13
    Caption = #40664#35748#21333#20215
  end
  object Label1: TLabel
    Left = 39
    Top = 148
    Width = 48
    Height = 13
    Caption = #37197#20214#21517#31216
  end
  object Label4: TLabel
    Left = 649
    Top = 28
    Width = 48
    Height = 13
    Caption = #20986#21333#26085#26399
  end
  object Label5: TLabel
    Left = 63
    Top = 81
    Width = 24
    Height = 13
    Caption = #22791#27880
  end
  object Label6: TLabel
    Left = 27
    Top = 25
    Width = 60
    Height = 13
    Caption = #21152#24037#21333#32534#21495
  end
  object Label7: TLabel
    Left = 233
    Top = 25
    Width = 60
    Height = 13
    Caption = #21152#24037#21830#21517#31216
  end
  object Label8: TLabel
    Left = 374
    Top = 120
    Width = 112
    Height = 16
    Caption = #28155#21152#21152#24037#21333#26126#32454
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = False
  end
  object Label9: TLabel
    Left = 63
    Top = 183
    Width = 24
    Height = 13
    Caption = #22791#27880
  end
  object Label16: TLabel
    Left = 39
    Top = 493
    Width = 84
    Height = 13
    Caption = #32511#33394#26159#24517#22635#36873#39033
    Color = clBtnFace
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentColor = False
    ParentFont = False
  end
  object Label10: TLabel
    Left = 669
    Top = 150
    Width = 48
    Height = 13
    Caption = #35843#25972#21333#20215
  end
  object ComboBoxEx1: TComboBoxEx
    Left = 93
    Top = 145
    Width = 200
    Height = 22
    ItemsEx = <>
    Color = clMoneyGreen
    DragMode = dmAutomatic
    TabOrder = 0
    TabStop = False
    OnKeyDown = ComboBoxEx1KeyDown
    OnSelect = ComboBoxEx1Select
    DropDownCount = 16
  end
  object Edit2: TEdit
    Left = 400
    Top = 147
    Width = 81
    Height = 21
    Color = clMoneyGreen
    TabOrder = 1
    OnKeyPress = Edit2KeyPress
  end
  object Edit3: TEdit
    Left = 572
    Top = 147
    Width = 86
    Height = 21
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 2
  end
  object DateTimePicker1: TDateTimePicker
    Left = 708
    Top = 25
    Width = 135
    Height = 21
    Date = 42329.660776898150000000
    Time = 42329.660776898150000000
    Color = clMoneyGreen
    TabOrder = 3
  end
  object Button1: TButton
    Left = 731
    Top = 488
    Width = 97
    Height = 25
    Caption = #20445#23384#21152#24037#21333#20449#24687
    TabOrder = 4
    OnClick = Button1Click
  end
  object Memo1: TMemo
    Left = 93
    Top = 57
    Width = 750
    Height = 53
    TabOrder = 5
  end
  object StringGrid1: TStringGrid
    Left = 32
    Top = 207
    Width = 801
    Height = 241
    FixedCols = 0
    RowCount = 1
    FixedRows = 0
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing, goRowSelect]
    TabOrder = 6
    ColWidths = (
      68
      194
      96
      97
      309)
  end
  object Edit4: TEdit
    Left = 93
    Top = 22
    Width = 124
    Height = 21
    Color = clMoneyGreen
    TabOrder = 7
    TextHint = #22238#36710#33719#21462#32534#21495
    OnKeyDown = Edit4KeyDown
  end
  object ComboBox1: TComboBox
    Left = 299
    Top = 22
    Width = 319
    Height = 21
    Color = clMoneyGreen
    DropDownCount = 16
    TabOrder = 8
    OnKeyDown = ComboBox1KeyDown
  end
  object Button2: TButton
    Left = 731
    Top = 176
    Width = 88
    Height = 25
    Caption = #28155#21152#26126#32454
    TabOrder = 9
    OnClick = Button2Click
  end
  object Edit5: TEdit
    Left = 93
    Top = 180
    Width = 567
    Height = 21
    TabOrder = 10
  end
  object Edit1: TEdit
    Left = 730
    Top = 147
    Width = 88
    Height = 21
    Color = clMoneyGreen
    TabOrder = 11
    OnKeyPress = Edit1KeyPress
  end
  object ZStoredProc1: TZStoredProc
    Connection = Form1.ZConnection1
    Params = <>
    Left = 602
    Top = 231
  end
  object PopupMenu1: TPopupMenu
    Left = 480
    Top = 352
    object N1: TMenuItem
      Caption = #21024#38500#24403#21069#35760#24405
    end
  end
end
