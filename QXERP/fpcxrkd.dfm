object Form71: TForm71
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #25353#21457#31080#26597#35810#20837#24211#21333
  ClientHeight = 652
  ClientWidth = 954
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
  object Label1: TLabel
    Left = 80
    Top = 19
    Width = 120
    Height = 13
    Caption = #36755#20837#35201#26597#35810#30340#21457#31080#32534#21495
  end
  object Edit1: TEdit
    Left = 216
    Top = 16
    Width = 433
    Height = 21
    TabOrder = 0
    TextHint = #36755#20837#35201#26597#35810#30340#21457#31080#32534#21495
  end
  object Button1: TButton
    Left = 680
    Top = 14
    Width = 105
    Height = 25
    Caption = #26597#35810
    TabOrder = 1
    OnClick = Button1Click
  end
  object StringGrid1: TStringGrid
    Left = 0
    Top = 60
    Width = 954
    Height = 592
    Align = alBottom
    ColCount = 9
    RowCount = 2
    PopupMenu = PopupMenu1
    TabOrder = 2
    OnDblClick = StringGrid1DblClick
    OnDrawCell = StringGrid1DrawCell
    OnSelectCell = StringGrid1SelectCell
    ExplicitLeft = -84
    ExplicitTop = 50
    ExplicitWidth = 1028
    ColWidths = (
      44
      73
      228
      80
      77
      71
      104
      82
      85)
  end
  object PopupMenu1: TPopupMenu
    Left = 312
    Top = 224
    object Execl1: TMenuItem
      Caption = #23548#20986#21040'Execl'
      OnClick = Execl1Click
    end
  end
  object ZStoredProc1: TZStoredProc
    Connection = Form1.ZConnection1
    Params = <>
    Left = 736
    Top = 416
  end
end
