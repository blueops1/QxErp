unit fhck;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DB, ZAbstractRODataset, ZAbstractDataset, ZStoredProcedure;

type
  TForm62 = class(TForm)
    ZStoredProc1: TZStoredProc;
    StringGrid1: TStringGrid;
    procedure FormShow(Sender: TObject);
    procedure StringGrid1SelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure StringGrid1DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form62: TForm62;
  //fhdid:string;

implementation

uses main,fhckinfo;

{$R *.dfm}

procedure TForm62.FormShow(Sender: TObject);
var
  i:integer;
begin
    i:=1;
    stringgrid1.Cells[0,0]:='���������';
    stringgrid1.Cells[1,0]:='��������';
    stringgrid1.Cells[2,0]:='�ͻ�����';
    stringgrid1.Cells[3,0]:='����Ա����';
    stringgrid1.Cells[4,0]:='��������';
    stringgrid1.Cells[5,0]:='�Ƿ񷢻�';
    try
    with zstoredproc1 do
    begin
      close;
      zstoredproc1.StoredProcName:='proc_cx_fhd_info';
      zstoredproc1.ParamByName('xsyid').Value:='';
      zstoredproc1.ParamByName('cxxm').Value:=1;
      open;
      stringgrid1.RowCount:=2;
      stringgrid1.Rows[1].Clear;
      while not eof do
      begin
        stringgrid1.RowCount:=stringgrid1.RowCount+1;
        stringgrid1.Cells[0,i]:=Fields[0].AsString;
        stringgrid1.Cells[1,i]:=fields[1].AsString;
        stringgrid1.Cells[2,i]:=fields[2].AsString;
        stringgrid1.Cells[3,i]:=fields[3].AsString;
        stringgrid1.Cells[4,i]:=fields[4].AsString;
        stringgrid1.Cells[5,i]:=fields[5].AsString;
        i:=i+1;
        stringgrid1.Rows[stringgrid1.RowCount-1].Clear;
        next
      end;
    end;
    except
      application.MessageBox('���ݲ�ѯʧ��','�������������ʾ');
    end;
end;

procedure TForm62.StringGrid1DblClick(Sender: TObject);
begin
  if (fhdid<>'') then
    form63.ShowModal;
end;

procedure TForm62.StringGrid1SelectCell(Sender: TObject; ACol, ARow: Integer;
  var CanSelect: Boolean);
begin
  if (ARow>0) and (ARow<stringgrid1.RowCount) then
    fhdid:=stringgrid1.Cells[0,ARow]
  else
    fhdid:='';
end;

end.