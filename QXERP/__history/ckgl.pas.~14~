unit ckgl;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, StdCtrls, Grids, ComCtrls, ExtCtrls, ZAbstractRODataset,
  ZAbstractDataset, ZDataset;

type
  Tfrom9 = class(TForm)
    PageControl1: TPageControl;
    TabSheet3: TTabSheet;
    Label12: TLabel;
    StringGrid1: TStringGrid;
    Edit9: TEdit;
    Button6: TButton;
    StringGrid2: TStringGrid;
    Button8: TButton;
    RadioGroup1: TRadioGroup;
    ZQuery1: TZQuery;
    procedure Button6Click(Sender: TObject);
    procedure StringGrid1SelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure Button8Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  from9: Tfrom9;
  Function ExportStrGridToExcel(Args: array of const): Boolean;stdcall;external 'dlltools.dll';

implementation

uses main;

{$R *.dfm}

procedure Tfrom9.Button6Click(Sender: TObject);
var y:integer;
begin
  stringgrid1.ColWidths[0]:=100;
  stringgrid1.ColWidths[1]:=100;
  stringgrid1.ColWidths[2]:=100;
  stringgrid1.ColWidths[3]:=100;
  stringgrid1.ColWidths[4]:=100;
  stringgrid1.ColWidths[5]:=100;
  stringgrid1.Cells[0,0]:='产品编号';
  stringgrid1.Cells[1,0]:='产品规格';
  stringgrid1.Cells[2,0]:='计量单位';
  stringgrid1.Cells[3,0]:='产品类型';
  stringgrid1.Cells[4,0]:='库存数量';
  stringgrid1.Cells[5,0]:='备注';
  //stringgrid1.RowCount:=1;
  y:=1;
  try
  with ZQuery1 do
  begin
    close;
    sql.Clear;
    sql.Add('select a.fcpbh,fcpmc,fcpdw,fcpzl,fcpkcs,fmemo from (select fcpbh,fcpmc,fcpdw,fcpzl,fmemo from cplxk where fcpmc like ''%'+edit9.Text+'%'') as a inner join (select fcpbh,fcpkcs from cpkcb) as b on a.fcpbh=b.fcpbh');
    open;
    stringgrid1.RowCount:=ZQuery1.RecordCount+1;

    while not eof do
    begin
      stringgrid1.Rows[y].Clear;
      stringgrid1.Cells[0,y]:=fields[0].AsString;
      stringgrid1.Cells[1,y]:=fields[1].AsString;
      stringgrid1.Cells[2,y]:=fields[2].AsString;
      stringgrid1.Cells[3,y]:=fields[3].AsString;
      stringgrid1.Cells[4,y]:=fields[4].AsString;
      stringgrid1.Cells[5,y]:=fields[5].AsString;
      y:=y+1;
      next;
    end;
  end;
  Except
      Application.MessageBox('查询失败！','成品管理提示');
  end;
end;

procedure Tfrom9.Button8Click(Sender: TObject);
begin
  case radiogroup1.ItemIndex of
    0: ExportStrGridToExcel([StringGrid1]);
    1: ExportStrGridToExcel([StringGrid2]);
    2: ExportStrGridToExcel([StringGrid1,StringGrid2]);
  end;
  //ExportStrGridToExcel([StringGrid1,StringGrid2]);
end;

procedure Tfrom9.StringGrid1SelectCell(Sender: TObject; ACol, ARow: Integer;
  var CanSelect: Boolean);
  var y:integer;
  strCpbh:string;
begin
  stringgrid2.ColWidths[0]:=100;
  stringgrid2.ColWidths[1]:=100;
  stringgrid2.ColWidths[2]:=100;
  stringgrid2.ColWidths[3]:=100;
  stringgrid2.ColWidths[4]:=100;
  stringgrid2.Cells[0,0]:='产品编号';
  stringgrid2.Cells[1,0]:='记帐日期';
  stringgrid2.Cells[2,0]:='入库数量';
  stringgrid2.Cells[3,0]:='出库数量';
  stringgrid2.Cells[4,0]:='备注';
  stringgrid2.RowCount:=1;
  begin
  strCpbh:= stringgrid1.Cells[0,ARow];
  if strCpbh<>'' then
  begin
    y:=1;
    try
    with ZQuery1 do
    begin
      close;
      sql.Clear;
      sql.Add('select fcpbh,fjzdate,frksl,fcksl,fmemo from cpcrkmxz where fcpbh='''+strCpbh+''' and fisdel=''N''');
      open;
      if not eof then
      begin
        stringgrid2.RowCount:=ZQuery1.RecordCount+1;
      end else
      begin
        stringgrid2.RowCount:=1;
      end;
      while not eof do
      begin
        stringgrid2.Rows[y].Clear;
        stringgrid2.Cells[0,y]:=fields[0].AsString;
        stringgrid2.Cells[1,y]:=fields[1].AsString;
        stringgrid2.Cells[2,y]:=fields[2].AsString;
        stringgrid2.Cells[3,y]:=fields[3].AsString;
        stringgrid2.Cells[4,y]:=fields[4].AsString;
        y:=y+1;
        next;
      end;
    end;
    Except
        Application.MessageBox('查询失败！','产品管理提示');
    end;
  end;
  end;
end;

end.

