object Form11: TForm11
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = #21322#25104#21697#20449#24687#31649#29702
  ClientHeight = 527
  ClientWidth = 708
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 708
    Height = 527
    ActivePage = TabSheet6
    Align = alClient
    TabOrder = 0
    object TabSheet6: TTabSheet
      Caption = #26032#22686#21322#25104#21697#20449#24687
      ImageIndex = 5
      object Label43: TLabel
        Left = 40
        Top = 53
        Width = 81
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = #21322#25104#21697#32534#21495
      end
      object Label44: TLabel
        Left = 32
        Top = 94
        Width = 89
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = #21322#25104#21697#35268#26684
      end
      object Label45: TLabel
        Left = 40
        Top = 136
        Width = 81
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = #21322#25104#21697#31181#31867
      end
      object Label46: TLabel
        Left = 40
        Top = 176
        Width = 81
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = #25152#23646#25104#21697#31181#31867
      end
      object Label47: TLabel
        Left = 32
        Top = 216
        Width = 90
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = #25152#23646#20135#21697#32534#21495
      end
      object Label48: TLabel
        Left = 94
        Top = 409
        Width = 81
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = #22791#27880
      end
      object Label49: TLabel
        Left = 31
        Top = 251
        Width = 90
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = #24050#20851#32852#20135#21697#32534#21495
      end
      object Edit19: TEdit
        Left = 136
        Top = 50
        Width = 209
        Height = 21
        ImeName = #20013#25991'('#31616#20307') - '#26497#28857#20116#31508
        TabOrder = 0
        TextHint = #22238#36710#33719#21462#26032#32534#21495
        OnKeyDown = Edit1KeyDown
      end
      object Edit20: TEdit
        Left = 136
        Top = 91
        Width = 209
        Height = 21
        ImeName = #20013#25991'('#31616#20307') - '#26497#28857#20116#31508
        TabOrder = 1
        OnChange = Edit20Change
      end
      object ComboBox24: TComboBox
        Left = 136
        Top = 133
        Width = 209
        Height = 21
        DropDownCount = 16
        ImeName = #20013#25991'('#31616#20307') - '#26497#28857#20116#31508
        TabOrder = 2
        OnDropDown = ComboBox24DropDown
        OnSelect = ComboBox24Select
      end
      object ComboBox25: TComboBox
        Left = 136
        Top = 173
        Width = 209
        Height = 21
        DropDownCount = 16
        ImeName = #20013#25991'('#31616#20307') - '#26497#28857#20116#31508
        TabOrder = 3
        OnDropDown = ComboBox25DropDown
        OnSelect = ComboBox25Select
      end
      object ComboBox26: TComboBox
        Left = 136
        Top = 212
        Width = 209
        Height = 21
        DropDownCount = 16
        TabOrder = 4
        OnKeyDown = ComboBox26KeyDown
        OnSelect = ComboBox26Select
      end
      object Memo3: TMemo
        Left = 360
        Top = 50
        Width = 320
        Height = 127
        Lines.Strings = (
          #21322#25104#21697#35268#26684#21629#21517#35268#21017#65306
          #39030'        '#26495#65306'        '#21333#21521#21644#21452#21521#65306#25215#36733#21147#25968#23383'+DX'#25110'SX+'#20301#31227#37327
          '                                        '#22266#23450#65306#25215#36733#21147#25968#23383'+GD'
          #20013#38388#38050#26495#65306#21333#21521#21644#21452#21521#36890#29992#65306#25215#36733#21147#25968#23383'+MN'#25110'KN'#65307
          '                            '#19981#33021#36890#29992#21017#65306#25215#36733#21147#25968#23383'+DX'#25110'SX'
          #24213'        '#30406'            '#21333#21521#21644#21452#21521#65306#25215#36733#21147#25968#23383'+MN'#25110'KN'#65307
          '                                        '#22266#23450#65306#25215#36733#21147#25968#23383'+GD'
          #20854#20182#37197#20214#21017#25353#19978#36848#35268#24459#21629#21517#12290)
        TabOrder = 5
      end
      object Edit21: TEdit
        Left = 190
        Top = 407
        Width = 409
        Height = 21
        ImeName = #20013#25991'('#31616#20307') - '#26497#28857#20116#31508
        TabOrder = 6
      end
      object Button13: TButton
        Left = 250
        Top = 449
        Width = 75
        Height = 25
        Caption = #20445#23384
        TabOrder = 7
        OnClick = Button1Click
      end
      object Button14: TButton
        Left = 392
        Top = 449
        Width = 75
        Height = 25
        Caption = #21462#28040
        TabOrder = 8
      end
      object Memo2: TMemo
        Left = 134
        Top = 248
        Width = 490
        Height = 129
        ReadOnly = True
        ScrollBars = ssVertical
        TabOrder = 9
      end
    end
    object TabSheet5: TTabSheet
      Caption = #21322#25104#21697#20449#24687#20462#25913
      ImageIndex = 4
      object Label37: TLabel
        Left = 50
        Top = 53
        Width = 81
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = #21322#25104#21697#32534#21495
      end
      object Label38: TLabel
        Left = 42
        Top = 94
        Width = 89
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = #21322#25104#21697#35268#26684
      end
      object Label39: TLabel
        Left = 50
        Top = 136
        Width = 81
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = #21322#25104#21697#31181#31867
      end
      object Label40: TLabel
        Left = 50
        Top = 176
        Width = 81
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = #25152#23646#25104#21697#31181#31867
      end
      object Label41: TLabel
        Left = 41
        Top = 215
        Width = 90
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = #25152#23646#20135#21697#32534#21495
      end
      object Label42: TLabel
        Left = 26
        Top = 257
        Width = 105
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = #21322#25104#21697#20449#24687#22791#27880
      end
      object Label1: TLabel
        Left = 18
        Top = 320
        Width = 672
        Height = 13
        Caption = #22914#26524#35201#20462#25913#21322#25104#21697#21517#31216#20197#22806#30340#20449#24687#65292#38656#35201#20808#21024#38500#20808#21322#25104#21697#19979#30340#24050#20851#32852#32534#21495#65292#22914#26524#24050#20851#32852#30340#32534#21495#19981#28165#31354#65292#21017#21482#25913#21322#25104#21697#21517#31216#21644#22791#27880
      end
      object Edit15: TEdit
        Left = 146
        Top = 50
        Width = 209
        Height = 21
        ReadOnly = True
        TabOrder = 0
      end
      object Edit16: TEdit
        Left = 146
        Top = 91
        Width = 209
        Height = 21
        ImeName = #20013#25991'('#31616#20307') - '#26497#28857#20116#31508
        TabOrder = 1
      end
      object ComboBox21: TComboBox
        Left = 146
        Top = 132
        Width = 209
        Height = 21
        DropDownCount = 16
        ImeName = #20013#25991'('#31616#20307') - '#26497#28857#20116#31508
        TabOrder = 2
        OnDropDown = ComboBox21DropDown
      end
      object ComboBox22: TComboBox
        Left = 146
        Top = 173
        Width = 209
        Height = 21
        DropDownCount = 16
        ImeName = #20013#25991'('#31616#20307') - '#26497#28857#20116#31508
        TabOrder = 3
        OnDropDown = ComboBox22DropDown
      end
      object ComboBox23: TComboBox
        Left = 146
        Top = 212
        Width = 209
        Height = 21
        DropDownCount = 16
        TabOrder = 4
      end
      object ListBox3: TListBox
        Left = 370
        Top = 50
        Width = 287
        Height = 183
        ItemHeight = 13
        TabOrder = 5
        OnClick = ListBox3Click
      end
      object Edit17: TEdit
        Left = 368
        Top = 23
        Width = 233
        Height = 21
        ImeName = #20013#25991'('#31616#20307') - '#26497#28857#20116#31508
        TabOrder = 6
        TextHint = #36755#20837#20851#38190#23383#22238#36710#33719#21462#21322#25104#21697#32534#21495
        OnKeyDown = Edit17KeyDown
      end
      object Edit18: TEdit
        Left = 146
        Top = 255
        Width = 511
        Height = 21
        ImeName = #20013#25991'('#31616#20307') - '#26497#28857#20116#31508
        TabOrder = 7
      end
      object Button11: TButton
        Left = 288
        Top = 369
        Width = 121
        Height = 25
        Caption = #21024#38500#20851#32852#20135#21697#32534#21495
        TabOrder = 8
        OnClick = Button11Click
      end
      object Button12: TButton
        Left = 446
        Top = 369
        Width = 75
        Height = 25
        Caption = #21462#28040
        TabOrder = 9
      end
      object Button15: TButton
        Left = 146
        Top = 369
        Width = 113
        Height = 25
        Caption = #26356#26032#21322#25104#21697#20449#24687
        TabOrder = 10
        OnClick = Button15Click
      end
    end
    object TabSheet4: TTabSheet
      Caption = #26032#22686#21322#25104#21697#31181#31867
      ImageIndex = 3
      OnShow = TabSheet4Show
      object Label10: TLabel
        Left = 136
        Top = 112
        Width = 89
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = #21322#25104#21697#31181#31867#32534#21495
      end
      object Label11: TLabel
        Left = 136
        Top = 165
        Width = 89
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = #21322#25104#21697#31181#31867#21517#31216
      end
      object Label15: TLabel
        Left = 144
        Top = 216
        Width = 81
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = #20135#21697#22791#27880
      end
      object Label16: TLabel
        Left = 240
        Top = 253
        Width = 57
        Height = 13
        Caption = '* '#20026#24517#22635#39033
        Color = clRed
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
      object Label17: TLabel
        Left = 422
        Top = 165
        Width = 6
        Height = 13
        Caption = '*'
        Color = clRed
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
      object Edit8: TEdit
        Left = 240
        Top = 109
        Width = 177
        Height = 21
        ImeName = #20013#25991'('#31616#20307') - '#26497#28857#20116#31508
        ReadOnly = True
        TabOrder = 0
      end
      object Edit11: TEdit
        Left = 239
        Top = 162
        Width = 177
        Height = 21
        ImeName = #20013#25991'('#31616#20307') - '#26497#28857#20116#31508
        TabOrder = 1
      end
      object Edit12: TEdit
        Left = 240
        Top = 213
        Width = 177
        Height = 21
        ImeName = #20013#25991'('#31616#20307') - '#26497#28857#20116#31508
        TabOrder = 2
      end
      object Button3: TButton
        Left = 240
        Top = 296
        Width = 75
        Height = 25
        Caption = #20445#23384
        TabOrder = 3
        OnClick = Button3Click
      end
      object Button4: TButton
        Left = 342
        Top = 296
        Width = 75
        Height = 25
        Caption = #21462#28040
        TabOrder = 4
      end
      object Button10: TButton
        Left = 472
        Top = 107
        Width = 105
        Height = 25
        Caption = #33719#21462#26032#22686#32534#21495
        TabOrder = 5
        OnClick = Button10Click
      end
    end
    object TabSheet2: TTabSheet
      Caption = #21322#25104#21697#31181#31867#20462#25913
      ImageIndex = 1
      OnShow = TabSheet2Show
      object Label5: TLabel
        Left = 288
        Top = 62
        Width = 48
        Height = 13
        Caption = #27169#31946#26597#35810
      end
      object Label8: TLabel
        Left = 256
        Top = 128
        Width = 89
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = #21322#25104#21697#31181#31867#32534#21495
      end
      object Label9: TLabel
        Left = 256
        Top = 181
        Width = 89
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = #21322#25104#21697#31181#31867#21517#31216
      end
      object Label14: TLabel
        Left = 264
        Top = 232
        Width = 81
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = #20135#21697#22791#27880
      end
      object ListBox1: TListBox
        Left = 0
        Top = 0
        Width = 177
        Height = 499
        Align = alLeft
        ImeName = #20013#25991'('#31616#20307') - '#26497#28857#20116#31508
        ItemHeight = 13
        TabOrder = 0
        OnClick = ListBox1Click
      end
      object Edit3: TEdit
        Left = 360
        Top = 59
        Width = 176
        Height = 21
        ImeName = #20013#25991'('#31616#20307') - '#26497#28857#20116#31508
        TabOrder = 1
      end
      object Button5: TButton
        Left = 560
        Top = 57
        Width = 75
        Height = 25
        Caption = #26597#35810
        TabOrder = 2
        OnClick = Button5Click
      end
      object Button7: TButton
        Left = 320
        Top = 376
        Width = 75
        Height = 25
        Caption = #20445#23384
        TabOrder = 3
        OnClick = Button7Click
      end
      object Button8: TButton
        Left = 528
        Top = 376
        Width = 75
        Height = 25
        Caption = #21462#28040
        TabOrder = 4
      end
      object Edit4: TEdit
        Left = 360
        Top = 125
        Width = 177
        Height = 21
        ImeName = #20013#25991'('#31616#20307') - '#26497#28857#20116#31508
        ReadOnly = True
        TabOrder = 5
      end
      object Edit5: TEdit
        Left = 359
        Top = 178
        Width = 177
        Height = 21
        ImeName = #20013#25991'('#31616#20307') - '#26497#28857#20116#31508
        ReadOnly = True
        TabOrder = 6
      end
      object Edit6: TEdit
        Left = 360
        Top = 229
        Width = 177
        Height = 21
        ImeName = #20013#25991'('#31616#20307') - '#26497#28857#20116#31508
        ReadOnly = True
        TabOrder = 7
      end
    end
  end
  object ZStoredProc1: TZStoredProc
    Connection = Form1.ZConnection1
    Params = <>
    Left = 576
    Top = 440
  end
end
