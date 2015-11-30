unit rwdjs;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ZAbstractRODataset, ZAbstractDataset, ZStoredProcedure, StdCtrls,
  Grids;

type
  TForm39 = class(TForm)
    StringGrid1: TStringGrid;
    Button1: TButton;
    ZStoredProc1: TZStoredProc;
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form39: TForm39;

implementation

{$R *.dfm}

uses main;

procedure TForm39.FormShow(Sender: TObject);
var
  i:integer;
begin         //proc_cx_renwudan_isend
  stringgrid1.RowCount:=2;
  stringgrid1.Rows[1].Clear;
  stringgrid1.Cells[0,0]:='���';
  stringgrid1.Cells[1,0]:='���񵥱��';
  stringgrid1.Cells[2,0]:='����������';
  stringgrid1.Cells[3,0]:='�ƻ�������';
  stringgrid1.Cells[4,0]:='����״̬';
  try
    with zStoredProc1 do
    begin
      close;
      StoredProcName:='proc_cx_renwudan_isend';
      open;
      i:=1;
      while not eof do
      begin
        stringgrid1.RowCount:=stringgrid1.RowCount+1;
        stringgrid1.Cells[0,i]:=inttostr(i);
        stringgrid1.Cells[1,i]:=fields[0].AsString;
        stringgrid1.Cells[2,i]:=fields[1].AsString;
        stringgrid1.Cells[3,i]:=fields[2].AsString;
        stringgrid1.Cells[4,i]:='δ����';
        stringgrid1.Rows[stringgrid1.RowCount-1].Clear;;
        i:=i+1;
        next;
      end;
    end;
  except
    application.MessageBox('��ѯ����ʧ�ܣ�','���񵥽���������ʾ');
  end;
end;

procedure TForm39.Button1Click(Sender: TObject);
var
  i:integer;
begin
  if stringgrid1.RowCount>2 then
  try
    with zStoredProc1 do
    begin
      close;
      StoredProcName:='proc_update_renwudaninfo_isend_by_rwdbh';
      for i := 1 to stringgrid1.RowCount - 2 do
      begin
        if strtofloat(stringgrid1.Cells[2,i])=strtofloat(stringgrid1.Cells[3,i]) then
        begin
          paramByName('rwdbh').Value:=stringgrid1.Cells[1,i];
          ExecProc;
        end;
      end;
      application.MessageBox('���ݴ�����ϣ����¸������ݡ�','���񵥽���������ʾ');
      close;
      StoredProcName:='proc_cx_renwudan_isend';
      open;
      stringgrid1.RowCount:=2;
      stringgrid1.Rows[1].Clear;
      i:=1;
      while not eof do
      begin
        stringgrid1.RowCount:=stringgrid1.RowCount+1;
        stringgrid1.Cells[0,i]:=inttostr(i);
        stringgrid1.Cells[1,i]:=fields[0].AsString;
        stringgrid1.Cells[2,i]:=fields[1].AsString;
        stringgrid1.Cells[3,i]:=fields[2].AsString;
        stringgrid1.Cells[4,i]:='δ����';
        stringgrid1.Rows[stringgrid1.RowCount-1].Clear;;
        i:=i+1;
        next;
      end;
    end;
  except
    application.MessageBox('��������ʧ�ܣ�','���񵥽���������ʾ');
  end;
end;

end.