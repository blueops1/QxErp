unit rwslcxbyrwdbh;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, DB, ZAbstractRODataset, ZAbstractDataset, ZStoredProcedure,
  Grids;

type
  TForm97 = class(TForm)
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
  Form97: TForm97;

implementation

uses main;

{$R *.dfm}

procedure TForm97.Execl1Click(Sender: TObject);
begin
  if stringgrid1.RowCount>2 then
    ExportStrGridToExcel([stringgrid1])
  else
    application.MessageBox('列表中没有任何数据！','任务单分单查询');
end;

procedure TForm97.FormShow(Sender: TObject);
var
  i,y:integer;
begin
  stringgrid1.RowCount:=2;
  stringgrid1.Rows[1].Clear;
  try
    with zStoredProc1 do
    begin
      close;
      StoredProcName:='PROC_CX_RENWUDAN_SYRWSL';
      open;
      i:=1;
      zstoredproc1.FirstResultSet;
      stringgrid1.ColCount:=fields[0].AsInteger+2;
      zstoredproc1.NextResultSet;
      stringgrid1.Cells[0,0]:='产品名称及任务单号';
      y:=1;
      while not eof do
      begin
        stringgrid1.Cells[y,0]:=fields[0].AsString;
        y:=y+1;
        next;
      end;
      stringgrid1.Cells[stringgrid1.ColCount-1,0]:='合计';
      zstoredproc1.LastResultSet;
      while not eof do
      begin
        stringgrid1.RowCount:=stringgrid1.RowCount+1;
        for y := 0 to stringgrid1.ColCount - 1 do
        begin
        //ringgrid1.Cells[y,i]:=inttostr(i);
          stringgrid1.Cells[y,i]:=fields[y].AsString;
        end;
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
