unit kptzsdycx;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DB, ZAbstractRODataset, ZAbstractDataset, ZStoredProcedure;

type
  TForm78 = class(TForm)
    StringGrid1: TStringGrid;
    ZStoredProc1: TZStoredProc;
    procedure FormShow(Sender: TObject);
    procedure StringGrid1DblClick(Sender: TObject);
    procedure StringGrid1SelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form78: TForm78;

implementation

uses main,kptzsdy;

{$R *.dfm}

procedure TForm78.FormShow(Sender: TObject);
var
  i:integer;
begin
  stringgrid1.Cells[0,0]:='���';  //fkptzsid,kaipiaotongzhidan_info.fhtbh,kh_info.fkhmc,fcddate,fczry,kaipiaotongzhidan_info.fmemo
  stringgrid1.Cells[1,0]:='֪ͨ����';
  stringgrid1.Cells[2,0]:='��ͬ���';
  stringgrid1.Cells[3,0]:='�ͻ�����';
  stringgrid1.Cells[4,0]:='��������';
  stringgrid1.Cells[5,0]:='����Ա';
  stringgrid1.Cells[6,0]:='��ע';
  try
    with zStoredProc1 do
    begin
      close;
      StoredProcName:='proc_cx_kptzsdycx';
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
        stringgrid1.Cells[4,i]:=fields[3].AsString;
        stringgrid1.Cells[5,i]:=fields[4].AsString;
        stringgrid1.Cells[6,i]:=fields[5].AsString;
        i:=i+1;
        stringgrid1.Rows[stringgrid1.RowCount-1].Clear;
        next;
      end;
    end;
  except
    application.MessageBox('���ݲ�ѯʧ��','��Ʊ֪ͨ���ӡ��ѯ');
  end;
end;

procedure TForm78.StringGrid1DblClick(Sender: TObject);
begin
    if (kptzsdy.strkptzsbh<>'') and (kptzsdy.strhtbh<>'') then
      kptzsdy.Form79.ShowModal;
end;

procedure TForm78.StringGrid1SelectCell(Sender: TObject; ACol, ARow: Integer;
  var CanSelect: Boolean);
begin
  kptzsdy.strkptzsbh:='';
  kptzsdy.strhtbh:='';
  if (ARow>0) and (ARow+1<stringgrid1.RowCount) then
  begin
    kptzsdy.strkptzsbh:=stringgrid1.Cells[1,ARow];
    kptzsdy.strhtbh:= stringgrid1.Cells[2,ARow];
  end;
end;

end.
