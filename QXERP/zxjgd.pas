unit zxjgd;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, DB, ZAbstractRODataset, ZAbstractDataset, ZStoredProcedure,
  StdCtrls, Grids, ComCtrls, ExtCtrls;

type
  TForm50 = class(TForm)
    Bevel1: TBevel;
    Label2: TLabel;
    Label3: TLabel;
    Label1: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label16: TLabel;
    ComboBoxEx1: TComboBoxEx;
    Edit2: TEdit;
    Edit3: TEdit;
    DateTimePicker1: TDateTimePicker;
    Button1: TButton;
    Memo1: TMemo;
    StringGrid1: TStringGrid;
    Edit4: TEdit;
    ComboBox1: TComboBox;
    Button2: TButton;
    Edit5: TEdit;
    ZStoredProc1: TZStoredProc;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    Label10: TLabel;
    Edit1: TEdit;
    procedure Button1Click(Sender: TObject);
    procedure Edit4KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure ComboBox1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ComboBoxEx1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ComboBoxEx1Select(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form50: TForm50;
  selRowIndex:integer;
  function SplitString(Source, Deli: string ): String;stdcall;external 'dlltools.dll';

implementation

uses main;

{$R *.dfm}

procedure TForm50.Button1Click(Sender: TObject);
var
  y:integer;
begin
if application.MessageBox('ȷ��Ҫ����������','�����ӹ���������ʾ',1)=1 then
  if stringgrid1.RowCount>1 then
    try
      with zstoredproc1 do
      begin
        close;
        zstoredproc1.StoredProcName:='proc_insert_jiagongdan_info';  //jgdbh,jgddate,jgsbh,czry,memo
        zstoredproc1.ParamByName('jgdbh').Value:=edit4.Text;
        zstoredproc1.ParamByName('jgsbh').Value:=splitstring(ComboBox1.Text,'|');
        zstoredproc1.ParamByName('jgddate').Value:=datetimepicker1.Date;
        zstoredproc1.ParamByName('czry').Value:=main.strUser;
        zstoredproc1.ParamByName('memo').Value:='*'+memo1.Text;
        execProc;
        zstoredproc1.StoredProcName:='proc_insert_jiagongdan_mxz';  //jgdbh,pjbh,pjsl,jgprice,memo
        for y := 1 to stringgrid1.RowCount - 1 do
        begin
          zstoredproc1.ParamByName('jgdbh').Value:=edit4.Text;
          zstoredproc1.ParamByName('pjbh').Value:=splitstring(stringgrid1.Cells[1,y],'|');
          zstoredproc1.ParamByName('pjsl').Value:=stringgrid1.Cells[2,y];
          zstoredproc1.ParamByName('jgprice').Value:=stringgrid1.Cells[3,y];
          zstoredproc1.ParamByName('memo').Value:='*'+stringgrid1.Cells[4,y];
          execProc;
        end;
      end;
      application.MessageBox('�������ݳɹ���','�����ӹ���������ʾ');
      edit1.Text:='';
      edit2.Text:='';
      edit3.Text:='';
      edit4.Text:='';
      edit5.Text:='';
      comboboxex1.Text:='';
      combobox1.Text:='';
      memo1.Text:='';
      stringgrid1.RowCount:=1;
  except
    application.MessageBox('��������ʧ�ܣ�','�����ӹ���������ʾ');
  end else
    application.MessageBox('�����Ӽӹ����ڵ���ϸ��','�����ӹ���������ʾ');
end;

procedure TForm50.Button2Click(Sender: TObject);
begin
  if (edit4.Text<>'') and (combobox1.Text<>'') then
    if (comboboxex1.Text<>'') and (edit2.Text<>'') and (edit3.Text<>'') then
      if (strtofloat(edit3.Text)>=strtofloat(edit1.Text)) then
      begin
        stringgrid1.RowCount:=stringgrid1.RowCount+1;
        stringgrid1.Cells[0,stringgrid1.RowCount-1]:=inttostr(stringgrid1.RowCount-1);
        stringgrid1.Cells[1,stringgrid1.RowCount-1]:=comboboxex1.Text;
        stringgrid1.Cells[2,stringgrid1.RowCount-1]:=edit2.Text;
        stringgrid1.Cells[3,stringgrid1.RowCount-1]:=edit1.Text;
        stringgrid1.Cells[4,stringgrid1.RowCount-1]:=edit5.Text;
        ComboBoxEx1.Text:='';
        edit3.Text:='';
        edit5.Text:='';
        edit1.Text:='';
        ComboBoxEx1.SetFocus;
        end else
          application.MessageBox('ʵ�ʼ۸���ڲο��۸�','�����ӹ���������ʾ')
      else
        application.MessageBox('�뽫��ϸ��д��','�����ӹ���������ʾ')
    else
      application.MessageBox('���Ƚ��ӹ�����Ϣ��д������','�����ӹ���������ʾ');
end;

procedure TForm50.ComboBox1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if key=13 then
 begin
    if combobox1.Items.Count>0 then
    ComboBox1.Items.Clear;
    try
      with zstoredproc1 do
      begin
        close;
        zstoredproc1.StoredProcName:='proc_cx_jgsmc';
        zstoredproc1.ParamByName('jgsname').Value:=ComboBox1.Text;
        open;
        while not eof do
        begin
          ComboBox1.Items.Add(fields[0].asstring);
          next;
        end;
        //combobox1.DroppedDown:=true;
      end;
  except
    application.MessageBox('���ݲ�ѯʧ�ܣ�','��Ʊ������ʾ');
  end;
 end;
end;

procedure TForm50.ComboBoxEx1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=13) and (ComboBoxEx1.Text<>'') then
      try
        with zstoredproc1 do
        begin
          comboboxex1.Items.Clear;
          close;
          zstoredproc1.StoredProcName:='proc_cx_waixiepeijianmc';
          zstoredproc1.ParamByName('itemname').Value:=comboboxex1.Text;
          open;
          while not eof do
          begin
            comboboxex1.Items.Add(fields[0].asstring);
            next;
          end;
        end;
    except
      application.MessageBox('���ݲ�ѯʧ�ܣ�','�����ӹ���������ʾ');
    end;
