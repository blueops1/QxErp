unit crkdinfomxzcx;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DB, ZAbstractRODataset, ZAbstractDataset,
  ZStoredProcedure, Menus;

type
  TForm46 = class(TForm)
    ZStoredProc1: TZStoredProc;
    StringGrid1: TStringGrid;
    Memo2: TMemo;
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
  Form46: TForm46;
  strCrkdBh:string;
  strIsCrk:string;
  strCrkDate:string;
  Function ExportStrGridToExcel(Args: array of const): Boolean;stdcall;external 'dlltools.dll';

implementation

uses main;

{$R *.dfm}

procedure TForm46.Execl1Click(Sender: TObject);
begin
  if stringgrid1.RowCount>2 then
    ExportStrGridToExcel([stringgrid1])
  else
    application.MessageBox('列表中没有任何数据！','出入库信息管理提示');
end;

procedure TForm46.FormShow(Sender: TObject);
var
  i:integer;
begin
  stringgrid1.RowCount:=2;
  stringgrid1.Rows[1].Clear;
  stringgrid1.Cells[0,0]:='序号';
  stringgrid1.Cells[1,0]:='物品名称';
  stringgrid1.Cells[4,0]:='备注';
  if strIsCrk='rk' then
  begin
    stringgrid1.Cells[2,0]:='入库数量';
    stringgrid1.Cells[3,0]:='单价';
    form46.Caption:='库存物资明细查询 入库单编号【'+strCrkdBh+'】入库日期:'+strCrkDate;
  end else
  begin
    stringgrid1.Cells[2,0]:='出库数量';
    stringgrid1.Cells[3,0]:=' ';
    form46.Caption:='库存物资明细查询 出库单编号【'+strCrkdBh+'】出库日期:'+strCrkDate;
  end;
  memo2.Lines.Clear;
  try
    with ZStoredProc1 do
    begin
      close;
        StoredProcName:='proc_cx_crkd_info_mxz_by_crkbh';
        ParamByName('crkdbh').Value:=strCrkdBh;
        ParamByName('crkdm').Value:=strIsCrk;
      open;
      FirstResultSet;
      if not eof then
        memo2.Lines.Add(fields[0].AsString);
      NextResultSet;
      i:=1;
      while not eof do
      begin
        stringgrid1.RowCount:=stringgrid1.RowCount+1;
        stringgrid1.Cells[0,i]:=inttostr(i);
        stringgrid1.Cells[1,i]:=fields[0].AsString;
        stringgrid1.Cells[2,i]:=fields[1].AsString;
        stringgrid1.Cells[3,i]:=fields[2].AsString;
        stringgrid1.Cells[4,i]:=fields[3].AsString;
        i:=i+1;
        stringgrid1.Rows[stringgrid1.RowCount-1].Clear;
        next;
      end;
    end;
  except
    application.MessageBox('数据查询失败！','出入库单信息及明细查询提示');
  end;
end;

end.
