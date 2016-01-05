object Form73: TForm73
  Left = 0
  Top = 0
  Caption = #36864#36135#22788#29702
  ClientHeight = 573
  ClientWidth = 932
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 38
    Top = 22
    Width = 72
    Height = 13
    Caption = #36755#20837#23458#25143#21517#31216
  end
  object Label2: TLabel
    Left = 38
    Top = 509
    Width = 84
    Height = 13
    Caption = #24403#21069#20219#21153#21333#32534#21495
  end
  object Label3: TLabel
    Left = 50
    Top = 538
    Width = 72
    Height = 13
    Caption = #35745#21010#21457#36135#26102#38388
  end
  object Label4: TLabel
    Left = 276
    Top = 509
    Width = 24
    Height = 13
    Caption = #22791#27880
  end
  object Edit1: TEdit
    Left = 126
    Top = 19
    Width = 361
    Height = 21
    TabOrder = 0
    TextHint = #26368#22810#36755#20837#21313#20010#23383#65292#27169#31946#26597#35810
  end
  object StringGrid1: TStringGrid
    Left = 22
    Top = 54
    Width = 889
    Height = 145
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSelect]
    TabOrder = 1
    ColWidths = (
      64
      93
      92
      517
      77)
  end
  object StringGrid2: TStringGrid
    Left = 22
    Top = 209
    Width = 465
    Height = 281
    ColCount = 6
    FixedCols = 0
    RowCount = 2
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSelect]
    TabOrder = 2
    ColWidths = (
      45
      64
      141
      47
      61
      68)
  end
  object StringGrid3: TStringGrid
    Left = 534
    Top = 209
    Width = 377
    Height = 281
    FixedCols = 0
    RowCount = 2
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing]
    TabOrder = 3
    ColWidths = (
      36
      55
      132
      59
      57)
  end
  object Button1: TButton
    Left = 493
    Top = 297
    Width = 35
    Height = 33
    Caption = '+'
    TabOrder = 4
  end
  object Button2: TButton
    Left = 493
    Top = 369
    Width = 35
    Height = 33
    Caption = '--'
    TabOrder = 5
  end
  object Button3: TButton
    Left = 516
    Top = 17
    Width = 99
    Height = 25
    Caption = #26597#35810#21512#21516#20449#24687
    TabOrder = 6
  end
  object Button4: TButton
    Left = 805
    Top = 520
    Width = 97
    Height = 25
    Caption = #20445#23384#35745#21010#20449#24687
    TabOrder = 7
  end
  object DateTimePicker1: TDateTimePicker
    Left = 135
    Top = 536
    Width = 121
    Height = 21
    Date = 42337.435255682870000000
    Time = 42337.435255682870000000
    TabOrder = 8
  end
  object Edit2: TEdit
    Left = 135
    Top = 506
    Width = 121
    Height = 21
    ReadOnly = True
    TabOrder = 9
  end
  object Memo1: TMemo
    Left = 306
    Top = 506
    Width = 471
    Height = 49
    TabOrder = 10
  end
  object Button5: TButton
    Left = 640
    Top = 17
    Width = 128
    Height = 25
    Caption = #21462#28040#26032#22686#35745#21010#20219#21153#21333
    TabOrder = 11
  end
  object Button6: TButton
    Left = 792
    Top = 17
    Width = 119
    Height = 25
    Caption = #28155#21152#38468#23646#29983#20135#35745#21010
    TabOrder = 12
  end
  object ZStoredProc1: TZStoredProc
    Connection = Form1.ZConnection1
    Params = <>
    Left = 806
    Top = 297
  end
end
