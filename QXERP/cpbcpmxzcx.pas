unit cpbcpmxzcx;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ZAbstractRODataset, ZAbstractDataset, ZStoredProcedure, Grids,
  StdCtrls;

type
  TForm91 = class(TForm)
    StringGrid2: TStringGrid;
    StringGrid1: TStringGrid;
    ZStoredProc1: TZStoredProc;
    Label1: TLabel;
    Label2: TLabel;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form91: TForm91;
  strcpbh,strbcpbh,strcpmc,strbcpmc,strcpzl:string;

implementation

uses main;

{$R *.dfm}

procedure TForm91.FormShow(Sender: TObject);
var y:integer;
begin
  stringgrid2.RowCount:=2;
  stringgrid2.Rows[1].Clear;
  stringgrid1.RowCount:=2;
  stringgrid1.Rows[1].Clear;
  stringgrid2.Cells[0,0]:='产品编号';
  stringgrid2.Cells[1,0]:='入库数量';
  stringgrid2.Cells[2,0]:='出库数量';
  stringgrid2.Cells[3,0]:='记帐日期';
  stringgrid2.Cells[4,0]:='备注';
  stringgrid1.Cells[0,0]:='半成品编号';
  stringgrid1.Cells[1,0]:='入库数量';
  stringgrid1.Cells[2,0]:='出库数量';
  stringgrid1.Cells[3,0]:='记帐日期';
  stringgrid1.Cells[4,0]:='备注';
  try
    with zStoredProc1 do
    begin
      close;
      StoredProcName:='proc_cx_cpbcpmxz';
      ParamByName('cpbh').Value:=strcpbh;
      ParamByName('cpzl').Value:=strcpzl;
      ParamByName('bcpbh').Value:=strbcpbh;
      open;
      y:=1;
      FirstResultSet;
      while not eof do
      begin
        stringgrid2.RowCount:=stringgrid2.RowCount+1;
        stringgrid2.Cells[0,y]:=fields[0].AsString;
        stringgrid2.Cells[1,y]:=fields[1].AsString;
        stringgrid2.Cells[2,y]:=fields[2].AsString;
        stringgrid2.Cells[3,y]:=fields[3].AsString;
        stringgrid2.Cells[4,y]:=fields[4].AsString;
        y := y +1;
        stringgrid2.Rows[stringgrid2.RowCount-1].Clear;
        next;
      end;
      NextResultSet;
      y:=1;
      while not eof do
      begin
        stringgrid1.RowCount:=stringgrid1.RowCount+1;
        stringgrid1.Cells[0,y]:=fields[0].AsString;
        stringgrid1.Cells[1,y]:=fields[1].AsString;
        stringgrid1.Cells[2,y]:=fields[2].AsString;
        stringgrid1.Cells[3,y]:=fields[3].AsString;
        stringgrid1.Cells[4,y]:=fields[4].AsString;
        y := y +1;
        stringgrid1.Rows[stringgrid1.RowCount-1].Clear;
        next;
      end;
      form91.Caption:='成品半成品明细帐查询 【成品：'+strcpmc+'】';
      if strbcpmc<>'无-无' then
          form91.Caption:=form91.Caption+'【半成品：'+strbcpmc+'】';
   end;
  Except
    Application.MessageBox('查询失败！','生产统计查询提示');
  end;

end;

end.
