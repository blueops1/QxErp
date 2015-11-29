object Form17: TForm17
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = #29983#20135#35745#21010#21333#26597#35810
  ClientHeight = 639
  ClientWidth = 1059
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 1059
    Height = 639
    ActivePage = TabSheet3
    Align = alClient
    TabOrder = 0
    object TabSheet3: TTabSheet
      Caption = #29983#20135#35745#21010#26597#35810
      ImageIndex = 2
      object Label12: TLabel
        Left = 45
        Top = 24
        Width = 65
        Height = 18
        AutoSize = False
        Caption = #39033#30446#21517#31216
      end
      object StringGrid1: TStringGrid
        Left = 0
        Top = 56
        Width = 1033
        Height = 193
        Align = alCustom
        ColCount = 9
        DefaultColWidth = 200
        FixedCols = 0
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRowSelect]
        TabOrder = 0
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
      end
      object StringGrid2: TStringGrid
        Left = 0
        Top = 255
        Width = 1051
        Height = 356
        Align = alBottom
        ColCount = 7
        TabOrder = 3
        ColWidths = (
          64
          122
          131
          137
          153
          151
          103)
      end
      object Button8: TButton
        Left = 664
        Top = 17
        Width = 91
        Height = 25
        Caption = #23548#20986#21040'EXECL'
        TabOrder = 4
      end
      object RadioGroup1: TRadioGroup
        Left = 780
        Top = 1
        Width = 225
        Height = 52
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
end
