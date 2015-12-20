unit bcpgl;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, ComCtrls, Grids, StdCtrls, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, ZStoredProcedure, Menus;

type
  TForm12 = class(TForm)
    PageControl1: TPageControl;
    TabSheet3: TTabSheet;
    Label12: TLabel;
    StringGrid1: TStringGrid;
    Edit9: TEdit;
    Button6: TButton;
    StringGrid2: TStringGrid;
    StringGrid7: TStringGrid;
    ZStoredProc1: TZStoredProc;
    PopupMenu1: TPopupMenu;
    Execl1: TMenuItem;
    PopupMenu2: TPopupMenu;
    MenuItem1: TMenuItem;
    PopupMenu3: TPopupMenu;
    MenuItem2: TMenuItem;
    procedure Button3Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure StringGrid1SelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure StringGrid2SelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure TabSheet3Show(Sender: TObject);
    procedure Edit9Change(Sender: TObject);
    procedure Execl1Click(Sender: TObject);
    procedure MenuItem1Click(Sender: TObject);
    procedure MenuItem2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form12: TForm12;
  boolhtinfoloaded:boolean;
  Function ExportStrGridToExcel(Args: array of const): Boolean;stdcall;external 'dlltools.dll';

implementation

uses main;

{$R *.dfm}

procedure TForm12.Button3Click(Sender: TObject);
begin   //proc_insert_cpcrkmxz_cprk   cpbh,rksl,jzdate,memo

end;

procedure TForm12.Button6Click(Sender: TObject);
var y:integer;
begin
  stringgrid1.RowCount:=2;   //proc_cx_bcpcx_by_cpmc
  boolhtinfoloaded:=false;
  try
    with zStoredProc1 do
    begin
      close;
      StoredProcName:='proc_cx_bcpcx_by_cpmc';
      ParamByName('cpmc').Value:='';
      open;
      y:=1;
      while not eof do
      begin
        stringgrid1.RowCount:=stringgrid1.RowCount+1;
        stringgrid1.Cells[0,y]:=fields[0].AsString;
        stringgrid1.Cells[1,y]:=fields[1].AsString;
        stringgrid1.Cells[2,y]:=fields[2].AsString;
        stringgrid1.Cells[3,y]:=fields[3].AsString;
        stringgrid1.Cells[4,y]:=fields[4].AsString;
        stringgrid1.Cells[5,y]:=fields[5].AsString;
        y:=y+1;
        stringgrid1.Rows[stringgrid1.RowCount-1].Clear;
        next;
      end;
      boolhtinfoloaded:=true;
    end;
  Except
      Application.MessageBox('查询失败！','成品管理提示');
  end;

end;

procedure TForm12.Edit9Change(Sender: TObject);
var y:integer;
begin
  stringgrid1.RowCount:=2;   //proc_cx_bcpcx_by_cpmc
  stringgrid1.Rows[1].Clear;
  boolhtinfoloaded:=false;
  try
    with zStoredProc1 do
    begin
      close;
      StoredProcName:='proc_cx_bcpcx_by_cpmc';
      ParamByName('cpmc').Value:=edit9.Text;
      open;
      y:=1;
      while not eof do
      begin
        stringgrid1.RowCount:=stringgrid1.RowCount+1;
        stringgrid1.Cells[0,y]:=fields[0].AsString;
        stringgrid1.Cells[1,y]:=fields[1].AsString;
        stringgrid1.Cells[2,y]:=fields[2].AsString;
        stringgrid1.Cells[3,y]:=fields[3].AsString;
        stringgrid1.Cells[4,y]:=fields[4].AsString;
        stringgrid1.Cells[5,y]:=fields[5].AsString;
        y:=y+1;
        stringgrid1.Rows[stringgrid1.RowCount-1].Clear;
        next;
      end;
      boolhtinfoloaded:=true;
    end;
  Except
      Application.MessageBox('查询失败！','半成品管理提示');
  end;
end;

procedure TForm12.Execl1Click(Sender: TObject);
begin
  if stringgrid1.RowCount>2 then
    ExportStrGridToExcel([stringgrid1])
  else
    application.MessageBox('列表中没有任何数据！','半成品统计查询提示');
end;

