object Form18: TForm18
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #22312#32447#28040#24687
  ClientHeight = 615
  ClientWidth = 1282
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -14
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 120
  TextHeight = 17
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 1282
    Height = 615
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
      Caption = #28040#24687#21457#36865
      object Label1: TLabel
        Left = 68
        Top = 35
        Width = 42
        Height = 17
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = #21457#36865#33267
      end
      object Label2: TLabel
        Left = 52
        Top = 143
        Width = 56
        Height = 17
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = #28040#24687#20869#23481
      end
      object Label3: TLabel
        Left = 52
        Top = 88
        Width = 56
        Height = 17
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = #20449#24687#26631#39064
      end
      object ComboBox1: TComboBox
        Left = 146
        Top = 31
        Width = 190
        Height = 25
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        DropDownCount = 16
        TabOrder = 0
        OnDropDown = ComboBox1DropDown
      end
      object Button1: TButton
        Left = 960
        Top = 513
        Width = 98
        Height = 32
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = #21457#36865
        TabOrder = 1
        OnClick = Button1Click
      end
      object Memo2: TMemo
        Left = 146
        Top = 139
        Width = 1090
        Height = 344
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        TabOrder = 2
      end
      object Edit1: TEdit
        Left = 146
        Top = 84
        Width = 1090
        Height = 25
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        TabOrder = 3
      end
      object Button11: TButton
        Left = 1098
        Top = 513
        Width = 109
        Height = 32
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = #32534#36753#26032#28040#24687
        TabOrder = 4
        OnClick = Button11Click
      end
    end
    object TabSheet2: TTabSheet
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = #28040#24687#22788#29702
      ImageIndex = 1
      OnShow = TabSheet2Show
      object Memo1: TMemo
        Left = 0
        Top = 213
        Width = 1257
        Height = 290
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        ReadOnly = True
        ScrollBars = ssVertical
        TabOrder = 0
      end
      object StringGrid1: TStringGrid
        Left = 0
        Top = 0
        Width = 1274
        Height = 205
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Align = alTop
        ColCount = 4
        RowCount = 2
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRowSelect]
        TabOrder = 1
        OnSelectCell = StringGrid1SelectCell
        ColWidths = (
          64
          130
          145
          609)
      end
      object Button4: TButton
        Left = 806
        Top = 519
        Width = 105
        Height = 33
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = #25910#34255
        TabOrder = 2
        OnClick = Button4Click
      end
      object Button5: TButton
        Left = 1015
        Top = 519
        Width = 137
        Height = 33
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = #20002#20837#22238#25910#31665
        TabOrder = 3
        OnClick = Button5Click
      end
      object Button10: TButton
        Left = 607
        Top = 519
        Width = 106
        Height = 33
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = #22238#22797
        TabOrder = 4
        OnClick = Button10Click
      end
    end
    object TabSheet3: TTabSheet
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = #25910#34255#30340#20449#24687
      ImageIndex = 2
      OnShow = TabSheet3Show
      object StringGrid2: TStringGrid
        Left = 0
        Top = 0
        Width = 1274
        Height = 205
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Align = alTop
        ColCount = 4
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRowSelect]
        TabOrder = 0
        OnSelectCell = StringGrid2SelectCell
        ColWidths = (
          64
          130
          145
          609)
      end
      object Memo3: TMemo
        Left = 0
        Top = 213
        Width = 1257
        Height = 290
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        ReadOnly = True
        ScrollBars = ssVertical
        TabOrder = 1
      end
      object Button3: TButton
        Left = 1057
        Top = 519
        Width = 158
        Height = 33
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = #21462#28040#25910#34255#26631#35760
        TabOrder = 2
        OnClick = Button3Click
      end
    end
    object TabSheet5: TTabSheet
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = #22238#25910#31665
      ImageIndex = 4
      OnShow = TabSheet5Show
      object StringGrid4: TStringGrid
        Left = 0
        Top = 0
        Width = 1274
        Height = 205
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Align = alTop
        ColCount = 4
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRowSelect]
        TabOrder = 0
        OnSelectCell = StringGrid4SelectCell
        ColWidths = (
          64
          130
          145
          609)
      end
      object Memo5: TMemo
        Left = 0
        Top = 213
        Width = 1257
        Height = 290
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        ReadOnly = True
        ScrollBars = ssVertical
        TabOrder = 1
      end
      object Button8: TButton
        Left = 868
        Top = 519
        Width = 159
        Height = 33
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = #24443#24213#21024#38500#24403#21069#20449#24687
        TabOrder = 2
        OnClick = Button8Click
      end
      object Button9: TButton
        Left = 1057
        Top = 519
        Width = 158
        Height = 33
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = #24443#24213#20840#37096#21024#38500
        TabOrder = 3
        OnClick = Button9Click
      end
      object Button12: TButton
        Left = 670
        Top = 519
        Width = 158
        Height = 33
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = #24674#22797#24403#21069#20449#24687
        TabOrder = 4
        OnClick = Button12Click
      end
    end
    object TabSheet6: TTabSheet
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = #21457#36865#30340#20449#24687
      ImageIndex = 5
      OnShow = TabSheet6Show
      object StringGrid5: TStringGrid
        Left = 0
        Top = 0
        Width = 1274
        Height = 205
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Align = alTop
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRowSelect]
        TabOrder = 0
        OnSelectCell = StringGrid5SelectCell
        ColWidths = (
          64
          130
          141
          60
          562)
      end
      object Memo6: TMemo
        Left = 0
        Top = 213
        Width = 1257
        Height = 322
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        ReadOnly = True
        ScrollBars = ssVertical
        TabOrder = 1
      end
    end
  end
  object ZQuery1: TZQuery
    Connection = Form1.ZConnection1
    Params = <>
    Left = 536
    Top = 232
  end
end
