unit bcpkczzgl;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ZAbstractRODataset, ZAbstractDataset, ZStoredProcedure, StdCtrls,
  Grids, ExtCtrls;

type
  TForm86 = class(TForm)
    Bevel2: TBevel;
    Bevel1: TBevel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label8: TLabel;
    Label6: TLabel;
    ComboBox1: TComboBox;
    StringGrid1: TStringGrid;
    StringGrid2: TStringGrid;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    ZStoredProc1: TZStoredProc;
    procedure ComboBox1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ComboBox1Select(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure StringGrid1SelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure StringGrid2SelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure Edit3KeyPress(Sender: TObject; var Key: Char);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form86: TForm86;
  SelARow,gzSelARow:integer;
  function SplitString(Source, Deli: string ): String;stdcall;external 'dlltools.dll';

implementation

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

procedure TForm86.Button1Click(Sender: TObject);
begin
  if (SelArow>0) and (SelArow<stringgrid1.RowCount-1) and (stringgrid1.Cells[1,SelArow]<>'') then
  try
    with zStoredProc1 do
    begin
      close;
      StoredProcName:='proc_insert_bcpkctips_of_itemid';
      ParamByName('itemid').Value:=stringgrid1.Cells[1,SelArow];
      ParamByName('czlx').Value:='ADD';
      ExecProc;
      application.MessageBox('���ӿ�������Ŀ�ɹ���','���Ʒ��������Ϣ��ʾ');
      stringgrid2.RowCount:=stringgrid2.RowCount+1;
      stringgrid2.Cells[0,stringgrid2.RowCount-2]:=inttostr(stringgrid2.RowCount-2);
      stringgrid2.Cells[1,stringgrid2.RowCount-2]:=stringgrid1.Cells[1,SelArow];
      stringgrid2.Cells[2,stringgrid2.RowCount-2]:=stringgrid1.Cells[2,SelArow];
      stringgrid2.Cells[3,stringgrid2.RowCount-2]:='0';
      DeleteStringGridRow(SelArow,stringgrid1);
    end;
  except
    application.MessageBox('���ӿ�������Ŀʧ��','���Ʒ��������Ϣ��ʾ');
  end;
end;

procedure TForm86.Button2Click(Sender: TObject);
begin
  if (gzSelARow>0) and (gzSelARow<stringgrid2.RowCount-1) and (stringgrid2.Cells[1,gzSelARow]<>'') then
  try
    with zStoredProc1 do
    begin
      close;
      StoredProcName:='proc_insert_bcpkctips_of_itemid';
      ParamByName('itemid').Value:=stringgrid2.Cells[1,gzSelARow];
      ParamByName('czlx').Value:='DEL';
      ExecProc;
    end;
      DeleteStringGridRow(gzSelARow,stringgrid2);
      application.MessageBox('ɾ����������Ŀ�ɹ���','�����������Ϣ����');
  except
    application.MessageBox('���ӿ�������Ŀʧ��','�����������Ϣ����');
  end;
end;

procedure TForm86.Button3Click(Sender: TObject);
begin
  if (edit1.Text<>'') and (edit3.Text<>'') then
  try
    with zStoredProc1 do
    begin
      close;
      StoredProcName:='proc_update_bcpkctips_itemminsl_by_itembh';
      ParamByName('itembh').Value:=edit1.Text;
      ParamByName('kcminls').Value:=edit3.Text;
      ExecProc;
      stringgrid2.Cells[3,gzSelARow]:=edit3.Text;
      application.MessageBox('����������óɹ���','�����������Ϣ����');
    end;
  except
    application.MessageBox('�����������ʧ�ܣ�','�����������Ϣ����');
  end else
    application.MessageBox('�����Ҳ��б�����ѡ����Ҫ���õļ�¼�У�������������������������','���Ʒ��������Ϣ��ʾ');
end;

procedure TForm86.ComboBox1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  combobox1.Items.Clear;
  try
    with ZStoredProc1 do
    begin
      close;
      StoredProcName:='proc_cx_cplxk_cplz';
      open;
      while not eof do
      begin
         combobox1.Items.Add(fields[0].asstring);
         next;
      end;
    end;
  except
    application.MessageBox('��ѯ����ʧ�ܣ�','���Ʒ��������Ϣ��ʾ');
  end;
end;

procedure TForm86.ComboBox1Select(Sender: TObject);
var
  i:integer;
begin
  try
    with ZStoredProc1 do
    begin
      close;
      StoredProcName:='proc_cx_cplxk_by_cpzl';
      ParamByName('cpzl').Value:=combobox1.Text;
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
    end;
  except
    application.MessageBox('��ѯ����ʧ�ܣ�','���Ʒ��������Ϣ��ʾ');
  end;
end;

procedure TForm86.Edit3KeyPress(Sender: TObject; var Key: Char);
begin
  if not charinset(key,['0'..'9','.',#8]) then
    key:=#0;
  if (key='.') and (Pos('.',Edit3.Text)>0)   then
    key:=#0;
end;

procedure TForm86.FormShow(Sender: TObject);
var
  i:integer;
begin
  stringgrid1.RowCount:=2;
  stringgrid1.Rows[1].Clear;
  stringgrid2.RowCount:=2;
  stringgrid2.Rows[1].Clear;
  stringgrid1.Cells[0,0]:='���';
  stringgrid1.Cells[1,0]:='��Ʒ���';
  stringgrid1.Cells[2,0]:='��Ʒ����';
  stringgrid2.Cells[0,0]:='���';
  stringgrid2.Cells[1,0]:='��Ʒ���';
  stringgrid2.Cells[2,0]:='��Ʒ����';
  stringgrid2.Cells[3,0]:='���ٿ����';
  try
    with zStoredProc1 do
    begin
      close;
      StoredProcName:='proc_cx_bcpkctips';
      open;
      i:=1;
      while not eof do
      begin
        stringgrid2.RowCount:=stringgrid2.RowCount+1;
        stringgrid2.Cells[0,i]:=inttostr(i);
        stringgrid2.Cells[1,i]:=fields[0].AsString;
        stringgrid2.Cells[2,i]:=fields[1].AsString;
        stringgrid2.Cells[3,i]:=fields[2].AsString;
        i:=i+1;
        next;
      end;
    end;
  except
    application.MessageBox('���ݲ�ѯʧ��','���Ʒ��������Ϣ��ʾ');
  end;
end;

procedure TForm86.StringGrid1SelectCell(Sender: TObject; ACol, ARow: Integer;
  var CanSelect: Boolean);
begin
  SelARow:=ARow;
end;

procedure TForm86.StringGrid2SelectCell(Sender: TObject; ACol, ARow: Integer;
  var CanSelect: Boolean);
begin
  gzSelARow:=ARow;
  edit1.Text:=stringgrid2.Cells[1,gzSelARow];
  edit2.Text:=stringgrid2.Cells[2,gzSelARow];
  edit3.Text:=stringgrid2.Cells[3,gzSelARow];
end;

end.