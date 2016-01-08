unit kptzsdy;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DB, ZAbstractRODataset, ZAbstractDataset,
  ZStoredProcedure;

type
  TForm79 = class(TForm)
    ZStoredProc1: TZStoredProc;
    Label2: TLabel;
    Edit1: TEdit;
    Label4: TLabel;
    Edit9: TEdit;
    Label13: TLabel;
    Edit6: TEdit;
    Label19: TLabel;
    Edit11: TEdit;
    Label3: TLabel;
    Edit3: TEdit;
    Label20: TLabel;
    Edit12: TEdit;
    Label22: TLabel;
    Memo1: TMemo;
    Label21: TLabel;
    Edit13: TEdit;
    StringGrid1: TStringGrid;
    Edit2: TEdit;
    Button3: TButton;
    Memo2: TMemo;
    Label5: TLabel;
    Label6: TLabel;
    Button4: TButton;
    Edit4: TEdit;
    procedure FormShow(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form79: TForm79;
  strkptzsbh,strhtbh:string;
  function SmallTOBig(small:real):string;stdcall;external 'dlltools.dll';

implementation

uses main;

{$R *.dfm}

procedure TForm79.Button3Click(Sender: TObject);
begin
if(edit2.Text<>'') and (stringgrid1.RowCount>2) then
  try
    form1.RvDataSetConnection1.DataSet:=zstoredProc1;
    with zstoredproc1 do
    begin
      close;
      StoredProcName:='proc_cx_kptzs_mxz_by_kptzsid';
      ParamByName('kptzsid').Value:=edit2.Text;
      open;
      with form1 do
      begin
        rvproject1.Open;
        rvproject1.SelectReport('kptzsdy',true);
        rvproject1.ClearParams;
        rvproject1.SetParam('kptzsbh',edit2.Text);
        rvproject1.SetParam('htbh',edit1.Text);
        rvproject1.SetParam('khmc',edit3.Text);
        rvproject1.SetParam('cdrq',edit9.Text);
        rvproject1.SetParam('xsyxm',edit6.Text);
        rvproject1.SetParam('memo',memo2.Text);
        rvproject1.SetParam('hjje','（人民币）'+edit4.Text+'元（￥:'+SmallTOBig(strtofloat(edit4.Text))+'）');
        rvproject1.SetParam('czry',main.strUser);
        zstoredproc1.SetResultSet(1);
        RvProject1.Execute;
        rvproject1.Close;
      end;
    end;
  except
    application.MessageBox('打印失败','开票通知书打印提示');
  end else
    application.MessageBox('请先调入已保存的开票通知书！','开票通知书打印提示');
end;

procedure TForm79.Button4Click(Sender: TObject);
begin
  if  application.MessageBox('确定取消退出吗？','开票通知书打印提示',1)=1 then
  begin
    edit9.text:='';
    edit6.text:='';
    edit11.text:='';
    edit3.text:='';
    edit12.text:='';
    edit13.text:='';
    memo1.Lines.Clear;
    memo2.Lines.Clear;
    edit2.Text:='0';
    stringgrid1.RowCount:=2;
    stringgrid1.Rows[1].Clear;
    edit1.Text:='';
    form79.Close;
  end;
end;

procedure TForm79.FormShow(Sender: TObject);
var
  i:integer;
begin
  stringgrid1.Cells[0,0]:='序号';
  stringgrid1.Cells[1,0]:='通知书编号';
  stringgrid1.Cells[2,0]:='发货单编号';
  stringgrid1.Cells[3,0]:='本次开票额';
  stringgrid1.Cells[4,0]:='备注';
  edit1.Text:= strhtbh;
  edit2.Text:= strkptzsbh;
  edit4.Text:= '0';
    try
      with zStoredProc1 do
      begin
        close;
        StoredProcName:='proc_cx_tuihuo_htinfo_by_htbh';
        ParamByName('htbh').Value:=edit1.Text;
        open;
        if not eof then
        begin
          edit9.text:=fields[0].AsString;
          edit6.text:=fields[1].AsString;
          edit11.text:=fields[2].AsString;
          edit3.text:=fields[3].AsString;
          edit12.text:=fields[4].AsString;
          edit13.text:=fields[5].AsString;
          memo1.Text:=fields[6].AsString;
        end;
        close;
        StoredProcName:='proc_cx_kptzs_mxz_by_kptzsid';
        ParamByName('kptzsid').Value:=edit2.Text;
        open;
        firstresultset;
        if not eof then
          memo2.Text:=fields[0].AsString;
        i:=1;
        nextresultset;
        stringgrid1.rowcount:=2;
        stringgrid1.rows[1].clear;
        while not eof do
        begin
            stringgrid1.RowCount:=stringgrid1.RowCount+1;
            stringgrid1.Cells[0,i]:=inttostr(i);
            stringgrid1.Cells[1,i]:=fields[0].AsString;
            stringgrid1.Cells[2,i]:=fields[1].AsString;
            stringgrid1.Cells[3,i]:=fields[2].AsString;
            stringgrid1.Cells[4,i]:=fields[3].AsString;
            edit4.Text:=floattostr(strtofloat(edit4.Text)+strtofloat(fields[2].asstring));
            i:=i+1;
            stringgrid1.Rows[stringgrid1.RowCount-1].Clear;         //proc_cx_newkptzsid
          next;
        end;
      end;
    except
      application.MessageBox('查询数据失败','开票通知书打印');
    end;
end;

end.
