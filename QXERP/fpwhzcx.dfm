object Form26: TForm26
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #21457#31080#26410#26680#24080#26597#35810
  ClientHeight = 515
  ClientWidth = 928
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
    Left = 32
    Top = 24
    Width = 108
    Height = 13
    Caption = #36755#20837#35201#26597#35810#30340#20379#24212#21830
  end
  object Label2: TLabel
    Left = 152
    Top = 53
    Width = 210
    Height = 13
    Caption = #36755#20837'*'#34920#31034#26597#35810#25152#26377#20379#24212#21830#30340#26410#26680#24080#20449#24687
  end
  object ComboBox1: TComboBox
    Left = 152
    Top = 21
    Width = 545
    Height = 21
    TabOrder = 0
    OnKeyDown = ComboBox1KeyDown
  end
  object StringGrid1: TStringGrid
    Left = 23
    Top = 72
    Width = 881
    Height = 401
    ColCount = 9
    RowCount = 2
    TabOrder = 1
    OnDrawCell = StringGrid1DrawCell
    ColWidths = (
      44
      73
      228
      80
      77
      71
      104
      82
      85)
  end
  object Button1: TButton
    Left = 752
    Top = 19
    Width = 97
    Height = 25
    Caption = #26597#35810
    TabOrder = 2
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 752
    Top = 482
    Width = 97
    Height = 25
    Caption = #23548#20986#21040'EXECL'
    TabOrder = 3
    OnClick = Button2Click
  end
  object ZStoredProc1: TZStoredProc
    Connection = Form1.ZConnection1
    Params = <>
    Left = 736
    Top = 416
  end
end
