unit csckddy;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, RpDefine, RpCon, RpConDS, DB, ZAbstractRODataset,
  ZAbstractDataset, ZStoredProcedure, Grids;

type
  TForm67 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label6: TLabel;
    Edit1: TEdit;
    Memo1: TMemo;
    StringGrid1: TStringGrid;
    Button3: TButton;
    ZStoredProc1: TZStoredProc;
    Edit2: TEdit;
    Edit3: TEdit;
    procedure FormShow(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Edit1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormDeactivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form67: TForm67;
  strcsckdbh:string;

implementation

uses main;

{$R *.dfm}

procedure TForm67.Button3Click(Sender: TObject);
begin
if(edit1.Text<>'') and (stringgrid1.RowCount>2) then
  try
    form1.RvDataSetConnection1.DataSet:=zstoredProc1;
    with zstoredproc1 do
    begin
      close;
      StoredProcName:='proc_cx_ceshichukudan_info_mxz_by_csckdid';
      ParamByName('csckdid').Value:=edit1.Text;
      open;
      with form1 do
      begin
        rvproject1.Open;
        rvproject1.SelectReport('csckddy',true);
        rvproject1.ClearParams;
        rvproject1.SetParam('csckdbh',edit1.Text);
        rvproject1.SetParam('sqrxm',edit2.Text);
        rvproject1.SetParam('memo',memo1.Text);
        rvproject1.SetParam('cdrq',edit3.Text);
        rvproject1.SetParam('czry',main.strUser);
        zstoredproc1.SetResultSet(1);
        RvProject1.Execute;
        rvproject1.Close;
      end;
    end;
  except
    application.MessageBox('打印失败','加工单打印提示');
  end else
    application.MessageBox('请先调入已保存的产品测试出库单！','加工单打印提示');
end;

procedure TForm67.Edit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  i:integer;
begin
  if (key=13) and (edit1.Text<>'') then
    try
      with zStoredProc1 do
      begin
        close;
        StoredProcName:='proc_cx_ceshichukudan_info_mxz_by_csckdid';
        ParamByName('csckdid').Value:=edit1.Text;
        open;
        firstresultset;
        if not eof  then
        begin
          edit1.Text:=fields[0].AsString;
          edit2.Text:=fields[1].AsString;
          edit3.Text:=fields[2].AsString;
          memo1.Text:=fields[3].AsString;
        end;
        stringgrid1.RowCount:=2;
        stringgrid1.Rows[1].Clear;
        i:=1;
        nextresultset;
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
      application.MessageBox('数据查询失败！','测试出库单打印提示');
    end;
end;

procedure TForm67.FormDeactivate(Sender: TObject);
begin
  edit1.Text:='';
  edit2.Text:='';
  edit3.Text:='';
  memo1.Text:='';
  stringgrid1.RowCount:=2;
  stringgrid1.Rows[1].Clear;
end;

procedure TForm67.FormShow(Sender: TObject);
var
  i:integer;
begin
  stringgrid1.Cells[0,0]:='序号';
  stringgrid1.Cells[1,0]:='产品名称';
  stringgrid1.Cells[2,0]:='测试数量';
  stringgrid1.Cells[3,0]:='备注';
  if strcsckdbh<>'' then
try
    with zStoredProc1 do
    begin
      close;
      StoredProcName:='proc_cx_ceshichukudan_info_mxz_by_csckdid';
      ParamByName('csckdid').Value:=strcsckdbh;
      open;
      firstresultset;
      if not eof  then
      begin
        edit1.Text:=fields[0].AsString;
        edit2.Text:=fields[1].AsString;
        edit3.Text:=fields[2].AsString;
        memo1.Text:=fields[3].AsString;
      end;
      stringgrid1.RowCount:=2;
      stringgrid1.Rows[1].Clear;
      i:=1;
      nextresultset;
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
    application.MessageBox('数据查询失败！','测试出库单打印提示');
  end;
end;

end.
