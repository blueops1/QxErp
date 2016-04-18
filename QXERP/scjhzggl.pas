unit scjhzggl;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ZAbstractRODataset, ZAbstractDataset, ZStoredProcedure, StdCtrls,
  Grids, ExtCtrls;

type
  TForm88 = class(TForm)
    Bevel2: TBevel;
    Bevel1: TBevel;
    Label8: TLabel;
    Label6: TLabel;
    StringGrid1: TStringGrid;
    StringGrid2: TStringGrid;
    Button1: TButton;
    Button2: TButton;
    Button4: TButton;
    ZStoredProc1: TZStoredProc;
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure StringGrid1SelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure Button2Click(Sender: TObject);
    procedure StringGrid2SelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure Button4Click(Sender: TObject);
    procedure StringGrid1DblClick(Sender: TObject);
    procedure StringGrid2DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form88: TForm88;
  SelARow,gzSelARow:integer;
  function SplitString(Source, Deli: string ): String;stdcall;external 'dlltools.dll';

implementation

uses main,scjhdmxzcx;

{$R *.dfm}

procedure DeleteStringGridRow(vRow: Integer; StringGrid: TStringGrid);
var
  i:Integer;
begin
  if StringGrid.RowCount > vRow then
  begin
    for i:= vRow to StringGrid.RowCount - 1 do
    begin
      StringGrid.Rows[i]:= StringGrid.Rows[i+1];
    end;
    StringGrid.RowCount := StringGrid.RowCount - 1;
  end;
end;

procedure TForm88.Button1Click(Sender: TObject);
var
  i:integer;
  booldouble:boolean;
begin
  booldouble:=true;
  for i := 1 to stringgrid2.RowCount-2 do
    if trim(stringgrid1.Cells[1,SelArow])=trim(stringgrid2.Cells[1,i]) then
      booldouble:=false;
  if booldouble=false then
    application.MessageBox('该计划单编号已经添加至跟踪列表!','生产计划单跟踪信息提示')
  else if (SelArow>0) and (SelArow<stringgrid1.RowCount-1) and (stringgrid1.Cells[1,SelArow]<>'') then
    try
      with zStoredProc1 do
      begin
        close;
        StoredProcName:='proc_insert_scjhdtips_by_czyid';
        ParamByName('scjhdbh').Value:=stringgrid1.Cells[1,SelArow];
        ParamByName('czlx').Value:='ADD';
        ParamByName('czyid').Value:=main.strUser;
        ExecProc;
        application.MessageBox('增加计划单跟踪项目成功！','生产计划单跟踪信息提示');
        stringgrid2.RowCount:=stringgrid2.RowCount+1;
        stringgrid2.Cells[0,stringgrid2.RowCount-2]:=inttostr(stringgrid2.RowCount-2);
        stringgrid2.Cells[1,stringgrid2.RowCount-2]:=stringgrid1.Cells[1,SelArow];
        stringgrid2.Cells[2,stringgrid2.RowCount-2]:=stringgrid1.Cells[2,SelArow];
        stringgrid2.Cells[3,stringgrid2.RowCount-2]:='0';
        DeleteStringGridRow(SelArow,stringgrid1);
      end;
    except
      application.MessageBox('增加计划单跟踪项目失败','生产计划单跟踪信息提示');
    end;
end;

procedure TForm88.Button2Click(Sender: TObject);
var
  i:integer;
begin
  if (gzSelARow>0) and (gzSelARow<stringgrid2.RowCount-1) and (stringgrid2.Cells[1,gzSelARow]<>'') then
  try
    with zStoredProc1 do
    begin
      close;
      StoredProcName:='proc_insert_scjhdtips_by_czyid';
      ParamByName('scjhdbh').Value:=stringgrid2.Cells[1,gzSelARow];
      ParamByName('czlx').Value:='DEL';
      ParamByName('czyid').Value:=main.strUser;
      ExecProc;
      DeleteStringGridRow(gzSelARow,stringgrid2);
      close;
      zstoredproc1.StoredProcName:='proc_wgzjhd_by_czyid';
      ParamByName('czyid').Value:=main.strUser;
      open;
      i:=1;
      stringgrid1.RowCount:=2;
      stringgrid1.Rows[1].Clear;
      while not eof do
      begin
        stringgrid1.RowCount:=stringgrid1.RowCount+1;
        stringgrid1.Cells[0,i]:=inttostr(i);
        stringgrid1.Cells[1,i]:=fields[0].AsString;
        stringgrid1.Cells[2,i]:=fields[1].AsString;
        i:=i+1;
        stringgrid1.Rows[stringgrid1.RowCount-1].Clear;
        next;
      end;
      application.MessageBox('删除计划单跟踪项目成功！','生产计划单跟踪信息提示');
    end;
  except
    application.MessageBox('增加计划单跟踪项目失败','生产计划单跟踪信息提示');
  end;
end;

procedure TForm88.Button4Click(Sender: TObject);
var
  i:integer;
