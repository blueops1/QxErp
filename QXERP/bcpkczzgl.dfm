object Form86: TForm86
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #24120#35268#21322#25104#21697#24211#23384#36319#36394#35774#32622
  ClientHeight = 554
  ClientWidth = 852
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
  object Bevel2: TBevel
    Left = 33
    Top = 68
    Width = 308
    Height = 395
    Shape = bsFrame
    Style = bsRaised
  end
  object Bevel1: TBevel
    Left = 399
    Top = 68
    Width = 409
    Height = 395
    Shape = bsFrame
    Style = bsRaised
  end
  object Label1: TLabel
    Left = 33
    Top = 26
    Width = 96
    Height = 13
    Caption = #36755#20837#20135#21697#21517#31216#26597#35810
  end
  object Label2: TLabel
    Left = 57
    Top = 485
    Width = 48
    Height = 13
    Caption = #29289#21697#32534#21495
  end
  object Label3: TLabel
    Left = 260
    Top = 485
    Width = 48
    Height = 13
    Caption = #29289#21697#21517#31216
  end
  object Label4: TLabel
    Left = 454
    Top = 485
    Width = 48
    Height = 13
    Caption = #24211#23384#19979#38480
  end
  object Label5: TLabel
    Left = 339
    Top = 26
    Width = 228
    Height = 13
    Caption = #36755#20837#29289#21697#21517#31216#20851#38190#23383#21518#22238#36710#65292#36827#34892#27169#31946#26597#35810
  end
  object Label8: TLabel
    Left = 542
    Top = 60
    Width = 96
    Height = 16
    Caption = #24211#23384#36319#36394#21015#34920
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = False
  end
  object Label6: TLabel
    Left = 134
    Top = 62
    Width = 112
    Height = 16
    Caption = #24211#23384#26410#36319#36394#21015#34920
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = False
  end
  object StringGrid1: TStringGrid
    Left = 47
    Top = 82
    Width = 281
    Height = 369
    ColCount = 3
    FixedCols = 0
    RowCount = 2
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSelect]
    TabOrder = 0
    OnSelectCell = StringGrid1SelectCell
    ColWidths = (
      64
      75
      105)
  end
  object StringGrid2: TStringGrid
    Left = 415
    Top = 82
    Width = 377
    Height = 369
    ColCount = 4
    FixedCols = 0
    RowCount = 2
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing, goRowSelect]
    TabOrder = 1
    OnSelectCell = StringGrid2SelectCell
    ColWidths = (
      52
      87
      127
      70)
  end
  object Button1: TButton
    Left = 350
    Top = 146
    Width = 43
    Height = 41
    Caption = '>'
    TabOrder = 2
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 350
    Top = 234
    Width = 43
    Height = 41
    Caption = #21024#38500
    TabOrder = 3
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 655
    Top = 480
    Width = 137
    Height = 25
    Caption = #35774#32622#36319#36394#39033#30446#24211#23384#19979#38480
    TabOrder = 4
    WordWrap = True
    OnClick = Button3Click
  end
  object Edit1: TEdit
    Left = 119
    Top = 482
    Width = 121
    Height = 21
    ReadOnly = True
    TabOrder = 5
  end
  object Edit2: TEdit
    Left = 314
    Top = 482
    Width = 121
    Height = 21
    ReadOnly = True
    TabOrder = 6
  end
  object Edit3: TEdit
    Left = 514
    Top = 482
    Width = 121
    Height = 21
    TabOrder = 7
    OnKeyPress = Edit3KeyPress
  end
  object Edit4: TEdit
    Left = 144
    Top = 24
    Width = 164
    Height = 21
    TabOrder = 8
    OnKeyDown = Edit4KeyDown
  end
  object Button4: TButton
    Left = 350
    Top = 322
    Width = 43
    Height = 41
    Caption = #28165#38500
    TabOrder = 9
    OnClick = Button4Click
  end
  object ZStoredProc1: TZStoredProc
    Connection = Form1.ZConnection1
    Params = <>
    Left = 527
    Top = 215
  end
end
