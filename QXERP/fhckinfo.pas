unit fhckinfo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ZAbstractRODataset, ZAbstractDataset, ZStoredProcedure, StdCtrls,
  Grids, ExtCtrls, ComCtrls;

type
  TForm63 = class(TForm)
    Label3: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label6: TLabel;
    Label5: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    Label1: TLabel;
    Bevel1: TBevel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Edit2: TEdit;
    Edit3: TEdit;
    StringGrid1: TStringGrid;
    Edit4: TEdit;
    Edit5: TEdit;
    Edit6: TEdit;
    Edit7: TEdit;
    Edit8: TEdit;
    Edit9: TEdit;
    Edit10: TEdit;
    Edit11: TEdit;
    Edit12: TEdit;
    Edit13: TEdit;
    Button2: TButton;
    Edit14: TEdit;
    Edit1: TEdit;
    Edit15: TEdit;
    Edit16: TEdit;
    Edit17: TEdit;
    Edit18: TEdit;
    ZStoredProc1: TZStoredProc;
    DateTimePicker1: TDateTimePicker;
    Label19: TLabel;
    procedure Edit10Change(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form63: TForm63;
  fhdid:string;
  tmpzjje:string;
  function SmallTOBig(small:real):string;stdcall;external 'dlltools.dll';

implementation

uses main,fhck;

{$R *.dfm}

procedure TForm63.Button2Click(Sender: TObject);
var
  y:integer;
begin
if application.MessageBox('确定要保存数据吗？','发货出库信息提示',1)=1 then
  if stringgrid1.RowCount>1 then
    try
      with zstoredproc1 do
      begin
        close;
        zstoredproc1.StoredProcName:='proc_insert_update_fahuock';  //fhdid,fhdate,yskbh,jzje
        zstoredproc1.ParamByName('fhdid').Value:=edit1.Text;
        zstoredproc1.ParamByName('fhdate').Value:=datetimepicker1.Date;
        zstoredproc1.ParamByName('yskbh').Value:=edit2.Text;
        zstoredproc1.ParamByName('jzje').Value:=strtofloat(edit16.Text);
        execProc;
        for y := 1 to stringgrid1.RowCount - 3 do
        begin
          zstoredproc1.StoredProcName:='proc_insert_fhck_cpcrkmxz';  //cpbh,cksl,jzdate,htbh,fhdbh,czry
          zstoredproc1.ParamByName('cpbh').Value:=stringgrid1.Cells[1,y];
          zstoredproc1.ParamByName('cksl').Value:=strtofloat(stringgrid1.Cells[5,y]);
          zstoredproc1.ParamByName('jzdate').Value:=datetimepicker1.Date;
          zstoredproc1.ParamByName('htbh').Value:=edit2.Text;
          zstoredproc1.ParamByName('fhdbh').Value:=edit1.Text;
          zstoredproc1.ParamByName('czry').Value:=main.strUser;
          execProc;
        end;
        application.MessageBox('发货单出库成功！','发货出库信息提示');
        edit1.Text:='';
        edit2.Text:='';
        edit4.Text:='';
        edit6.Text:='';
        edit15.Text:='';
        edit16.Text:='';
        edit17.Text:='';
        edit5.Text:='';
        edit3.Text:='';
        edit7.Text:='';
        edit18.Text:='';
        edit8.Text:='';
        edit12.Text:='';
        edit11.Text:='';
        edit10.Text:='';
        edit13.Text:='';
        edit9.Text:='';
        edit14.Text:='';
        datetimepicker1.DateTime:=now();
        stringgrid1.RowCount:=2;
        stringgrid1.Rows[1].Clear;
        close;
        zstoredproc1.StoredProcName:='proc_cx_fhd_info';
        zstoredproc1.ParamByName('xsyid').Value:='';
        zstoredproc1.ParamByName('cxxm').Value:=1;
        open;
        y:=1;
        fhck.Form62.StringGrid1.RowCount:=2;
        fhck.Form62.StringGrid1.Rows[1].Clear;
        while not eof do
        begin
          fhck.Form62.StringGrid1.RowCount:=fhck.Form62.StringGrid1.RowCount+1;;
          fhck.Form62.StringGrid1.Cells[0,y]:=Fields[0].AsString;
          fhck.Form62.StringGrid1.Cells[1,y]:=fields[1].AsString;
          fhck.Form62.StringGrid1.Cells[2,y]:=fields[2].AsString;
          fhck.Form62.StringGrid1.Cells[3,y]:=fields[3].AsString;
          fhck.Form62.StringGrid1.Cells[4,y]:=fields[4].AsString;
          fhck.Form62.StringGrid1.Cells[5,y]:=fields[5].AsString;
          y:=y+1;
          fhck.Form62.StringGrid1.Rows[fhck.Form62.StringGrid1.RowCount-1].Clear;
          next
        end;
      end;
    except
      application.MessageBox('更新数据失败！','发货出库信息提示');
    end;
end;

procedure TForm63.Edit10Change(Sender: TObject);
begin
  if edit10.Text <> '' then
    edit14.Text:=smalltobig(strtofloat(edit10.Text))
   else
    edit14.Text:='';
end;

procedure TForm63.FormShow(Sender: TObject);
var
  i:integer;
begin
  try
    with zstoredproc1 do
    begin
      close;
      zstoredproc1.StoredProcName:='proc_cx_fhdxxzl';
      zstoredproc1.ParamByName('fhdbh').Value:=fhdid;
      open;
      zstoredproc1.FirstResultSet;
      edit1.Text:=fields[0].AsString;
      edit2.Text:=fields[1].AsString;
      edit4.Text:=fields[2].AsString;
      edit6.Text:=fields[3].AsString;
      edit15.Text:=fields[4].AsString;
      edit16.Text:=fields[5].AsString;
      edit17.Text:=fields[6].AsString;
      edit5.Text:=fields[7].AsString;
      zstoredproc1.NextResultSet;
      i:=1;
      stringgrid1.Cells[0,0]:='序号';
      stringgrid1.Cells[1,0]:='产品编号';
      stringgrid1.Cells[2,0]:='产品名称';
      stringgrid1.Cells[3,0]:='产品种类';
      stringgrid1.Cells[4,0]:='销售价格';
      stringgrid1.Cells[5,0]:='发货数量';
      stringgrid1.Cells[6,0]:='合计金额';
      stringgrid1.RowCount:=2;
      stringgrid1.Rows[1].Clear;
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
        i:=i+1;
        stringgrid1.Rows[stringgrid1.RowCount-1].Clear;
        next;
      end;
      zstoredproc1.NextResultSet;
      if not eof then
      begin
        //stringgrid1.Cells[0,i]:=inttostr(i);
        stringgrid1.RowCount:=stringgrid1.RowCount+1;
        stringgrid1.Cells[0,i]:=fields[0].AsString;
        stringgrid1.Cells[2,i]:=fields[1].AsString;
        stringgrid1.Cells[3,i]:=fields[2].AsString;
        stringgrid1.Cells[4,i]:=fields[3].AsString;
        stringgrid1.Cells[5,i]:=fields[4].AsString;
        stringgrid1.Cells[6,i]:=fields[5].AsString;
        edit16.Text:=fields[5].AsString;
        i:=i+1;
        stringgrid1.Rows[stringgrid1.RowCount-1].Clear;
      end;
      zstoredproc1.LastResultSet;
      edit3.Text:=fields[0].AsString;
      edit7.Text:=fields[1].AsString;
      edit18.Text:=fields[2].AsString;
      edit8.Text:=fields[3].AsString;
      edit12.Text:=fields[4].AsString;
      edit11.Text:=fields[5].AsString;
      edit10.Text:=fields[6].AsString;
      edit13.Text:=fields[7].AsString;
      edit9.Text:=fields[8].AsString;
      datetimepicker1.DateTime:=now();
    end;
  except
    application.MessageBox('查询数据失败！','发货单详细信息提示');

  end;
end;

end.
