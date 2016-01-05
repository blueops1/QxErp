unit bthcsckgl;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ZAbstractRODataset, ZAbstractDataset, ZStoredProcedure, StdCtrls,
  Grids, ComCtrls;

type
  TForm76 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label6: TLabel;
    Label4: TLabel;
    Edit1: TEdit;
    Memo1: TMemo;
    StringGrid1: TStringGrid;
    Button3: TButton;
    Edit2: TEdit;
    Edit3: TEdit;
    Memo2: TMemo;
    ZStoredProc1: TZStoredProc;
    DateTimePicker1: TDateTimePicker;
    Label5: TLabel;
    procedure Edit1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form76: TForm76;

implementation

uses main;

{$R *.dfm}

procedure TForm76.Button3Click(Sender: TObject);
var
  i:integer;
begin   //proc_insert_cpcrkmxz_cprk   cpbh,rksl,jzdate,memo
if application.MessageBox('ȷ��Ҫ����������','���˻ز��Բ�Ʒ������ʾ',1)=1 then
  if stringgrid1.RowCount>2 then
  try
    with zStoredProc1 do
    begin
      close;
      StoredProcName:='proc_insert_cpcrkmxz_cpck';  //proc_update_bthcscktzd_isckcl_by_bthcsckdid
      for i := 1 to stringgrid1.RowCount - 2 do
      begin
        ParamByName('cpbh').Value:=SplitString(stringgrid1.Cells[1,i],'|');
        ParamByName('cksl').Value:=stringgrid1.Cells[2,i];
        ParamByName('jzdate').Value:=datetimepicker1.Date;
        ParamByName('memo').Value:=memo2.Text+'��Ʒ���Գ��ⵥ�ţ�'+edit1.Text+'����Ա��'+edit2.text;
        ParamByName('czry').Value:=main.strUser;
        ExecProc;
      end;
        close;
        StoredProcName:='proc_update_bthcscktzd_isckcl_by_bthcsckdid';  //proc_update_bthcscktzd_isckcl_by_bthcsckdid
        ParamByName('bthcsckdid').Value:=edit1.Text;
        ExecProc;
        stringgrid1.RowCount:=2;
        stringgrid1.Rows[1].Clear;
        edit1.Text:='';
        edit2.Text:='';
        edit3.Text:='';
        memo1.Lines.Clear;
        memo2.Lines.Clear;
        edit1.SetFocus;
        application.MessageBox('�������ݳɹ���','���˻ز��Բ�Ʒ������ʾ');
    end;
  except
    application.MessageBox('��������ʧ�ܣ�','���˻ز��Բ�Ʒ������ʾ');
  end;
end;

procedure TForm76.Edit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  i:integer;
begin
  if (key=13) and (edit1.Text<>'') then
    try
      with zStoredProc1 do
      begin
        close;
        StoredProcName:='proc_cx_bthcscktzd_info_mxz_by_csckdid';
        ParamByName('csckdid').Value:=edit1.Text;
        open;
        firstresultset;
        if not eof  then
        begin
          edit1.Text:=fields[0].AsString;
          edit2.Text:=fields[1].AsString;
          edit3.Text:=fields[2].AsString;
          memo1.Text:=fields[3].AsString;
          memo2.Text:=fields[6].AsString;
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
            stringgrid1.Cells[3,i]:=fields[3].AsString;
           // stringgrid1.Cells[4,i]:=fields[3].AsString;
            i:=i+1;
            stringgrid1.Rows[stringgrid1.RowCount-1].Clear;
            next;
          end;
        end else
          application.MessageBox('�ò��˻ز��Բ�Ʒ���ⵥ�Ų����ڻ�����ɳ��⴦��','���˻ز��Բ�Ʒ������ʾ');
      end;
    except
      application.MessageBox('���ݲ�ѯʧ�ܣ�','���˻ز��Բ�Ʒ������ʾ');
    end;
end;

procedure TForm76.FormShow(Sender: TObject);
begin
  datetimepicker1.Date:=now();
  stringgrid1.Cells[0,0]:='���';
  stringgrid1.Cells[1,0]:='��Ʒ����';
  stringgrid1.Cells[2,0]:='��������';
  stringgrid1.Cells[3,0]:='��ע';
end;

end.
