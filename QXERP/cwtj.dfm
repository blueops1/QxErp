object Form107: TForm107
  Left = 0
  Top = 0
  Caption = #38144#21806#32479#35745
  ClientHeight = 749
  ClientWidth = 1085
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 120
  TextHeight = 16
  object Label1: TLabel
    Left = 112
    Top = 40
    Width = 60
    Height = 16
    Caption = #21551#22987#26085#26399
  end
  object Label2: TLabel
    Left = 408
    Top = 40
    Width = 60
    Height = 16
    Caption = #32467#26463#26085#26399
  end
  object DateTimePicker1: TDateTimePicker
    Left = 184
    Top = 32
    Width = 186
    Height = 24
    Date = 43090.508968402780000000
    Time = 43090.508968402780000000
    TabOrder = 0
  end
  object DateTimePicker2: TDateTimePicker
    Left = 504
    Top = 32
    Width = 186
    Height = 24
    Date = 43090.508968402780000000
    Time = 43090.508968402780000000
    TabOrder = 1
  end
  object Button1: TButton
    Left = 744
    Top = 31
    Width = 121
    Height = 25
    Caption = #26597#35810
    TabOrder = 2
    OnClick = Button1Click
  end
  object StringGrid1: TStringGrid
    Left = 8
    Top = 88
    Width = 1073
    Height = 665
    ColCount = 6
    PopupMenu = PopupMenu1
    TabOrder = 3
    ColWidths = (
      64
      148
      254
      169
      161
      174)
  end
  object ZStoredProc1: TZStoredProc
    Connection = Form1.ZConnection1
    Params = <>
    Left = 856
    Top = 568
  end
  object PopupMenu1: TPopupMenu
    Left = 312
    Top = 224
    object Execl1: TMenuItem
      Caption = #23548#20986#21040'Execl'
      OnClick = Execl1Click
    end
  end
end
