unit cwtj;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, StdCtrls, ComCtrls, DB, ZAbstractRODataset, ZAbstractDataset,
  ZStoredProcedure, Menus;

type
  TForm107 = class(TForm)
    ZStoredProc1: TZStoredProc;
    DateTimePicker1: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
    Label1: TLabel;
    Label2: TLabel;
    Button1: TButton;
    StringGrid1: TStringGrid;
    PopupMenu1: TPopupMenu;
    Execl1: TMenuItem;
    procedure Button1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Execl1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form107: TForm107;
  Function ExportStrGridToExcel(Args: array of const): Boolean;stdcall;external 'dlltools.dll';

implementation

{$R *.dfm}

procedure TForm107.Button1Click(Sender: TObject);
var
i:integer;
begin
 try
    with zStoredProc1 do
    begin
      stringgrid1.RowCount:=2;
      stringgrid1.Rows[1].Clear;
      Close;
      StoredProcName:='proc_tj_xszs_by_start_end_date';
      ParamByName('startdate').Value:=datetimepicker1.Date;
      ParamByName('enddate').Value:=datetimepicker2.Date;
      open;
      i:=1;
      while not eof do
      begin
        stringgrid1.RowCount:=stringgrid1.RowCount+1;
        stringgrid1.Cells[0,i]:=inttostr(i);
        stringgrid1.Cells[1,i]:=fields[0].AsString;
        stringgrid1.Cells[2,i]:=fields[1].AsString;
        stringgrid1.Cells[3,i]:=fields[2].AsString;
        stringgrid1.Cells[4,i]:=fields[3].AsString;
        stringgrid1.Cells[5,i]:=fields[4].AsString;
{        if stringgrid1.Cells[7,i]<>'0' then
          stringgrid1.Cells[8,i]:=floattostr(strtofloat(stringgrid1.Cells[6,i])/strtofloat(stringgrid1.Cells[7,i]))
        else
          stringgrid1.Cells[8,i]:='0';    }
        stringgrid1.Rows[stringgrid1.RowCount-1].Clear;
        i:=i+1;
        next;
      end;
    end;
  except
    application.MessageBox('数据查询失败！','仓库库存查询');
  end
end;

procedure TForm107.Execl1Click(Sender: TObject);
begin
  if stringgrid1.RowCount>2 then
    ExportStrGridToExcel([stringgrid1])
  else
    application.MessageBox('列表中没有任何数据！','仓库查询提示');
end;

procedure TForm107.FormShow(Sender: TObject);
begin
  stringgrid1.Cells[0,0]:='序号';
    stringgrid1.Cells[1,0]:='产品编号';
      stringgrid1.Cells[2,0]:='产品名称';
        stringgrid1.Cells[3,0]:='产品类型';
          stringgrid1.Cells[4,0]:='发货数量';
            stringgrid1.Cells[5,0]:='销售金额';
end;

end.
