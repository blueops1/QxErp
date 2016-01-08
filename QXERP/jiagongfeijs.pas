unit jiagongfeijs;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ZAbstractRODataset, ZAbstractDataset, ZStoredProcedure, StdCtrls,
  Grids;

type
  TForm81 = class(TForm)
    Label1: TLabel;
    ComboBox1: TComboBox;
    ZStoredProc1: TZStoredProc;
    Label8: TLabel;
    Edit15: TEdit;
    Label9: TLabel;
    Edit8: TEdit;
    Label18: TLabel;
    Edit14: TEdit;
    Label10: TLabel;
    Edit9: TEdit;
    Label11: TLabel;
    Edit10: TEdit;
    Label12: TLabel;
    Edit11: TEdit;
    Label13: TLabel;
    Edit12: TEdit;
    Label6: TLabel;
    Edit2: TEdit;
    Button1: TButton;
    Button2: TButton;
    StringGrid1: TStringGrid;
    StringGrid2: TStringGrid;
    Label5: TLabel;
    Memo2: TMemo;
    Button3: TButton;
    Button4: TButton;
    Edit1: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    Edit3: TEdit;
    Edit4: TEdit;
    Label4: TLabel;
    Edit5: TEdit;
    procedure ComboBox1Select(Sender: TObject);
    procedure ComboBox1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure StringGrid1SelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure StringGrid2SelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure Button2Click(Sender: TObject);
    procedure Edit3KeyPress(Sender: TObject; var Key: Char);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure StringGrid1DblClick(Sender: TObject);
    procedure StringGrid2DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form81: TForm81;
  sARow,sARow2:integer;

implementation
uses main,jgdcx;

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

procedure TForm81.Button1Click(Sender: TObject);
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
      stringgrid2.Cells[2,stringgrid2.RowCount-2]:=stringgrid1.Cells[2,sARow];
      stringgrid2.Cells[3,stringgrid2.RowCount-2]:=stringgrid1.Cells[2,sARow];
      stringgrid2.Cells[4,stringgrid2.RowCount-2]:=edit5.Text;
      edit4.Text:=floattostr(strtofloat(edit4.Text)+strtofloat(stringgrid1.Cells[2,sARow]));
      //stringgrid2.Cells[4,stringgrid2.RowCount-2]:='';
      edit5.Text:='';
      stringgrid2.Rows[stringgrid2.RowCount-1].Clear;
      sARow:=0;
    end;
end;

procedure TForm81.Button2Click(Sender: TObject);
begin
  if (sARow2<stringgrid2.RowCount-1) and (sARow2>0) then
  begin
    edit4.Text:=floattostr(strtofloat(edit4.Text)-strtofloat(stringgrid2.Cells[3,sARow2]));
    DeleteStringGridRow(sARow2,stringgrid2);
    sARow2:=0;
  end;
end;

procedure TForm81.Button3Click(Sender: TObject);
var
  i:integer;
  strerrorxx:string;
begin                         //proc_insert_jiagongjiesuandan_info jgjsdid,jgsid,jszje,fpsl,fpbh,CURDATE(),czry,memo    //proc_insert_jiagongjiesuandan_mxz jgjsdid,jgdid,kpje,memo,fpbh,fpsl,
  if (edit15.Text<>'') and (edit1.Text<>'') and (edit2.Text<>'') and (edit3.Text<>'')and (edit4.Text<>'') and (stringgrid2.RowCount>2) then
    try
      with zStoredProc1 do
      begin
        close;
        strerrorxx:='������㵥ʧ��';
        StoredProcName:='proc_insert_jiagongjiesuandan_info';
        ParamByName('jgjsdid').Value:=edit2.Text;
        ParamByName('jgsid').Value:=edit15.Text;
        ParamByName('jszje').Value:=edit4.Text;
        ParamByName('fpsl').Value:=edit3.Text;
        ParamByName('fpbh').Value:=edit1.Text;
        ParamByName('czry').Value:=main.strUser;
        ParamByName('memo').Value:='*'+memo2.Text;
        ExecProc;
        close;
        strerrorxx:='������㵥��ϸʧ��';
        StoredProcName:='proc_insert_jiagongjiesuandan_mxz';     //kptzsid,fhdbh,kpje,memo
        for i := 1 to stringgrid2.RowCount - 2 do
        begin
          ParamByName('jgjsdid').Value:=edit2.Text;
          ParamByName('jgdid').Value:=stringgrid2.Cells[1,i];
          ParamByName('kpje').Value:=stringgrid2.Cells[3,i];
          ParamByName('memo').Value:=stringgrid2.Cells[4,i];
          ParamByName('fpsl').Value:=edit3.Text;
          ParamByName('fpbh').Value:=edit1.Text;
          ExecProc;
        end;
          application.MessageBox('�������ݳɹ�','��Ʊ֪ͨ����ʾ');
          edit1.Text:='';
          edit2.text:='';
          edit3.text:='0';
          edit4.Text:='0';
          edit8.text:='';
          edit9.text:='';
          edit10.text:='';
          edit11.text:='';
          edit12.text:='';
          edit14.text:='';
          edit15.text:='';
          memo2.Lines.Clear;
          combobox1.Text:='';
          stringgrid1.RowCount:=2;
          stringgrid1.Rows[1].Clear;
          stringgrid2.RowCount:=2;
          stringgrid2.Rows[1].Clear;
          combobox1.SetFocus;
      end;
    except
      application.MessageBox(pwidechar(strerrorxx),'�����ӹ����㵥������ʾ');
    end else
      application.MessageBox('�뽫��������д����','�����ӹ����㵥������ʾ');
