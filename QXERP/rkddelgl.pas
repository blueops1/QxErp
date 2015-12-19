unit rkddelgl;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, DB, ZAbstractRODataset, ZAbstractDataset, ZStoredProcedure,
  Grids, StdCtrls, ComCtrls, ExtCtrls;

type
  TForm53 = class(TForm)
    Bevel1: TBevel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Edit3: TEdit;
    Button1: TButton;
    StringGrid1: TStringGrid;
    Edit4: TEdit;
    ZStoredProc1: TZStoredProc;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    Label1: TLabel;
    Edit1: TEdit;
    Label2: TLabel;
    Edit2: TEdit;
    Edit5: TEdit;
    Edit6: TEdit;
    Label3: TLabel;
    Edit7: TEdit;
    procedure Edit4KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form53: TForm53;
  selRowIndex:integer;
  function SplitString(Source, Deli: string ): String;stdcall;external 'dlltools.dll';

implementation

uses main;

{$R *.dfm}

procedure TForm53.Button1Click(Sender: TObject);
var
  y:integer;
begin
if application.MessageBox('ȷ��Ҫɾ������ⵥ����','��ⵥ������ʾ',1)=1 then
  if stringgrid1.RowCount>1 then
    try
      with zstoredproc1 do
      begin
      close;
      zstoredproc1.StoredProcName:='proc_update_ckitem_del_itemljslandljzje';
        for y := 1 to stringgrid1.RowCount - 2 do
        begin
          zstoredproc1.ParamByName('itembh').Value:=splitstring(stringgrid1.Cells[1,y],'|');
          zstoredproc1.ParamByName('rksl').Value:=stringgrid1.Cells[2,y];
          zstoredproc1.ParamByName('itemprice').Value:=stringgrid1.Cells[3,y];
          execProc;
        end;
        close;
        zstoredproc1.StoredProcName:='proc_del_rkdgl_by_rkdbh';
        zstoredproc1.ParamByName('rkdbh').Value:=edit4.Text;
        execProc;
      end;
      application.MessageBox('ɾ����ⵥ�ɹ���','��ⵥ������ʾ');
      edit2.Text:='';
      edit3.Text:='';
      edit4.Text:='';
      edit5.Text:='';
      edit6.Text:='';
      edit7.Text:='';
      edit1.Text:='';
      edit4.SetFocus;
      stringgrid1.RowCount:=2;
      stringgrid1.Rows[1].Clear;
  except
    application.MessageBox('ɾ����ⵥʧ�ܣ�','��ⵥ������ʾ');
  end else
    application.MessageBox('����ⵥ��û��Ʒ��ϸ��','��ⵥ������ʾ');
end;

procedure TForm53.Edit4KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  y:integer;
begin
 if key=13 then
  try
    with zStoredProc1 do
    begin
      close;
      StoredProcName:='proc_cx_delrkd_by_rkdbh';
      ParamByName('rkdbh').Value:=edit4.Text;
      open;
      FirstResultSet;
      if not eof then
      begin
        edit3.Text:=fields[1].AsString;
        edit1.Text:=fields[2].AsString;
        edit5.Text:=fields[3].AsString;
        edit2.Text:=fields[4].AsString;
        edit6.Text:=fields[5].AsString;
        edit7.Text:=fields[6].AsString;
      end;
      stringgrid1.RowCount:=2;
      stringgrid1.Rows[1].Clear;
      y:=1;
      NextResultSet;
      while not eof do
      begin
        stringgrid1.RowCount:=stringgrid1.RowCount+1;
        stringgrid1.Cells[0,y]:=inttostr(y);
        stringgrid1.Cells[1,y]:=fields[0].AsString;
        stringgrid1.Cells[2,y]:=fields[1].AsString;
        stringgrid1.Cells[3,y]:=fields[2].AsString;
        stringgrid1.Cells[4,y]:=fields[3].AsString;
        y:=y+1;
        stringgrid1.Rows[stringgrid1.RowCount-1].Clear;
        next;
      end;
      if (edit1.Text<>'') or (edit7.Text<>main.strUser) then
        button1.Enabled:=false
      else
        button1.Enabled:=true;
    end;
  except
    application.MessageBox('��ѯ����ʧ�ܣ�','��ⵥ������ʾ');
  end;
end;

procedure TForm53.FormShow(Sender: TObject);
begin
  stringgrid1.Cells[0,0]:='���';
  stringgrid1.Cells[1,0]:='��Ʒ���';
  stringgrid1.Cells[2,0]:='�������';
  stringgrid1.Cells[3,0]:='����';
  stringgrid1.Cells[4,0]:='��ע';
  edit4.SetFocus;

end;

end.