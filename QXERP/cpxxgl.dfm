object Form8: TForm8
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = #20135#21697#20449#24687#31649#29702
  ClientHeight = 611
  ClientWidth = 871
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 871
    Height = 611
    ActivePage = TabSheet1
    Align = alClient
    TabOrder = 0
    ExplicitWidth = 1059
    object TabSheet1: TTabSheet
      Caption = #26032#22686#20135#21697#20449#24687
      ExplicitWidth = 1051
      object Label6: TLabel
        Left = 398
        Top = 125
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
      object Label7: TLabel
        Left = 261
        Top = 333
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
      object Label1: TLabel
        Left = 173
        Top = 80
        Width = 81
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = #20135#21697#32534#21495
      end
      object Label2: TLabel
        Left = 165
        Top = 117
        Width = 89
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = #20135#21697#35268#26684
      end
      object Label3: TLabel
        Left = 173
        Top = 152
        Width = 81
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = #35745#37327#21333#20301
      end
      object Label4: TLabel
        Left = 173
        Top = 187
        Width = 81
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = #20135#21697#31867#22411
      end
      object Label13: TLabel
        Left = 173
        Top = 291
        Width = 81
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = #20135#21697#22791#27880
      end
      object Label25: TLabel
        Left = 398
        Top = 157
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
      object Label26: TLabel
        Left = 398
        Top = 192
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
      object Label21: TLabel
        Left = 166
        Top = 221
        Width = 89
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = #20135#21697#27604#37325'1'
      end
      object Label22: TLabel
        Left = 165
        Top = 256
        Width = 89
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = #20135#21697#27604#37325'2'
      end
      object Label23: TLabel
        Left = 461
        Top = 222
        Width = 246
        Height = 13
        Caption = #27604#37325'1'#22635#20837#30406#24335#30340#37325#37327#25110#26495#24335#30340#27233#33014#37096#20998#30340#20307#31215
      end
      object Label24: TLabel
        Left = 461
        Top = 256
        Width = 198
        Height = 13
        Caption = #27604#37325'2'#22635#20837'F4'#26495#24335#25903#24231#30340'F4'#37096#20998#30340#20307#31215
      end
      object Label27: TLabel
        Left = 370
        Top = 333
        Width = 156
        Height = 13
        Caption = #20135#21697#27604#37325#20540#29992#20110#35745#31639#29983#20135#20135#20540
      end
      object Button1: TButton
        Left = 261
        Top = 393
        Width = 75
        Height = 25
        Caption = #20445#23384
        TabOrder = 0
        OnClick = Button1Click
      end
      object Button2: TButton
        Left = 370
        Top = 393
        Width = 75
        Height = 25
        Caption = #21462#28040
        TabOrder = 1
      end
      object Edit1: TEdit
        Left = 269
        Top = 77
        Width = 177
        Height = 21
        ImeName = #20013#25991'('#31616#20307') - '#26497#28857#20116#31508
        TabOrder = 2
      end
      object Edit2: TEdit
        Left = 268
        Top = 114
        Width = 177
        Height = 21
        ImeName = #20013#25991'('#31616#20307') - '#26497#28857#20116#31508
        TabOrder = 3
      end
      object Edit10: TEdit
        Left = 268
        Top = 288
        Width = 426
        Height = 21
        ImeName = #20013#25991'('#31616#20307') - '#26497#28857#20116#31508
        TabOrder = 6
      end
      object ComboBox1: TComboBox
        Left = 268
        Top = 184
        Width = 177
        Height = 21
        DropDownCount = 16
        ImeName = #20013#25991'('#31616#20307') - '#26497#28857#20116#31508
        TabOrder = 5
        OnDropDown = ComboBox1DropDown
      end
      object ComboBox2: TComboBox
        Left = 269
        Top = 149
        Width = 176
        Height = 21
        DropDownCount = 16
        ImeName = #20013#25991'('#31616#20307') - '#26497#28857#20116#31508
        TabOrder = 4
        Items.Strings = (
          #20010
          #22359
          #26465
          #22871)
      end
      object Edit13: TEdit
        Left = 269
        Top = 218
        Width = 177
        Height = 21
        ImeName = #20013#25991'('#31616#20307') - '#26497#28857#20116#31508
        TabOrder = 7
        Text = '0'
        OnKeyPress = Edit13KeyPress
      end
      object Edit14: TEdit
        Left = 268
        Top = 253
        Width = 177
        Height = 21
        ImeName = #20013#25991'('#31616#20307') - '#26497#28857#20116#31508
        TabOrder = 8
        Text = '0'
        OnKeyPress = Edit14KeyPress
      end
    end
    object TabSheet4: TTabSheet
      Caption = #20135#21697#20449#24687#20462#25913
      ImageIndex = 3
      ExplicitLeft = 8
      ExplicitTop = 28
      ExplicitWidth = 1051
      object Label15: TLabel
        Left = 278
        Top = 136
        Width = 81
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = #20135#21697#32534#21495
      end
      object Label16: TLabel
        Left = 270
        Top = 173
        Width = 89
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = #20135#21697#35268#26684
      end
      object Label17: TLabel
        Left = 278
        Top = 208
        Width = 81
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = #35745#37327#21333#20301
      end
      object Label18: TLabel
        Left = 278
        Top = 243
        Width = 81
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = #20135#21697#31867#22411
      end
      object Label19: TLabel
        Left = 279
        Top = 352
        Width = 81
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = #20135#21697#22791#27880
      end
      object Label20: TLabel
        Left = 367
        Top = 381
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
      object Label12: TLabel
        Left = 270
        Top = 280
        Width = 89
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = #20135#21697#27604#37325'1'
      end
      object Label28: TLabel
        Left = 269
        Top = 315
        Width = 89
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = #20135#21697#27604#37325'2'
      end
      object Label29: TLabel
        Left = 565
        Top = 281
        Width = 246
        Height = 13
        Caption = #27604#37325'1'#22635#20837#30406#24335#30340#37325#37327#25110#26495#24335#30340#27233#33014#37096#20998#30340#20307#31215
      end
      object Label30: TLabel
        Left = 565
        Top = 315
        Width = 198
        Height = 13
        Caption = #27604#37325'2'#22635#20837'F4'#26495#24335#25903#24231#30340'F4'#37096#20998#30340#20307#31215
      end
      object Edit7: TEdit
        Left = 374
        Top = 133
        Width = 177
        Height = 21
        ImeName = #20013#25991'('#31616#20307') - '#26497#28857#20116#31508
        ReadOnly = True
        TabOrder = 0
      end
      object Edit8: TEdit
        Left = 373
        Top = 170
        Width = 177
        Height = 21
        ImeName = #20013#25991'('#31616#20307') - '#26497#28857#20116#31508
        TabOrder = 1
      end
      object ComboBox5: TComboBox
        Left = 374
        Top = 205
        Width = 176
        Height = 21
        DropDownCount = 16
        ImeName = #20013#25991'('#31616#20307') - '#26497#28857#20116#31508
        TabOrder = 2
        Items.Strings = (
          #20010
          #22359
          #26465
          #22871)
      end
      object ComboBox6: TComboBox
        Left = 373
        Top = 240
        Width = 177
        Height = 21
        DropDownCount = 16
        ImeName = #20013#25991'('#31616#20307') - '#26497#28857#20116#31508
        TabOrder = 3
        OnDropDown = ComboBox6DropDown
      end
      object Edit11: TEdit
        Left = 374
        Top = 349
        Width = 418
        Height = 21
        ImeName = #20013#25991'('#31616#20307') - '#26497#28857#20116#31508
        TabOrder = 4
      end
      object Button3: TButton
        Left = 374
        Top = 433
        Width = 75
        Height = 25
        Caption = #20445#23384
        TabOrder = 5
        OnClick = Button3Click
      end
      object Button4: TButton
        Left = 517
        Top = 433
        Width = 75
        Height = 25
        Caption = #21462#28040
        TabOrder = 6
      end
      object ListBox2: TListBox
        Left = 0
        Top = 0
        Width = 201
        Height = 583
        Align = alLeft
        ItemHeight = 13
        TabOrder = 7
        OnClick = ListBox2Click
      end
      object Edit12: TEdit
        Left = 374
        Top = 64
        Width = 176
        Height = 21
        TabOrder = 8
      end
      object Button9: TButton
        Left = 582
        Top = 62
        Width = 89
        Height = 25
        Caption = #31946#31946#26597#35810
        TabOrder = 9
        OnClick = Button9Click
      end
      object Edit9: TEdit
        Left = 373
        Top = 277
        Width = 177
        Height = 21
        ImeName = #20013#25991'('#31616#20307') - '#26497#28857#20116#31508
        TabOrder = 10
        Text = '0'
        OnKeyPress = Edit13KeyPress
      end
      object Edit15: TEdit
        Left = 372
        Top = 312
        Width = 177
        Height = 21
        ImeName = #20013#25991'('#31616#20307') - '#26497#28857#20116#31508
        TabOrder = 11
        Text = '0'
        OnKeyPress = Edit14KeyPress
      end
    end
    object TabSheet2: TTabSheet
      Caption = #26032#22686#21512#21516#26126#32454
      Enabled = False
      ImageIndex = 1
      TabVisible = False
      ExplicitWidth = 1051
      object Label5: TLabel
        Left = 328
        Top = 38
        Width = 48
        Height = 13
        Caption = #27169#31946#26597#35810
      end
      object Label8: TLabel
        Left = 320
        Top = 144
        Width = 81
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = #20135#21697#32534#21495
      end
      object Label9: TLabel
        Left = 312
        Top = 181
        Width = 89
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = #20135#21697#35268#26684
      end
      object Label10: TLabel
        Left = 320
        Top = 216
        Width = 81
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = #35745#37327#21333#20301
      end
      object Label11: TLabel
        Left = 320
        Top = 251
        Width = 81
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = #20135#21697#31867#22411
      end
      object Label14: TLabel
        Left = 320
        Top = 288
        Width = 81
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = #20135#21697#22791#27880
      end
      object ListBox1: TListBox
        Left = 0
        Top = 0
        Width = 249
        Height = 583
        Align = alLeft
        ImeName = #20013#25991'('#31616#20307') - '#26497#28857#20116#31508
        ItemHeight = 13
        TabOrder = 0
      end
      object Edit3: TEdit
        Left = 416
        Top = 35
        Width = 150
        Height = 21
        ImeName = #20013#25991'('#31616#20307') - '#26497#28857#20116#31508
        TabOrder = 1
      end
      object Button5: TButton
        Left = 616
        Top = 33
        Width = 75
        Height = 25
        Caption = #26597#35810
        TabOrder = 2
      end
      object CheckBox1: TCheckBox
        Left = 616
        Top = 180
        Width = 97
        Height = 17
        Caption = #20462#25913
        TabOrder = 3
      end
      object CheckBox2: TCheckBox
        Left = 616
        Top = 215
        Width = 97
        Height = 17
        Caption = #20462#25913
        TabOrder = 4
      end
      object CheckBox4: TCheckBox
        Left = 616
        Top = 250
        Width = 97
        Height = 17
        Caption = #20462#25913
        TabOrder = 5
      end
      object Button7: TButton
        Left = 491
        Top = 408
        Width = 75
        Height = 25
        Caption = #20445#23384
        TabOrder = 6
      end
      object Button8: TButton
        Left = 680
        Top = 408
        Width = 75
        Height = 25
        Caption = #21462#28040
        TabOrder = 7
      end
      object Edit4: TEdit
        Left = 416
        Top = 141
        Width = 177
        Height = 21
        ImeName = #20013#25991'('#31616#20307') - '#26497#28857#20116#31508
        TabOrder = 8
      end
      object Edit5: TEdit
        Left = 415
        Top = 178
        Width = 177
        Height = 21
        ImeName = #20013#25991'('#31616#20307') - '#26497#28857#20116#31508
        TabOrder = 9
      end
      object ComboBox3: TComboBox
        Left = 416
        Top = 213
        Width = 176
        Height = 21
        ImeName = #20013#25991'('#31616#20307') - '#26497#28857#20116#31508
        TabOrder = 10
        OnDropDown = ComboBox1DropDown
        Items.Strings = (
          #20010
          #22359
          #26465
          #22871)
      end
      object ComboBox4: TComboBox
        Left = 415
        Top = 248
        Width = 177
        Height = 21
        ImeName = #20013#25991'('#31616#20307') - '#26497#28857#20116#31508
        TabOrder = 11
        OnDropDown = ComboBox1DropDown
      end
      object Edit6: TEdit
        Left = 415
        Top = 285
        Width = 177
        Height = 21
        ImeName = #20013#25991'('#31616#20307') - '#26497#28857#20116#31508
        TabOrder = 12
      end
    end
  end
  object ZStoredProc1: TZStoredProc
    Connection = Form1.ZConnection1
    Params = <>
    Left = 640
    Top = 440
  end
end
