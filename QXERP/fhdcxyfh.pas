unit fhdcxyfh;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ZAbstractRODataset, ZAbstractDataset, ZStoredProcedure, StdCtrls,
  Grids, ExtCtrls;

type
  TForm100 = class(TForm)
    Label1: TLabel;
    Edit1: TEdit;
    RadioGroup1: TRadioGroup;
    StringGrid1: TStringGrid;
    Button1: TButton;
    ZStoredProc1: TZStoredProc;
    procedure Button1Click(Sender: TObject);
    procedure StringGrid1DblClick(Sender: TObject);
    procedure StringGrid1SelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form100: TForm100;

implementation

uses main,fhdxxzl;

{$R *.dfm}

procedure TForm100.Button1Click(Sender: TObject);
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
      zstoredproc1.StoredProcName:='proc_cx_fhd_info_yfh';
      zstoredproc1.ParamByName('xsyid').Value:=edit1.Text;
      zstoredproc1.ParamByName('cxxm').Value:=radiogroup1.ItemIndex;
      open;
      stringgrid1.RowCount:=zstoredproc1.RecordCount+1;
      while not eof do
      begin
        stringgrid1.Cells[0,i]:=Fields[0].AsString;
        stringgrid1.Cells[1,i]:=fields[1].AsString;
        stringgrid1.Cells[2,i]:=fields[2].AsString;
        stringgrid1.Cells[3,i]:=fields[3].AsString;
        stringgrid1.Cells[4,i]:=fields[4].AsString;
        stringgrid1.Cells[5,i]:=fields[5].AsString;
        i:=i+1;
        next
      end;
    end;
    except
      application.MessageBox('aaa','aaa');
    end;
end;

procedure TForm100.StringGrid1DblClick(Sender: TObject);
begin
  if (fhdid<>'') then
    fhdxxzl.form21.ShowModal;
end;

procedure TForm100.StringGrid1SelectCell(Sender: TObject; ACol, ARow: Integer;
  var CanSelect: Boolean);
begin
  if (ARow>0) and (ARow<stringgrid1.RowCount) then
    fhdid:=stringgrid1.Cells[0,ARow]
  else
    fhdid:='';
end;

end.