object Form4: TForm4
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = #20027#31649#21333#20301#31649#29702
  ClientHeight = 547
  ClientWidth = 940
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
    Width = 940
    Height = 547
    ActivePage = TabSheet2
    Align = alClient
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = #26032#22686#20027#31649#21333#20301
      object Label1: TLabel
        Left = 152
        Top = 80
        Width = 82
        Height = 13
        AutoSize = False
        Caption = #20027#31649#21333#20301#32534#21495
      end
      object Label2: TLabel
        Left = 152
        Top = 224
        Width = 82
        Height = 13
        AutoSize = False
        Caption = #20027#31649#21333#20301#22320#22336
      end
      object Label3: TLabel
        Left = 152
        Top = 152
        Width = 82
        Height = 13
        AutoSize = False
        Caption = #20027#31649#21333#20301#21517#31216
      end
      object Label4: TLabel
        Left = 152
        Top = 296
        Width = 73
        Height = 13
        AutoSize = False
        Caption = #22791'                '#27880
      end
      object Label5: TLabel
        Left = 637
        Top = 152
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
      object Label6: TLabel
        Left = 637
        Top = 224
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
        Left = 208
        Top = 413
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
      object Edit1: TEdit
        Left = 240
        Top = 77
        Width = 150
        Height = 21
        ImeName = #20013#25991'('#31616#20307') - '#26497#28857#20116#31508
        ReadOnly = True
        TabOrder = 0
      end
      object Edit2: TEdit
        Left = 240
        Top = 221
        Width = 377
        Height = 21
        ImeName = #20013#25991'('#31616#20307') - '#26497#28857#20116#31508
        TabOrder = 1
      end
      object Edit3: TEdit
        Left = 240
        Top = 149
        Width = 377
        Height = 21
        ImeName = #20013#25991'('#31616#20307') - '#26497#28857#20116#31508
        TabOrder = 2
      end
      object Button1: TButton
        Left = 447
        Top = 408
        Width = 75
        Height = 25
        Caption = #30830#23450
        TabOrder = 3
        OnClick = Button1Click
      end
      object Button2: TButton
        Left = 568
        Top = 408
        Width = 75
        Height = 25
        Caption = #21462#28040
        TabOrder = 4
        OnClick = Button2Click
      end
      object Edit4: TEdit
        Left = 240
        Top = 293
        Width = 377
        Height = 21
        ImeName = #20013#25991'('#31616#20307') - '#26497#28857#20116#31508
        TabOrder = 5
      end
    end
    object TabSheet2: TTabSheet
      Caption = #20027#31649#21333#20301#20449#24687#20462#25913
      ImageIndex = 1
      OnShow = TabSheet2Show
      object Label8: TLabel
        Left = 328
        Top = 117
        Width = 82
        Height = 13
        AutoSize = False
        Caption = #20027#31649#21333#20301#32534#21495
      end
      object Label9: TLabel
        Left = 328
        Top = 189
        Width = 82
        Height = 13
        AutoSize = False
        Caption = #20027#31649#21333#20301#21517#31216
      end
      object Label10: TLabel
        Left = 328
        Top = 261
        Width = 82
        Height = 13
        AutoSize = False
        Caption = #20027#31649#21333#20301#22320#22336
      end
      object Label11: TLabel
        Left = 328
        Top = 333
        Width = 73
        Height = 13
        AutoSize = False
        Caption = #22791'                '#27880
      end
      object Label12: TLabel
        Left = 328
        Top = 38
        Width = 48
        Height = 13
        Caption = #27169#31946#26597#35810
      end
      object ListBox1: TListBox
        Left = 0
        Top = 0
        Width = 249
        Height = 519
        Align = alLeft
        ImeName = #20013#25991'('#31616#20307') - '#26497#28857#20116#31508
        ItemHeight = 13
        TabOrder = 0
        OnClick = ListBox1Click
      end
      object Button3: TButton
        Left = 491
        Top = 408
        Width = 75
        Height = 25
        Caption = #20445#23384
        TabOrder = 1
        OnClick = Button3Click
      end
      object Button4: TButton
        Left = 680
        Top = 408
        Width = 75
        Height = 25
        Caption = #21462#28040
        TabOrder = 2
        OnClick = Button4Click
      end
      object CheckBox1: TCheckBox
        Left = 812
        Top = 188
        Width = 97
        Height = 17
        Caption = #20462#25913
        TabOrder = 3
        OnClick = CheckBox1Click
      end
      object CheckBox2: TCheckBox
        Left = 812
        Top = 260
        Width = 97
        Height = 17
        Caption = #20462#25913
        TabOrder = 4
        OnClick = CheckBox2Click
      end
      object CheckBox4: TCheckBox
        Left = 812
        Top = 332
        Width = 97
        Height = 17
        Caption = #20462#25913
        TabOrder = 5
        OnClick = CheckBox4Click
      end
      object Edit5: TEdit
        Left = 416
        Top = 114
        Width = 150
        Height = 21
        ImeName = #20013#25991'('#31616#20307') - '#26497#28857#20116#31508
        ReadOnly = True
        TabOrder = 6
      end
      object Edit6: TEdit
        Left = 416
        Top = 186
        Width = 377
        Height = 21
        ImeName = #20013#25991'('#31616#20307') - '#26497#28857#20116#31508
        ReadOnly = True
        TabOrder = 7
      end
      object Edit7: TEdit
        Left = 416
        Top = 258
        Width = 377
        Height = 21
        ImeName = #20013#25991'('#31616#20307') - '#26497#28857#20116#31508
        ReadOnly = True
        TabOrder = 8
      end
      object Edit8: TEdit
        Left = 416
        Top = 330
        Width = 377
        Height = 21
        ImeName = #20013#25991'('#31616#20307') - '#26497#28857#20116#31508
        ReadOnly = True
        TabOrder = 9
      end
      object Edit9: TEdit
        Left = 416
        Top = 35
        Width = 150
        Height = 21
        ImeName = #20013#25991'('#31616#20307') - '#26497#28857#20116#31508
        TabOrder = 10
      end
      object Button5: TButton
        Left = 616
        Top = 33
        Width = 75
        Height = 25
        Caption = #26597#35810
        TabOrder = 11
        OnClick = Button5Click
      end
    end
  end
  object ZQuery1: TZQuery
    Connection = Form1.ZConnection1
    Params = <>
    Left = 784
    Top = 120
  end
end
