object Form106: TForm106
  Left = 0
  Top = 0
  Caption = #21152#24037#21333#32479#35745
  ClientHeight = 674
  ClientWidth = 1114
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
  object Label4: TLabel
    Left = 651
    Top = 168
    Width = 48
    Height = 13
    Caption = #32467#31639#37329#39069
    Visible = False
  end
  object Label3: TLabel
    Left = 422
    Top = 168
    Width = 83
    Height = 13
    Caption = #21457#31080#31246#29575#65288'%'#65289
  end
  object Label2: TLabel
    Left = 65
    Top = 168
    Width = 48
    Height = 13
    Caption = #21457#31080#32534#21495
  end
  object Label5: TLabel
    Left = 53
    Top = 212
    Width = 60
    Height = 13
    Alignment = taRightJustify
    Caption = #32467#31639#21333#22791#27880
  end
  object Label1: TLabel
    Left = 53
    Top = 29
    Width = 84
    Height = 13
    Caption = #21152#24037#21830#21517#31216#26597#35810
  end
  object Label8: TLabel
    Left = 813
    Top = 67
    Width = 60
    Height = 13
    Caption = #21152#24037#21830#32534#21495
  end
  object Label9: TLabel
    Left = 77
    Top = 67
    Width = 60
    Height = 13
    Caption = #21152#24037#21830#21517#31216
  end
  object Label18: TLabel
    Left = 77
    Top = 185
    Width = 60
    Height = 13
    Caption = #21152#24037#21830#22320#22336
  end
  object Label10: TLabel
    Left = 77
    Top = 107
    Width = 60
    Height = 13
    Caption = #21152#24037#21830#24080#21495
  end
  object Label11: TLabel
    Left = 65
    Top = 147
    Width = 72
    Height = 13
    Caption = #21152#24037#21830#24320#25143#34892
  end
  object Label12: TLabel
    Left = 837
    Top = 107
    Width = 36
    Height = 13
    Caption = #32852#31995#20154
    Visible = False
  end
  object Label13: TLabel
    Left = 825
    Top = 147
    Width = 48
    Height = 13
    Caption = #32852#31995#30005#35805
    Visible = False
  end
  object Label6: TLabel
    Left = 53
    Top = 221
    Width = 84
    Height = 13
    Caption = #21152#24037#32467#31639#21333#32534#21495
  end
  object Memo2: TMemo
    Left = 127
    Top = 209
    Width = 699
    Height = 49
    TabOrder = 13
    Visible = False
  end
  object Edit4: TEdit
    Left = 705
    Top = 165
    Width = 121
    Height = 21
    Color = clMoneyGreen
    ReadOnly = True
    TabOrder = 18
    Text = '0'
    Visible = False
  end
  object Edit1: TEdit
    Left = 127
    Top = 165
    Width = 274
    Height = 21
    Color = clMoneyGreen
    TabOrder = 16
  end
  object Button4: TButton
    Left = 882
    Top = 207
    Width = 92
    Height = 25
    Caption = #21462#28040
    TabOrder = 15
    Visible = False
  end
  object Button3: TButton
    Left = 882
    Top = 168
    Width = 92
    Height = 25
    Caption = #20445#23384#32467#31639#21333
    TabOrder = 14
    Visible = False
  end
  object Edit3: TEdit
    Left = 504
    Top = 165
    Width = 119
    Height = 21
    Color = clMoneyGreen
    TabOrder = 17
    Text = '0'
    Visible = False
  end
  object Edit5: TEdit
    Left = 538
    Top = 224
    Width = 394
    Height = 21
    TabOrder = 19
    TextHint = #27492#22788#28155#21152#32467#31639#21333#26126#32454#22791#27880#65292#26368#22810#20116#21313#20010#27721#23383#12290
    Visible = False
  end
  object ComboBox1: TComboBox
    Left = 143
    Top = 26
    Width = 858
    Height = 21
    DropDownCount = 16
    TabOrder = 0
    OnKeyDown = ComboBox1KeyDown
    OnSelect = ComboBox1Select
  end
  object Edit15: TEdit
    Left = 880
    Top = 64
    Width = 121
    Height = 21
    Color = clMoneyGreen
    ReadOnly = True
    TabOrder = 1
  end
  object Edit8: TEdit
    Left = 143
    Top = 64
    Width = 658
    Height = 21
    TabOrder = 2
  end
  object Edit14: TEdit
    Left = 143
    Top = 182
    Width = 858
    Height = 21
    TabOrder = 3
    Visible = False
  end
  object Edit9: TEdit
    Left = 143
    Top = 104
    Width = 658
    Height = 21
    TabOrder = 4
    Visible = False
  end
  object Edit10: TEdit
    Left = 143
    Top = 144
    Width = 658
    Height = 21
    TabOrder = 5
    Visible = False
  end
  object Edit11: TEdit
    Left = 880
    Top = 104
    Width = 121
    Height = 21
    TabOrder = 6
    Visible = False
  end
  object Edit12: TEdit
    Left = 880
    Top = 144
    Width = 121
    Height = 21
    TabOrder = 7
    Visible = False
  end
  object Edit2: TEdit
    Left = 143
    Top = 218
    Width = 129
    Height = 21
    TabStop = False
    Color = clMoneyGreen
    ReadOnly = True
    TabOrder = 8
  end
  object Button1: TButton
    Left = 74
    Top = 355
    Width = 107
    Height = 25
    Caption = #28155#21152#21152#24037#21333'>>'
    TabOrder = 9
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 224
    Top = 355
    Width = 107
    Height = 25
    Caption = '<<'#21024#38500#21152#24037#21333
    TabOrder = 10
    OnClick = Button2Click
  end
  object StringGrid1: TStringGrid
    Left = 48
    Top = 91
    Width = 484
    Height = 254
    ColCount = 4
    FixedCols = 0
    RowCount = 2
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSelect]
    TabOrder = 11
    OnDblClick = StringGrid1DblClick
    OnSelectCell = StringGrid1SelectCell
    ColWidths = (
      48
      90
      93
      213)
  end
  object StringGrid2: TStringGrid
    Left = 48
    Top = 391
    Width = 487
    Height = 254
    FixedCols = 0
    RowCount = 2
    TabOrder = 12
    OnDblClick = StringGrid2DblClick
    OnSelectCell = StringGrid2SelectCell
    ColWidths = (
      46
      90
      101
      89
      121)
  end
  object StringGrid3: TStringGrid
    Left = 555
    Top = 91
    Width = 526
    Height = 554
    FixedCols = 0
    RowCount = 2
    PopupMenu = PopupMenu1
    TabOrder = 20
    OnDblClick = StringGrid2DblClick
    ColWidths = (
      46
      148
      97
      99
      104)
  end
  object Button5: TButton
    Left = 378
    Top = 355
    Width = 75
    Height = 25
    Caption = #32479#35745
    TabOrder = 21
    OnClick = Button5Click
  end
  object ZStoredProc1: TZStoredProc
    Connection = Form1.ZConnection1
    Params = <>
    Left = 752
    Top = 288
  end
  object PopupMenu1: TPopupMenu
    Left = 616
    Top = 264
    object EXECL1: TMenuItem
      Caption = #23548#20986#21040'EXECL'
      OnClick = EXECL1Click
    end
  end
end
