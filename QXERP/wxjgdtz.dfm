object Form93: TForm93
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #22806#21327#21152#24037#21333#20462#25913
  ClientHeight = 681
  ClientWidth = 1009
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
  object Label6: TLabel
    Left = 24
    Top = 16
    Width = 60
    Height = 13
    Caption = #21152#24037#21333#32534#21495
  end
  object Label7: TLabel
    Left = 230
    Top = 16
    Width = 60
    Height = 13
    Caption = #21152#24037#21830#21517#31216
  end
  object Label4: TLabel
    Left = 738
    Top = 16
    Width = 48
    Height = 13
    Caption = #20986#21333#26085#26399
  end
  object Label5: TLabel
    Left = 60
    Top = 61
    Width = 24
    Height = 13
    Caption = #22791#27880
  end
  object Bevel1: TBevel
    Left = 15
    Top = 110
    Width = 966
    Height = 408
    Shape = bsFrame
    Style = bsRaised
  end
  object Label8: TLabel
    Left = 460
    Top = 103
    Width = 80
    Height = 16
    Caption = #21152#24037#21333#26126#32454
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = False
  end
  object Label12: TLabel
    Left = 741
    Top = 46
    Width = 60
    Height = 13
    Caption = #21152#24037#24635#36153#29992
  end
  object Label1: TLabel
    Left = 440
    Top = 122
    Width = 132
    Height = 13
    Caption = #21452#20987#35760#24405#26465#26597#30475#20837#24211#26126#32454
  end
  object Label9: TLabel
    Left = 105
    Top = 531
    Width = 48
    Height = 13
    Caption = #24037#20214#32534#21495
  end
  object Label10: TLabel
    Left = 319
    Top = 531
    Width = 48
    Height = 13
    Caption = #21152#24037#21333#20215
  end
  object Label11: TLabel
    Left = 554
    Top = 531
    Width = 48
    Height = 13
    Caption = #21152#24037#25968#37327
  end
  object Label2: TLabel
    Left = 542
    Top = 566
    Width = 60
    Height = 13
    Caption = #35843#25972#21518#25968#37327
  end
  object Label3: TLabel
    Left = 307
    Top = 566
    Width = 60
    Height = 13
    Caption = #35843#25972#21518#21333#20215
  end
  object Label13: TLabel
    Left = 105
    Top = 566
    Width = 48
    Height = 13
    Caption = #24050#21457#25968#37327
  end
  object Label14: TLabel
    Left = 129
    Top = 597
    Width = 24
    Height = 13
    Alignment = taRightJustify
    Caption = #22791#27880
  end
  object Label16: TLabel
    Left = 814
    Top = 619
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
  object Label15: TLabel
    Left = 105
    Top = 644
    Width = 48
    Height = 13
    Caption = #35843#25972#21407#22240
  end
  object Edit4: TEdit
    Left = 90
    Top = 13
    Width = 124
    Height = 21
    TabOrder = 0
    OnKeyDown = Edit4KeyDown
  end
  object Memo1: TMemo
    Left = 90
    Top = 43
    Width = 629
    Height = 53
    ReadOnly = True
    TabOrder = 1
  end
  object StringGrid1: TStringGrid
    Left = 36
    Top = 144
    Width = 929
    Height = 358
    ColCount = 9
    FixedCols = 0
    RowCount = 2
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing, goRowSelect]
    PopupMenu = PopupMenu1
    TabOrder = 2
    OnSelectCell = StringGrid1SelectCell
    ColWidths = (
      47
      70
      161
      73
      76
      77
      72
      72
      241)
  end
  object Edit1: TEdit
    Left = 314
    Top = 13
    Width = 405
    Height = 21
    ReadOnly = True
    TabOrder = 3
  end
  object Edit2: TEdit
    Left = 807
    Top = 13
    Width = 158
    Height = 21
    ReadOnly = True
    TabOrder = 4
  end
  object Edit6: TEdit
    Left = 807
    Top = 43
    Width = 158
    Height = 21
    ReadOnly = True
    TabOrder = 5
    Text = '0'
  end
  object Button1: TButton
    Left = 807
    Top = 70
    Width = 167
    Height = 25
    Caption = #21152#24037#21333#25171#21360
    TabOrder = 6
    Visible = False
  end
  object Edit3: TEdit
    Left = 167
    Top = 528
    Width = 129
    Height = 21
    ImeName = #20013#25991'('#31616#20307') - '#26497#28857#20116#31508
    ReadOnly = True
    TabOrder = 7
  end
  object Edit7: TEdit
    Left = 383
    Top = 528
    Width = 145
    Height = 21
    ImeName = #20013#25991'('#31616#20307') - '#26497#28857#20116#31508
    ReadOnly = True
    TabOrder = 8
  end
  object Edit8: TEdit
    Left = 624
    Top = 528
    Width = 137
    Height = 21
    ImeName = #20013#25991'('#31616#20307') - '#26497#28857#20116#31508
    ReadOnly = True
    TabOrder = 9
  end
  object Edit9: TEdit
    Left = 624
    Top = 563
    Width = 137
    Height = 21
    Color = clMoneyGreen
    ImeName = #20013#25991'('#31616#20307') - '#26497#28857#20116#31508
    TabOrder = 10
    OnChange = Edit9Change
    OnKeyPress = Edit9KeyPress
  end
  object Edit5: TEdit
    Left = 383
    Top = 563
    Width = 145
    Height = 21
    Color = clMoneyGreen
    ImeName = #20013#25991'('#31616#20307') - '#26497#28857#20116#31508
    TabOrder = 11
    OnChange = Edit5Change
    OnKeyPress = Edit5KeyPress
  end
  object Edit10: TEdit
    Left = 167
    Top = 563
    Width = 129
    Height = 21
    ImeName = #20013#25991'('#31616#20307') - '#26497#28857#20116#31508
    ReadOnly = True
    TabOrder = 12
  end
  object Memo2: TMemo
    Left = 167
    Top = 590
    Width = 594
    Height = 42
    ReadOnly = True
    TabOrder = 13
  end
  object Button2: TButton
    Left = 814
    Top = 574
    Width = 91
    Height = 25
    Caption = #35843#25972#21152#24037#26126#32454
    TabOrder = 14
    OnClick = Button2Click
  end
  object Edit11: TEdit
    Left = 169
    Top = 641
    Width = 592
    Height = 21
    Color = clMoneyGreen
    TabOrder = 15
  end
  object ZStoredProc1: TZStoredProc
    Connection = Form1.ZConnection1
    Params = <>
    Left = 382
    Top = 279
  end
  object PopupMenu1: TPopupMenu
    Left = 656
    Top = 295
    object Execl1: TMenuItem
      Caption = #23548#20986#21040'Execl'
    end
  end
end