procedure TForm12.MenuItem1Click(Sender: TObject);
begin
  if stringgrid2.RowCount>2 then
    ExportStrGridToExcel([stringgrid2])
  else
    application.MessageBox('列表中没有任何数据！','半成品统计查询提示');
end;

procedure TForm12.MenuItem2Click(Sender: TObject);
begin
  if stringgrid7.RowCount>2 then
    ExportStrGridToExcel([stringgrid7])
  else
    application.MessageBox('列表中没有任何数据！','半成品统计查询提示');
end;

procedure TForm12.StringGrid1SelectCell(Sender: TObject; ACol, ARow: Integer;
  var CanSelect: Boolean);
  var y:integer;
begin
  stringgrid2.RowCount:=2;
  stringgrid2.Rows[1].Clear;
  if (boolhtinfoloaded=true) and (stringgrid1.Cells[0,ARow]<>'') then
  begin
    try
      with zStoredProc1 do            //proc_cx_bcplxk_by_cpbh
      begin
        close;
        StoredProcName:='proc_cx_bcplxk_by_cpbh';
        ParamByName('cpbh').Value:= stringgrid1.Cells[0,ARow];
        open;
        y:=1;
        while not eof do
        begin
          stringgrid2.RowCount:=stringgrid2.RowCount+1;
          stringgrid2.Cells[0,y]:=fields[0].AsString;
          stringgrid2.Cells[1,y]:=fields[1].AsString;
          stringgrid2.Cells[2,y]:=fields[2].AsString;
          stringgrid2.Cells[3,y]:=fields[3].AsString;
          stringgrid2.Cells[4,y]:=fields[4].AsString;
          y:=y+1;
          stringgrid2.Rows[stringgrid2.RowCount-1].Clear;
          next;
        end;
      end;
    Except
        Application.MessageBox('查询失败！','半成品管理提示');
    end;
  end;
end;

procedure TForm12.StringGrid2SelectCell(Sender: TObject; ACol, ARow: Integer;
  var CanSelect: Boolean);
  var y:integer;
begin
  stringgrid7.RowCount:=2;
  stringgrid7.Rows[1].Clear;
  begin
  if stringgrid2.Cells[0,ARow]<>'' then
  begin
    try
      with zStoredProc1 do     //proc_cx_bcpmxz_by_bcpbh
      begin
        close;
        StoredProcName:='proc_cx_bcpmxz_by_bcpbh';
        ParamByName('bcpbh').Value:=stringgrid2.Cells[0,ARow];
        open;
        y:=1;
        while not eof do
        begin
          stringgrid7.RowCount:=stringgrid7.RowCount+1;
          stringgrid7.Cells[0,y]:=fields[0].AsString;
          stringgrid7.Cells[1,y]:=fields[1].AsString;
          stringgrid7.Cells[2,y]:=fields[2].AsString;
          stringgrid7.Cells[3,y]:=fields[3].AsString;
          stringgrid7.Cells[4,y]:=fields[4].AsString;
          y:=y+1;
          stringgrid7.Rows[stringgrid7.RowCount-1].Clear;
          next;
        end;
      end;
    Except
        Application.MessageBox('查询失败！','半成品管理提示');
    end;
  end;
  end;
end;

procedure TForm12.TabSheet3Show(Sender: TObject);
begin
  stringgrid1.Cells[0,0]:='产品编号';
  stringgrid1.Cells[1,0]:='产品规格';
  stringgrid1.Cells[2,0]:='计量单位';
  stringgrid1.Cells[3,0]:='产品类型';
  stringgrid1.Cells[4,0]:='库存数量';
  stringgrid1.Cells[5,0]:='备注';
  stringgrid2.Cells[0,0]:='半成品编号';
  stringgrid2.Cells[1,0]:='半成品规格';
  stringgrid2.Cells[2,0]:='半成品类型';
  stringgrid2.Cells[3,0]:='半成品库存量';
  stringgrid2.Cells[4,0]:='成品类型';
  stringgrid7.Cells[0,0]:='半成品编号';
  stringgrid7.Cells[1,0]:='入库数量';
  stringgrid7.Cells[2,0]:='出库数量';
  stringgrid7.Cells[3,0]:='记帐日期';
  stringgrid7.Cells[4,0]:='备注';
end;

end.

