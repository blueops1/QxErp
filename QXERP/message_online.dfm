object Form18: TForm18
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #22312#32447#28040#24687
  ClientHeight = 470
  ClientWidth = 980
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
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 980
    Height = 470
    ActivePage = TabSheet1
    Align = alClient
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = #28040#24687#21457#36865
      ExplicitLeft = 8
      ExplicitTop = 28
      ExplicitWidth = 1001
      ExplicitHeight = 432
      object Label1: TLabel
        Left = 52
        Top = 27
        Width = 36
        Height = 13
        Caption = #21457#36865#33267
      end
      object Label2: TLabel
        Left = 40
        Top = 109
        Width = 48
        Height = 13
        Caption = #28040#24687#20869#23481
      end
      object Label3: TLabel
        Left = 40
        Top = 67
        Width = 48
        Height = 13
        Caption = #20449#24687#26631#39064
      end
      object ComboBox1: TComboBox
        Left = 112
        Top = 24
        Width = 145
        Height = 21
        TabOrder = 0
        OnDropDown = ComboBox1DropDown
      end
      object Button1: TButton
        Left = 814
        Top = 288
        Width = 75
        Height = 25
        Caption = #21457#36865
        TabOrder = 1
        OnClick = Button1Click
      end
      object Memo2: TMemo
        Left = 112
        Top = 106
        Width = 833
        Height = 170
        TabOrder = 2
      end
      object Edit1: TEdit
        Left = 112
        Top = 64
        Width = 833
        Height = 21
        TabOrder = 3
      end
    end
    object TabSheet2: TTabSheet
      Caption = #28040#24687#22788#29702
      ImageIndex = 1
      OnShow = TabSheet2Show
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 281
      ExplicitHeight = 165
      object Memo1: TMemo
        Left = 0
        Top = 163
        Width = 961
        Height = 222
        ReadOnly = True
        ScrollBars = ssVertical
        TabOrder = 0
      end
      object StringGrid1: TStringGrid
        Left = 0
        Top = 0
        Width = 972
        Height = 157
        Align = alTop
        ColCount = 4
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRowSelect]
        TabOrder = 1
        OnSelectCell = StringGrid1SelectCell
        ExplicitWidth = 1001
        ColWidths = (
          64
          130
          145
          609)
      end
      object Button2: TButton
        Left = 664
        Top = 397
        Width = 121
        Height = 25
        Caption = #26631#35760#20026#24050#38405
        TabOrder = 2
        OnClick = Button2Click
      end
      object Button4: TButton
        Left = 520
        Top = 397
        Width = 121
        Height = 25
        Caption = #25910#34255#24182#26631#35760#20026#24050#38405
        TabOrder = 3
        OnClick = Button4Click
      end
      object Button5: TButton
        Left = 808
        Top = 397
        Width = 121
        Height = 25
        Caption = #20002#20837#22238#25910#31665
        TabOrder = 4
        OnClick = Button5Click
      end
    end
    object TabSheet3: TTabSheet
      Caption = #25910#34255#30340#20449#24687
      ImageIndex = 2
      OnShow = TabSheet3Show
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object StringGrid2: TStringGrid
        Left = 0
        Top = 0
        Width = 972
        Height = 157
        Align = alTop
        ColCount = 4
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRowSelect]
        TabOrder = 0
        OnSelectCell = StringGrid2SelectCell
        ExplicitWidth = 1001
        ColWidths = (
          64
          130
          145
          609)
      end
      object Memo3: TMemo
        Left = 0
        Top = 163
        Width = 961
        Height = 222
        ReadOnly = True
        ScrollBars = ssVertical
        TabOrder = 1
      end
      object Button3: TButton
        Left = 808
        Top = 397
        Width = 121
        Height = 25
        Caption = #21462#28040#25910#34255#26631#35760
        TabOrder = 2
        OnClick = Button3Click
      end
    end
    object TabSheet4: TTabSheet
      Caption = #26087#30340#20449#24687
      ImageIndex = 3
      OnShow = TabSheet4Show
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object StringGrid3: TStringGrid
        Left = 0
        Top = 0
        Width = 972
        Height = 157
        Align = alTop
        ColCount = 4
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRowSelect]
        TabOrder = 0
        OnSelectCell = StringGrid3SelectCell
        ExplicitWidth = 1001
        ColWidths = (
          64
          130
          145
          609)
      end
      object Memo4: TMemo
        Left = 0
        Top = 163
        Width = 961
        Height = 222
        ReadOnly = True
        ScrollBars = ssVertical
        TabOrder = 1
      end
      object Button6: TButton
        Left = 664
        Top = 397
        Width = 121
        Height = 25
        Caption = #21024#38500#24403#21069#20449#24687
        TabOrder = 2
        OnClick = Button6Click
      end
      object Button7: TButton
        Left = 808
        Top = 397
        Width = 121
        Height = 25
        Caption = #20840#37096#21024#38500
        TabOrder = 3
        OnClick = Button7Click
      end
    end
    object TabSheet5: TTabSheet
      Caption = #22238#25910#31665
      ImageIndex = 4
      OnShow = TabSheet5Show
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object StringGrid4: TStringGrid
        Left = 0
        Top = 0
        Width = 972
        Height = 157
        Align = alTop
        ColCount = 4
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRowSelect]
        TabOrder = 0
        OnSelectCell = StringGrid4SelectCell
        ExplicitWidth = 1001
        ColWidths = (
          64
          130
          145
          609)
      end
      object Memo5: TMemo
        Left = 0
        Top = 163
        Width = 961
        Height = 222
        ReadOnly = True
        ScrollBars = ssVertical
        TabOrder = 1
      end
      object Button8: TButton
        Left = 664
        Top = 397
        Width = 121
        Height = 25
        Caption = #24443#24213#21024#38500#24403#21069#20449#24687
        TabOrder = 2
        OnClick = Button8Click
      end
      object Button9: TButton
        Left = 808
        Top = 397
        Width = 121
        Height = 25
        Caption = #24443#24213#20840#37096#21024#38500
        TabOrder = 3
        OnClick = Button9Click
      end
    end
  end
  object ZQuery1: TZQuery
    Connection = Form1.ZConnection1
    Params = <>
    Left = 832
    Top = 360
  end
end