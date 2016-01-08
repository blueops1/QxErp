unit kptzs;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ZAbstractRODataset, ZAbstractDataset, ZStoredProcedure, StdCtrls,
  Grids;

type
  TForm77 = class(TForm)
    ComboBox1: TComboBox;
    ZStoredProc1: TZStoredProc;
    Label1: TLabel;
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
    StringGrid2: TStringGrid;
    Edit2: TEdit;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Memo2: TMemo;
    Label5: TLabel;
    Label6: TLabel;
    Button4: TButton;
    Edit4: TEdit;
    procedure ComboBox1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ComboBox1Select(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure StringGrid1SelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure StringGrid2SelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure StringGrid1DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form77: TForm77;
  sARow,sARow2:integer;

implementation
uses main,fhdxxzl;

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

procedure TForm77.Button1Click(Sender: TObject);
var
  i:integer;
  booldouble:boolean;
begin
  booldouble:=true;
  for i := 1 to stringgrid2.RowCount-2 do
    if trim(stringgrid1.Cells[1,sARow])=trim(stringgrid2.Cells[1,i]) then
      booldouble:=false;
  if booldouble=false then
    application.MessageBox('�÷���������Ѿ���������Ʊ�б�!','��Ʊ֪ͨ����ʾ')
    else if (sARow<stringgrid1.RowCount-1) and (sARow>0) then
    begin
      stringgrid2.RowCount:=stringgrid2.RowCount+1;
      stringgrid2.Cells[0,stringgrid2.RowCount-2]:=inttostr(stringgrid2.RowCount-2);
      stringgrid2.Cells[1,stringgrid2.RowCount-2]:=stringgrid1.Cells[1,sARow];
      stringgrid2.Cells[2,stringgrid2.RowCount-2]:=stringgrid1.Cells[4,sARow];
      stringgrid2.Cells[3,stringgrid2.RowCount-2]:=stringgrid1.Cells[4,sARow];
      stringgrid2.Cells[4,stringgrid2.RowCount-2]:='';
      edit4.Text:=floattostr(strtofloat(edit4.Text)+strtofloat(stringgrid1.Cells[4,sARow]));
      stringgrid2.Rows[stringgrid2.RowCount-1].Clear;
      sARow:=0;
    end;
end;

procedure TForm77.Button2Click(Sender: TObject);
begin
  if (sARow2<stringgrid2.RowCount-1) and (sARow2>0) then
  begin
    edit4.Text:=floattostr(strtofloat(edit4.Text)+strtofloat(stringgrid2.Cells[3,sARow]));
    DeleteStringGridRow(sARow2,stringgrid2);
    sARow2:=0;
  end;
end;

procedure TForm77.Button3Click(Sender: TObject);
var
  i:integer;
begin
if (stringgrid2.RowCount>2) and (edit2.Text<>'') then
  try
    with zStoredProc1 do
    begin
      close;
      StoredProcName:='proc_insert_kaipiaotongzhishu';  //kptzsid,htbh,CURDATE(),czry,memo
      ParamByName('kptzsid').Value:=edit2.Text;
      ParamByName('htbh').Value:=edit1.Text;
      ParamByName('kpje').Value:=edit4.text;
      ParamByName('czry').Value:=main.strUser;
      ParamByName('memo').Value:='*'+memo2.Text;
      ExecProc;
      close;
      StoredProcName:='proc_insert_kaipiaotongzhishu_mxz';     //kptzsid,fhdbh,kpje,memo
      for i := 1 to stringgrid2.RowCount - 2 do
      begin
        ParamByName('kptzsid').Value:=edit2.Text;
        ParamByName('fhdbh').Value:=stringgrid2.Cells[1,i];
        ParamByName('kpje').Value:=stringgrid2.Cells[3,i];
        ParamByName('memo').Value:='��Ʊ��ͬ�ı��Ϊ��'+edit1.Text;
        ExecProc;
      end;
      application.MessageBox('�������ݳɹ�','��Ʊ֪ͨ����ʾ');
      edit9.text:='';
      edit6.text:='';
      edit11.text:='';
      edit3.text:='';
      edit12.text:='';
      edit13.text:='';
      memo1.Lines.Clear;
      memo2.Lines.Clear;
      edit2.Text:='0';
      combobox1.Text:='';
      stringgrid1.RowCount:=2;
      stringgrid1.Rows[1].Clear;
      stringgrid2.RowCount:=2;
      stringgrid2.Rows[1].Clear;
      edit1.Text:='';
      combobox1.SetFocus;
    end;
  except
    application.MessageBox('��������ʧ��','��Ʊ֪ͨ����ʾ');
  end;
end;

procedure TForm77.Button4Click(Sender: TObject);
begin
  if  application.MessageBox('ȷ��ȡ���˳���','��Ʊ֪ͨ����ʾ',1)=1 then
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
    combobox1.Text:='';
    stringgrid1.RowCount:=2;
    stringgrid1.Rows[1].Clear;
    stringgrid2.RowCount:=2;
    stringgrid2.Rows[1].Clear;
    edit1.Text:='';
    combobox1.SetFocus;
    form77.Close;
  end;
end;

procedure TForm77.ComboBox1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if key=13 then
 begin
    if combobox1.Items.Count>0 then
    ComboBox1.Items.Clear;
    //combobox1.Items.Add('*|ȫ����Ӧ��');
    try
      with zstoredproc1 do
      begin
        close;
        zstoredproc1.StoredProcName:='proc_cx_khandzgdwandxsy_by_cxitemandcxmc';
        zstoredproc1.ParamByName('cxitem').Value:='khhtxsy';
        zstoredproc1.ParamByName('cxmc').Value:=ComboBox1.Text;
        open;
        while not eof do
        begin
          ComboBox1.Items.Add(fields[0].asstring);
          next;
        end;
        //combobox1.DroppedDown:=true;
      end;
  except
    application.MessageBox('���ݲ�ѯʧ�ܣ�','��Ʒ���Գ�����ʾ');
  end;
 end;
end;

procedure TForm77.ComboBox1Select(Sender: TObject);
var
  i:integer;
begin
    try
      with zStoredProc1 do
      begin
        close;
        StoredProcName:='proc_cx_tuihuo_htinfo_by_htbh';
        ParamByName('htbh').Value:=splitstring(combobox1.Text,'|');
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
          edit2.text:=fields[7].AsString;
          edit1.Text:= splitstring(combobox1.Text,'|');
        end;
        close;
        StoredProcName:='proc_cx_kptzs_wkpmxz_by_htbh';
        ParamByName('htbh').Value:=edit1.Text;
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
            stringgrid1.Cells[3,i]:=fields[2].AsString;
            stringgrid1.Cells[4,i]:=fields[4].AsString;
            stringgrid1.Cells[5,i]:=fields[3].AsString;
            i:=i+1;
            stringgrid1.Rows[stringgrid1.RowCount-1].Clear;         //proc_cx_newkptzsid
          next;
        end;
        close;
        StoredProcName:='proc_cx_newkptzsid';
        open;
        if fields[0].AsString<>'' then
          edit2.Text:=fields[0].AsString
        else
          edit2.Text:=formatDateTime('yyyy',date)+'000001';
{        NextResultSet;
        stringgrid1.RowCount:=stringgrid1.RowCount+1;
        stringgrid1.Cells[0,i]:='�ϼ�';
        stringgrid1.Cells[1,i]:=fields[0].AsString;
        stringgrid1.Cells[2,i]:=fields[1].AsString;
        stringgrid1.Cells[3,i]:=fields[2].AsString;
        i:=i+1;
        stringgrid1.Rows[stringgrid1.RowCount-1].Clear;     }
      end;
    except
      application.MessageBox('���ݲ�ѯʧ�ܣ�','��Ʊ֪ͨ����ʾ');
    end;
end;

procedure TForm77.FormShow(Sender: TObject);
begin
  stringgrid1.Cells[0,0]:='���';
  stringgrid1.Cells[1,0]:='���������';
  stringgrid1.Cells[2,0]:='��������';
  stringgrid1.Cells[3,0]:='�ѿ�Ʊ�ܶ�';
  stringgrid1.Cells[4,0]:='δ��Ʊ�ܶ�';
  stringgrid1.Cells[5,0]:='��ע';
  stringgrid2.Cells[0,0]:='���';
  stringgrid2.Cells[1,0]:='���������';
  stringgrid2.Cells[2,0]:='δ��Ʊ�ܶ�';
  stringgrid2.Cells[3,0]:='���ο�Ʊ��';
end;

procedure TForm77.StringGrid1DblClick(Sender: TObject);
begin
  if (fhdid<>'') then
    fhdxxzl.form21.ShowModal;
end;

procedure TForm77.StringGrid1SelectCell(Sender: TObject; ACol, ARow: Integer;
  var CanSelect: Boolean);
begin
  sARow:=ARow;
  if (stringgrid1.RowCount>2) and (ARow>0) and (ARow<stringgrid1.RowCount-1) then
    fhdid:=stringgrid1.Cells[0,ARow]
  else
    fhdid:='';
end;

procedure TForm77.StringGrid2SelectCell(Sender: TObject; ACol, ARow: Integer;
  var CanSelect: Boolean);
begin
  sARow2:=ARow;
  //tmpString:=stringgrid2.Cells[ACol,ARow];
end;

end.