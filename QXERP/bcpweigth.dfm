object Form103: TForm103
  Left = 0
  Top = 0
  Caption = #21512#21516#21322#25104#21697#37325#35201#20851#32852
  ClientHeight = 601
  ClientWidth = 1081
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
    Visible = False
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
    Top = 464
    Width = 48
    Height = 13
    Caption = #20135#21697#32534#21495
  end
  object Label10: TLabel
    Left = 248
    Top = 464
    Width = 48
    Height = 13
    Caption = #39030#26495#37325#37327
  end
  object Label11: TLabel
    Left = 483
    Top = 464
    Width = 48
    Height = 13
    Caption = #34923#26495#37325#37327
  end
  object Label16: TLabel
    Left = 727
    Top = 530
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
  object Label5: TLabel
    Left = 58
    Top = 530
    Width = 24
    Height = 13
    Alignment = taRightJustify
    Caption = #22791#27880
  end
  object Label6: TLabel
    Left = 34
    Top = 499
    Width = 48
    Height = 13
    Caption = #20135#21697#21517#31216
  end
  object Label12: TLabel
    Left = 248
    Top = 499
    Width = 48
    Height = 13
    Caption = #24213#30406#37325#37327
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
    DropDownCount = 16
    TabOrder = 4
  end
  object Edit7: TEdit
    Left = 312
    Top = 461
    Width = 145
    Height = 21
    ImeName = #20013#25991'('#31616#20307') - '#26497#28857#20116#31508
    ReadOnly = True
    TabOrder = 6
  end
  object Edit8: TEdit
    Left = 553
    Top = 461
    Width = 137
    Height = 21
    ImeName = #20013#25991'('#31616#20307') - '#26497#28857#20116#31508
    ReadOnly = True
    TabOrder = 7
  end
  object Button1: TButton
    Left = 720
    Top = 459
    Width = 91
    Height = 25
    Caption = #35843#25972#20135#21697#26126#32454
    TabOrder = 8
    OnClick = Button1Click
  end
  object ComboBox3: TComboBox
    Left = 501
    Top = 19
    Width = 125
    Height = 21
    Color = clMoneyGreen
    DropDownCount = 16
    TabOrder = 9
  end
  object Memo1: TMemo
    Left = 96
    Top = 119
    Width = 730
    Height = 50
    TabOrder = 10
  end
  object Edit2: TEdit
    Left = 96
    Top = 88
    Width = 530
    Height = 21
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 11
  end
  object Edit3: TEdit
    Left = 312
    Top = 19
    Width = 113
    Height = 21
    TabOrder = 12
    Text = 'Edit3'
  end
  object Edit4: TEdit
    Left = 96
    Top = 461
    Width = 129
    Height = 21
    ImeName = #20013#25991'('#31616#20307') - '#26497#28857#20116#31508
    ReadOnly = True
    TabOrder = 13
  end
  object Memo2: TMemo
    Left = 96
    Top = 522
    Width = 594
    Height = 50
    Color = clMoneyGreen
    TabOrder = 14
  end
  object Edit5: TEdit
    Left = 96
    Top = 496
    Width = 129
    Height = 21
    ImeName = #20013#25991'('#31616#20307') - '#26497#28857#20116#31508
    ReadOnly = True
    TabOrder = 15
  end
  object StringGrid1: TStringGrid
    Left = 34
    Top = 81
    Width = 1015
    Height = 367
    ColCount = 8
    FixedCols = 0
    RowCount = 2
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing]
    PopupMenu = PopupMenu1
    TabOrder = 5
    OnSelectCell = StringGrid1SelectCell
    ColWidths = (
      64
      78
      128
      109
      107
      110
      122
      262)
  end
  object Edit10: TEdit
    Left = 318
    Top = 496
    Width = 137
    Height = 21
    ImeName = #20013#25991'('#31616#20307') - '#26497#28857#20116#31508
    ReadOnly = True
    TabOrder = 16
  end
  object Button2: TButton
    Left = 856
    Top = 459
    Width = 105
    Height = 25
    Caption = #23548#20837#26032#22686#20135#21697
    TabOrder = 17
    OnClick = Button2Click
  end
  object ZStoredProc1: TZStoredProc
    Connection = Form1.ZConnection1
    Params = <>
    Left = 720
    Top = 376
  end
  object PopupMenu1: TPopupMenu
    Left = 544
    Top = 392
    object N1: TMenuItem
      Caption = #21024#38500#24403#21069#35760#24405
    end
  end
end
