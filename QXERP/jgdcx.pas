unit jgdcx;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Grids, StdCtrls, ComCtrls, DB, ZAbstractRODataset,
  ZAbstractDataset, ZStoredProcedure, Menus;

type
  TForm54 = class(TForm)
    Label6: TLabel;
    Edit4: TEdit;
    Label7: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Memo1: TMemo;
    StringGrid1: TStringGrid;
    Label8: TLabel;
    Bevel1: TBevel;
    ZStoredProc1: TZStoredProc;
    Edit1: TEdit;
    Edit2: TEdit;
    PopupMenu1: TPopupMenu;
    Execl1: TMenuItem;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Execl1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form54: TForm54;
  strjgdbh:string;

implementation

uses main;

{$R *.dfm}

procedure TForm54.Execl1Click(Sender: TObject);
begin
  if stringgrid1.RowCount>2 then
    ExportStrGridToExcel([stringgrid1])
  else
    application.MessageBox('列表中没有任何数据！','仓库查询提示');
end;

procedure TForm54.FormClose(Sender: TObject; var Action: TCloseAction);
begin
      edit4.Text:='';
      edit1.Text:='';
      edit2.Text:='';
      memo1.Text:='';
      stringgrid1.RowCount:=2;
      stringgrid1.Rows[1].Clear;
end;

procedure TForm54.FormShow(Sender: TObject);
var
  i:integer;
begin
  stringgrid1.Cells[0,0]:='序号';
  stringgrid1.Cells[1,0]:='加工单编号';
  stringgrid1.Cells[2,0]:='工件名称';
  stringgrid1.Cells[3,0]:='工件类型';
  stringgrid1.Cells[4,0]:='加工总数';
  stringgrid1.Cells[5,0]:='已交货总数';
  stringgrid1.Cells[6,0]:='加工单价';
  stringgrid1.Cells[7,0]:='备注';
  try
    with zStoredProc1 do
    begin
      close;
      StoredProcName:='proc_ccx_jgdinfo_mxz_by_jgdbh';
      ParamByName('jgdbh').Value:=strjgdbh;
      open;
      firstresultset;
      if not eof  then
      begin
      edit4.Text:=fields[0].AsString;
      edit1.Text:=fields[1].AsString;
      edit2.Text:=fields[2].AsString;
      memo1.Text:=fields[3].AsString;
      end;
      nextresultset;
      stringgrid1.RowCount:=2;
      stringgrid1.Rows[1].Clear;
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
        i:=i+1;
        stringgrid1.Rows[stringgrid1.RowCount-1].Clear;
        next;
      end;
    end;
  except
    application.MessageBox('数据查询失败！','新增加工单管理提示');
  end;
end;

end.
