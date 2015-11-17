object Form3: TForm3
  Left = 0
  Top = 0
  BorderStyle = bsToolWindow
  Caption = #36830#25509#25968#25454#24211
  ClientHeight = 259
  ClientWidth = 436
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 104
    Top = 29
    Width = 60
    Height = 13
    Caption = #26381#21153#22120#21517#31216
  end
  object Label2: TLabel
    Left = 104
    Top = 85
    Width = 60
    Height = 13
    AutoSize = False
    Caption = #24080'            '#21495
  end
  object Label3: TLabel
    Left = 104
    Top = 112
    Width = 60
    Height = 13
    AutoSize = False
    Caption = #23494'            '#30721
  end
  object Label4: TLabel
    Left = 104
    Top = 57
    Width = 60
    Height = 13
    Caption = #25968#25454#24211#21517#31216
  end
  object Label6: TLabel
    Left = 104
    Top = 167
    Width = 60
    Height = 13
    AutoSize = False
    Caption = #32534'            '#30721
  end
  object Label5: TLabel
    Left = 104
    Top = 140
    Width = 60
    Height = 13
    AutoSize = False
    Caption = #31471'            '#21475
  end
  object Edit1: TEdit
    Left = 184
    Top = 26
    Width = 150
    Height = 21
    ImeName = #20013#25991'('#31616#20307') - '#26497#28857#20116#31508
    TabOrder = 0
    Text = 'localhost'
  end
  object Edit2: TEdit
    Left = 184
    Top = 82
    Width = 150
    Height = 21
    ImeName = #20013#25991'('#31616#20307') - '#26497#28857#20116#31508
    TabOrder = 1
    Text = 'sa'
  end
  object Edit3: TEdit
    Left = 184
    Top = 109
    Width = 150
    Height = 21
    ImeName = #20013#25991'('#31616#20307') - '#26497#28857#20116#31508
    TabOrder = 2
    Text = '123456'
  end
  object Button1: TButton
    Left = 184
    Top = 200
    Width = 75
    Height = 25
    Caption = #36830#25509
    TabOrder = 3
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 283
    Top = 200
    Width = 75
    Height = 25
    Caption = #21462#28040
    TabOrder = 4
  end
  object Button3: TButton
    Left = 89
    Top = 200
    Width = 75
    Height = 25
    Caption = #20445#23384#35774#32622
    TabOrder = 5
    OnClick = Button3Click
  end
  object Edit4: TEdit
    Left = 184
    Top = 54
    Width = 150
    Height = 21
    ImeName = #20013#25991'('#31616#20307') - '#26497#28857#20116#31508
    TabOrder = 6
    Text = 'qxerp'
  end
  object Edit5: TEdit
    Left = 184
    Top = 137
    Width = 150
    Height = 21
    ImeName = #20013#25991'('#31616#20307') - '#26497#28857#20116#31508
    TabOrder = 7
    Text = '3306'
  end
  object Edit6: TEdit
    Left = 184
    Top = 164
    Width = 150
    Height = 21
    ImeName = #20013#25991'('#31616#20307') - '#26497#28857#20116#31508
    TabOrder = 8
    Text = 'gbk'
  end
end
