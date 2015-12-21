object Form54: TForm54
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #21152#24037#21333#26597#35810
  ClientHeight = 635
  ClientWidth = 1000
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label6: TLabel
    Left = 24
    Top = 25
    Width = 60
    Height = 13
    Caption = #21152#24037#21333#32534#21495
  end
  object Label7: TLabel
    Left = 230
    Top = 25
    Width = 60
    Height = 13
    Caption = #21152#24037#21830#21517#31216
  end
  object Label4: TLabel
    Left = 738
    Top = 25
    Width = 48
    Height = 13
    Caption = #20986#21333#26085#26399
  end
  object Label5: TLabel
    Left = 60
    Top = 81
    Width = 24
    Height = 13
    Caption = #22791#27880
  end
  object Bevel1: TBevel
    Left = 25
    Top = 129
    Width = 950
    Height = 480
    Shape = bsFrame
    Style = bsRaised
  end
  object Label8: TLabel
    Left = 460
    Top = 122
    Width = 80
    Height = 16
    Caption = #21152#24037#21333#26126#32454
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = False
  end
  object Label12: TLabel
    Left = 741
    Top = 81
    Width = 60
    Height = 13
    Caption = #21152#24037#24635#36153#29992
  end
  object Edit4: TEdit
    Left = 90
    Top = 22
    Width = 124
    Height = 21
    TabOrder = 0
  end
  object Memo1: TMemo
    Left = 90
    Top = 63
    Width = 629
    Height = 53
    TabOrder = 1
  end
  object StringGrid1: TStringGrid
    Left = 37
    Top = 163
    Width = 929
    Height = 446
    ColCount = 9
    FixedCols = 0
    RowCount = 2
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing, goRowSelect]
    PopupMenu = PopupMenu1
    TabOrder = 2
    ColWidths = (
      47
      70
      161
      73
      76
      77
      72
      72
      241)
  end
  object Edit1: TEdit
    Left = 314
    Top = 22
    Width = 405
    Height = 21
    TabOrder = 3
  end
  object Edit2: TEdit
    Left = 808
    Top = 22
    Width = 167
    Height = 21
    TabOrder = 4
  end
  object Edit6: TEdit
    Left = 808
    Top = 78
    Width = 167
    Height = 21
    ReadOnly = True
    TabOrder = 5
    Text = '0'
  end
  object ZStoredProc1: TZStoredProc
    Connection = Form1.ZConnection1
    Params = <>
    Left = 382
    Top = 288
  end
  object PopupMenu1: TPopupMenu
    Left = 656
    Top = 304
    object Execl1: TMenuItem
      Caption = #23548#20986#21040'Execl'
      OnClick = Execl1Click
    end
  end
end
