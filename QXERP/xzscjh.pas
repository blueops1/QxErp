unit xzscjh;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ZAbstractRODataset, ZAbstractDataset, ZStoredProcedure, StdCtrls,
  Grids, ComCtrls;

type
  TForm36 = class(TForm)
    Edit1: TEdit;
    ZStoredProc1: TZStoredProc;
    StringGrid1: TStringGrid;
    StringGrid2: TStringGrid;
    StringGrid3: TStringGrid;
    Button1: TButton;
    Button2: TButton;
    Label1: TLabel;
    Button3: TButton;
    Button4: TButton;
    DateTimePicker1: TDateTimePicker;
    Edit2: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Memo1: TMemo;
    Button5: TButton;
    procedure StringGrid1SelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure Button1Click(Sender: TObject);
    procedure StringGrid2SelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure Button2Click(Sender: TObject);
    procedure StringGrid3SelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure FormShow(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure StringGrid3SetEditText(Sender: TObject; ACol, ARow: Integer;
      const Value: string);
    procedure Button5Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form36: TForm36;
  sARow,sARow2:integer;
  tmpString:string;
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
    application.MessageBox('�ò�Ʒ����Ѿ��������ƻ������б�!','��Ʊ������ʾ')
    else if (sARow<stringgrid2.RowCount-1) and (sARow>0) and (strtofloat(stringgrid2.Cells[4,sARow])>strtofloat(stringgrid2.Cells[5,sARow])) then
    begin
      stringgrid3.RowCount:=stringgrid3.RowCount+1;
      stringgrid3.Cells[0,stringgrid3.RowCount-2]:=inttostr(stringgrid3.RowCount-2);
      stringgrid3.Cells[1,stringgrid3.RowCount-2]:=stringgrid2.Cells[1,sARow];
      stringgrid3.Cells[2,stringgrid3.RowCount-2]:=stringgrid2.Cells[2,sARow];
      stringgrid3.Cells[3,stringgrid3.RowCount-2]:=floattostr(strtofloat(stringgrid2.Cells[4,sARow])-strtofloat(stringgrid2.Cells[5,sARow]));
      stringgrid3.Cells[4,stringgrid3.RowCount-2]:='';
      stringgrid3.Rows[stringgrid3.RowCount-1].Clear;
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

procedure TForm36.Button3Click(Sender: TObject);
var
  i:integer;
begin
  try
    stringgrid1.RowCount:=2;
    stringgrid1.Rows[1].Clear;
    stringgrid2.RowCount:=2;
    stringgrid2.Rows[1].Clear;
    stringgrid3.RowCount:=2;
    stringgrid3.Rows[1].Clear;
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
        stringgrid1.Cells[4,i]:=fields[3].AsString;
        i:=i+1;
        stringgrid1.Rows[stringgrid1.RowCount-1].Clear;
        next;
      end;
    end;
  except
    application.MessageBox('���ݲ�ѯʧ�ܣ�','������ͬ��ʾ');
  end;
end;

procedure TForm36.Button4Click(Sender: TObject);
var
  y:integer;
  boolnull:boolean;
begin
  boolnull:=true;
   for y := 1 to stringgrid3.RowCount - 2 do
   begin
     if (stringgrid3.Cells[4,y]='') or (stringgrid3.Cells[4,y]='0') then
        boolnull:=false;
   end;
  if boolnull=false then
    application.MessageBox('��ȷ�ϼƻ����б��мƻ���Ϊ����ֵ��','�����ƻ�����ʾ')
  else if application.MessageBox('ȷ��Ҫ����������','�����ƻ�����ʾ',1)=1 then
  if stringgrid3.RowCount>2 then
  try
      with zstoredproc1 do
      begin
        close;
        zstoredproc1.StoredProcName:='proc_insert_jihuadan_info';  //rwdbh,jhksdate,jhfhdate,memo
        zstoredproc1.ParamByName('rwdbh').Value:=edit2.Text;
        zstoredproc1.ParamByName('jhksdate').Value:=now();
        zstoredproc1.ParamByName('jhfhdate').Value:=datetimepicker1.Date;
        zstoredproc1.ParamByName('memo').Value:='*'+memo1.Text;
        execProc;
        zstoredproc1.StoredProcName:='proc_insert_jihuadan_mxz';  //cpbh,jhsl
        for y := 1 to stringgrid3.RowCount - 2 do
        begin
          zstoredproc1.ParamByName('cpbh').Value:=splitstring(stringgrid3.Cells[2,y],'|');
          zstoredproc1.ParamByName('jhsl').Value:=stringgrid3.Cells[4,y];
          execProc;
        end;
        zstoredproc1.StoredProcName:='proc_update_renwudan_by_rwdbh_cpbh_jhzsl';  //cpbh,jhsl
        for y := 1 to stringgrid3.RowCount - 2 do
        begin
          zstoredproc1.ParamByName('rwdbh').Value:=stringgrid3.Cells[1,y];
          zstoredproc1.ParamByName('cpbh').Value:=splitstring(stringgrid3.Cells[2,y],'|');
          zstoredproc1.ParamByName('jhzsl').Value:=stringgrid3.Cells[4,y];
          execProc;
        end;
      end;
      edit1.Text:='';
      edit2.Text:='';
      memo1.Text:='';
      stringgrid1.RowCount:=2;
      stringgrid1.Rows[1].Clear;
      stringgrid2.RowCount:=2;
      stringgrid2.Rows[1].Clear;
      stringgrid3.RowCount:=2;
      stringgrid3.Rows[1].Clear;
      application.MessageBox('�������ݳɹ���','�����ƻ�����ʾ');
  except
    application.MessageBox('��������ʧ�ܣ�','�����ƻ�����ʾ');
  end else
    application.MessageBox('�����Ӽƻ����ڵ���ϸ��','�����ƻ�����ʾ');
end;

procedure TForm36.Button5Click(Sender: TObject);
begin
  edit1.Text:='';
  edit2.Text:='';
  memo1.Text:='';
  stringgrid1.RowCount:=2;
  stringgrid1.Rows[1].Clear;
  stringgrid2.RowCount:=2;
  stringgrid2.Rows[1].Clear;
  stringgrid3.RowCount:=2;
  stringgrid3.Rows[1].Clear;
  form36.Close;
end;

procedure TForm36.FormShow(Sender: TObject);
begin
  datetimepicker1.Date:=now();
  stringgrid1.Cells[0,0]:='���';
  stringgrid1.Cells[1,0]:='���񵥱��';
  stringgrid1.Cells[2,0]:='��ͬ���';
  stringgrid1.Cells[3,0]:='�ͻ�����';
  stringgrid1.Cells[4,0]:='����Ա';
  stringgrid2.Cells[0,0]:='���';
  stringgrid2.Cells[1,0]:='���񵥱��';
  stringgrid2.Cells[2,0]:='��Ʒ����';
  stringgrid2.Cells[3,0]:='��λ';
  stringgrid2.Cells[4,0]:='��������';
  stringgrid2.Cells[5,0]:='���¼ƻ���';
  stringgrid3.Cells[0,0]:='���';
  stringgrid3.Cells[1,0]:='���񵥺�';
  stringgrid3.Cells[2,0]:='��Ʒ����';
  stringgrid3.Cells[3,0]:='ʣ����';
  stringgrid3.Cells[4,0]:='�¼ƻ���';
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
      edit2.Text:=stringgrid1.Cells[1,ARow];
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
      application.MessageBox('���ݲ�ѯʧ�ܣ�','�����ƻ�����ʾ');
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
  tmpString:=stringgrid3.Cells[ACol,ARow];
end;

procedure TForm36.StringGrid3SetEditText(Sender: TObject; ACol, ARow: Integer;
  const Value: string);
begin
  if (ACol<>4) and (ARow>0) then
  begin
    stringgrid3.Cells[ACol,ARow]:=tmpString;
  end else
  if strtofloat(stringgrid3.Cells[3,ARow])<strtofloat(stringgrid3.Cells[4,ARow]) then
    stringgrid3.Cells[4,ARow]:='0';
end;

end.