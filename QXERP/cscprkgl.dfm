object Form65: TForm65
  Left = 0
  Top = 0
  Caption = #27979#35797#20135#21697#24402#24211#31649#29702
  ClientHeight = 503
  ClientWidth = 761
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
  object Label1: TLabel
    Left = 40
    Top = 27
    Width = 84
    Height = 13
    Caption = #27979#35797#20986#24211#21333#32534#21495
  end
  object Label2: TLabel
    Left = 240
    Top = 27
    Width = 60
    Height = 13
    Caption = #20986#24211#30003#35831#20154
  end
  object Label3: TLabel
    Left = 76
    Top = 61
    Width = 48
    Height = 13
    Caption = #20986#24211#29702#30001
  end
  object Label6: TLabel
    Left = 411
    Top = 27
    Width = 48
    Height = 13
    Caption = #20986#24211#26085#26399
  end
  object Label4: TLabel
    Left = 61
    Top = 463
    Width = 420
    Height = 13
    Caption = #27880#65306#20840#37096#24402#24211#65292#21017#26126#32454#20013#19981#29992#22635#20837#23454#38469#24402#24211#25968#37327#65292#30452#25509#28857#20987#12304#20840#37096#24402#24211#12305#21363#21487#12290
  end
  object Label5: TLabel
    Left = 600
    Top = 83
    Width = 72
    Height = 13
    Caption = #26159#21542#20840#37096#36864#22238
  end
  object Label7: TLabel
    Left = 556
    Top = 27
    Width = 72
    Height = 13
    Caption = #26411#27425#20837#24211#26085#26399
  end
  object Edit1: TEdit
    Left = 130
    Top = 24
    Width = 95
    Height = 21
    TabOrder = 0
    OnKeyDown = Edit1KeyDown
  end
  object Memo1: TMemo
    Left = 130
    Top = 58
    Width = 464
    Height = 57
    TabOrder = 1
  end
  object StringGrid1: TStringGrid
    Left = 24
    Top = 131
    Width = 709
    Height = 305
    TabStop = False
    FixedCols = 0
    RowCount = 2
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing]
    TabOrder = 2
    OnSelectCell = StringGrid1SelectCell
    OnSetEditText = StringGrid1SetEditText
    ColWidths = (
      70
      151
      114
      122
      213)
  end
  object Button2: TButton
    Left = 542
    Top = 458
    Width = 75
    Height = 25
    Caption = #20445#23384#20449#24687
    TabOrder = 3
    OnClick = Button2Click
  end
  object Edit2: TEdit
    Left = 311
    Top = 24
    Width = 82
    Height = 21
    TabOrder = 4
  end
  object Edit3: TEdit
    Left = 465
    Top = 24
    Width = 80
    Height = 21
    TabOrder = 5
  end
  object Button1: TButton
    Left = 638
    Top = 458
    Width = 75
    Height = 25
    Caption = #20840#37096#24402#24211
    TabOrder = 6
    OnClick = Button1Click
  end
  object Edit4: TEdit
    Left = 681
    Top = 80
    Width = 52
    Height = 21
    ReadOnly = True
    TabOrder = 7
  end
  object Edit5: TEdit
    Left = 638
    Top = 24
    Width = 100
    Height = 21
    TabOrder = 8
  end
  object ZStoredProc1: TZStoredProc
    Connection = Form1.ZConnection1
    Params = <>
    Left = 520
    Top = 288
  end
end
