unit 入库单信息查询;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, ExtCtrls, DB, ZAbstractRODataset,
  ZAbstractDataset, ZStoredProcedure, Grids;

type
  TForm70 = class(TForm)
    Label1: TLabel;
    ComboBox1: TComboBox;
    StringGrid1: TStringGrid;
    Button1: TButton;
    Button2: TButton;
    ZStoredProc1: TZStoredProc;
    RadioGroup1: TRadioGroup;
    DateTimePicker1: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
    Label3: TLabel;
    自: TLabel;
    至: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form70: TForm70;

implementation

{$R *.dfm}

end.
