object Form64: TForm64
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #20135#21697#27979#35797#20986#24211#35760#24405
  ClientHeight = 511
  ClientWidth = 685
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
    Left = 40
    Top = 27
    Width = 84
    Height = 13
    Caption = #27979#35797#20986#24211#21333#32534#21495
  end
  object Label2: TLabel
    Left = 272
    Top = 27
    Width = 60
    Height = 13
    Caption = #20986#24211#30003#35831#20154
  end
  object Label3: TLabel
    Left = 76
    Top = 61
    Width = 48
    Height = 13
    Caption = #20986#24211#29702#30001
  end
  object Label4: TLabel
    Left = 75
    Top = 131
    Width = 48
    Height = 13
    Caption = #20135#21697#21517#31216
  end
  object Label5: TLabel
    Left = 339
    Top = 131
    Width = 48
    Height = 13
    Caption = #20986#24211#25968#37327
  end
  object Label6: TLabel
    Left = 480
    Top = 27
    Width = 48
    Height = 13
    Caption = #20986#24211#26085#26399
  end
  object Label7: TLabel
    Left = 99
    Top = 168
    Width = 24
    Height = 13
    Caption = #22791#27880
  end
  object Label8: TLabel
    Left = 52
    Top = 463
    Width = 77
    Height = 13
    Alignment = taRightJustify
    AutoSize = False
    Caption = #24403#21069#24211#23384#25968#37327
  end
  object ComboBox1: TComboBox
    Left = 129
    Top = 128
    Width = 191
    Height = 21
    TabOrder = 4
    OnKeyDown = ComboBox1KeyDown
    OnSelect = ComboBox1Select
  end
  object ComboBox2: TComboBox
    Left = 352
    Top = 24
    Width = 113
    Height = 21
    TabOrder = 1
    OnKeyDown = ComboBox2KeyDown
  end
  object Edit1: TEdit
    Left = 130
    Top = 24
    Width = 121
    Height = 21
    TabOrder = 0
    OnKeyDown = Edit1KeyDown
  end
  object Memo1: TMemo
    Left = 130
    Top = 58
    Width = 503
    Height = 57
    TabOrder = 3
  end
  object Edit2: TEdit
    Left = 407
    Top = 128
    Width = 121
    Height = 21
    TabOrder = 5
    OnKeyPress = Edit2KeyPress
  end
  object StringGrid1: TStringGrid
    Left = 24
    Top = 201
    Width = 625
    Height = 241
    TabStop = False
    ColCount = 4
    FixedCols = 0
    RowCount = 2
    TabOrder = 8
    ColWidths = (
      70
      151
      114
      219)
  end
  object DateTimePicker1: TDateTimePicker
    Left = 544
    Top = 24
    Width = 89
    Height = 21
    Date = 42366.521600902780000000
    Time = 42366.521600902780000000
    TabOrder = 2
  end
  object Button1: TButton
    Left = 558
    Top = 166
    Width = 75
    Height = 25
    Caption = #28155#21152#26126#32454
    TabOrder = 7
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 558
    Top = 458
    Width = 75
    Height = 25
    Caption = #20445#23384#20449#24687
    TabOrder = 9
    OnClick = Button2Click
  end
  object Edit3: TEdit
    Left = 129
    Top = 165
    Width = 399
    Height = 21
    TabOrder = 6
  end
  object Edit4: TEdit
    Left = 147
    Top = 460
    Width = 97
    Height = 21
    TabStop = False
    ImeName = #20013#25991'('#31616#20307') - '#26497#28857#20116#31508
    ReadOnly = True
    TabOrder = 10
    OnKeyPress = Edit2KeyPress
  end
  object ZStoredProc1: TZStoredProc
    Connection = Form1.ZConnection1
    Params = <>
    Left = 504
    Top = 304
  end
end
