object Form9: TForm9
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = #24212#25910#27454#35760#24080
  ClientHeight = 652
  ClientWidth = 1085
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 1085
    Height = 652
    ActivePage = TabSheet1
    Align = alClient
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = #26032#22686#24212#25910#27454#35760#24080
      object Label1: TLabel
        Left = 48
        Top = 472
        Width = 81
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = #24212#25910#27454#32534#21495
      end
      object Label2: TLabel
        Left = 312
        Top = 472
        Width = 54
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = #26032#22686#37329#39069
      end
      object Label3: TLabel
        Left = 538
        Top = 472
        Width = 56
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = #35760#24080#26085#26399
      end
      object Label4: TLabel
        Left = 745
        Top = 472
        Width = 33
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = #22791#27880
      end
      object Label30: TLabel
        Left = 57
        Top = 32
        Width = 72
        Height = 13
        Caption = #36755#20837#26597#35810#21517#31216
      end
      object Label5: TLabel
        Left = 261
        Top = 472
        Width = 36
        Height = 13
        Caption = #24517#22635#39033
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
        Left = 496
        Top = 472
        Width = 36
        Height = 13
        Caption = #24517#22635#39033
        Color = clRed
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
      object Button1: TButton
        Left = 806
        Top = 522
        Width = 75
        Height = 25
        Caption = #30830#23450
        TabOrder = 0
        OnClick = Button1Click
      end
      object Button2: TButton
        Left = 919
        Top = 522
        Width = 75
        Height = 25
        Caption = #21462#28040
        TabOrder = 1
      end
      object Edit1: TEdit
        Left = 135
        Top = 469
        Width = 120
        Height = 21
        ImeName = #20013#25991'('#31616#20307') - '#26497#28857#20116#31508
        TabOrder = 2
      end
      object Edit2: TEdit
        Left = 372
        Top = 469
        Width = 114
        Height = 21
        ImeName = #20013#25991'('#31616#20307') - '#26497#28857#20116#31508
        TabOrder = 3
      end
      object Edit4: TEdit
        Left = 792
        Top = 469
        Width = 233
        Height = 21
        ImeName = #20013#25991'('#31616#20307') - '#26497#28857#20116#31508
        TabOrder = 4
      end
      object Edit16: TEdit
        Left = 135
        Top = 29
        Width = 169
        Height = 21
        ImeMode = imDisable
        ImeName = #20013#25991'('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
        TabOrder = 5
        OnChange = Edit16Change
      end
      object StringGrid4: TStringGrid
        Left = 57
        Top = 64
        Width = 968
        Height = 361
        ColCount = 2
        FixedCols = 0
        TabOrder = 6
        OnSelectCell = StringGrid4SelectCell
        ColWidths = (
          81
          861)
      end
      object Button7: TButton
        Left = 760
        Top = 23
        Width = 106
        Height = 25
        Caption = #32534#21495#36741#21161#26597#35810'>>'
        TabOrder = 7
        Visible = False
      end
      object DateTimePicker1: TDateTimePicker
        Left = 616
        Top = 469
        Width = 105
        Height = 21
        Date = 42180.606373275460000000
        Time = 42180.606373275460000000
        ImeName = #20013#25991'('#31616#20307') - '#26497#28857#20116#31508
        TabOrder = 8
      end
      object RadioGroup1: TRadioGroup
        Left = 387
        Top = 16
        Width = 277
        Height = 41
        Caption = #26597#35810#36873#39033
        Columns = 2
        ItemIndex = 0
        Items.Strings = (
          #23458#25143#21517#31216#26597#35810
          #38144#21806#22995#21517#26597#35810)
        TabOrder = 9
      end
    end
    object TabSheet2: TTabSheet
      Caption = #24212#25910#27454#22238#25910#35760#24080
      ImageIndex = 1
      object Label8: TLabel
        Left = 73
        Top = 469
        Width = 81
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = #24212#25910#27454#32534#21495
      end
      object Label9: TLabel
        Left = 294
        Top = 469
        Width = 36
        Height = 13
        Caption = #24517#22635#39033
        Color = clRed
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
      object Label10: TLabel
        Left = 561
        Top = 469
        Width = 36
        Height = 13
        Caption = #24517#22635#39033
        Color = clRed
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
      object Label11: TLabel
        Left = 321
        Top = 469
        Width = 89
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = #22238#25910#37329#39069
      end
      object Label13: TLabel
        Left = 593
        Top = 469
        Width = 81
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = #35760#24080#26085#26399
      end
      object Label14: TLabel
        Left = 757
        Top = 469
        Width = 81
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = #22791#27880
      end
      object Label16: TLabel
        Left = 58
        Top = 32
        Width = 72
        Height = 13
        Caption = #36755#20837#26597#35810#21517#31216
      end
      object Edit3: TEdit
        Left = 160
        Top = 466
        Width = 115
        Height = 21
        ImeName = #20013#25991'('#31616#20307') - '#26497#28857#20116#31508
        TabOrder = 0
      end
      object Edit5: TEdit
        Left = 432
        Top = 466
        Width = 115
        Height = 21
        ImeName = #20013#25991'('#31616#20307') - '#26497#28857#20116#31508
        TabOrder = 1
      end
      object DateTimePicker2: TDateTimePicker
        Left = 687
        Top = 466
        Width = 105
        Height = 21
        Date = 42180.606373275460000000
        Time = 42180.606373275460000000
        ImeName = #20013#25991'('#31616#20307') - '#26497#28857#20116#31508
        TabOrder = 2
      end
      object Edit6: TEdit
        Left = 852
        Top = 466
        Width = 177
        Height = 21
        ImeName = #20013#25991'('#31616#20307') - '#26497#28857#20116#31508
        TabOrder = 3
      end
      object Button3: TButton
        Left = 805
        Top = 521
        Width = 75
        Height = 25
        Caption = #30830#23450
        TabOrder = 4
        OnClick = Button3Click
      end
      object Button4: TButton
        Left = 917
        Top = 521
        Width = 75
        Height = 25
        Caption = #21462#28040
        TabOrder = 5
      end
      object Button5: TButton
        Left = 783
        Top = 23
        Width = 97
        Height = 25
        Caption = #32534#21495#36741#21161#26597#35810'>>'
        TabOrder = 6
        Visible = False
      end
      object StringGrid3: TStringGrid
        Left = 56
        Top = 66
        Width = 973
        Height = 369
        ColCount = 2
        FixedCols = 0
        TabOrder = 7
        OnSelectCell = StringGrid3SelectCell
        ColWidths = (
          82
          857)
      end
      object Edit7: TEdit
        Left = 136
        Top = 29
        Width = 169
        Height = 21
        ImeName = #20013#25991'('#31616#20307') - '#26497#28857#20116#31508
        TabOrder = 8
        OnChange = Edit7Change
      end
      object RadioGroup2: TRadioGroup
        Left = 388
        Top = 16
        Width = 277
        Height = 41
        Caption = #26597#35810#36873#39033
        Color = clBtnHighlight
        Columns = 2
        ItemIndex = 0
        Items.Strings = (
          #23458#25143#21517#31216#26597#35810
          #38144#21806#22995#21517#26597#35810)
        ParentBackground = False
        ParentColor = False
        TabOrder = 9
      end
    end
    object TabSheet3: TTabSheet
      Caption = #21512#21516#26597#35810
      ImageIndex = 2
      object Label12: TLabel
        Left = 45
        Top = 24
        Width = 65
        Height = 18
        AutoSize = False
        Caption = #20135#21697#35268#26684
      end
      object StringGrid1: TStringGrid
        Left = 0
        Top = 48
        Width = 1073
        Height = 254
        Align = alCustom
        ColCount = 9
        DefaultColWidth = 200
        FixedCols = 0
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRowSelect]
        TabOrder = 0
      end
      object Edit9: TEdit
        Left = 116
        Top = 19
        Width = 365
        Height = 21
        ImeName = #20013#25991'('#31616#20307') - '#26497#28857#20116#31508
        TabOrder = 1
      end
      object Button6: TButton
        Left = 497
        Top = 17
        Width = 75
        Height = 25
        Caption = #26597#35810
        TabOrder = 2
      end
      object StringGrid2: TStringGrid
        Left = 0
        Top = 268
        Width = 1077
        Height = 356
        Align = alBottom
        ColCount = 7
        TabOrder = 3
      end
    end
  end
  object ZQuery1: TZQuery
    Connection = Form1.ZConnection1
    Params = <>
    Left = 1000
    Top = 24
  end
end
