object Form16: TForm16
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = #25104#21697#32479#35745#26597#35810
  ClientHeight = 922
  ClientWidth = 1438
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -14
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  PixelsPerInch = 120
  TextHeight = 17
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 1438
    Height = 922
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    ActivePage = TabSheet1
    Align = alClient
    TabOrder = 0
    object TabSheet1: TTabSheet
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = #25104#21697#20986#20837#24211#24080#25143
      object Label2: TLabel
        Left = 146
        Top = 35
        Width = 14
        Height = 17
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = #33258
      end
      object Label3: TLabel
        Left = 429
        Top = 35
        Width = 14
        Height = 17
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = #33267
      end
      object DateTimePicker1: TDateTimePicker
        Left = 178
        Top = 31
        Width = 243
        Height = 25
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Date = 42187.350045567130000000
        Time = 42187.350045567130000000
        ImeName = #20013#25991'('#31616#20307') - '#26497#28857#20116#31508
        TabOrder = 0
      end
      object DateTimePicker2: TDateTimePicker
        Left = 452
        Top = 31
        Width = 244
        Height = 25
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Date = 42187.350101030090000000
        Time = 42187.350101030090000000
        ImeName = #20013#25991'('#31616#20307') - '#26497#28857#20116#31508
        TabOrder = 1
      end
      object Button1: TButton
        Left = 722
        Top = 29
        Width = 98
        Height = 32
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = #26597#35810
        TabOrder = 2
        OnClick = Button1Click
      end
      object StringGrid1: TStringGrid
        Left = 4
        Top = 101
        Width = 692
        Height = 765
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Align = alCustom
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSelect]
        TabOrder = 3
        OnSelectCell = StringGrid1SelectCell
        ColWidths = (
          64
          99
          106
          104
          115)
      end
      object StringGrid2: TStringGrid
        Left = 722
        Top = 101
        Width = 689
        Height = 765
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Align = alCustom
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing, goRowSelect]
        TabOrder = 4
        ColWidths = (
          64
          99
          106
          104
          115)
      end
      object Button5: TButton
        Left = 931
        Top = 29
        Width = 119
        Height = 32
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = #23548#20986#21040'EXECL'
        TabOrder = 5
        OnClick = Button5Click
      end
      object RadioGroup1: TRadioGroup
        Left = 1078
        Top = 4
        Width = 294
        Height = 72
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = #23548#20986#34920#36873#25321
        Columns = 3
        ItemIndex = 0
        Items.Strings = (
          #34920#19968
          #34920#20108
          #20840#37096)
        TabOrder = 6
      end
    end
    object TabSheet2: TTabSheet
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = #25353#21608#32479#35745
      ImageIndex = 1
      object DateTimePicker3: TDateTimePicker
        Left = 178
        Top = 31
        Width = 243
        Height = 25
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Date = 42187.350045567130000000
        Time = 42187.350045567130000000
        ImeName = #20013#25991'('#31616#20307') - '#26497#28857#20116#31508
        TabOrder = 0
      end
      object Button2: TButton
        Left = 471
        Top = 31
        Width = 98
        Height = 33
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = #26597#35810
        TabOrder = 1
        OnClick = Button2Click
      end
      object StringGrid3: TStringGrid
        Left = 4
        Top = 101
        Width = 692
        Height = 765
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Align = alCustom
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSelect]
        TabOrder = 2
        OnSelectCell = StringGrid3SelectCell
        ColWidths = (
          64
          99
          106
          104
          115)
      end
      object StringGrid4: TStringGrid
        Left = 722
        Top = 101
        Width = 689
        Height = 765
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Align = alCustom
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing, goRowSelect]
        TabOrder = 3
        ColWidths = (
          64
          99
          106
          104
          115)
      end
      object Button6: TButton
        Left = 900
        Top = 31
        Width = 119
        Height = 33
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = #23548#20986#21040'EXECL'
        TabOrder = 4
        OnClick = Button6Click
      end
      object RadioGroup2: TRadioGroup
        Left = 1046
        Top = 7
        Width = 294
        Height = 71
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
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
    object TabSheet3: TTabSheet
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = #25353#26376#32479#35745
      ImageIndex = 2
      object DateTimePicker4: TDateTimePicker
        Left = 178
        Top = 31
        Width = 243
        Height = 25
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Date = 42187.350045567130000000
        Time = 42187.350045567130000000
        ImeName = #20013#25991'('#31616#20307') - '#26497#28857#20116#31508
        TabOrder = 0
      end
      object Button3: TButton
        Left = 471
        Top = 31
        Width = 98
        Height = 33
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = #26597#35810
        TabOrder = 1
        OnClick = Button3Click
      end
      object StringGrid5: TStringGrid
        Left = 4
        Top = 101
        Width = 692
        Height = 765
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Align = alCustom
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSelect]
        TabOrder = 2
        OnSelectCell = StringGrid5SelectCell
        ColWidths = (
          64
          99
          106
          104
          115)
      end
      object StringGrid6: TStringGrid
        Left = 722
        Top = 101
        Width = 689
        Height = 765
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Align = alCustom
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing, goRowSelect]
        TabOrder = 3
        ColWidths = (
          64
          99
          106
          104
          115)
      end
      object Button7: TButton
        Left = 900
        Top = 31
        Width = 119
        Height = 33
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = #23548#20986#21040'EXECL'
        TabOrder = 4
        OnClick = Button7Click
      end
      object RadioGroup3: TRadioGroup
        Left = 1046
        Top = 7
        Width = 294
        Height = 71
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
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
    object TabSheet4: TTabSheet
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = #25353#24180#32479#35745
      ImageIndex = 3
      object DateTimePicker5: TDateTimePicker
        Left = 178
        Top = 31
        Width = 243
        Height = 25
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Date = 42187.350045567130000000
        Time = 42187.350045567130000000
        ImeName = #20013#25991'('#31616#20307') - '#26497#28857#20116#31508
        TabOrder = 0
      end
      object Button4: TButton
        Left = 471
        Top = 31
        Width = 98
        Height = 33
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = #26597#35810
        TabOrder = 1
        OnClick = Button4Click
      end
      object StringGrid7: TStringGrid
        Left = 4
        Top = 101
        Width = 692
        Height = 765
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Align = alCustom
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSelect]
        TabOrder = 2
        OnSelectCell = StringGrid7SelectCell
        ColWidths = (
          64
          99
          106
          104
          115)
      end
      object StringGrid8: TStringGrid
        Left = 722
        Top = 101
        Width = 689
        Height = 765
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Align = alCustom
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing, goRowSelect]
        TabOrder = 3
        ColWidths = (
          64
          99
          106
          104
          115)
      end
      object Button8: TButton
        Left = 900
        Top = 31
        Width = 119
        Height = 33
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = #23548#20986#21040'EXECL'
        TabOrder = 4
        OnClick = Button8Click
      end
      object RadioGroup4: TRadioGroup
        Left = 1046
        Top = 7
        Width = 294
        Height = 71
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
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
  object ZQuery1: TZQuery
    Connection = Form1.ZConnection1
    Params = <>
    Left = 64
    Top = 32
  end
end
