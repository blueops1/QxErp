unit cgkcgz;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DB, ZAbstractRODataset, ZAbstractDataset, ZStoredProcedure,
  StdCtrls;

type
  TForm33 = class(TForm)
    ZStoredProc1: TZStoredProc;
    StringGrid1: TStringGrid;
    Button1: TButton;
    procedure FormShow(Sender: TObject);
    procedure StringGrid1DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form33: TForm33;
  Function ExportStrGridToExcel(Args: array of const): Boolean;stdcall;external 'dlltools.dll';

implementation

{$R *.dfm}

uses main;

procedure TForm33.Button1Click(Sender: TObject);
begin
  ExportStrGridToExcel([StringGrid1]);
end;

procedure TForm33.FormShow(Sender: TObject);
var
  i:integer;
begin
  stringgrid1.Cells[0,0]:='���';
  stringgrid1.Cells[1,0]:='��Ʒ���';
  stringgrid1.Cells[2,0]:='��Ʒ����';
  stringgrid1.Cells[3,0]:='��Ʒ����';
  stringgrid1.Cells[4,0]:='��ǰ�����';
  stringgrid1.Cells[5,0]:='���������';
  stringgrid1.Cells[6,0]:='���������';
  stringgrid1.RowCount:=2;
  stringgrid1.Rows[1].Clear;
  try
    with zStoredProc1 do
    begin
      close;
      StoredProcName:='proc_cx_itemkctips_gziteminfo';
      open;
      i:=1;
      while not eof do
      begin
        stringgrid1.RowCount:=stringgrid1.RowCount+1;
        stringgrid1.Cells[0,i]:=inttostr(i);
        stringgrid1.Cells[1,i]:=fields[0].AsString;
        stringgrid1.Cells[2,i]:=fields[1].AsString;
        stringgrid1.Cells[3,i]:=fields[2].AsString;
        stringgrid1.Cells[4,i]:=fields[3].AsString;
        stringgrid1.Cells[5,i]:=fields[4].AsString;
        stringgrid1.Cells[6,i]:=floattostr(strtofloat(stringgrid1.Cells[4,i])-strtofloat(stringgrid1.Cells[5,i]));
        i:=i+1;
        stringgrid1.Rows[stringgrid1.RowCount-1].Clear;
        next;
      end;
    end;
  except
    application.MessageBox('���ݲ�ѯʧ�ܣ�','��������ٹ���');
  end;
end;

procedure TForm33.StringGrid1DrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
begin
  with TStringGrid(Sender) do
  begin
    if (ARow>0) and (ARow<TStringGrid(Sender).rowCount-1) then
      if(strtofloat(Cells[6,ARow])<0) then
//        Canvas.Brush.Color:=clRed
        Canvas.Font.Color:=clRed
      else
  //      Canvas.Brush.Color:=clWindow;
        Canvas.Font.Color:=clWindowText;
    Canvas.FillRect(Rect);
    Canvas.TextOut(Rect.Left+2,Rect.Top+2,Cells[ACol,ARow]);
  end;
end;

end.