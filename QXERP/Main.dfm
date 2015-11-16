object Form1: TForm1
  Left = 0
  Top = 0
  Caption = #29983#20135#31649#29702#31995#32479
  ClientHeight = 757
  ClientWidth = 1085
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  WindowState = wsMaximized
  OnResize = FormResize
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object StatusBar1: TStatusBar
    Left = 0
    Top = 738
    Width = 1085
    Height = 19
    Panels = <
      item
        Alignment = taCenter
        Text = #24403#21069#26102#38388
        Width = 367
      end
      item
        Alignment = taCenter
        Text = #27993#27743#31206#23665#27233#33014#24037#31243#32929#20221#20844#21496#26377#38480#20844#21496
        Width = 367
      end
      item
        Width = 367
      end>
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 1085
    Height = 738
    ActivePage = TabSheet1
    Align = alClient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    MultiLine = True
    ParentFont = False
    TabOrder = 1
    TabPosition = tpLeft
    object TabSheet1: TTabSheet
      Caption = #38144#21806#31649#29702
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      object Button1: TButton
        Left = 160
        Top = 104
        Width = 97
        Height = 65
        Caption = #38144#21806#21592#31649#29702
        TabOrder = 0
        OnClick = Button1Click
      end
      object Button2: TButton
        Left = 296
        Top = 104
        Width = 97
        Height = 65
        Caption = #20027#31649#21333#20301#31649#29702
        TabOrder = 1
        OnClick = Button2Click
      end
      object Button5: TButton
        Left = 432
        Top = 104
        Width = 97
        Height = 65
        Caption = #21512#21516#26041#31649#29702
        TabOrder = 2
        OnClick = Button5Click
      end
      object Button8: TButton
        Left = 568
        Top = 104
        Width = 97
        Height = 65
        Caption = #21512#21516#31649#29702
        TabOrder = 3
        OnClick = Button8Click
      end
    end
    object TabSheet2: TTabSheet
      Caption = #29983#20135#31649#29702
      ImageIndex = 1
      object Button11: TButton
        Left = 432
        Top = 104
        Width = 97
        Height = 65
        Caption = #21322#25104#21697#31649#29702
        TabOrder = 0
        OnClick = Button11Click
      end
      object Button17: TButton
        Left = 160
        Top = 104
        Width = 97
        Height = 65
        Caption = #29983#20135#35745#21010
        TabOrder = 1
        OnClick = Button17Click
      end
      object Button18: TButton
        Left = 296
        Top = 104
        Width = 97
        Height = 65
        Caption = #22806#21327#21152#24037
        TabOrder = 2
        OnClick = Button11Click
      end
    end
    object TabSheet3: TTabSheet
      Caption = #20179#24211#31649#29702
      ImageIndex = 2
      object Button3: TButton
        Left = 160
        Top = 104
        Width = 97
        Height = 65
        Caption = #20179#24211#31649#29702
        TabOrder = 0
        OnClick = Button3Click
      end
    end
    object TabSheet4: TTabSheet
      Caption = #25910#27454#31649#29702
      ImageIndex = 3
      object Button6: TButton
        Left = 160
        Top = 104
        Width = 97
        Height = 65
        Caption = #24212#25910#27454#35760#24080
        TabOrder = 0
        OnClick = Button6Click
      end
      object Button7: TButton
        Left = 296
        Top = 104
        Width = 97
        Height = 65
        Caption = #24212#25910#27454#26597#35810
        TabOrder = 1
        OnClick = Button7Click
      end
    end
    object TabSheet6: TTabSheet
      Caption = #26597#35810#32479#35745
      ImageIndex = 5
      object Button13: TButton
        Left = 160
        Top = 104
        Width = 97
        Height = 65
        Caption = #38144#21806#32479#35745#26597#35810
        TabOrder = 0
        OnClick = Button11Click
      end
      object Button14: TButton
        Left = 288
        Top = 104
        Width = 97
        Height = 65
        Caption = #29983#20135#32479#35745#26597#35810
        TabOrder = 1
        OnClick = Button14Click
      end
      object Button15: TButton
        Left = 416
        Top = 104
        Width = 97
        Height = 65
        Caption = #20179#24211#32479#35745#26597#35810
        TabOrder = 2
        OnClick = Button11Click
      end
      object Button16: TButton
        Left = 544
        Top = 104
        Width = 97
        Height = 65
        Caption = #24212#25910#27454#32479#35745#26597#35810
        TabOrder = 3
        OnClick = Button11Click
      end
    end
    object TabSheet5: TTabSheet
      Caption = #22522#26412#35774#32622
      ImageIndex = 4
      object Button4: TButton
        Left = 160
        Top = 104
        Width = 97
        Height = 65
        Caption = #20135#21697#20449#24687#31649#29702
        TabOrder = 0
        OnClick = Button4Click
      end
      object Button10: TButton
        Left = 296
        Top = 104
        Width = 97
        Height = 65
        Caption = #21322#25104#21697#20449#24687#31649#29702
        TabOrder = 1
        OnClick = Button10Click
      end
      object Button9: TButton
        Left = 432
        Top = 104
        Width = 97
        Height = 65
        Caption = #32844#24037#20449#24687#31649#29702
        TabOrder = 2
        OnClick = Button9Click
      end
      object Button12: TButton
        Left = 568
        Top = 104
        Width = 97
        Height = 65
        Caption = #24080#25143#26435#38480#31649#29702
        TabOrder = 3
        OnClick = Button12Click
      end
    end
  end
  object MainMenu1: TMainMenu
    Left = 112
    Top = 448
    object N1: TMenuItem
      Caption = '&S'#31995#32479
      object N4: TMenuItem
        Caption = #23494#30721#20462#25913
        OnClick = N4Click
      end
      object L1: TMenuItem
        Caption = '&L'#36830#25509#26381#21153#22120
      end
      object C1: TMenuItem
        Caption = '&C'#35774#32622
      end
      object X1: TMenuItem
        Caption = '&X'#36864#20986
        OnClick = X1Click
      end
    end
    object N2: TMenuItem
      Caption = '&A'#20851#20110
      object N3: TMenuItem
        Caption = #20851#20110#26412#36719#20214
        OnClick = N3Click
      end
    end
  end
  object ZConnection1: TZConnection
    ControlsCodePage = cCP_UTF16
    Port = 0
    Protocol = 'mysql-5'
    Left = 496
    Top = 344
  end
end
