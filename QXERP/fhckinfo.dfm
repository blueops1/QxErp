object Form63: TForm63
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #21457#36135#20986#24211#26126#32454
  ClientHeight = 672
  ClientWidth = 1089
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
  object Label3: TLabel
    Left = 45
    Top = 506
    Width = 60
    Height = 13
    Caption = #36135#36816#21333#32534#21495
    Color = clWindowText
    ParentColor = False
  end
  object Label7: TLabel
    Left = 310
    Top = 506
    Width = 36
    Height = 13
    Caption = #25215#36816#21830
  end
  object Label8: TLabel
    Left = 874
    Top = 506
    Width = 60
    Height = 13
    Caption = #25215#36816#21830#32534#21495
  end
  object Label9: TLabel
    Left = 21
    Top = 546
    Width = 84
    Height = 13
    Caption = #36710#29260#25110#24555#36882#21333#21495
  end
  object Label10: TLabel
    Left = 300
    Top = 546
    Width = 48
    Height = 13
    Caption = #36865#36798#22320#28857
  end
  object Label11: TLabel
    Left = 536
    Top = 586
    Width = 24
    Height = 13
    Caption = #36816#36153
  end
  object Label12: TLabel
    Left = 288
    Top = 586
    Width = 70
    Height = 13
    Caption = #36865#36798#36317#31163'(KM)'
  end
  object Label13: TLabel
    Left = 26
    Top = 586
    Width = 74
    Height = 13
    Caption = #36135#29289#24635#37325#37327'(T)'
  end
  object Label14: TLabel
    Left = 76
    Top = 626
    Width = 24
    Height = 13
    Caption = #22791#27880
  end
  object Label15: TLabel
    Left = 692
    Top = 586
    Width = 24
    Height = 13
    Caption = #22823#20889
  end
  object Label6: TLabel
    Left = 312
    Top = 152
    Width = 36
    Height = 13
    Caption = #38144#21806#21592
    Color = clWindowText
    ParentColor = False
  end
  object Label5: TLabel
    Left = 324
    Top = 114
    Width = 24
    Height = 13
    Caption = #22791#27880
    Color = clWindowText
    ParentColor = False
  end
  object Label2: TLabel
    Left = 57
    Top = 114
    Width = 48
    Height = 13
    Caption = #21512#21516#32534#21495
    Color = clWindowText
    ParentColor = False
  end
  object Label4: TLabel
    Left = 288
    Top = 76
    Width = 60
    Height = 13
    Caption = #25910#36135#20154#21517#31216
    Color = clWindowText
    ParentColor = False
  end
  object Label1: TLabel
    Left = 45
    Top = 77
    Width = 60
    Height = 13
    Caption = #21457#36135#21333#32534#21495
    Color = clWindowText
    ParentColor = False
  end
  object Bevel1: TBevel
    Left = 16
    Top = 52
    Width = 1031
    Height = 4
  end
  object Label16: TLabel
    Left = 57
    Top = 152
    Width = 48
    Height = 13
    Caption = #20986#21333#26085#26399
    Color = clWindowText
    ParentColor = False
  end
  object Label17: TLabel
    Left = 21
    Top = 21
    Width = 84
    Height = 13
    Caption = #35831#36873#25321#21457#36135#26085#26399
    Color = clWindowText
    ParentColor = False
  end
  object Label18: TLabel
    Left = 565
    Top = 152
    Width = 48
    Height = 13
    Caption = #26159#21542#21457#36135
    Color = clWindowText
    ParentColor = False
    Visible = False
  end
  object Label19: TLabel
    Left = 368
    Top = 21
    Width = 360
    Height = 13
    Caption = #27880#65306#30830#35748#20986#24211#21069#65292#35831#20180#32454#26680#23545#21457#36135#26126#32454#65292#20197#21450#36873#25321#20934#30830#30340#21457#36135#26085#26399#65281
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Edit2: TEdit
    Left = 120
    Top = 111
    Width = 137
    Height = 21
    ReadOnly = True
    TabOrder = 0
  end
  object Edit3: TEdit
    Left = 120
    Top = 503
    Width = 137
    Height = 21
    ReadOnly = True
    TabOrder = 1
  end
  object StringGrid1: TStringGrid
    Left = 45
    Top = 191
    Width = 996
    Height = 281
    ColCount = 7
    FixedCols = 0
    RowCount = 2
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRowSizing, goColSizing, goRowSelect]
    TabOrder = 2
    ColWidths = (
      135
      145
      134
      155
      129
      141
      128)
    RowHeights = (
      24
      24)
  end
  object Edit4: TEdit
    Left = 368
    Top = 73
    Width = 665
    Height = 21
    ReadOnly = True
    TabOrder = 3
  end
  object Edit5: TEdit
    Left = 368
    Top = 111
    Width = 665
    Height = 21
    TabOrder = 4
  end
  object Edit6: TEdit
    Left = 368
    Top = 149
    Width = 145
    Height = 21
    ReadOnly = True
    TabOrder = 5
  end
  object Edit7: TEdit
    Left = 952
    Top = 503
    Width = 89
    Height = 21
    ReadOnly = True
    TabOrder = 6
  end
  object Edit8: TEdit
    Left = 120
    Top = 543
    Width = 137
    Height = 21
    TabOrder = 7
  end
  object Edit9: TEdit
    Left = 368
    Top = 543
    Width = 673
    Height = 21
    ReadOnly = True
    TabOrder = 8
  end
  object Edit10: TEdit
    Left = 579
    Top = 583
    Width = 94
    Height = 21
    ReadOnly = True
    TabOrder = 9
    OnChange = Edit10Change
  end
  object Edit11: TEdit
    Left = 368
    Top = 583
    Width = 153
    Height = 21
    TabOrder = 10
  end
  object Edit12: TEdit
    Left = 120
    Top = 583
    Width = 137
    Height = 21
    ReadOnly = True
    TabOrder = 11
  end
  object Edit13: TEdit
    Left = 120
    Top = 623
    Width = 921
    Height = 21
    TabOrder = 12
  end
  object Button2: TButton
    Left = 946
    Top = 16
    Width = 95
    Height = 25
    Caption = #21457#36135#21333#20986#24211
    TabOrder = 13
    OnClick = Button2Click
  end
  object Edit14: TEdit
    Left = 728
    Top = 583
    Width = 313
    Height = 21
    ReadOnly = True
    TabOrder = 14
  end
  object Edit1: TEdit
    Left = 120
    Top = 73
    Width = 137
    Height = 21
    ReadOnly = True
    TabOrder = 15
  end
  object Edit15: TEdit
    Left = 120
    Top = 149
    Width = 137
    Height = 21
    ReadOnly = True
    TabOrder = 16
  end
  object Edit16: TEdit
    Left = 808
    Top = 149
    Width = 137
    Height = 21
    Color = clMoneyGreen
    TabOrder = 17
    Visible = False
  end
  object Edit17: TEdit
    Left = 628
    Top = 149
    Width = 137
    Height = 21
    ReadOnly = True
    TabOrder = 18
    Visible = False
  end
  object Edit18: TEdit
    Left = 368
    Top = 503
    Width = 490
    Height = 21
    ReadOnly = True
    TabOrder = 19
  end
  object DateTimePicker1: TDateTimePicker
    Left = 120
    Top = 18
    Width = 137
    Height = 21
    Date = 42362.819852372680000000
    Time = 42362.819852372680000000
    Color = clMoneyGreen
    TabOrder = 20
  end
  object ZStoredProc1: TZStoredProc
    Connection = Form1.ZConnection1
    Params = <>
    Left = 504
    Top = 335
  end
end
