unit bcpxxgl;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, Grids, StdCtrls, ComCtrls, ZAbstractRODataset,
  ZAbstractDataset, ZDataset;

type
  TForm11 = class(TForm)
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
    ComboBox2: TComboBox;
    TabSheet2: TTabSheet;
    Label5: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label14: TLabel;
    ListBox1: TListBox;
    Edit3: TEdit;
    Button5: TButton;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    Button7: TButton;
    Button8: TButton;
    Edit4: TEdit;
    Edit5: TEdit;
    Edit6: TEdit;
    TabSheet3: TTabSheet;
    Label12: TLabel;
    StringGrid1: TStringGrid;
    Edit9: TEdit;
    Button6: TButton;
    StringGrid2: TStringGrid;
    Edit7: TEdit;
    TabSheet4: TTabSheet;
    Label10: TLabel;
    Edit8: TEdit;
    Label11: TLabel;
    Edit11: TEdit;
    Label15: TLabel;
    Edit12: TEdit;
    Button3: TButton;
    Button4: TButton;
    Button9: TButton;
    Button10: TButton;
    Label16: TLabel;
    Label17: TLabel;
    Button11: TButton;
    Label30: TLabel;
    Edit16: TEdit;
    StringGrid4: TStringGrid;
    Button12: TButton;
    ZQuery1: TZQuery;
    procedure Button10Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure ListBox1Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure CheckBox2Click(Sender: TObject);
    procedure ComboBox2DropDown(Sender: TObject);
    procedure Button11Click(Sender: TObject);
    procedure Edit16Change(Sender: TObject);
    procedure Button12Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure StringGrid1SelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure StringGrid4SelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure TabSheet2Show(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form11: TForm11;

implementation

uses main;

{$R *.dfm}

procedure TForm11.Button10Click(Sender: TObject);
var strBCPBH : String;
begin
  try
  with ZQuery1 do
  begin
    close;
    sql.Clear;
    sql.Add('select top 1 fbcplxbh+1 from BCPLXB order by CONVERT(int,fbcplxbh) desc');
    open;
    if not eof then
       strBCPBH := fields[0].AsString
       else
       strBCPBH := '1';
    edit8.Text := strBCPBH;
  end;
    Except
        Application.MessageBox('查询失败！','半成品管理提示');
    end;
end;

procedure TForm11.Button11Click(Sender: TObject);
begin
  stringgrid4.Visible:=not stringgrid4.Visible;
  edit16.Visible:= not edit16.Visible;
  label30.Visible:= not label30.Visible;
  //groupbox1.Visible:=not groupbox1.Visible;
end;

procedure TForm11.Button12Click(Sender: TObject);
var strBCPBH : String;
begin
  try
  with ZQuery1 do
  begin
    close;
    sql.Clear;
    sql.Add('select max(cast(fbcpbh as unsigned))+1 from BCPLXk_info');
    open;
    if not eof then
       strBCPBH := fields[0].AsString
       else
       strBCPBH := '1';
    edit1.Text := strBCPBH;
  end;
    Except
        Application.MessageBox('查询失败！','半成品管理提示');
    end;
end;

procedure TForm11.Button1Click(Sender: TObject);
begin
  if (edit1.Text <> '') and (edit2.Text <> '') and (edit7.Text <> '') and (combobox2.Text <> '') then
  begin
    try
      with ZQuery1 do
      begin
        close;
        sql.Clear;
        sql.Add('insert into bcplxk_info (fbcpbh,fbcpgg,fbcplxmc,fsscpbh,fmemo) values ('''+edit1.Text+''','''+edit2.Text+''','''+combobox2.Text+''','''+edit7.Text+''','''+main.strUser+edit10.Text+''')');
        sql.Add('insert into bcpkcb (fbcpbh,fbcpkcs) values ('''+edit1.Text+''','''+'0'+''')');
        ExecSQL;
        edit1.Text := '';
        edit2.Text := '';
        edit3.Text := '';
        edit4.Text := '';
        Application.MessageBox('新增半成品信息成功！','半成品管理提示');
        close;
        sql.Clear;
        sql.Add('select top 1 fbcpbh+1 from BCPLXk_info order by CONVERT(int,fbcpbh) desc');
        open;
        if not eof then
           edit1.Text := fields[0].AsString;
      end;
    Except
      Application.MessageBox('新增半成品信息失败！','半成品管理提示');
    end;
  end else
    Application.MessageBox('请将必填项目填写完整！','半成品管理提示');
end;


procedure TForm11.Button3Click(Sender: TObject);
begin
  if (edit11.Text <> '')then
  begin
    try
      with ZQuery1 do
      begin
        close;
        sql.Clear;
        sql.Add('insert into bcplxb (fbcplxbh,fbcplxmc,fmemo) values ('''+edit8.Text+''','''+edit11.Text+''','''+main.strUser+edit12.Text+''')');
        ExecSQL;
        Application.MessageBox('新增记录成功！','半成品信息管理提示');
        edit11.Text := '';
        edit12.Text := '';
        close;
        sql.Clear;
        sql.Add('select top 1 fbcplxbh+1 from BCPLXB order by CONVERT(int,fbcplxbh) desc');
        open;
        if not eof then
           edit8.Text := fields[0].AsString;
      end;
    Except
      Application.MessageBox('新增记录失败！','半成品信息管理提示');
    end;
   end else
    Application.MessageBox('请将必填项目填写完整！','半成品信息管理提示');

end;

procedure TForm11.Button5Click(Sender: TObject);
begin
  listbox1.Clear;
  with ZQuery1 do
    begin
      close;
      sql.Clear;
      sql.Add('select fbcplxmc from bcplxb where fbcplxmc like ''%'+edit3.text+'%'' and fisdel=''N''');
      open;
      while not eof  do
      begin
        listbox1.Items.Append(fields[0].AsString);
        next;
      end;
  end;
end;

procedure TForm11.Button6Click(Sender: TObject);
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

procedure TForm11.Button7Click(Sender: TObject);
begin
 if (edit4.Text = '') then
   begin
   Application.MessageBox('请选择需要修改的半成品！','提示');
   end else
   begin
   try
     with ZQuery1 do
     begin
       close;
       sql.Clear;
       if CheckBox1.Checked then
        sql.Add('update bcplxb set fbcplxmc = '''+edit5.Text+''' where fbcplxbh = '''+edit4.Text+'''');
       if CheckBox2.Checked then
        sql.Add('update bcplxb set fmemo = '''+edit6.Text+''' where fbcplxbh = '''+edit4.Text+'''');
        ExecSQL;
        edit5.ReadOnly := True;
        edit6.ReadOnly := True;
        checkbox1.Checked := False;
        checkbox2.Checked := False;
        listbox1.Clear;
        close;
        sql.Clear;
        sql.Add('select fbcplxmc from bcplxb where fisdel=''N''');
        open;
        while not eof  do
        begin
          listbox1.Items.Append(fields[0].AsString);
          next;
        end;
        Application.MessageBox('记录修改成功！','提示');
        end;
     Except
       Application.MessageBox('记录修改失败！','提示');
   end;
     end;
end;

procedure TForm11.CheckBox1Click(Sender: TObject);
begin
  if edit4.Text <> '' then
  begin
    edit5.ReadOnly := not CheckBox1.Checked;
  end;
end;

procedure TForm11.CheckBox2Click(Sender: TObject);
begin
  if edit4.Text <> '' then
  begin
    edit6.ReadOnly := not CheckBox2.Checked;
  end;
end;

procedure TForm11.ComboBox2DropDown(Sender: TObject);
begin
  combobox2.Items.Clear;
  with ZQuery1 do
  begin
    close;
    sql.Clear;
    sql.Add('select fbcplxmc from bcplxb');
    open;
    while not eof do
    begin
       combobox2.Items.Add(fields[0].asstring);
       next;
    end;
  end;
end;

procedure TForm11.Edit16Change(Sender: TObject);
var y:integer;
begin
  y:=1;
  if edit16.Text<>'' then
   begin
    try
    with ZQuery1 do
    begin
      close;
      sql.Clear;
      sql.Add('select fcpbh,fcpmc,fcpzl from cplxk where fcpmc like ''%'+edit16.Text+'%''');
      open;
      stringgrid4.RowCount:=RecordCount+1;
      while not eof do
      begin
        stringgrid4.Cells[0,y]:=fields[0].AsString;
        stringgrid4.Cells[1,y]:=fields[1].AsString;
        stringgrid4.Cells[2,y]:=fields[2].AsString;
        y:=y+1;
        next;
      end;
    end;
    Except
      Application.MessageBox('查询失败！','半成品管理提示');
    end;
  end;
end;

procedure TForm11.ListBox1Click(Sender: TObject);
var strBcplxmc:String;
begin
  strBcplxmc := listbox1.Items.Strings[listbox1.itemindex];
  with ZQuery1 do
  begin
    close;
    sql.Clear;
    sql.Add('select fbcplxbh,fbcplxmc,fmemo from bcplxb where fbcplxmc = '''+strBcplxmc+'''');
    open;
    if not eof then
    begin
      edit4.Text := fields[0].AsString;
      edit5.Text := fields[1].AsString;
      edit6.Text := fields[2].AsString;
    end;
  end;
end;

procedure TForm11.StringGrid1SelectCell(Sender: TObject; ACol, ARow: Integer;
  var CanSelect: Boolean);
  var y:integer;
  strCpbh:string;
begin
  stringgrid2.ColWidths[0]:=200;
  stringgrid2.ColWidths[1]:=200;
  stringgrid2.ColWidths[2]:=200;
  stringgrid2.Cells[0,0]:='半成品规格';
  stringgrid2.Cells[1,0]:='半成品名称';
  stringgrid2.Cells[2,0]:='半成品库存量';
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
      sql.Add('select a.fbcpbh,fbcpgg,fbcplxmc,fbcpkcs,fmemo,fsscpbh from (select fbcpbh,fbcpkcs,fmemo from bcpkcb where fisdel=''N'') as a inner join(select fbcpbh,fbcpgg,fbcplxmc,fsscpbh from bcplxk_info) as b on a.fbcpbh=b.fbcpbh where fsscpbh='''+strCpbh+'''');
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
        stringgrid2.Cells[0,y]:=fields[1].AsString;
        stringgrid2.Cells[1,y]:=fields[2].AsString;
        stringgrid2.Cells[2,y]:=fields[3].AsString;
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



procedure TForm11.StringGrid4SelectCell(Sender: TObject; ACol, ARow: Integer;
  var CanSelect: Boolean);
begin
  edit1.Text:=stringgrid4.Cells[0,ARow];
end;

procedure TForm11.TabSheet2Show(Sender: TObject);

begin
listbox1.Clear;
with ZQuery1 do
  begin
    close;
    sql.Clear;
    sql.Add('select fbcplxmc from bcplxb');
    open;
    while not eof  do
    begin
      listbox1.Items.Append(fields[0].AsString);
      next;
    end;

  end;
end;

end.
