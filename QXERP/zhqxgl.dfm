object Form14: TForm14
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = #24080#25143#26435#38480#31649#29702
  ClientHeight = 887
  ClientWidth = 1360
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -14
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 120
  TextHeight = 17
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 1360
    Height = 887
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    ActivePage = TabSheet2
    Align = alClient
    TabOrder = 0
    object TabSheet1: TTabSheet
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = #26032#22686#24080#25143
      object Label2: TLabel
        Left = 277
        Top = 263
        Width = 85
        Height = 17
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Alignment = taRightJustify
        AutoSize = False
        Caption = #24080#21495#21517#31216
      end
      object Label6: TLabel
        Left = 595
        Top = 263
        Width = 8
        Height = 18
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = '*'
        Color = clRed
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
      object Label7: TLabel
        Left = 391
        Top = 404
        Width = 73
        Height = 18
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = '* '#20026#24517#22635#39033
        Color = clRed
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
      object Label8: TLabel
        Left = 611
        Top = 263
        Width = 85
        Height = 17
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Alignment = taRightJustify
        AutoSize = False
        Caption = #23494#30721
      end
      object Label17: TLabel
        Left = 940
        Top = 263
        Width = 8
        Height = 18
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = '*'
        Color = clRed
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
      object Edit2: TEdit
        Left = 391
        Top = 259
        Width = 196
        Height = 25
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        ImeName = #20013#25991'('#31616#20307') - '#26497#28857#20116#31508
        TabOrder = 0
      end
      object Button1: TButton
        Left = 673
        Top = 398
        Width = 99
        Height = 32
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = #30830#23450
        TabOrder = 1
        OnClick = Button1Click
      end
      object Button2: TButton
        Left = 834
        Top = 398
        Width = 98
        Height = 32
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = #21462#28040
        TabOrder = 2
      end
      object Edit9: TEdit
        Left = 736
        Top = 259
        Width = 196
        Height = 25
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        ImeName = #20013#25991'('#31616#20307') - '#26497#28857#20116#31508
        TabOrder = 3
        Text = '123456'
      end
    end
    object TabSheet2: TTabSheet
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = #26435#38480#20462#25913
      ImageIndex = 1
      OnShow = TabSheet2Show
      object Label22: TLabel
        Left = 313
        Top = 50
        Width = 56
        Height = 17
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = #27169#31946#26597#35810
      end
      object Label1: TLabel
        Left = 324
        Top = 136
        Width = 42
        Height = 17
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = #24080#25143#21517
      end
      object Label3: TLabel
        Left = 718
        Top = 136
        Width = 28
        Height = 17
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = #23494#30721
      end
      object ListBox1: TListBox
        Left = 0
        Top = 0
        Width = 179
        Height = 855
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Align = alLeft
        ImeName = #20013#25991'('#31616#20307') - '#26497#28857#20116#31508
        ItemHeight = 17
        TabOrder = 0
        OnClick = ListBox1Click
      end
      object Button3: TButton
        Left = 779
        Top = 596
        Width = 98
        Height = 33
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = #20445#23384
        TabOrder = 1
        OnClick = Button3Click
      end
      object Button4: TButton
        Left = 999
        Top = 596
        Width = 98
        Height = 33
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = #21462#28040
        TabOrder = 2
      end
      object CheckBox1: TCheckBox
        Left = 324
        Top = 292
        Width = 127
        Height = 22
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = #22806#21327#21152#24037#31649#29702
        TabOrder = 3
      end
      object CheckBox2: TCheckBox
        Left = 324
        Top = 348
        Width = 127
        Height = 22
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = #20135#21697#20449#24687#31649#29702
        TabOrder = 4
      end
      object CheckBox4: TCheckBox
        Left = 324
        Top = 396
        Width = 127
        Height = 22
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = #21457#36135#31649#29702
        TabOrder = 5
      end
      object CheckBox3: TCheckBox
        Left = 324
        Top = 452
        Width = 127
        Height = 23
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = #36136#37327#31649#29702
        TabOrder = 6
      end
      object CheckBox5: TCheckBox
        Left = 779
        Top = 239
        Width = 127
        Height = 23
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = #26242#26080'5-5'
        TabOrder = 7
      end
      object CheckBox6: TCheckBox
        Left = 779
        Top = 288
        Width = 127
        Height = 22
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = #24212#25910#27454#31649#29702
        TabOrder = 8
      end
      object CheckBox7: TCheckBox
        Left = 779
        Top = 344
        Width = 127
        Height = 22
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = #32844#24037#20449#24687#31649#29702
        TabOrder = 9
      end
      object Edit15: TEdit
        Left = 428
        Top = 46
        Width = 196
        Height = 25
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        ImeName = #20013#25991'('#31616#20307') - '#26497#28857#20116#31508
        TabOrder = 10
      end
      object Button5: TButton
        Left = 689
        Top = 43
        Width = 98
        Height = 33
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = #26597#35810
        TabOrder = 11
        OnClick = Button5Click
      end
      object CheckBox10: TCheckBox
        Left = 324
        Top = 239
        Width = 127
        Height = 23
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = #38144#21806#31649#29702
        TabOrder = 12
      end
      object CheckBox11: TCheckBox
        Left = 779
        Top = 449
        Width = 127
        Height = 22
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = 'OA'#21150#20844
        TabOrder = 13
      end
      object CheckBox12: TCheckBox
        Left = 779
        Top = 392
        Width = 127
        Height = 23
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = #29983#20135#35745#21010
        TabOrder = 14
      end
      object CheckBox13: TCheckBox
        Left = 544
        Top = 239
        Width = 127
        Height = 23
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = #36134#21153#32479#35745
        TabOrder = 15
      end
      object CheckBox14: TCheckBox
        Left = 544
        Top = 292
        Width = 127
        Height = 22
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = #20179#24211#31649#29702
        TabOrder = 16
      end
      object CheckBox15: TCheckBox
        Left = 544
        Top = 348
        Width = 148
        Height = 22
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = #21322#25104#21697#20449#24687#31649#29702
        TabOrder = 17
      end
      object CheckBox16: TCheckBox
        Left = 544
        Top = 396
        Width = 127
        Height = 22
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = #26597#35810#32479#35745
        TabOrder = 18
      end
      object CheckBox17: TCheckBox
        Left = 544
        Top = 452
        Width = 127
        Height = 23
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = #29983#20135#31649#29702
        TabOrder = 19
      end
      object CheckBox18: TCheckBox
        Left = 999
        Top = 239
        Width = 127
        Height = 23
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = #26242#26080'18-6'
        TabOrder = 20
      end
      object CheckBox19: TCheckBox
        Left = 999
        Top = 288
        Width = 127
        Height = 22
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = #32467#31639#20013#24515
        TabOrder = 21
      end
      object CheckBox20: TCheckBox
        Left = 999
        Top = 344
        Width = 127
        Height = 22
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = #29983#20135#32479#35745#26597#35810
        TabOrder = 22
      end
      object CheckBox21: TCheckBox
        Left = 999
        Top = 392
        Width = 174
        Height = 23
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = #21322#25104#21697#37325#37327#31649#29702
        TabOrder = 23
      end
      object CheckBox22: TCheckBox
        Left = 999
        Top = 449
        Width = 127
        Height = 22
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = #24080#25143#26435#38480#31649#29702
        TabOrder = 24
      end
      object Edit1: TEdit
        Left = 428
        Top = 132
        Width = 158
        Height = 25
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        ImeName = #20013#25991'('#31616#20307') - '#26497#28857#20116#31508
        TabOrder = 25
      end
      object Edit3: TEdit
        Left = 779
        Top = 132
        Width = 159
        Height = 25
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        ImeName = #20013#25991'('#31616#20307') - '#26497#28857#20116#31508
        ReadOnly = True
        TabOrder = 26
      end
      object CheckBox8: TCheckBox
        Left = 999
        Top = 135
        Width = 127
        Height = 22
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = #20462#25913#23494#30721
        TabOrder = 27
        OnClick = CheckBox8Click
      end
    end
  end
  object ZQuery1: TZQuery
    Connection = Form1.ZConnection1
    Params = <>
    Left = 872
    Top = 176
  end
end
