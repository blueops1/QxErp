object Form2: TForm2
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = #38144#21806#21592#31649#29702
  ClientHeight = 473
  ClientWidth = 856
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label8: TLabel
    Left = 152
    Top = 144
    Width = 65
    Height = 13
    AutoSize = False
    Caption = #38144#21806#21592#32534#21495
  end
  object Label9: TLabel
    Left = 440
    Top = 144
    Width = 65
    Height = 13
    AutoSize = False
    Caption = #38144#21806#21592#25163#26426
  end
  object Label10: TLabel
    Left = 440
    Top = 208
    Width = 65
    Height = 13
    AutoSize = False
    Caption = #38144#21806#21592#37038#31665
  end
  object Label11: TLabel
    Left = 152
    Top = 208
    Width = 65
    Height = 13
    AutoSize = False
    Caption = #38144#21806#21592#22995#21517
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 856
    Height = 473
    ActivePage = TabSheet1
    Align = alClient
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = #26032#22686#38144#21806#21592
      object Label1: TLabel
        Left = 152
        Top = 144
        Width = 65
        Height = 13
        AutoSize = False
        Caption = #38144#21806#21592#32534#21495
      end
      object Label2: TLabel
        Left = 152
        Top = 208
        Width = 65
        Height = 13
        AutoSize = False
        Caption = #38144#21806#21592#22995#21517
      end
      object Label3: TLabel
        Left = 440
        Top = 144
        Width = 65
        Height = 13
        AutoSize = False
        Caption = #38144#21806#21592#25163#26426
      end
      object Label4: TLabel
        Left = 440
        Top = 208
        Width = 65
        Height = 13
        AutoSize = False
        Caption = #38144#21806#21592#37038#31665
      end
      object Label5: TLabel
        Left = 684
        Top = 144
        Width = 6
        Height = 13
        Caption = '*'
        Color = clRed
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
      object Label6: TLabel
        Left = 396
        Top = 208
        Width = 6
        Height = 13
        Caption = '*'
        Color = clRed
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
      object Label7: TLabel
        Left = 240
        Top = 277
        Width = 57
        Height = 13
        Caption = '* '#20026#24517#22635#39033
        Color = clRed
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
      object Edit1: TEdit
        Left = 240
        Top = 141
        Width = 150
        Height = 21
        ImeName = #20013#25991'('#31616#20307') - '#26497#28857#20116#31508
        ReadOnly = True
        TabOrder = 0
      end
      object Edit2: TEdit
        Left = 240
        Top = 205
        Width = 150
        Height = 21
        ImeName = #20013#25991'('#31616#20307') - '#26497#28857#20116#31508
        TabOrder = 1
      end
      object Edit3: TEdit
        Left = 528
        Top = 141
        Width = 150
        Height = 21
        ImeName = #20013#25991'('#31616#20307') - '#26497#28857#20116#31508
        TabOrder = 2
      end
      object Edit4: TEdit
        Left = 528
        Top = 205
        Width = 150
        Height = 21
        ImeName = #20013#25991'('#31616#20307') - '#26497#28857#20116#31508
        TabOrder = 3
      end
      object Button1: TButton
        Left = 456
        Top = 272
        Width = 75
        Height = 25
        Caption = #30830#23450
        TabOrder = 4
        OnClick = Button1Click
      end
      object Button2: TButton
        Left = 576
        Top = 272
        Width = 75
        Height = 25
        Caption = #21462#28040
        TabOrder = 5
      end
    end
    object TabSheet2: TTabSheet
      Caption = #38144#21806#21592#20449#24687#20462#25913
      ImageIndex = 1
      OnShow = TabSheet2Show
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 858
      ExplicitHeight = 455
      object Label12: TLabel
        Left = 136
        Top = 142
        Width = 65
        Height = 13
        AutoSize = False
        Caption = #38144#21806#21592#32534#21495
      end
      object Label13: TLabel
        Left = 496
        Top = 142
        Width = 65
        Height = 13
        AutoSize = False
        Caption = #38144#21806#21592#25163#26426
      end
      object Label14: TLabel
        Left = 496
        Top = 206
        Width = 65
        Height = 13
        AutoSize = False
        Caption = #38144#21806#21592#37038#31665
      end
      object Label15: TLabel
        Left = 136
        Top = 206
        Width = 65
        Height = 13
        AutoSize = False
        Caption = #38144#21806#21592#22995#21517
      end
      object ListBox1: TListBox
        Left = 0
        Top = 0
        Width = 97
        Height = 445
        Align = alLeft
        ImeName = #20013#25991'('#31616#20307') - '#26497#28857#20116#31508
        ItemHeight = 13
        TabOrder = 0
        OnClick = ListBox1Click
      end
      object Edit5: TEdit
        Left = 224
        Top = 139
        Width = 150
        Height = 21
        ImeName = #20013#25991'('#31616#20307') - '#26497#28857#20116#31508
        ReadOnly = True
        TabOrder = 1
      end
      object Edit6: TEdit
        Left = 224
        Top = 203
        Width = 150
        Height = 21
        ImeName = #20013#25991'('#31616#20307') - '#26497#28857#20116#31508
        ReadOnly = True
        TabOrder = 2
      end
      object Edit7: TEdit
        Left = 576
        Top = 139
        Width = 150
        Height = 21
        ImeName = #20013#25991'('#31616#20307') - '#26497#28857#20116#31508
        ReadOnly = True
        TabOrder = 3
      end
      object Edit8: TEdit
        Left = 576
        Top = 203
        Width = 150
        Height = 21
        ImeName = #20013#25991'('#31616#20307') - '#26497#28857#20116#31508
        ReadOnly = True
        TabOrder = 4
      end
      object Button3: TButton
        Left = 456
        Top = 272
        Width = 75
        Height = 25
        Caption = #20445#23384
        TabOrder = 5
        OnClick = Button3Click
      end
      object Button4: TButton
        Left = 576
        Top = 272
        Width = 75
        Height = 25
        Caption = #21462#28040
        TabOrder = 6
      end
      object CheckBox1: TCheckBox
        Left = 732
        Top = 141
        Width = 97
        Height = 17
        Caption = #20462#25913
        TabOrder = 7
        OnClick = CheckBox1Click
      end
      object CheckBox2: TCheckBox
        Left = 732
        Top = 205
        Width = 97
        Height = 17
        Caption = #20462#25913
        TabOrder = 8
        OnClick = CheckBox2Click
      end
      object CheckBox4: TCheckBox
        Left = 380
        Top = 205
        Width = 97
        Height = 17
        Caption = #20462#25913
        TabOrder = 9
        OnClick = CheckBox4Click
      end
    end
  end
  object ADOQuery1: TADOQuery
    Connection = Form1.ADOConnection1
    Parameters = <>
    Left = 768
    Top = 416
  end
end
