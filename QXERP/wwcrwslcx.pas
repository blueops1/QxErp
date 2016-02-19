unit wwcrwslcx;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ZAbstractRODataset, ZAbstractDataset, ZStoredProcedure, StdCtrls,
  Grids, Menus;

type
  TForm96 = class(TForm)
    StringGrid1: TStringGrid;
    ZStoredProc1: TZStoredProc;
    PopupMenu1: TPopupMenu;
    Execl1: TMenuItem;
    procedure FormShow(Sender: TObject);
    procedure Execl1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form96: TForm96;

implementation

uses main;

{$R *.dfm}

procedure TForm96.Execl1Click(Sender: TObject);
begin
  if stringgrid1.RowCount>2 then
    ExportStrGridToExcel([stringgrid1])
  else
    application.MessageBox('列表中没有任何数据！','未列入生产计划任务数量明细查询');
end;

procedure TForm96.FormShow(Sender: TObject);
var
  i:integer;
begin         //proc_cx_renwudan_isend
  stringgrid1.RowCount:=2;
  stringgrid1.Rows[1].Clear;
  stringgrid1.Cells[0,0]:='序号';
  stringgrid1.Cells[1,0]:='产品编号';
  stringgrid1.Cells[2,0]:='产品名称';
  stringgrid1.Cells[3,0]:='产品类型';
  stringgrid1.Cells[4,0]:='合同总数量';
  stringgrid1.Cells[5,0]:='未下计划数';

  try
    with zStoredProc1 do
    begin
      close;
      StoredProcName:='proc_cx_wwcrwls';
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
        stringgrid1.Rows[stringgrid1.RowCount-1].Clear;;
        i:=i+1;
        next;
      end;
    end;
  except
    application.MessageBox('查询数据失败！','未列入生产计划任务数量明细查询提示');
  end;
end;

end.
