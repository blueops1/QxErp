object Form47: TForm47
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #21322#25104#21697#29983#20135#32479#35745#26597#35810
  ClientHeight = 627
  ClientWidth = 1102
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
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 1102
    Height = 627
    ActivePage = TabSheet1
    Align = alClient
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = #25353#26102#38388#32479#35745
      OnShow = TabSheet1Show
      object Label2: TLabel
        Left = 72
        Top = 26
        Width = 12
        Height = 13
        Caption = #33258
      end
      object Label3: TLabel
        Left = 288
        Top = 26
        Width = 12
        Height = 13
        Caption = #33267
      end
      object DateTimePicker1: TDateTimePicker
        Left = 96
        Top = 23
        Width = 145
        Height = 21
        Date = 42187.350045567130000000
        Time = 42187.350045567130000000
        ImeName = #20013#25991'('#31616#20307') - '#26497#28857#20116#31508
        TabOrder = 0
      end
      object DateTimePicker2: TDateTimePicker
        Left = 338
        Top = 23
        Width = 143
        Height = 21
        Date = 42187.350101030090000000
        Time = 42187.350101030090000000
        ImeName = #20013#25991'('#31616#20307') - '#26497#28857#20116#31508
        TabOrder = 1
      end
      object Button1: TButton
        Left = 552
        Top = 21
        Width = 113
        Height = 25
        Caption = #26597#35810
        TabOrder = 2
        OnClick = Button1Click
      end
      object StringGrid1: TStringGrid
        Left = 3
        Top = 64
        Width = 529
        Height = 532
        Align = alCustom
        RowCount = 2
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing, goRowSelect]
        PopupMenu = PopupMenu1
        TabOrder = 3
        OnSelectCell = StringGrid1SelectCell
        ColWidths = (
          64
          197
          80
          76
          70)
      end
      object StringGrid2: TStringGrid
        Left = 552
        Top = 64
        Width = 527
        Height = 532
        Align = alCustom
        RowCount = 2
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing, goRowSelect]
        PopupMenu = PopupMenu2
        TabOrder = 4
        ColWidths = (
          64
          75
          75
          98
          175)
      end
    end
    object TabSheet2: TTabSheet
      Caption = #25353#21608#26376#24180#32479#35745
      ImageIndex = 1
      OnShow = TabSheet2Show
      object DateTimePicker3: TDateTimePicker
        Left = 330
        Top = 24
        Width = 143
        Height = 21
        Date = 42187.350045567130000000
        Time = 42187.350045567130000000
        ImeName = #20013#25991'('#31616#20307') - '#26497#28857#20116#31508
        TabOrder = 0
      end
      object Button2: TButton
        Left = 552
        Top = 20
        Width = 113
        Height = 25
        Caption = #26597#35810
        TabOrder = 1
        OnClick = Button2Click
      end
      object StringGrid3: TStringGrid
        Left = 3
        Top = 64
        Width = 529
        Height = 532
        Align = alCustom
        RowCount = 2
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing, goRowSelect]
        PopupMenu = PopupMenu3
        TabOrder = 2
        OnSelectCell = StringGrid3SelectCell
        ColWidths = (
          64
          157
          101
          80
          83)
      end
      object StringGrid4: TStringGrid
        Left = 552
        Top = 64
        Width = 527
        Height = 530
        Align = alCustom
        RowCount = 2
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing, goRowSelect]
        PopupMenu = PopupMenu4
        TabOrder = 3
        ColWidths = (
          64
          99
          106
          104
          115)
      end
      object RadioGroup5: TRadioGroup
        Left = 39
        Top = 11
        Width = 225
        Height = 38
        Caption = #26597#35810#36873#39033
        Columns = 3
        ItemIndex = 0
        Items.Strings = (
          #25353#21608
          #25353#26376
          #25353#24180)
        TabOrder = 4
      end
    end
    object TabSheet3: TTabSheet
      Caption = #26597#35810#25152#26377#21322#25104#21697#24211#23384
      ImageIndex = 2
      OnShow = TabSheet3Show
      object StringGrid5: TStringGrid
        Left = 3
        Top = 41
        Width = 575
        Height = 555
        Align = alCustom
        ColCount = 6
        RowCount = 2
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing, goRowSelect]
        PopupMenu = PopupMenu5
        TabOrder = 0
        OnSelectCell = StringGrid5SelectCell
        ColWidths = (
          64
          149
          92
          87
          77
          76)
      end
      object StringGrid6: TStringGrid
        Left = 584
        Top = 40
        Width = 495
        Height = 555
        Align = alCustom
        RowCount = 2
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing, goRowSelect]
        PopupMenu = PopupMenu6
        TabOrder = 1
        ColWidths = (
          64
          77
          75
          98
          147)
      end
      object Button3: TButton
        Left = 960
        Top = 6
        Width = 119
        Height = 25
        Caption = #26597#35810#20840#37096#21322#25104#21697#24211#23384
        TabOrder = 2
        OnClick = Button3Click
      end
    end
  end
  object ZStoredProc1: TZStoredProc
    Connection = Form1.ZConnection1
    Params = <>
    Left = 336
    Top = 192
  end
  object PopupMenu1: TPopupMenu
    Left = 312
    Top = 224
    object Execl1: TMenuItem
      Caption = #23548#20986#21040'Execl'
      OnClick = Execl1Click
    end
  end
  object PopupMenu2: TPopupMenu
    Left = 640
    Top = 288
    object MenuItem1: TMenuItem
      Caption = #23548#20986#21040'Execl'
      OnClick = MenuItem1Click
    end
  end
  object PopupMenu3: TPopupMenu
    Left = 328
    Top = 352
    object MenuItem2: TMenuItem
      Caption = #23548#20986#21040'Execl'
      OnClick = MenuItem2Click
    end
  end
  object PopupMenu4: TPopupMenu
    Left = 760
    Top = 264
    object MenuItem3: TMenuItem
      Caption = #23548#20986#21040'Execl'
      OnClick = MenuItem3Click
    end
  end
  object PopupMenu5: TPopupMenu
    Left = 864
    Top = 248
    object MenuItem4: TMenuItem
      Caption = #23548#20986#21040'Execl'
      OnClick = MenuItem4Click
    end
  end
  object PopupMenu6: TPopupMenu
    Left = 776
    Top = 392
    object MenuItem5: TMenuItem
      Caption = #23548#20986#21040'Execl'
      OnClick = MenuItem5Click
    end
  end
end
