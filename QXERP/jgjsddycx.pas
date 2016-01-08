unit jgjsddycx;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ZAbstractRODataset, ZAbstractDataset, ZStoredProcedure, Grids;

type
  TForm82 = class(TForm)
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
  Form82: TForm82;

implementation

uses main,jiagongjiesuandandy;

{$R *.dfm}

procedure TForm82.FormShow(Sender: TObject);
var
  i:integer;
begin                                          //proc_cx_jiagongjiesuandandycx  fjgjsdid,fjgsmc,fjszje,ffpbh,ffpsl,fcddate,fczry,jiagongjiesuandan_info.fmemo
  stringgrid1.Cells[0,0]:='序号';
  stringgrid1.Cells[1,0]:='结算单编号';
  stringgrid1.Cells[2,0]:='加工商名称';
  stringgrid1.Cells[3,0]:='结算金额';
  stringgrid1.Cells[4,0]:='发票编号';
  stringgrid1.Cells[5,0]:='发票税率';
  stringgrid1.Cells[6,0]:='出单日期';
  stringgrid1.Cells[7,0]:='操作员';
  stringgrid1.Cells[8,0]:='备注';
  try
    with zStoredProc1 do
    begin
      close;
      StoredProcName:='proc_cx_jiagongjiesuandandycx';
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
        stringgrid1.Cells[7,i]:=fields[6].AsString;
        stringgrid1.Cells[8,i]:=fields[7].AsString;
        i:=i+1;
        stringgrid1.Rows[stringgrid1.RowCount-1].Clear;
        next;
      end;
    end;
  except
    application.MessageBox('数据查询失败','加工结算单打印查询');
  end;
end;

procedure TForm82.StringGrid1DblClick(Sender: TObject);
begin
    if (jiagongjiesuandandy.strjgjsdbh<>'') and (jiagongjiesuandandy.strjgsbh<>'') then
      jiagongjiesuandandy.Form83.ShowModal;
end;

procedure TForm82.StringGrid1SelectCell(Sender: TObject; ACol, ARow: Integer;
  var CanSelect: Boolean);
begin
  jiagongjiesuandandy.strjgjsdbh:='';
  jiagongjiesuandandy.strjgsbh:='';
  jiagongjiesuandandy.strfpbh:='';
  jiagongjiesuandandy.strfpsl:='';
  jiagongjiesuandandy.strjsje:='';
  jiagongjiesuandandy.strjsdmemo:='';
  jiagongjiesuandandy.strcddate:='';
  if (ARow>0) and (ARow+1<stringgrid1.RowCount) then
  begin
    jiagongjiesuandandy.strjgjsdbh:=stringgrid1.Cells[1,ARow];
    jiagongjiesuandandy.strjgsbh:=stringgrid1.Cells[2,ARow];
    jiagongjiesuandandy.strfpbh:=stringgrid1.Cells[4,ARow];
    jiagongjiesuandandy.strfpsl:=stringgrid1.Cells[5,ARow];
    jiagongjiesuandandy.strjsje:=stringgrid1.Cells[3,ARow];
    jiagongjiesuandandy.strcddate:=stringgrid1.Cells[6,ARow];
    jiagongjiesuandandy.strjsdmemo:=stringgrid1.Cells[8,ARow];
  end;
end;

end.
