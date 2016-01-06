unit ckitemgz;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ZAbstractRODataset, ZAbstractDataset, ZStoredProcedure, StdCtrls,
  Grids, Menus;

type
  TForm35 = class(TForm)
    StringGrid1: TStringGrid;
    ZStoredProc1: TZStoredProc;
    PopupMenu1: TPopupMenu;
    Execl1: TMenuItem;
    procedure FormShow(Sender: TObject);
    procedure Execl1Click(Sender: TObject);
    procedure StringGrid1DblClick(Sender: TObject);
    procedure StringGrid1SelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form35: TForm35;
  Function ExportStrGridToExcel(Args: array of const): Boolean;stdcall;external 'dlltools.dll';

implementation

uses main,kcmxzcx;

{$R *.dfm}

procedure TForm35.Execl1Click(Sender: TObject);
begin
  ExportStrGridToExcel([stringgrid1]);
end;

procedure TForm35.FormShow(Sender: TObject);
var
  i:integer;
  sumofgz:real;
begin
 stringgrid1.Cells[0,0]:='序号';
 stringgrid1.Cells[1,0]:='物品编号';
 stringgrid1.Cells[2,0]:='物品名称';
 stringgrid1.Cells[3,0]:='物品单位';
 stringgrid1.Cells[4,0]:='物品类型';
 stringgrid1.Cells[5,0]:='未开票数量';
 stringgrid1.Cells[6,0]:='累计总额';
 stringgrid1.Cells[7,0]:='累计采购数';
 stringgrid1.Cells[8,0]:='平均单价';
 stringgrid1.Cells[9,0]:='估值总额';
 sumofgz:=0;
  try
    with zStoredProc1 do
    begin
      stringgrid1.RowCount:=2;
      stringgrid1.Rows[1].Clear;
      Close;
      StoredProcName:='proc_cx_wgzitemgz';
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
        stringgrid1.Cells[6,i]:=fields[5].AsString;
        stringgrid1.Cells[7,i]:=fields[6].AsString;
        stringgrid1.Cells[8,i]:=fields[7].AsString;
        stringgrid1.Cells[9,i]:=floattostr(strtofloat(stringgrid1.Cells[5,i])*strtofloat(stringgrid1.Cells[8,i]));
        sumofgz:=sumofgz+ strtofloat(stringgrid1.Cells[5,i])*strtofloat(stringgrid1.Cells[8,i]);
        stringgrid1.Rows[stringgrid1.RowCount-1].Clear;
        stringgrid1.Cells[0,i+1]:='合计';
        stringgrid1.Cells[9,i+1]:= floattostr(sumofgz);
        i:=i+1;
        next;
      end;

    end;
  except
    application.MessageBox('数据查询失败！','仓库库存查询');
  end;
end;

procedure TForm35.StringGrid1DblClick(Sender: TObject);
begin
  if strCkitemBh<>'NULL' then
    kcmxzcx.Form45.ShowModal;
end;

procedure TForm35.StringGrid1SelectCell(Sender: TObject; ACol, ARow: Integer;
  var CanSelect: Boolean);
begin
  if stringgrid1.RowCount>2 then
  begin
    strCkitemBh:=stringgrid1.Cells[1,ARow];
    strCkItemmc:=stringgrid1.Cells[2,ARow];
  end
  else
    strCkitemBh:='NULL';
end;

end.
