object Form105: TForm105
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = #21512#21516#21457#36135#25968#37327#26597#35810
  ClientHeight = 635
  ClientWidth = 1115
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
  object Label12: TLabel
    Left = 96
    Top = 22
    Width = 49
    Height = 18
    AutoSize = False
    Caption = #21512#21516#32534#21495
  end
  object Label1: TLabel
    Left = 96
    Top = 59
    Width = 49
    Height = 18
    AutoSize = False
    Caption = #39033#30446#21517#31216
  end
  object Edit9: TEdit
    Left = 162
    Top = 21
    Width = 365
    Height = 21
    ImeName = #20013#25991'('#31616#20307') - '#26497#28857#20116#31508
    TabOrder = 0
  end
  object Button1: TButton
    Left = 545
    Top = 17
    Width = 75
    Height = 25
    Caption = #26597#35810
    TabOrder = 1
    OnClick = Button1Click
  end
  object StringGrid2: TStringGrid
    Left = 0
    Top = 88
    Width = 1115
    Height = 547
    Align = alBottom
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing]
    TabOrder = 2
    ExplicitWidth = 1113
    ColWidths = (
      112
      104
      114
      123
      611)
  end
  object Edit1: TEdit
    Left = 162
    Top = 56
    Width = 695
    Height = 21
    TabOrder = 3
  end
  object Button2: TButton
    Left = 888
    Top = 52
    Width = 75
    Height = 25
    Caption = #26174#31034#26126#32454
    TabOrder = 4
    OnClick = Button2Click
  end
  object Button8: TButton
    Left = 995
    Top = 52
    Width = 91
    Height = 25
    Caption = #23548#20986#21040'EXECL'
    TabOrder = 5
    OnClick = Button8Click
  end
  object ZStoredProc1: TZStoredProc
    Connection = Form1.ZConnection1
    Params = <>
    Left = 688
    Top = 8
  end
end
