unit htgl;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, DB, ADODB, Grids, ExtCtrls, ZAbstractRODataset,
  ZAbstractDataset, ZDataset;

type
  TForm6 = class(TForm)
    PageControl1: TPageControl;
    TabSheet3: TTabSheet;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    StringGrid1: TStringGrid;
    Edit9: TEdit;
    Button6: TButton;
    Label12: TLabel;
    StringGrid2: TStringGrid;
    Button8: TButton;
    RadioGroup1: TRadioGroup;
    ZQuery1: TZQuery;
    procedure Button2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
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
  Form6: TForm6;
  Function ExportStrGridToExcel(Args: array of const): Boolean;stdcall;external 'dlltools.dll';

implementation

uses Main;

{$R *.dfm}

procedure TForm6.Button2Click(Sender: TObject);
begin
  form6.Close;
end;

procedure TForm6.Button6Click(Sender: TObject);
var y:integer;
begin
  y:=1;
  try
  with ZQuery1 do
  begin
    close;
    sql.Clear;
    sql.Add('select fhtbh,fhtdate,fkhmc,fxsyxm,flxr,flxrdh,fhtzje,ffhjsbz,fmemo from (select * from (select fhtbh,fkhbh,fhtdate,fxsybh,flxr,flxrdh,fhtzje,ffhjsbz,fmemo from ht_info where fkhbh in (select fkdhid from Kh_info where fkhmc like ''%'+edit9.Text+'%'') and fisdel=''N'') as a inner join (select fkdhid,fkhmc from Kh_info) as b on a.fkhbh=b.fkdhid) as c inner join (select fxsyid,fxsyxm from Xsy_info) as d on c.fxsybh=d.fxsyid');
    open;
    stringgrid1.RowCount:=ZQuery1.RecordCount+1;
    while not eof do
    begin
      stringgrid2.Rows[y].Clear;
      stringgrid1.Cells[0,y]:=fields[0].AsString;
      stringgrid1.Cells[1,y]:=fields[1].AsString;
      stringgrid1.Cells[2,y]:=fields[2].AsString;
      stringgrid1.Cells[3,y]:=fields[3].AsString;
      stringgrid1.Cells[4,y]:=fields[4].AsString;
      stringgrid1.Cells[5,y]:=fields[5].AsString;
      stringgrid1.Cells[6,y]:=fields[6].AsString;
      stringgrid1.Cells[7,y]:=fields[7].AsString;
      stringgrid1.Cells[8,y]:=fields[8].AsString;
      y:=y+1;
      next;
    end;
  end;
  Except
      Application.MessageBox('查询失败！','合同管理提示');
  end;
end;

procedure TForm6.Button8Click(Sender: TObject);
begin
  case radiogroup1.ItemIndex of
    0: ExportStrGridToExcel([StringGrid1]);
    1: ExportStrGridToExcel([StringGrid2]);
    2: ExportStrGridToExcel([StringGrid1,StringGrid2]);
  end;
end;

procedure TForm6.FormShow(Sender: TObject);
begin
  stringgrid1.ColWidths[0]:=100;
  stringgrid1.ColWidths[1]:=100;
  stringgrid1.ColWidths[2]:=400;
  stringgrid1.ColWidths[3]:=60;
  stringgrid1.ColWidths[4]:=50;
  stringgrid1.ColWidths[5]:=90;
  stringgrid1.ColWidths[6]:=60;
  stringgrid1.ColWidths[7]:=60;
  stringgrid1.ColWidths[8]:=150;
  stringgrid1.Cells[0,0]:='合同编号';
  stringgrid1.Cells[1,0]:='合同日期';
  stringgrid1.Cells[2,0]:='客户名称';
  stringgrid1.Cells[3,0]:='销售人员';
  stringgrid1.Cells[4,0]:='联系人';
  stringgrid1.Cells[5,0]:='联系电话';
  stringgrid1.Cells[6,0]:='合同金额';
  stringgrid1.Cells[7,0]:='供货结束';
  stringgrid1.Cells[8,0]:='备注';
  stringgrid2.ColWidths[0]:=100;
  stringgrid2.ColWidths[1]:=100;
  stringgrid2.ColWidths[2]:=100;
  stringgrid2.ColWidths[3]:=100;
  stringgrid2.ColWidths[4]:=100;
  stringgrid2.ColWidths[5]:=100;
  stringgrid2.ColWidths[6]:=100;
  stringgrid2.Cells[0,0]:='产品类型';
  stringgrid2.Cells[1,0]:='产品名称';
  stringgrid2.Cells[2,0]:='单价';
  stringgrid2.Cells[3,0]:='合同数量';
  stringgrid2.Cells[4,0]:='合计金额';
  stringgrid2.Cells[5,0]:='已发数量';
  stringgrid2.Cells[6,0]:='发货金额';
end;

procedure TForm6.StringGrid1SelectCell(Sender: TObject; ACol, ARow: Integer;
  var CanSelect: Boolean);
var strHtbh:string;
var y:integer;
var floatZje:real;
var htcpsl:integer;
var yfhcpsl:integer;
var yfhcpzje:real;
begin
  strHtbh:= stringgrid1.Cells[0,ARow];
  if strHtbh<>'' then
  begin
    y:=1;
    floatZje:=0;
    try
    with ZQuery1 do
    begin
      close;
      sql.Clear;
      sql.Add('select fcpzl,fcpmc,fcpdj,fcpsl,fcpdj*fcpsl as fcpzje,fyfhsl,fyfhsl*fcpdj as fyfhzje from (select fcpbh,fcpdj,fcpsl,fyfhsl from htcpmxb where fcpbh in (select fcpbh from htcpmxb where fhtbh='''+strHtbh+''')) as a inner join(select fcpbh,fcpmc,fcpzl from cplxk) as b on a.fcpbh=b.fcpbh');
      open;
      if not eof then
      begin
        stringgrid2.RowCount:=ZQuery1.RecordCount+2;
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
        stringgrid2.Cells[5,y]:=fields[5].AsString;
        stringgrid2.Cells[6,y]:=fields[6].AsString;
        htcpsl:=htcpsl+fields[3].AsInteger;
        floatzje:=floatzje+fields[4].AsFloat;
        yfhcpsl:=yfhcpsl+fields[5].AsInteger;
        yfhcpzje:=yfhcpzje+fields[6].AsFloat;
        y:=y+1;
        next;
      end;
      stringgrid2.Rows[y].Clear;
      stringgrid2.Cells[0,y]:='总计';
      stringgrid2.Cells[3,y]:=inttostr(htcpsl);
      stringgrid2.Cells[4,y]:=floattostr(floatzje);
      stringgrid2.Cells[5,y]:=inttostr(yfhcpsl);
      stringgrid2.Cells[6,y]:=floattostr(yfhcpzje);
    end;
    Except
        Application.MessageBox('查询失败！','合同管理提示');
    end;
  end;
end;

end.
