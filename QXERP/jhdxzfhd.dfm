object Form40: TForm40
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #35745#21010#21333#36716#20837#21457#36135#21333
  ClientHeight = 566
  ClientWidth = 990
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label3: TLabel
    Left = 45
    Top = 339
    Width = 60
    Height = 13
    Caption = #36135#36816#21333#32534#21495
    Color = clWindowText
    ParentColor = False
  end
  object Label7: TLabel
    Left = 310
    Top = 339
    Width = 36
    Height = 13
    Caption = #25215#36816#21830
  end
  object Label8: TLabel
    Left = 794
    Top = 339
    Width = 60
    Height = 13
    Caption = #25215#36816#21830#32534#21495
  end
  object Label9: TLabel
    Left = 21
    Top = 379
    Width = 84
    Height = 13
    Caption = #36710#29260#25110#24555#36882#21333#21495
  end
  object Label10: TLabel
    Left = 300
    Top = 379
    Width = 48
    Height = 13
    Caption = #36865#36798#22320#28857
  end
  object Label11: TLabel
    Left = 536
    Top = 419
    Width = 24
    Height = 13
    Caption = #36816#36153
  end
  object Label12: TLabel
    Left = 288
    Top = 419
    Width = 70
    Height = 13
    Caption = #36865#36798#36317#31163'(KM)'
  end
  object Label13: TLabel
    Left = 26
    Top = 419
    Width = 74
    Height = 13
    Caption = #36135#29289#24635#37325#37327'(T)'
  end
  object Label14: TLabel
    Left = 76
    Top = 459
    Width = 24
    Height = 13
    Caption = #22791#27880
  end
  object Label15: TLabel
    Left = 692
    Top = 419
    Width = 24
    Height = 13
    Caption = #22823#20889
  end
  object Label16: TLabel
    Left = 45
    Top = 497
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
  object Label6: TLabel
    Left = 794
    Top = 29
    Width = 48
    Height = 13
    Caption = #23458#25143#32534#21495
    Color = clWindowText
    ParentColor = False
  end
  object Label5: TLabel
    Left = 324
    Top = 70
    Width = 24
    Height = 13
    Caption = #22791#27880
    Color = clWindowText
    ParentColor = False
  end
  object Label2: TLabel
    Left = 57
    Top = 70
    Width = 48
    Height = 13
    Caption = #21512#21516#32534#21495
    Color = clWindowText
    ParentColor = False
  end
  object Label4: TLabel
    Left = 288
    Top = 29
    Width = 60
    Height = 13
    Caption = #25910#36135#20154#21517#31216
    Color = clWindowText
    ParentColor = False
  end
  object Label1: TLabel
    Left = 45
    Top = 33
    Width = 60
    Height = 13
    Caption = #21457#36135#21333#32534#21495
    Color = clWindowText
    ParentColor = False
  end
  object Edit2: TEdit
    Left = 120
    Top = 67
    Width = 137
    Height = 21
    Color = clMoneyGreen
    ReadOnly = True
    TabOrder = 0
  end
  object Edit3: TEdit
    Left = 120
    Top = 336
    Width = 137
    Height = 21
    Color = clMoneyGreen
    ReadOnly = True
    TabOrder = 1
  end
  object StringGrid2: TStringGrid
    Left = 45
    Top = 101
    Width = 906
    Height = 221
    ColCount = 6
    RowCount = 2
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goEditing]
    TabOrder = 2
    ColWidths = (
      64
      100
      111
      96
      116
      128)
    RowHeights = (
      24
      24)
  end
  object Edit4: TEdit
    Left = 368
    Top = 26
    Width = 401
    Height = 21
    Color = clMoneyGreen
    ReadOnly = True
    TabOrder = 3
  end
  object Edit5: TEdit
    Left = 368
    Top = 67
    Width = 583
    Height = 21
    TabOrder = 4
  end
  object Edit6: TEdit
    Left = 862
    Top = 26
    Width = 89
    Height = 21
    Color = clMoneyGreen
    ReadOnly = True
    TabOrder = 5
  end
  object ComboBox1: TComboBox
    Left = 368
    Top = 336
    Width = 393
    Height = 21
    Color = clMoneyGreen
    TabOrder = 6
    OnDropDown = ComboBox1DropDown
    OnSelect = ComboBox1Select
  end
  object Edit7: TEdit
    Left = 862
    Top = 336
    Width = 89
    Height = 21
    Color = clMoneyGreen
    ReadOnly = True
    TabOrder = 7
  end
  object Edit8: TEdit
    Left = 120
    Top = 376
    Width = 137
    Height = 21
    TabOrder = 8
  end
  object Edit9: TEdit
    Left = 368
    Top = 376
    Width = 583
    Height = 21
    Color = clMoneyGreen
    TabOrder = 9
  end
  object Edit10: TEdit
    Left = 579
    Top = 416
    Width = 94
    Height = 21
    Color = clMoneyGreen
    TabOrder = 10
    OnChange = Edit10Change
    OnKeyPress = Edit10KeyPress
  end
  object Edit11: TEdit
    Left = 368
    Top = 416
    Width = 153
    Height = 21
    TabOrder = 11
  end
  object Edit12: TEdit
    Left = 120
    Top = 416
    Width = 137
    Height = 21
    Color = clMoneyGreen
    TabOrder = 12
  end
  object Edit13: TEdit
    Left = 120
    Top = 456
    Width = 831
    Height = 21
    TabOrder = 13
  end
  object Button2: TButton
    Left = 844
    Top = 492
    Width = 107
    Height = 25
    Caption = #20445#23384#21457#36135#21333
    TabOrder = 14
    OnClick = Button2Click
  end
  object Edit14: TEdit
    Left = 722
    Top = 416
    Width = 229
    Height = 21
    ReadOnly = True
    TabOrder = 15
  end
  object Edit1: TEdit
    Left = 120
    Top = 26
    Width = 137
    Height = 21
    Color = clMoneyGreen
    TabOrder = 16
  end
  object ZQuery1: TZQuery
    Connection = Form1.ZConnection1
    Params = <>
    Left = 400
    Top = 226
  end
end
