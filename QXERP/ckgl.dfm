object from9: Tfrom9
  Left = 0
  Top = 0
  BorderStyle = bsToolWindow
  Caption = #20179#24211#31649#29702
  ClientHeight = 704
  ClientWidth = 1089
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
    Width = 1089
    Height = 704
    ActivePage = TabSheet1
    Align = alClient
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = #25104#21697#20837#24211
      object Label1: TLabel
        Left = 75
        Top = 520
        Width = 81
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = #20135#21697#32534#21495
      end
      object Label2: TLabel
        Left = 347
        Top = 520
        Width = 49
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = #20837#24211#25968#37327
      end
      object Label3: TLabel
        Left = 559
        Top = 520
        Width = 81
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = #35760#24080#26085#26399
      end
      object Label4: TLabel
        Left = 705
        Top = 520
        Width = 81
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = #22791#27880
      end
      object Label30: TLabel
        Left = 64
        Top = 24
        Width = 72
        Height = 13
        Caption = #36755#20837#26597#35810#21517#31216
        ParentShowHint = False
        ShowHint = True
      end
      object Label5: TLabel
        Left = 273
        Top = 520
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
      object Label6: TLabel
        Left = 505
        Top = 520
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
      object Button1: TButton
        Left = 759
        Top = 569
        Width = 75
        Height = 25
        Caption = #30830#23450
        TabOrder = 0
        OnClick = Button1Click
      end
      object Button2: TButton
        Left = 886
        Top = 569
        Width = 75
        Height = 25
        Caption = #21462#28040
        TabOrder = 1
      end
      object Edit1: TEdit
        Left = 162
        Top = 517
        Width = 105
        Height = 21
        ImeName = #20013#25991'('#31616#20307') - '#26497#28857#20116#31508
        TabOrder = 2
      end
      object Edit2: TEdit
        Left = 402
        Top = 517
        Width = 97
        Height = 21
        ImeName = #20013#25991'('#31616#20307') - '#26497#28857#20116#31508
        TabOrder = 3
      end
      object Edit4: TEdit
        Left = 808
        Top = 517
        Width = 177
        Height = 21
        ImeName = #20013#25991'('#31616#20307') - '#26497#28857#20116#31508
        TabOrder = 4
      end
      object Edit16: TEdit
        Left = 142
        Top = 21
        Width = 169
        Height = 21
        ImeName = #20013#25991'('#31616#20307') - '#26497#28857#20116#31508
        ParentShowHint = False
        ShowHint = True
        TabOrder = 5
        OnChange = Edit16Change
      end
      object StringGrid4: TStringGrid
        Left = 64
        Top = 64
        Width = 953
        Height = 409
        ColCount = 4
        FixedCols = 0
        ParentShowHint = False
        ShowHint = True
        TabOrder = 6
        OnSelectCell = StringGrid4SelectCell
        ColWidths = (
          136
          140
          153
          152)
      end
      object Button7: TButton
        Left = 422
        Top = 19
        Width = 97
        Height = 25
        Caption = #32534#21495#36741#21161#26597#35810'>>'
        TabOrder = 7
        Visible = False
        OnClick = Button7Click
      end
      object DateTimePicker1: TDateTimePicker
        Left = 646
        Top = 517
        Width = 98
        Height = 21
        Date = 42180.606373275460000000
        Time = 42180.606373275460000000
        ImeName = #20013#25991'('#31616#20307') - '#26497#28857#20116#31508
        TabOrder = 8
      end
    end
    object TabSheet2: TTabSheet
      Caption = #25104#21697#20986#24211
      ImageIndex = 1
      object Label8: TLabel
        Left = 62
        Top = 523
        Width = 81
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = #20135#21697#32534#21495
      end
      object Label9: TLabel
        Left = 276
        Top = 523
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
        Left = 542
        Top = 523
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
        Left = 334
        Top = 523
        Width = 51
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = #20986#24211#25968#37327
      end
      object Label13: TLabel
        Left = 584
        Top = 522
        Width = 55
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = #35760#24080#26085#26399
      end
      object Label14: TLabel
        Left = 721
        Top = 520
        Width = 81
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = #22791#27880
      end
      object Label16: TLabel
        Left = 65
        Top = 24
        Width = 72
        Height = 13
        Caption = #36755#20837#26597#35810#21517#31216
      end
      object Edit3: TEdit
        Left = 149
        Top = 520
        Width = 121
        Height = 21
        ImeName = #20013#25991'('#31616#20307') - '#26497#28857#20116#31508
        TabOrder = 0
      end
      object Edit5: TEdit
        Left = 408
        Top = 520
        Width = 121
        Height = 21
        ImeName = #20013#25991'('#31616#20307') - '#26497#28857#20116#31508
        TabOrder = 1
      end
      object DateTimePicker2: TDateTimePicker
        Left = 648
        Top = 520
        Width = 105
        Height = 21
        Date = 42180.606373275460000000
        Time = 42180.606373275460000000
        ImeName = #20013#25991'('#31616#20307') - '#26497#28857#20116#31508
        TabOrder = 2
      end
      object Edit6: TEdit
        Left = 824
        Top = 517
        Width = 177
        Height = 21
        ImeName = #20013#25991'('#31616#20307') - '#26497#28857#20116#31508
        TabOrder = 3
      end
      object Button3: TButton
        Left = 775
        Top = 577
        Width = 75
        Height = 25
        Caption = #30830#23450
        TabOrder = 4
        OnClick = Button3Click
      end
      object Button4: TButton
        Left = 910
        Top = 577
        Width = 75
        Height = 25
        Caption = #21462#28040
        TabOrder = 5
      end
      object Button5: TButton
        Left = 478
        Top = 19
        Width = 97
        Height = 25
        Caption = #32534#21495#36741#21161#26597#35810'>>'
        TabOrder = 6
        Visible = False
        OnClick = Button5Click
      end
      object StringGrid3: TStringGrid
        Left = 65
        Top = 64
        Width = 960
        Height = 409
        ColCount = 4
        FixedCols = 0
        TabOrder = 7
        OnSelectCell = StringGrid3SelectCell
        ColWidths = (
          175
          164
          183
          167)
      end
      object Edit7: TEdit
        Left = 143
        Top = 21
        Width = 169
        Height = 21
        ImeName = #20013#25991'('#31616#20307') - '#26497#28857#20116#31508
        TabOrder = 8
        OnChange = Edit7Change
      end
    end
    object TabSheet3: TTabSheet
      Caption = #24211#23384#26597#35810
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
        Top = 59
        Width = 1078
        Height = 255
        Align = alCustom
        ColCount = 9
        DefaultColWidth = 200
        FixedCols = 0
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRowSelect]
        TabOrder = 0
        OnSelectCell = StringGrid1SelectCell
        ColWidths = (
          200
          200
          200
          200
          200
          200
          200
          200
          200)
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
        OnClick = Button6Click
      end
      object StringGrid2: TStringGrid
        Left = 0
        Top = 320
        Width = 1081
        Height = 356
        Align = alBottom
        ColCount = 7
        TabOrder = 3
      end
      object Button8: TButton
        Left = 688
        Top = 17
        Width = 91
        Height = 25
        Caption = #23548#20986#21040'EXECL'
        TabOrder = 4
        OnClick = Button8Click
      end
      object RadioGroup1: TRadioGroup
        Left = 816
        Top = 1
        Width = 225
        Height = 55
        Caption = #23548#20986#34920#36873#25321
        Columns = 3
        ItemIndex = 0
        Items.Strings = (
          #34920#19968
          #34920#20108
          #20840#37096)
        TabOrder = 5
      end
    end
  end
  object ZQuery1: TZQuery
    Connection = Form1.ZConnection1
    Params = <>
    Left = 576
    Top = 232
  end
end
