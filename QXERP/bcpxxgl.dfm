object Form11: TForm11
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = #21322#25104#21697#20449#24687#31649#29702
  ClientHeight = 485
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
    Height = 485
    ActivePage = TabSheet1
    Align = alClient
    TabOrder = 0
    ExplicitWidth = 715
    object TabSheet1: TTabSheet
      Caption = #26032#22686#21322#25104#21697#20449#24687
      OnShow = TabSheet1Show
      ExplicitWidth = 707
      object Label1: TLabel
        Left = 96
        Top = 53
        Width = 81
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = #21322#25104#21697#32534#21495
      end
      object Label2: TLabel
        Left = 88
        Top = 94
        Width = 89
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = #21322#25104#21697#35268#26684
      end
      object Label3: TLabel
        Left = 96
        Top = 136
        Width = 81
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = #21322#25104#21697#31181#31867
      end
      object Label4: TLabel
        Left = 88
        Top = 216
        Width = 90
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = #25152#23646#20135#21697#32534#21495'1'
      end
      object Label13: TLabel
        Left = 94
        Top = 337
        Width = 81
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = #22791#27880
      end
      object Label18: TLabel
        Left = 96
        Top = 256
        Width = 81
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = #25152#23646#20135#21697#32534#21495'3'
      end
      object Label6: TLabel
        Left = 96
        Top = 176
        Width = 81
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = #25152#23646#25104#21697#31181#31867
      end
      object Label7: TLabel
        Left = 192
        Top = 376
        Width = 288
        Height = 13
        Caption = #21322#25104#21697#21516#26102#23646#20110#22810#20010#25104#21697#26102#65292#38656#35774#32622#22810#20010#25152#23646#25104#21697#32534#21495
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
      object Label12: TLabel
        Left = 352
        Top = 217
        Width = 90
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = #25152#23646#20135#21697#32534#21495'2'
      end
      object Label19: TLabel
        Left = 360
        Top = 257
        Width = 81
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = #25152#23646#20135#21697#32534#21495'4'
      end
      object Label20: TLabel
        Left = 96
        Top = 296
        Width = 81
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = #25152#23646#20135#21697#32534#21495'5'
      end
      object Label21: TLabel
        Left = 360
        Top = 296
        Width = 81
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = #25152#23646#20135#21697#32534#21495'6'
      end
      object Button1: TButton
        Left = 248
        Top = 409
        Width = 75
        Height = 25
        Caption = #20445#23384
        TabOrder = 0
        OnClick = Button1Click
      end
      object Button2: TButton
        Left = 390
        Top = 409
        Width = 75
        Height = 25
        Caption = #21462#28040
        TabOrder = 1
      end
      object Edit1: TEdit
        Left = 192
        Top = 50
        Width = 145
        Height = 21
        ImeName = #20013#25991'('#31616#20307') - '#26497#28857#20116#31508
        TabOrder = 2
        TextHint = #22238#36710#33719#21462#26032#32534#21495
        OnKeyDown = Edit1KeyDown
      end
      object Edit2: TEdit
        Left = 192
        Top = 91
        Width = 145
        Height = 21
        ImeName = #20013#25991'('#31616#20307') - '#26497#28857#20116#31508
        TabOrder = 3
      end
      object Edit10: TEdit
        Left = 190
        Top = 335
        Width = 321
        Height = 21
        ImeName = #20013#25991'('#31616#20307') - '#26497#28857#20116#31508
        TabOrder = 5
      end
      object ComboBox2: TComboBox
        Left = 192
        Top = 132
        Width = 145
        Height = 21
        ImeName = #20013#25991'('#31616#20307') - '#26497#28857#20116#31508
        TabOrder = 4
        OnDropDown = ComboBox2DropDown
      end
      object ComboBox1: TComboBox
        Left = 192
        Top = 212
        Width = 145
        Height = 21
        TabOrder = 6
        OnKeyDown = ComboBox1KeyDown
      end
      object ComboBox3: TComboBox
        Left = 456
        Top = 212
        Width = 145
        Height = 21
        TabOrder = 7
        OnKeyDown = ComboBox3KeyDown
      end
      object ComboBox4: TComboBox
        Left = 192
        Top = 172
        Width = 145
        Height = 21
        ImeName = #20013#25991'('#31616#20307') - '#26497#28857#20116#31508
        TabOrder = 8
        OnDropDown = ComboBox4DropDown
      end
      object Memo1: TMemo
        Left = 359
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
        TabOrder = 9
      end
      object ComboBox5: TComboBox
        Left = 192
        Top = 253
        Width = 145
        Height = 21
        TabOrder = 10
        OnKeyDown = ComboBox5KeyDown
      end
      object ComboBox6: TComboBox
        Left = 456
        Top = 253
        Width = 145
        Height = 21
        TabOrder = 11
        OnKeyDown = ComboBox6KeyDown
      end
      object ComboBox7: TComboBox
        Left = 192
        Top = 293
        Width = 145
        Height = 21
        TabOrder = 12
        OnKeyDown = ComboBox7KeyDown
      end
      object ComboBox8: TComboBox
        Left = 456
        Top = 293
        Width = 145
        Height = 21
        TabOrder = 13
        OnKeyDown = ComboBox8KeyDown
      end
    end
    object TabSheet3: TTabSheet
      Caption = #21322#25104#21697#20449#24687#20462#25913
      ImageIndex = 3
      ExplicitWidth = 707
      object Label22: TLabel
        Left = 96
        Top = 53
        Width = 81
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = #21322#25104#21697#32534#21495
      end
      object Label23: TLabel
        Left = 88
        Top = 94
        Width = 89
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = #21322#25104#21697#35268#26684
      end
      object Label24: TLabel
        Left = 96
        Top = 136
        Width = 81
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = #21322#25104#21697#31181#31867
      end
      object Label25: TLabel
        Left = 96
        Top = 176
        Width = 81
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = #25152#23646#25104#21697#31181#31867
      end
      object Label26: TLabel
        Left = 88
        Top = 216
        Width = 90
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = #25152#23646#20135#21697#32534#21495'1'
      end
      object Label27: TLabel
        Left = 352
        Top = 217
        Width = 90
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = #25152#23646#20135#21697#32534#21495'2'
      end
      object Label28: TLabel
        Left = 96
        Top = 256
        Width = 81
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = #25152#23646#20135#21697#32534#21495'3'
      end
      object Label29: TLabel
        Left = 360
        Top = 257
        Width = 81
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = #25152#23646#20135#21697#32534#21495'4'
      end
      object Label30: TLabel
        Left = 360
        Top = 296
        Width = 81
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = #25152#23646#20135#21697#32534#21495'6'
      end
      object Label31: TLabel
        Left = 96
        Top = 296
        Width = 81
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = #25152#23646#20135#21697#32534#21495'5'
      end
      object Label32: TLabel
        Left = 94
        Top = 337
        Width = 81
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = #22791#27880
      end
      object Edit7: TEdit
        Left = 368
        Top = 23
        Width = 233
        Height = 21
        ImeName = #20013#25991'('#31616#20307') - '#26497#28857#20116#31508
        TabOrder = 0
        TextHint = #36755#20837#20851#38190#23383#22238#36710#33719#21462#21322#25104#21697#32534#21495
        OnKeyDown = Edit7KeyDown
      end
      object Edit9: TEdit
        Left = 192
        Top = 91
        Width = 145
        Height = 21
        ImeName = #20013#25991'('#31616#20307') - '#26497#28857#20116#31508
        TabOrder = 1
      end
      object ComboBox9: TComboBox
        Left = 192
        Top = 132
        Width = 145
        Height = 21
        ImeName = #20013#25991'('#31616#20307') - '#26497#28857#20116#31508
        TabOrder = 2
        OnDropDown = ComboBox9DropDown
      end
      object ComboBox10: TComboBox
        Left = 192
        Top = 172
        Width = 145
        Height = 21
        ImeName = #20013#25991'('#31616#20307') - '#26497#28857#20116#31508
        TabOrder = 3
        OnDropDown = ComboBox10DropDown
      end
      object ComboBox11: TComboBox
        Left = 192
        Top = 212
        Width = 145
        Height = 21
        TabOrder = 4
        OnKeyDown = ComboBox11KeyDown
      end
      object ComboBox12: TComboBox
        Left = 456
        Top = 212
        Width = 145
        Height = 21
        TabOrder = 5
        OnKeyDown = ComboBox12KeyDown
      end
      object ComboBox13: TComboBox
        Left = 192
        Top = 253
        Width = 145
        Height = 21
        TabOrder = 6
        OnKeyDown = ComboBox13KeyDown
      end
      object ComboBox14: TComboBox
        Left = 456
        Top = 253
        Width = 145
        Height = 21
        TabOrder = 7
        OnKeyDown = ComboBox14KeyDown
      end
      object ComboBox15: TComboBox
        Left = 456
        Top = 293
        Width = 145
        Height = 21
        TabOrder = 8
        OnKeyDown = ComboBox15KeyDown
      end
      object ComboBox16: TComboBox
        Left = 192
        Top = 293
        Width = 145
        Height = 21
        TabOrder = 9
        OnKeyDown = ComboBox16KeyDown
      end
      object Edit13: TEdit
        Left = 190
        Top = 335
        Width = 411
        Height = 21
        ImeName = #20013#25991'('#31616#20307') - '#26497#28857#20116#31508
        TabOrder = 10
      end
      object Button6: TButton
        Left = 248
        Top = 393
        Width = 75
        Height = 25
        Caption = #20445#23384#20462#25913
        TabOrder = 11
        OnClick = Button6Click
      end
      object Button9: TButton
        Left = 398
        Top = 393
        Width = 75
        Height = 25
        Caption = #21462#28040
        TabOrder = 12
        OnClick = Button9Click
      end
      object ListBox2: TListBox
        Left = 368
        Top = 50
        Width = 233
        Height = 143
        ItemHeight = 13
        TabOrder = 13
        OnClick = ListBox2Click
      end
      object Edit14: TEdit
        Left = 192
        Top = 50
        Width = 145
        Height = 21
        ReadOnly = True
        TabOrder = 14
      end
    end
    object TabSheet4: TTabSheet
      Caption = #26032#22686#21322#25104#21697#31181#31867
      ImageIndex = 3
      OnShow = TabSheet4Show
      ExplicitWidth = 707
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
      ExplicitWidth = 707
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
        Height = 457
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
    Top = 400
  end
end
