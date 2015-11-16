unit ckgl;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, StdCtrls, Grids, ComCtrls, ExtCtrls, ZAbstractRODataset,
  ZAbstractDataset, ZDataset;

type
  Tfrom9 = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label30: TLabel;
    Button1: TButton;
    Button2: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit4: TEdit;
    Edit16: TEdit;
    StringGrid4: TStringGrid;
    Button7: TButton;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    Label12: TLabel;
    StringGrid1: TStringGrid;
    Edit9: TEdit;
    Button6: TButton;
    StringGrid2: TStringGrid;
    DateTimePicker1: TDateTimePicker;
    Label5: TLabel;
    Label6: TLabel;
    Label8: TLabel;
    Edit3: TEdit;
    Label9: TLabel;
    Label10: TLabel;
    Edit5: TEdit;
    Label11: TLabel;
    Label13: TLabel;
    DateTimePicker2: TDateTimePicker;
    Label14: TLabel;
    Edit6: TEdit;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    StringGrid3: TStringGrid;
    Edit7: TEdit;
    Label16: TLabel;
    Button8: TButton;
    RadioGroup1: TRadioGroup;
    ZQuery1: TZQuery;
    procedure Edit16Change(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure StringGrid4SelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure Button1Click(Sender: TObject);
    procedure StringGrid3SelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure Edit7Change(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure StringGrid1SelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure FormActivate(Sender: TObject);
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

procedure Tfrom9.Button1Click(Sender: TObject);

begin
  if (edit1.Text <> '') and (edit2.Text <> '')then
  begin
    try
      with ZQuery1 do
      begin
        close;
        sql.Clear;
        sql.Add('insert into cpcrkmxz (fcpbh,frksl,fjzdate,fmemo) values ('''+edit1.Text+''','''+edit2.Text+''','''+datetimetostr(datetimepicker1.Date)+''','''+main.strUser+edit4.Text+''')');
        if strtoint(edit2.text)>=0 then
        sql.Add('update cpkcb set fcpkcs=fcpkcs+'+edit2.Text+' where fcpbh='+edit1.Text)
        else
        sql.Add('update cpkcb set fcpkcs=fcpkcs'+edit2.Text+' where fcpbh='+edit1.Text);
        ExecSQL;
        edit1.Text := '';
        edit2.Text := '';
        Application.MessageBox('成品入库成功！','仓库管理提示');
        //PageControl1.ActivePageIndex:=1;
      end;
    Except
      Application.MessageBox('成品入库失败！','仓库管理提示');
    end;
  end else
    Application.MessageBox('请将必填项目填写完整！','仓库管理提示');
end;

procedure Tfrom9.Button3Click(Sender: TObject);
var strBcpbh: Array Of String ;
var x:integer;
begin
begin
  if (edit3.Text <> '') and (edit5.Text <> '')then
  begin
    try
      with ZQuery1 do
      begin
        close;
        sql.Clear;
        sql.Add('insert into cpcrkmxz (fcpbh,fCksl,fjzdate,fmemo) values ('''+edit3.Text+''','''+edit5.Text+''','''+datetimetostr(datetimepicker2.Date)+''','''+main.strUser+edit6.Text+''')');
        if strtoint(edit5.text)>=0 then
        sql.Add('update cpkcb set fcpkcs=fcpkcs-'+edit5.Text+' where fcpbh='+edit3.Text)
        else
        sql.Add('update cpkcb set fcpkcs=fcpkcs+'+inttostr(strtoint(edit5.Text)*-1)+' where fcpbh='+edit3.Text);
        ExecSQL;
        sql.Clear;
        sql.Add('select fbcpbh from bcplxk_info where fsscpbh='''+edit3.Text+'''');
        open;
        if not eof then
        begin
        x:=0;
        setLength(strBcpbh,RecordCount);

          while not eof do
          begin
            strBcpbh[x]:=fields[0].AsString;
            x := x+1;
            next;
          end;
          x := 0;
          sql.Clear;
          while x<length(strBcpbh) do
          begin
            sql.Add('insert into bcpcrkmxz (fbcpbh,fCksl,fjzdate,fmemo) values ('''+StrBcpbh[x]+''','''+edit5.Text+''','''+datetimetostr(datetimepicker2.Date)+''','''+main.strUser+edit6.Text+''')');
            if strtoint(edit5.text)>=0 then
            sql.Add('update bcpkcb set fbcpkcs=fbcpkcs-'+edit5.Text+' where fbcpbh='+StrBcpbh[x])
            else
            sql.Add('update bcpkcb set fbcpkcs=fbcpkcs+'+inttostr(strtoint(edit5.Text)*-1)+' where fbcpbh='+StrBcpbh[x]);
            x := x + 1;
          end;
          ExecSQL;
        end;
        edit3.Text := '';
        edit5.Text := '';
        Application.MessageBox('成品出库成功！','仓库管理提示');
        //PageControl1.ActivePageIndex:=1;
      end;
    Except
      Application.MessageBox('成品出库失败！','仓库管理提示');
    end;
  end else
    Application.MessageBox('请将必填项目填写完整！','仓库管理提示');
end;
end;

procedure Tfrom9.Button5Click(Sender: TObject);
begin
  stringgrid3.Visible:=not stringgrid3.Visible;
  edit7.Visible:= not edit7.Visible;
  label16.Visible:= not label16.Visible;
end;

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

procedure Tfrom9.Button7Click(Sender: TObject);
begin
  stringgrid4.Visible:=not stringgrid4.Visible;
  edit16.Visible:= not edit16.Visible;
  label30.Visible:= not label30.Visible;
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

procedure Tfrom9.Edit16Change(Sender: TObject);
var y:integer;
begin
  begin
      y:=1;
      if edit16.Text<>'' then
      begin
        try
        with ZQuery1 do
        begin
          close;
          sql.Clear;
          sql.Add('select a.fcpbh,a.fcpmc,b.fcpkcs,a.fcpzl from (select fcpbh,fcpmc,fcpzl from cplxk where fcpmc like ''%'+edit16.Text+'%'') as a inner join(select fcpbh,fcpkcs from cpkcb) as b on a.fcpbh=b.fcpbh order by fcpmc' );
          open;
          stringgrid4.RowCount:=RecordCount+1;
          while not eof do
          begin
            stringgrid4.Cells[0,y]:=fields[0].AsString;
            stringgrid4.Cells[1,y]:=fields[1].AsString;
            stringgrid4.Cells[2,y]:=fields[3].AsString;
            stringgrid4.Cells[3,y]:=fields[2].AsString;
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

procedure Tfrom9.Edit7Change(Sender: TObject);
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
          sql.Add('select a.fcpbh,a.fcpmc,b.fcpkcs,a.fcpzl from (select fcpbh,fcpmc,fcpzl from cplxk where fcpmc like ''%'+edit7.Text+'%'') as a inner join(select fcpbh,fcpkcs from cpkcb) as b on a.fcpbh=b.fcpbh order by fcpmc');
          open;
          stringgrid3.RowCount:=RecordCount+1;
          while not eof do
          begin
            stringgrid3.Cells[0,y]:=fields[0].AsString;
            stringgrid3.Cells[1,y]:=fields[1].AsString;
            stringgrid3.Cells[2,y]:=fields[3].AsString;
            stringgrid3.Cells[3,y]:=fields[2].AsString;
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

procedure Tfrom9.FormActivate(Sender: TObject);
begin
  datetimepicker1.DateTime := date();
  datetimepicker2.DateTime := date();
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

procedure Tfrom9.StringGrid3SelectCell(Sender: TObject; ACol, ARow: Integer;
  var CanSelect: Boolean);
begin
  edit3.Text:=stringgrid3.Cells[0,ARow];
end;

procedure Tfrom9.StringGrid4SelectCell(Sender: TObject; ACol, ARow: Integer;
  var CanSelect: Boolean);
begin

  edit1.Text:=stringgrid4.Cells[0,ARow];

end;

end.

