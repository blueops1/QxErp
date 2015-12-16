object Form48: TForm48
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #19981#33391#36136#26816#24773#20917#35760#24405#30331#35760
  ClientHeight = 351
  ClientWidth = 668
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 66
    Top = 27
    Width = 48
    Height = 13
    Caption = #21592#24037#22995#21517
  end
  object Label2: TLabel
    Left = 458
    Top = 27
    Width = 48
    Height = 13
    Caption = #36136#26816#26085#26399
  end
  object Label3: TLabel
    Left = 42
    Top = 67
    Width = 72
    Height = 13
    Caption = #19981#33391#36136#26816#24773#20917
  end
  object Label4: TLabel
    Left = 266
    Top = 27
    Width = 48
    Height = 13
    Caption = #20135#21697#31867#22411
  end
  object DateTimePicker1: TDateTimePicker
    Left = 512
    Top = 24
    Width = 97
    Height = 21
    Date = 42351.504665428240000000
    Time = 42351.504665428240000000
    TabOrder = 0
  end
  object ComboBox1: TComboBox
    Left = 120
    Top = 24
    Width = 129
    Height = 21
    DropDownCount = 16
    TabOrder = 1
    OnKeyDown = ComboBox1KeyDown
  end
  object Memo1: TMemo
    Left = 120
    Top = 64
    Width = 489
    Height = 201
    TabOrder = 2
  end
  object Button1: TButton
    Left = 414
    Top = 296
    Width = 75
    Height = 25
    Caption = #20445#23384
    TabOrder = 3
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 534
    Top = 296
    Width = 75
    Height = 25
    Caption = #21462#28040
    TabOrder = 4
    OnClick = Button2Click
  end
  object ComboBox2: TComboBox
    Left = 328
    Top = 24
    Width = 113
    Height = 21
    TabOrder = 5
    Items.Strings = (
      #30406#24335#25903#24231
      #26495#24335#25903#24231
      #20280#32553#32541)
  end
  object ZStoredProc1: TZStoredProc
    Connection = Form1.ZConnection1
    Params = <>
    Left = 440
    Top = 184
  end
end
