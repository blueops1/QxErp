unit cpxxgl;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, StdCtrls, ComCtrls, DB, ADODB, ExtCtrls;

type
  TForm8 = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Label6: TLabel;
    Label7: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label13: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Button1: TButton;
    Button2: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit10: TEdit;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    Label12: TLabel;
    StringGrid1: TStringGrid;
    Edit9: TEdit;
    Button6: TButton;
    StringGrid2: TStringGrid;
    ADOQuery1: TADOQuery;
    ComboBox1: TComboBox;
    ComboBox2: TComboBox;
    ListBox1: TListBox;
    Label5: TLabel;
    Edit3: TEdit;
    Button5: TButton;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox4: TCheckBox;
    Button7: TButton;
    Button8: TButton;
    Label8: TLabel;
    Edit4: TEdit;
    Label9: TLabel;
    Edit5: TEdit;
    Label10: TLabel;
    ComboBox3: TComboBox;
    Label11: TLabel;
    ComboBox4: TComboBox;
    Label14: TLabel;
    Edit6: TEdit;
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure ComboBox1DropDown(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure StringGrid1SelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form8: TForm8;

implementation
uses Main;

{$R *.dfm}

procedure TForm8.Button1Click(Sender: TObject);
begin
  if (edit2.Text <> '') and (combobox1.Text <> '') and (combobox2.Text <> '')then
  begin
    try
      with ADOQuery1 do
      begin
        close;
        sql.Clear;
        sql.Add('insert into cplxk (fcpbh,fcpmc,fcpdw,fcpzl,fmemo) values ('''+edit1.Text+''','''+edit2.Text+''','''+combobox2.Text+''','''+combobox1.Text+''','''+main.strUser+edit10.Text+''')');
        sql.Add('insert into cpkcb (fcpbh,fcpkcs) values ('''+edit1.Text+''','''+'0'+''')');
        ExecSQL;
        Application.MessageBox('新增记录成功！','产品信息管理提示');
        edit2.Text := '';
        combobox2.Text := '';
        combobox1.Text:='';
        edit10.Text := '';
      close;
      sql.Clear;
      sql.Add('select top 1 fcpbh+1 from cplxk order by CONVERT(int,fcpbh) desc');
      open;
      if not eof then
        edit1.Text := fields[0].AsString;
      end;
      Except
      Application.MessageBox('新增记录失败！','产品信息管理提示');
    end;
   end else
    Application.MessageBox('请将必填项目填写完整！','产品信息管理提示');
end;

procedure TForm8.Button6Click(Sender: TObject);
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
  with ADOQuery1 do
  begin
    close;
    sql.Clear;
    sql.Add('select a.fcpbh,fcpmc,fcpdw,fcpzl,fcpkcs,fmemo from (select fcpbh,fcpmc,fcpdw,fcpzl,fmemo from cplxk where fcpmc like ''%'+edit9.Text+'%'') as a inner join (select fcpbh,fcpkcs from cpkcb) as b on a.fcpbh=b.fcpbh');
    open;
    stringgrid1.RowCount:=adoquery1.RecordCount+1;

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

procedure TForm8.ComboBox1DropDown(Sender: TObject);
begin
  with ADOQuery1 do
  begin
    close;
    sql.Clear;
    sql.Add('select distinct fcpzl from cplxk');
    open;
    while not eof do
    begin
       combobox1.Items.Add(fields[0].asstring);
       next;
    end;
  end;
end;

procedure TForm8.FormShow(Sender: TObject);
var strCPBH : String;
begin
  with ADOQuery1 do
  begin
    close;
    sql.Clear;
    sql.Add('select top 1 fcpbh+1 from cpkcb order by CONVERT(int,fcpbh) desc');
    open;
    if not eof then
       strCPBH := fields[0].AsString;
    edit1.Text := strCPBH;
  end;
end;

procedure TForm8.StringGrid1SelectCell(Sender: TObject; ACol, ARow: Integer;
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
    with ADOQuery1 do
    begin
      close;
      sql.Clear;
      sql.Add('select fcpbh,fjzdate,frksl,fcksl,fmemo from cpcrkmxz where fcpbh='''+strCpbh+''' and fisdel=''N''');
      open;
      if not eof then
      begin
        stringgrid2.RowCount:=adoquery1.RecordCount+1;
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