begin
 if  application.MessageBox('确定清除所有跟踪项目吗？','生产计划单跟踪信息提示',1)=1 then
  try
    with zStoredProc1 do
    begin
      close;
      StoredProcName:='proc_insert_scjhdtips_by_czyid';
      ParamByName('scjhdbh').Value:='';
      ParamByName('czlx').Value:='CLR';
      ParamByName('czyid').Value:=main.strUser;
      ExecProc;
      close;
      zstoredproc1.StoredProcName:='proc_wgzjhd_by_czyid';
      ParamByName('czyid').Value:=main.strUser;
      open;
      i:=1;
      stringgrid1.RowCount:=2;
      stringgrid1.Rows[1].Clear;
      while not eof do
      begin
        stringgrid1.RowCount:=stringgrid1.RowCount+1;
        stringgrid1.Cells[0,i]:=inttostr(i);
        stringgrid1.Cells[1,i]:=fields[0].AsString;
        stringgrid1.Cells[2,i]:=fields[1].AsString;
        i:=i+1;
        stringgrid1.Rows[stringgrid1.RowCount-1].Clear;
        next;
      end;
      application.MessageBox('删除计划单跟踪项目成功！','生产计划单跟踪信息提示');
    end;
    for I := 1 to stringgrid2.RowCount - 1 do
    begin
      stringgrid2.Rows[i].Clear;
    end;
      stringgrid2.RowCount:=2;
      stringgrid2.Rows[1].Clear;
      application.MessageBox('清除计划单跟踪项目成功！','生产计划单跟踪信息提示');
  except
    application.MessageBox('清除计划单跟踪项目失败','生产计划单跟踪信息提示');
  end;
end;

procedure TForm88.FormShow(Sender: TObject);
var
  i:integer;
begin
  stringgrid1.RowCount:=2;
  stringgrid1.Rows[1].Clear;
  stringgrid2.RowCount:=2;
  stringgrid2.Rows[1].Clear;
  stringgrid1.Cells[0,0]:='序号';
  stringgrid1.Cells[1,0]:='计划单编号';
  stringgrid1.Cells[2,0]:='项目名称';
  stringgrid2.Cells[0,0]:='序号';
  stringgrid2.Cells[1,0]:='计划单编号';
  stringgrid2.Cells[2,0]:='项目名称';
    try
      with zstoredproc1 do
      begin
        close;
        zstoredproc1.StoredProcName:='proc_wgzjhd_by_czyid';
        ParamByName('czyid').Value:=main.strUser;
        open;
        i:=1;
        stringgrid1.RowCount:=2;
        stringgrid1.Rows[1].Clear;
        while not eof do
        begin
           stringgrid1.RowCount:=stringgrid1.RowCount+1;
           stringgrid1.Cells[0,i]:=inttostr(i);
           stringgrid1.Cells[1,i]:=fields[0].AsString;
           stringgrid1.Cells[2,i]:=fields[1].AsString;
           i:=i+1;
           stringgrid1.Rows[stringgrid1.RowCount-1].Clear;
           next;
        end;
        close;
        StoredProcName:='proc_cx_ygzscjhd_by_czyid';
        ParamByName('czyid').Value:=main.strUser;
        open;
        i:=1;
        while not eof do
        begin
          stringgrid2.RowCount:=stringgrid2.RowCount+1;
          stringgrid2.Cells[0,i]:=inttostr(i);
          stringgrid2.Cells[1,i]:=fields[0].AsString;
          stringgrid2.Cells[2,i]:=fields[1].AsString;
          i:=i+1;
          stringgrid2.rows[stringgrid2.RowCount-1].Clear;
          next;
        end;
        //combobox1.DroppedDown:=true;
      end;
  except
    application.MessageBox('数据查询失败！','计划单查询提示');
  end;
end;

procedure TForm88.StringGrid1DblClick(Sender: TObject);
begin
  if scjhdmxzcx.strscjhdbh<>'' then
    scjhdmxzcx.Form90.ShowModal;
end;

procedure TForm88.StringGrid1SelectCell(Sender: TObject; ACol, ARow: Integer;
  var CanSelect: Boolean);
begin
  SelARow:=ARow;
  scjhdmxzcx.strscjhdbh:='';
  if (ARow>0) and (ARow+1<stringgrid1.RowCount) then
    scjhdmxzcx.strscjhdbh:=stringgrid1.Cells[1,ARow];
end;

procedure TForm88.StringGrid2DblClick(Sender: TObject);
begin
  if scjhdmxzcx.strscjhdbh<>'' then
    scjhdmxzcx.Form90.ShowModal;
end;

procedure TForm88.StringGrid2SelectCell(Sender: TObject; ACol, ARow: Integer;
  var CanSelect: Boolean);
begin
  gzSelARow:=ARow;
  scjhdmxzcx.strscjhdbh:='';
  if (ARow>0) and (ARow+1<stringgrid2.RowCount) then
    scjhdmxzcx.strscjhdbh:=stringgrid2.Cells[1,ARow];
end;

end.
