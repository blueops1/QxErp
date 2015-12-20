object Form12: TForm12
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = #21322#25104#21697#26597#35810
  ClientHeight = 681
  ClientWidth = 1084
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
    Width = 1084
    Height = 681
    ActivePage = TabSheet1
    Align = alClient
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = #25353#21322#25104#21697#26597#35810#24211#23384
      ImageIndex = 1
      OnShow = TabSheet1Show
      object StringGrid5: TStringGrid
        Left = 3
        Top = 41
        Width = 575
        Height = 555
        Align = alCustom
        ColCount = 6
        RowCount = 2
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSelect]
        TabOrder = 0
        OnSelectCell = StringGrid5SelectCell
        ColWidths = (
          64
          99
          106
          88
          83
          93)
      end
      object StringGrid6: TStringGrid
        Left = 581
        Top = 40
        Width = 495
        Height = 555
        Align = alCustom
        RowCount = 2
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSelect]
        TabOrder = 1
        ColWidths = (
          64
          84
          83
          104
          115)
      end
      object Button3: TButton
        Left = 597
        Top = 5
        Width = 119
        Height = 25
        Caption = #26597#35810#20840#37096#21322#25104#21697#24211#23384
        TabOrder = 2
      end
      object Edit1: TEdit
        Left = 144
        Top = 7
        Width = 434
        Height = 21
        TabOrder = 3
        OnChange = Edit1Change
      end
    end
    object TabSheet3: TTabSheet
      Caption = #25353#25104#21697#26597#35810#21322#25104#21697#24211#23384
      ImageIndex = 2
      OnShow = TabSheet3Show
      object Label12: TLabel
        Left = 45
        Top = 24
        Width = 65
        Height = 18
        AutoSize = False
        Caption = #20135#21697#35268#26684
      end
      object StringGrid1: TStringGrid
        Left = 0
        Top = 48
        Width = 1073
        Height = 254
        Align = alCustom
        ColCount = 9
        DefaultColWidth = 200
        FixedCols = 0
        RowCount = 2
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRowSelect]
        PopupMenu = PopupMenu1
        TabOrder = 0
        OnSelectCell = StringGrid1SelectCell
      end
      object Edit9: TEdit
        Left = 116
        Top = 19
        Width = 365
        Height = 21
        ImeName = #20013#25991'('#31616#20307') - '#26497#28857#20116#31508
        TabOrder = 1
        OnChange = Edit9Change
      end
      object Button6: TButton
        Left = 497
        Top = 17
        Width = 75
        Height = 25
        Caption = #26597#35810#20840#37096
        TabOrder = 2
        OnClick = Button6Click
      end
      object StringGrid2: TStringGrid
        Left = 0
        Top = 301
        Width = 513
        Height = 340
        Align = alCustom
        RowCount = 2
        PopupMenu = PopupMenu2
        TabOrder = 3
        OnSelectCell = StringGrid2SelectCell
        ColWidths = (
          64
          82
          103
          117
          126)
      end
      object StringGrid7: TStringGrid
        Left = 519
        Top = 301
        Width = 546
        Height = 340
        Align = alCustom
        RowCount = 2
        PopupMenu = PopupMenu3
        TabOrder = 4
        ColWidths = (
          64
          82
          88
          92
          89)
      end
    end
  end
  object ZStoredProc1: TZStoredProc
    Connection = Form1.ZConnection1
    Params = <>
    Left = 808
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
    Left = 320
    Top = 440
    object MenuItem1: TMenuItem
      Caption = #23548#20986#21040'Execl'
      OnClick = MenuItem1Click
    end
  end
  object PopupMenu3: TPopupMenu
    Left = 672
    Top = 456
    object MenuItem2: TMenuItem
      Caption = #23548#20986#21040'Execl'
      OnClick = MenuItem2Click
    end
  end
end