end;

procedure TForm50.ComboBoxEx1Select(Sender: TObject);
begin
  try
    with zStoredProc1 do
    begin
      close;
      StoredProcName:='proc_cx_waixiepeijian_jgprice_by_pjbh';
      ParamByName('pjbh').Value:=SplitString(ComboBoxEx1.Text,'|');
      open;
      if not eof then
        edit3.Text:=fields[0].AsString
      else
        application.MessageBox('����Ʒ�����ڣ�','�����ӹ���������ʾ');
    end;
  except
    application.MessageBox('���ݲ�ѯʧ�ܣ�','�����ӹ���������ʾ');
  end;
end;

procedure TForm50.Edit4KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key=13 then
    try
      with zstoredproc1 do
      begin
        close;
        zstoredproc1.StoredProcName:='proc_cx_newwxjgdbh';
        open;
        if fields[0].AsString<>'' then
          edit4.Text:=fields[0].AsString
        else
          edit4.Text:=formatDateTime('yyyy',date)+'0001';
      end;
    except
      application.MessageBox('���ݲ�ѯʧ�ܣ�','�����ӹ���������ʾ');
    end;
end;

procedure TForm50.FormShow(Sender: TObject);
begin
  datetimepicker1.DateTime:=now();
  stringgrid1.Cells[0,0]:='���';
  stringgrid1.Cells[1,0]:='������';
  stringgrid1.Cells[2,0]:='�ӹ�����';
  stringgrid1.Cells[3,0]:='�ӹ�����';
  stringgrid1.Cells[4,0]:='��ע';
end;

end.