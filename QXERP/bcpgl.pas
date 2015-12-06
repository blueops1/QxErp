unit bcpgl;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, ComCtrls, Grids, StdCtrls, ZAbstractRODataset,
  ZAbstractDataset, ZDataset;

type
  TForm12 = class(TForm)
    PageControl1: TPageControl;
    TabSheet2: TTabSheet;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Edit3: TEdit;
    Edit5: TEdit;
    DateTimePicker2: TDateTimePicker;
    Edit6: TEdit;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    StringGrid3: TStringGrid;
    Edit7: TEdit;
    TabSheet3: TTabSheet;
    Label12: TLabel;
    StringGrid1: TStringGrid;
    Edit9: TEdit;
    Button6: TButton;
    StringGrid2: TStringGrid;
    StringGrid7: TStringGrid;
    ZQuery1: TZQuery;
    procedure Edit7Change(Sender: TObject);
    procedure StringGrid3SelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure Button3Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure StringGrid1SelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure StringGrid2SelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure Button5Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form12: TForm12;

implementation

uses main;

{$R *.dfm}

procedure TForm12.Button3Click(Sender: TObject);

begin
  if (edit3.Text <> '') and (edit5.Text <> '')then
  begin
    try
      with ZQuery1 do
      begin
        close;
        sql.Clear;
        ExecSQL;
        sql.Add('insert into bcpcrkmxz (fbcpbh,fCksl,fjzdate,fmemo) values ('''+edit3.Text+''','''+edit5.Text+''','''+datetimetostr(datetimepicker2.Date)+''','''+main.strUser+edit6.Text+''')');
        sql.Clear;
        if strtoint(edit5.text)>=0 then
        sql.Add('update bcpkcb set fbcpkcs=fbcpkcs-'+edit5.Text+' where fbcpbh='+edit3.Text)
        else
        sql.Add('update bcpkcb set fbcpkcs=fbcpkcs+'+inttostr(strtoint(edit5.Text)*-1)+' where fbcpbh='+edit3.Text);
        ExecSQL;
        edit3.Text := '';
        edit5.Text := '';
        Application.MessageBox('半成品出库成功！','半成品管理提示');
        //PageControl1.ActivePageIndex:=1;
      end;
    Except
      Application.MessageBox('半成品出库失败！','半成品管理提示');
    end;
  end else
    Application.MessageBox('请将必填项目填写完整！','半成品管理提示');
end;

procedure TForm12.Button5Click(Sender: TObject);
begin
  stringgrid3.Visible:=not stringgrid3.Visible;
  edit7.Visible:= not edit7.Visible;
  label16.Visible:= not label16.Visible;
end;

procedure TForm12.Button6Click(Sender: TObject);
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
    sql.Add('select a.fcpbh,fcpmc,fcpdw,fcpzl,fcpkcs,fmemo from (select fcpbh,fcpmc,fcpdw,fcpzl,fmemo from cplxk where fcpbh in (select fsscpbh from bcplxk_info) or fcpbh in (select fsscpbh1 from bcplxk_info) and fcpmc like ''%'+edit9.Text+'%'') as a inner join (select fcpbh,fcpkcs from cpkcb) as b on a.fcpbh=b.fcpbh');
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

procedure TForm12.Edit7Change(Sender: TObject);
var y:integer;
begin
  begin
      y:=1;
      if edit7.Text<>'' then
      begin
        try
        with ZQuery1 do
        begin
          close;
          sql.Clear;
          sql.Add('select fbcpbh,fbcplxmc,fcpmc,fcpzl from (select fbcpbh,fbcpgg,fbcplxmc,fsscpbh from bcplxk_info where fbcpgg like ''%'+edit7.text+'%'') as a inner join (select fcpbh,fcpmc,fcpzl from cplxk) as b on a.fsscpbh=b.fcpbh');
          open;
          stringgrid3.RowCount:=RecordCount+1;
          while not eof do
          begin
            stringgrid3.Cells[0,y]:=fields[0].AsString;
            stringgrid3.Cells[1,y]:=fields[1].AsString;
            stringgrid3.Cells[2,y]:=fields[2].AsString;
            stringgrid3.Cells[3,y]:=fields[3].AsString;
            y:=y+1;
            next;
          end;
        end;
          Except
              Application.MessageBox('查询失败！','仓库管理提示');
        end;
      end;
    end;
end;

procedure TForm12.FormActivate(Sender: TObject);
begin
  datetimepicker2.DateTime := date();
end;

procedure TForm12.StringGrid1SelectCell(Sender: TObject; ACol, ARow: Integer;
  var CanSelect: Boolean);
  var y:integer;
  strCpbh:string;
begin
  stringgrid2.ColWidths[0]:=100;
  stringgrid2.ColWidths[1]:=100;
  stringgrid2.ColWidths[2]:=100;
  stringgrid2.ColWidths[2]:=100;
  stringgrid2.Cells[0,0]:='半成品编号';
  stringgrid2.Cells[1,0]:='半成品规格';
  stringgrid2.Cells[2,0]:='半成品名称';
  stringgrid2.Cells[3,0]:='半成品库存量';
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
      sql.Add('select a.fbcpbh,fbcpmc,fbcplxbh,fbcpkcs,fmemo,fsscpbh from (select fbcpbh,fbcpkcs,fmemo from bcpkcb where fisdel=''N'') as a inner join(select fbcpbh,fbcpmc,fbcplxbh,fsscpbh,fsscpbh1 from bcplxk_info  where fsscpbh='''+strCpbh+''' or fsscpbh1='''+strCpbh+''') as b on a.fbcpbh=b.fbcpbh');
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
//        stringgrid2.Rows[y].Clear;
        stringgrid2.Cells[0,y]:=fields[0].AsString;
        stringgrid2.Cells[1,y]:=fields[1].AsString;
        stringgrid2.Cells[2,y]:=fields[2].AsString;
        stringgrid2.Cells[3,y]:=fields[3].AsString;
        y:=y+1;
        next;
      end;
        stringgrid2.Cells[0,y]:=fields[0].AsString;
        stringgrid2.Cells[1,y]:=fields[1].AsString;
        stringgrid2.Cells[2,y]:=fields[2].AsString;
        stringgrid2.Cells[3,y]:=fields[3].AsString;
    end;
    Except
        Application.MessageBox('查询失败！','半成品管理提示');
    end;
  end;
  end;
end;

procedure TForm12.StringGrid2SelectCell(Sender: TObject; ACol, ARow: Integer;
  var CanSelect: Boolean);
  var y:integer;
  strbCpbh:string;
begin
  stringgrid7.ColWidths[0]:=100;
  stringgrid7.ColWidths[1]:=100;
  stringgrid7.ColWidths[2]:=100;
  stringgrid7.ColWidths[3]:=100;
  stringgrid7.ColWidths[4]:=200;
  stringgrid7.Cells[0,0]:='半成品编号';
  stringgrid7.Cells[1,0]:='入库数量';
  stringgrid7.Cells[2,0]:='出库数量';
  stringgrid7.Cells[3,0]:='记帐日期';
  stringgrid7.Cells[4,0]:='备注';
  stringgrid7.RowCount:=1;
  begin
  strbCpbh:= stringgrid2.Cells[0,ARow];
  if strbCpbh<>'' then
  begin
    y:=1;
    try
    with ZQuery1 do
    begin
      close;
      sql.Clear;
      sql.Add('select fbcpbh,frksl,fcksl,fjzdate,fmemo from bcpcrkmxz where fisdel=''N'' and fbcpbh='''+strbCpbh+'''');
      open;
      if not eof then
      begin
        stringgrid7.RowCount:=ZQuery1.RecordCount+1;
      end else
      begin
        stringgrid7.RowCount:=1;
      end;
      while not eof do
      begin
        stringgrid7.Rows[y].Clear;
        stringgrid7.Cells[0,y]:=fields[0].AsString;
        stringgrid7.Cells[1,y]:=fields[1].AsString;
        stringgrid7.Cells[2,y]:=fields[2].AsString;
        stringgrid7.Cells[3,y]:=fields[3].AsString;
        stringgrid7.Cells[4,y]:=fields[4].AsString;
        y:=y+1;
        next;
      end;
    end;
    Except
        Application.MessageBox('查询失败！','半成品管理提示');
    end;
  end;
  end;
end;

procedure TForm12.StringGrid3SelectCell(Sender: TObject; ACol, ARow: Integer;
  var CanSelect: Boolean);
begin
  edit3.Text:=stringgrid3.Cells[0,ARow];
end;

end.