end;

procedure TForm81.Button4Click(Sender: TObject);
begin
  if  application.MessageBox('ȷ��ȡ���˳���','��Ʊ֪ͨ����ʾ',1)=1 then
  begin
    edit1.Text:='';
    edit2.text:='';
    edit3.text:='0';
    edit4.Text:='0';
    edit8.text:='';
    edit9.text:='';
    edit10.text:='';
    edit11.text:='';
    edit12.text:='';
    edit14.text:='';
    edit15.text:='';
    memo2.Lines.Clear;
    combobox1.Text:='';
    stringgrid1.RowCount:=2;
    stringgrid1.Rows[1].Clear;
    stringgrid2.RowCount:=2;
    stringgrid2.Rows[1].Clear;
    combobox1.SetFocus;
    form81.Close;
  end;
end;

procedure TForm81.ComboBox1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (key=13) then
 begin
    if combobox1.Items.Count>0 then
      ComboBox1.Items.Clear;
    try
      with zstoredproc1 do
      begin
        close;
        StoredProcName:='proc_cx_jgsmc';
        ParamByName('jgsname').Value:=ComboBox1.Text;
        open;
        while not eof do
        begin
          ComboBox1.Items.Add(fields[0].asstring);
          next;
        end;
        //combobox1.DroppedDown:=true;
      end;
    except
      application.MessageBox('���ݲ�ѯʧ�ܣ�','�����ӹ����㵥������ʾ');
    end;
 end;
end;

procedure TForm81.ComboBox1Select(Sender: TObject);
var
  i:integer;
begin
  try
    if combobox1.Text<>'' then
    try
      with zStoredProc1 do
      begin
        close;
        StoredProcName:='proc_cx_jgsinfo_jgsbh';
        ParamByName('jgsbh').Value:=SplitString(combobox1.Text,'|');
        open;
        if not eof then
        begin
          Edit15.Text := fields[1].AsString;
          Edit8.Text := fields[2].AsString;
          Edit14.Text := fields[3].AsString;
          Edit9.Text := fields[4].AsString;
          Edit10.Text := fields[5].AsString;
          Edit11.Text := fields[6].AsString;
          Edit12.Text := fields[7].AsString;
          //Memo2.Text := fields[8].AsString;
        end;                                  //proc_cx_jgdjiesuan_wxjgdinfo_by_jgsbh
        close;
        StoredProcName:='proc_cx_jgdjiesuan_wxjgdinfo_by_jgsbh';
        ParamByName('jgsbh').Value:=SplitString(combobox1.Text,'|');
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
            //stringgrid1.Cells[4,i]:=fields[4].AsString;
            //stringgrid1.Cells[5,i]:=fields[3].AsString;
            i:=i+1;
            stringgrid1.Rows[stringgrid1.RowCount-1].Clear;         //proc_cx_newkptzsid
          next;
        end;
        close;
        StoredProcName:='proc_cx_newjgjsdid';
        open;
        if fields[0].AsString<>'' then
          edit2.Text:=fields[0].AsString
        else
          edit2.Text:=formatDateTime('yyyy',date)+'000001';
      end;
    except
      application.MessageBox('���ݲ�ѯʧ�ܣ�','��Ӧ�̹�����ʾ');
    end;
  except
    application.MessageBox('���ݲ�ѯʧ��111��','��Ӧ�̹�����ʾ');
  end;
end;

procedure TForm81.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
  if not charinset(key,['0'..'9',#8]) then
    key:=#0;

end;

procedure TForm81.Edit3KeyPress(Sender: TObject; var Key: Char);
begin
  if not charinset(key,['0'..'9','.',#8]) then
    key:=#0;
  if (key='.') and (Pos('.',Edit3.Text)>0)   then
    key:=#0;
end;

procedure TForm81.FormShow(Sender: TObject);
begin
  stringgrid1.Cells[0,0]:='���';
  stringgrid1.Cells[1,0]:='�ӹ������';
  stringgrid1.Cells[2,0]:='�ӹ��ܽ��';
  stringgrid1.Cells[3,0]:='��ע';
  stringgrid2.Cells[0,0]:='���';
  stringgrid2.Cells[1,0]:='�ӹ������';
  stringgrid2.Cells[2,0]:='�ӹ��ܽ��';
  stringgrid2.Cells[3,0]:='��Ʊ���';
  stringgrid2.Cells[4,0]:='��ע';
end;

procedure TForm81.StringGrid1DblClick(Sender: TObject);
begin
  if strjgdbh<>'NULL' then
    jgdcx.Form54.ShowModal;
end;

procedure TForm81.StringGrid1SelectCell(Sender: TObject; ACol, ARow: Integer;
  var CanSelect: Boolean);
begin
  sARow:=ARow;
  if (stringgrid1.RowCount>2) and (ARow>0) and (ARow<stringgrid1.RowCount-1) then
  begin
    strjgdbh:=stringgrid1.Cells[1,ARow];
  end
  else
    strjgdbh:='NULL';
end;

procedure TForm81.StringGrid2DblClick(Sender: TObject);
begin
  if strjgdbh<>'NULL' then
    jgdcx.Form54.ShowModal;
end;

procedure TForm81.StringGrid2SelectCell(Sender: TObject; ACol, ARow: Integer;
  var CanSelect: Boolean);
begin
  sARow2:=ARow;
    if (stringgrid2.RowCount>2) and (ARow>0) and (ARow<stringgrid2.RowCount-1) then
  begin
    strjgdbh:=stringgrid2.Cells[1,ARow];
  end
  else
    strjgdbh:='NULL';
end;

end.