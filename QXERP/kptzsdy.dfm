object Form79: TForm79
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #24320#31080#36890#30693#20070#25171#21360
  ClientHeight = 570
  ClientWidth = 808
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
  object Label2: TLabel
    Left = 224
    Top = 23
    Width = 48
    Height = 13
    Alignment = taRightJustify
    Caption = #21512#21516#32534#21495
  end
  object Label4: TLabel
    Left = 400
    Top = 23
    Width = 48
    Height = 13
    Alignment = taRightJustify
    Caption = #21512#21516#26085#26399
  end
  object Label13: TLabel
    Left = 599
    Top = 23
    Width = 48
    Height = 13
    Alignment = taRightJustify
    Caption = #38144#21806#22995#21517
  end
  object Label19: TLabel
    Left = 40
    Top = 93
    Width = 48
    Height = 13
    Alignment = taRightJustify
    Caption = #21512#21516#37329#39069
  end
  object Label3: TLabel
    Left = 40
    Top = 60
    Width = 48
    Height = 13
    Alignment = taRightJustify
    Caption = #23458#25143#20449#24687
  end
  object Label20: TLabel
    Left = 236
    Top = 93
    Width = 36
    Height = 13
    Alignment = taRightJustify
    Caption = #32852#31995#20154
  end
  object Label22: TLabel
    Left = 64
    Top = 128
    Width = 24
    Height = 13
    Alignment = taRightJustify
    Caption = #22791#27880
  end
  object Label21: TLabel
    Left = 400
    Top = 93
    Width = 48
    Height = 13
    Alignment = taRightJustify
    Caption = #32852#31995#30005#35805
  end
  object Label5: TLabel
    Left = 28
    Top = 453
    Width = 60
    Height = 13
    Alignment = taRightJustify
    Caption = #36890#30693#20070#22791#27880
  end
  object Label6: TLabel
    Left = 28
    Top = 23
    Width = 60
    Height = 13
    Caption = #36890#30693#20070#32534#21495
  end
  object Edit1: TEdit
    Left = 278
    Top = 20
    Width = 104
    Height = 21
    ImeName = #20013#25991'('#31616#20307') - '#26497#28857#20116#31508
    ReadOnly = True
    TabOrder = 0
    TextHint = #22238#36710#33719#21462#26032#21512#21516#32534#21495
  end
  object Edit9: TEdit
    Left = 469
    Top = 20
    Width = 113
    Height = 21
    ImeName = #20013#25991'('#31616#20307') - '#26497#28857#20116#31508
    ReadOnly = True
    TabOrder = 1
  end
  object Edit6: TEdit
    Left = 662
    Top = 20
    Width = 104
    Height = 21
    ImeName = #20013#25991'('#31616#20307') - '#26497#28857#20116#31508
    ReadOnly = True
    TabOrder = 2
  end
  object Edit11: TEdit
    Left = 102
    Top = 90
    Width = 104
    Height = 21
    ImeName = #20013#25991'('#31616#20307') - '#26497#28857#20116#31508
    ReadOnly = True
    TabOrder = 3
    Text = '0'
  end
  object Edit3: TEdit
    Left = 102
    Top = 57
    Width = 664
    Height = 21
    ReadOnly = True
    TabOrder = 4
  end
  object Edit12: TEdit
    Left = 278
    Top = 90
    Width = 104
    Height = 21
    ImeName = #20013#25991'('#31616#20307') - '#26497#28857#20116#31508
    ReadOnly = True
    TabOrder = 5
  end
  object Memo1: TMemo
    Left = 102
    Top = 123
    Width = 664
    Height = 47
    ReadOnly = True
    TabOrder = 6
  end
  object Edit13: TEdit
    Left = 469
    Top = 90
    Width = 113
    Height = 21
    ImeName = #20013#25991'('#31616#20307') - '#26497#28857#20116#31508
    ReadOnly = True
    TabOrder = 7
  end
  object StringGrid1: TStringGrid
    Left = 102
    Top = 183
    Width = 664
    Height = 254
    FixedCols = 0
    RowCount = 2
    TabOrder = 8
    OnDblClick = StringGrid1DblClick
    OnSelectCell = StringGrid1SelectCell
    ColWidths = (
      48
      76
      86
      97
      325)
  end
  object Edit2: TEdit
    Left = 102
    Top = 20
    Width = 104
    Height = 21
    TabStop = False
    ReadOnly = True
    TabOrder = 9
  end
  object Button3: TButton
    Left = 543
    Top = 518
    Width = 104
    Height = 25
    Caption = #25171#21360#24320#31080#36890#30693#20070
    TabOrder = 10
    OnClick = Button3Click
  end
  object Memo2: TMemo
    Left = 102
    Top = 450
    Width = 664
    Height = 49
    TabOrder = 11
  end
  object Button4: TButton
    Left = 679
    Top = 518
    Width = 87
    Height = 25
    Caption = #21462#28040
    TabOrder = 12
    OnClick = Button4Click
  end
  object Edit4: TEdit
    Left = 645
    Top = 90
    Width = 121
    Height = 21
    ReadOnly = True
    TabOrder = 13
    Text = '0'
  end
  object ZStoredProc1: TZStoredProc
    Connection = Form1.ZConnection1
    Params = <>
    Left = 30
    Top = 182
  end
end
