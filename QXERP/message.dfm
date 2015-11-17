object Form18: TForm18
  Left = 0
  Top = 0
  Caption = #22312#32447#28040#24687
  ClientHeight = 460
  ClientWidth = 1009
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 1009
    Height = 460
    ActivePage = TabSheet1
    Align = alClient
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = #28040#24687#21457#36865
      ExplicitLeft = 8
      ExplicitTop = 28
      object Label1: TLabel
        Left = 40
        Top = 27
        Width = 36
        Height = 13
        Caption = #21457#36865#33267
      end
      object Label2: TLabel
        Left = 40
        Top = 59
        Width = 48
        Height = 13
        Caption = #28040#24687#20869#23481
      end
      object ComboBox1: TComboBox
        Left = 112
        Top = 24
        Width = 145
        Height = 21
        TabOrder = 0
        OnDropDown = ComboBox1DropDown
      end
      object Edit1: TEdit
        Left = 112
        Top = 56
        Width = 697
        Height = 21
        TabOrder = 1
      end
      object Button1: TButton
        Left = 480
        Top = 120
        Width = 75
        Height = 25
        Caption = #21457#36865
        TabOrder = 2
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'TabSheet2'
      ImageIndex = 1
      ExplicitWidth = 281
      ExplicitHeight = 165
    end
  end
  object ZQuery1: TZQuery
    Params = <>
    Left = 832
    Top = 360
  end
end
