unit xzscjh;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ZAbstractRODataset, ZAbstractDataset, ZStoredProcedure, StdCtrls,
  Grids;

type
  TForm36 = class(TForm)
    Edit1: TEdit;
    ZStoredProc1: TZStoredProc;
    StringGrid1: TStringGrid;
    StringGrid2: TStringGrid;
    StringGrid3: TStringGrid;
    Button1: TButton;
    Button2: TButton;
    procedure Edit1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure StringGrid1SelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure Button1Click(Sender: TObject);
    procedure StringGrid2SelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure Button2Click(Sender: TObject);
    procedure StringGrid3SelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form36: TForm36;
  sARow,sARow2:integer;
  function SplitString(Source, Deli: string ): String;stdcall;external 'dlltools.dll';

implementation

{$R *.dfm}

uses main;

procedure DeleteStringGridRow(vRow: Integer; StringGrid: TStringGrid);
var
  i:Integer;
begin
  if StringGrid.RowCount > vRow then
  begin
    for i:= vRow to StringGrid.RowCount - vRow do
    begin
      StringGrid.Rows[i]:= StringGrid.Rows[i+1];
    end;
    StringGrid.RowCount := StringGrid.RowCount - 1;
  end;
end;

procedure TForm36.Button1Click(Sender: TObject);
var
  i:integer;
  booldouble:boolean;
begin
  booldouble:=true;
  for i := 1 to stringgrid3.RowCount-2 do
    if trim(stringgrid2.Cells[2,sARow])=trim(stringgrid3.Cells[2,i]) then
      booldouble:=false;
  if booldouble=false then
    application.MessageBox('该产品编号已经添加至计划任务列表!','发票核帐提示')
    else if (sARow<stringgrid2.RowCount-1) and (sARow>0) and (strtofloat(stringgrid2.Cells[4,sARow])>strtofloat(stringgrid2.Cells[5,sARow])) then
    begin
      stringgrid3.RowCount:=stringgrid3.RowCount+1;
      stringgrid3.Cells[0,stringgrid3.RowCount-2]:=inttostr(stringgrid3.RowCount-2);
      stringgrid3.Cells[1,stringgrid3.RowCount-2]:=stringgrid2.Cells[1,sARow];
      stringgrid3.Cells[2,stringgrid3.RowCount-2]:=stringgrid2.Cells[2,sARow];
      stringgrid3.Cells[3,stringgrid3.RowCount-2]:=floattostr(strtofloat(stringgrid2.Cells[4,sARow])-strtofloat(stringgrid2.Cells[5,sARow]));
      stringgrid3.Cells[4,stringgrid3.RowCount-2]:='';
      //stringgrid3.Rows[stringgrid3.RowCount-1].Clear;
      sARow:=0;
    end;
end;

procedure TForm36.Button2Click(Sender: TObject);
begin
  if (sARow2<stringgrid3.RowCount-1) and (sARow2>0) then
  begin
    DeleteStringGridRow(sARow2,stringgrid3);
    sARow2:=0;
  end;
end;

procedure TForm36.Edit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  i:integer;
begin
  if key=13 then
  try
    stringgrid1.RowCount:=2;
    stringgrid1.Rows[1].Clear;
    with  zStoredProc1 do
    begin
      close;
      StoredProcName:='proc_cx_renwudan_info_by_khmc';
      ParamByName('khmc').Value:=edit1.Text;
      open;
      i:=1;
      while not eof do
      begin
        stringgrid1.RowCount:=stringgrid1.RowCount+1;;
        stringgrid1.Cells[0,i]:=inttostr(i);
        stringgrid1.Cells[1,i]:=fields[0].AsString;
        stringgrid1.Cells[2,i]:=fields[1].AsString;
        stringgrid1.Cells[3,i]:=fields[2].AsString;
        i:=i+1;
        stringgrid1.Rows[stringgrid1.RowCount-1].Clear;
        next;
      end;
    end;
  except
    application.MessageBox('数据查询失败！','新增合同提示');
  end;
end;

procedure TForm36.FormShow(Sender: TObject);
begin
stringgrid1.Cells[0,0]:='序号';
stringgrid1.Cells[1,0]:='任务单编号';
stringgrid1.Cells[2,0]:='合同编号';
stringgrid1.Cells[3,0]:='客户名称';
stringgrid2.Cells[0,0]:='序号';
stringgrid2.Cells[1,0]:='任务单编号';
stringgrid2.Cells[2,0]:='产品名称';
stringgrid2.Cells[3,0]:='单位';
stringgrid2.Cells[4,0]:='任务总数';
stringgrid2.Cells[5,0]:='已下计划数';
stringgrid3.Cells[0,0]:='序号';
stringgrid3.Cells[1,0]:='任务单号';
stringgrid3.Cells[2,0]:='产品名称';
stringgrid3.Cells[3,0]:='剩余数';
stringgrid3.Cells[4,0]:='新计划数';
end;

procedure TForm36.StringGrid1SelectCell(Sender: TObject; ACol, ARow: Integer;
  var CanSelect: Boolean);
var
  i:integer;
begin
  if stringgrid1.Cells[1,ARow]<>'' then
    begin
    try
      stringgrid2.RowCount:=2;
      stringgrid2.Rows[1].Clear;
      with  zStoredProc1 do
      begin
        close;
        StoredProcName:='proc_cx_renwudan_mxz_by_rwdbh';
        ParamByName('rwdbh').Value:=stringgrid1.Cells[1,ARow];
        open;
        i:=1;
        while not eof do
        begin
          stringgrid2.RowCount:=stringgrid2.RowCount+1;;
          stringgrid2.Cells[0,i]:=inttostr(i);
          stringgrid2.Cells[1,i]:=fields[0].AsString;
          stringgrid2.Cells[2,i]:=fields[1].AsString;
          stringgrid2.Cells[3,i]:=fields[2].AsString;
          stringgrid2.Cells[4,i]:=fields[3].AsString;
          stringgrid2.Cells[5,i]:=fields[4].AsString;
          i:=i+1;
          stringgrid2.Rows[stringgrid2.RowCount-1].Clear;
          next;
        end;
      end;
    except
      application.MessageBox('数据查询失败！','新增合同提示');
    end;
  end;
end;

procedure TForm36.StringGrid2SelectCell(Sender: TObject; ACol, ARow: Integer;
  var CanSelect: Boolean);
begin
  sARow:=ARow;
end;

procedure TForm36.StringGrid3SelectCell(Sender: TObject; ACol, ARow: Integer;
  var CanSelect: Boolean);
begin
  sARow2:=ARow;
end;

end.
