unit bthcscktzd;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ZAbstractRODataset, ZAbstractDataset, ZStoredProcedure, StdCtrls,
  Grids;

type
  TForm74 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label6: TLabel;
    Edit1: TEdit;
    Memo1: TMemo;
    StringGrid1: TStringGrid;
    Button3: TButton;
    Edit2: TEdit;
    Edit3: TEdit;
    ZStoredProc1: TZStoredProc;
    Memo2: TMemo;
    Label4: TLabel;
    Edit4: TEdit;
    Label5: TLabel;
    Edit5: TEdit;
    Label9: TLabel;
    Edit6: TEdit;
    procedure FormShow(Sender: TObject);
    procedure Edit1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form74: TForm74;

implementation
uses main;

{$R *.dfm}

procedure TForm74.Button3Click(Sender: TObject);
begin
if application.MessageBox('ȷ��Ҫ����������','�²�Ʒ���Բ��˻�֪ͨ��������ʾ',1)=1 then
  if memo2.Text<>'' then
    try
      with zstoredproc1 do
      begin
        close;
        zstoredproc1.StoredProcName:='proc_insert_bthcscktzd';  //csckdid,cscksqrid,csckdate,czry,csckly
        zstoredproc1.ParamByName('csckdid').Value:=edit4.Text;
        zstoredproc1.ParamByName('czry').Value:=main.strUser;
        zstoredproc1.ParamByName('bthmemo').Value:='*'+memo2.Text;
        execProc;
        if ParamByName('returncode').Value=1 then
          application.MessageBox('�ò��Գ��ⵥ����Ѿ����ڣ�','�²�Ʒ���Բ��˻�֪ͨ��������ʾ')
        else begin
          application.MessageBox('���ݱ���ɹ���','�²�Ʒ���Բ��˻�֪ͨ��������ʾ');
      end;
      edit1.Text:='';
      edit2.Text:='';
      edit3.Text:='';
      memo1.Text:='';
      edit4.Text:='';
      memo2.Lines.Clear;
      stringgrid1.RowCount:=2;
      stringgrid1.Rows[1].Clear;
      end;
  except
    application.MessageBox('��������ʧ�ܣ�','�²�Ʒ���Բ��˻�֪ͨ��������ʾ');
  end else
    application.MessageBox('����д���˻�˵����','�²�Ʒ���Բ��˻�֪ͨ��������ʾ');
end;

procedure TForm74.Edit1KeyDown(Sender: TObject; var Key: Word;
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
          edit5.Text:=fields[6].AsString;
          edit6.Text:=fields[7].AsString;
          edit4.Text:=edit1.Text;
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
          stringgrid1.Cells[3,i]:=fields[3].AsString;
         // stringgrid1.Cells[4,i]:=fields[3].AsString;
          i:=i+1;
          stringgrid1.Rows[stringgrid1.RowCount-1].Clear;
          next;
        end;
      end;
    except
      application.MessageBox('���ݲ�ѯʧ�ܣ�','���Գ��ⵥ��ӡ��ʾ');
    end;
end;

procedure TForm74.FormShow(Sender: TObject);
begin
  stringgrid1.Cells[0,0]:='���';
  stringgrid1.Cells[1,0]:='��Ʒ����';
  stringgrid1.Cells[2,0]:='��������';
  stringgrid1.Cells[3,0]:='��ע';
end;

end.