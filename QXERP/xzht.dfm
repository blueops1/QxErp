object Form28: TForm28
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #26032#22686#21512#21516
  ClientHeight = 557
  ClientWidth = 869
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
    Left = 34
    Top = 22
    Width = 48
    Height = 13
    Alignment = taRightJustify
    Caption = #21512#21516#32534#21495
  end
  object Label2: TLabel
    Left = 34
    Top = 54
    Width = 48
    Height = 13
    Alignment = taRightJustify
    Caption = #23458#25143#32534#21495
  end
  object Label3: TLabel
    Left = 10
    Top = 90
    Width = 72
    Height = 13
    Alignment = taRightJustify
    Caption = #20027#31649#21333#20301#32534#21495
  end
  object Label4: TLabel
    Left = 248
    Top = 22
    Width = 48
    Height = 13
    Alignment = taRightJustify
    Caption = #21512#21516#26085#26399
  end
  object Label13: TLabel
    Left = 439
    Top = 22
    Width = 48
    Height = 13
    Alignment = taRightJustify
    Caption = #38144#21806#32534#21495
  end
  object Label19: TLabel
    Left = 642
    Top = 22
    Width = 48
    Height = 13
    Alignment = taRightJustify
    Caption = #21512#21516#37329#39069
  end
  object Label20: TLabel
    Left = 654
    Top = 57
    Width = 36
    Height = 13
    Alignment = taRightJustify
    Caption = #32852#31995#20154
  end
  object Label21: TLabel
    Left = 642
    Top = 90
    Width = 48
    Height = 13
    Alignment = taRightJustify
    Caption = #32852#31995#30005#35805
  end
  object Label22: TLabel
    Left = 58
    Top = 123
    Width = 24
    Height = 13
    Alignment = taRightJustify
    Caption = #22791#27880
  end
  object Label9: TLabel
    Left = 34
    Top = 194
    Width = 48
    Height = 13
    Caption = #20135#21697#32534#21495
  end
  object Label10: TLabel
    Left = 276
    Top = 194
    Width = 48
    Height = 13
    Caption = #20135#21697#21333#20215
  end
  object Label11: TLabel
    Left = 499
    Top = 194
    Width = 48
    Height = 13
    Caption = #20135#21697#25968#37327
  end
  object Label16: TLabel
    Left = 39
    Top = 525
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
  object Edit1: TEdit
    Left = 96
    Top = 19
    Width = 129
    Height = 21
    Color = clMoneyGreen
    ImeName = #20013#25991'('#31616#20307') - '#26497#28857#20116#31508
    TabOrder = 0
    TextHint = #22238#36710#33719#21462#26032#21512#21516#32534#21495
    OnKeyDown = Edit1KeyDown
  end
  object Edit11: TEdit
    Left = 696
    Top = 19
    Width = 130
    Height = 21
    Color = clBtnFace
    ImeName = #20013#25991'('#31616#20307') - '#26497#28857#20116#31508
    ReadOnly = True
    TabOrder = 1
    Text = '0'
  end
  object Edit12: TEdit
    Left = 696
    Top = 54
    Width = 130
    Height = 21
    ImeName = #20013#25991'('#31616#20307') - '#26497#28857#20116#31508
    TabOrder = 2
  end
  object Edit13: TEdit
    Left = 696
    Top = 87
    Width = 130
    Height = 21
    ImeName = #20013#25991'('#31616#20307') - '#26497#28857#20116#31508
    TabOrder = 3
  end
  object ComboBox1: TComboBox
    Left = 96
    Top = 54
    Width = 530
    Height = 21
    Color = clMoneyGreen
    TabOrder = 4
    OnKeyDown = ComboBox1KeyDown
    OnSelect = ComboBox1Select
  end
  object DateTimePicker1: TDateTimePicker
    Left = 312
    Top = 19
    Width = 105
    Height = 21
    Date = 42333.772030914360000000
    Time = 42333.772030914360000000
    TabOrder = 5
  end
  object StringGrid1: TStringGrid
    Left = 34
    Top = 235
    Width = 792
    Height = 273
    ColCount = 4
    RowCount = 1
    FixedRows = 0
    TabOrder = 6
    OnMouseUp = StringGrid1MouseUp
    OnSelectCell = StringGrid1SelectCell
    ColWidths = (
      64
      167
      195
      212)
  end
  object Edit7: TEdit
    Left = 333
    Top = 191
    Width = 154
    Height = 21
    Color = clMoneyGreen
    ImeName = #20013#25991'('#31616#20307') - '#26497#28857#20116#31508
    TabOrder = 7
    OnKeyPress = Edit7KeyPress
  end
  object Edit8: TEdit
    Left = 564
    Top = 191
    Width = 134
    Height = 21
    Color = clMoneyGreen
    ImeName = #20013#25991'('#31616#20307') - '#26497#28857#20116#31508
    TabOrder = 8
    OnKeyPress = Edit8KeyPress
  end
  object Button1: TButton
    Left = 728
    Top = 189
    Width = 83
    Height = 25
    Caption = #28155#21152#20135#21697#26126#32454
    TabOrder = 9
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 728
    Top = 514
    Width = 83
    Height = 25
    Caption = #20445#23384#21512#21516#20449#24687
    TabOrder = 10
    OnClick = Button2Click
  end
  object ComboBox3: TComboBox
    Left = 501
    Top = 19
    Width = 125
    Height = 21
    Color = clMoneyGreen
    TabOrder = 11
    OnKeyDown = ComboBox3KeyDown
  end
  object Memo1: TMemo
    Left = 96
    Top = 119
    Width = 730
    Height = 40
    TabOrder = 12
  end
  object ComboBox4: TComboBox
    Left = 96
    Top = 191
    Width = 164
    Height = 21
    Color = clMoneyGreen
    TabOrder = 13
    OnKeyDown = ComboBox4KeyDown
  end
  object Edit2: TEdit
    Left = 96
    Top = 88
    Width = 530
    Height = 21
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 14
  end
  object ZStoredProc1: TZStoredProc
    Connection = Form1.ZConnection1
    Params = <>
    Left = 720
    Top = 376
  end
  object PopupMenu1: TPopupMenu
    Left = 592
    Top = 480
    object N1: TMenuItem
      Caption = #21024#38500#24403#21069#35760#24405
      OnClick = N1Click
    end
  end
end
