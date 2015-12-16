unit zggl;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, DB, ADODB, Grids, ZAbstractRODataset,
  ZAbstractDataset, ZDataset;

type
  TForm13 = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Button1: TButton;
    Button2: TButton;
    TabSheet2: TTabSheet;
    ListBox1: TListBox;
    Button3: TButton;
    Button4: TButton;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox4: TCheckBox;
    Label8: TLabel;
    Edit9: TEdit;
    Label9: TLabel;
    Edit10: TEdit;
    Label10: TLabel;
    Edit11: TEdit;
    Label11: TLabel;
    Edit12: TEdit;
    ComboBox1: TComboBox;
    Label16: TLabel;
    Label17: TLabel;
    Label12: TLabel;
    Edit4: TEdit;
    Label13: TLabel;
    Edit5: TEdit;
    Label14: TLabel;
    Edit6: TEdit;
    Label15: TLabel;
    Edit7: TEdit;
    Label18: TLabel;
    Edit8: TEdit;
    Label19: TLabel;
    Edit13: TEdit;
    Label20: TLabel;
    ComboBox2: TComboBox;
    Label21: TLabel;
    Edit14: TEdit;
    CheckBox3: TCheckBox;
    CheckBox5: TCheckBox;
    CheckBox6: TCheckBox;
    CheckBox7: TCheckBox;
    Label22: TLabel;
    Edit15: TEdit;
    Button5: TButton;
    TabSheet3: TTabSheet;
    StringGrid1: TStringGrid;
    TabSheet4: TTabSheet;
    TabSheet5: TTabSheet;
    Edit16: TEdit;
    Edit17: TEdit;
    Edit18: TEdit;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Button6: TButton;
    Button7: TButton;
    Label26: TLabel;
    Label27: TLabel;
    Button8: TButton;
    ListBox2: TListBox;
    Label28: TLabel;
    Edit19: TEdit;
    Button9: TButton;
    Label29: TLabel;
    Edit20: TEdit;
    Label30: TLabel;
    Edit21: TEdit;
    Label31: TLabel;
    Edit22: TEdit;
    Button10: TButton;
    Button11: TButton;
    CheckBox8: TCheckBox;
    CheckBox9: TCheckBox;
    Button12: TButton;
    Label32: TLabel;
    Button13: TButton;
    ZQuery1: TZQuery;
    procedure TabSheet3Show(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure CheckBox8Click(Sender: TObject);
    procedure CheckBox9Click(Sender: TObject);
    procedure TabSheet5Show(Sender: TObject);
    procedure ListBox2Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure ComboBox1DropDown(Sender: TObject);
    procedure ComboBox2DropDown(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure CheckBox2Click(Sender: TObject);
    procedure CheckBox4Click(Sender: TObject);
    procedure CheckBox3Click(Sender: TObject);
    procedure CheckBox5Click(Sender: TObject);
    procedure CheckBox6Click(Sender: TObject);
    procedure CheckBox7Click(Sender: TObject);
    procedure TabSheet2Show(Sender: TObject);
    procedure ListBox1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button12Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button13Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form13: TForm13;
  Function ExportStrGridToExcel(Args: array of const): Boolean;stdcall;external 'dlltools.dll';

implementation

uses main;

{$R *.dfm}

procedure TForm13.Button12Click(Sender: TObject);
var strZGBH : String;
begin
  try
  with ZQuery1 do
  begin
    close;
    sql.Clear;
    sql.Add('select max(cast(fZGbh as unsigned))+1 from ZG_info');
    open;
    if not eof then
       strZGBH := fields[0].AsString
       else
       strZGBH := '1';
    edit1.Text := strZGBH;
  end;
    Except
        Application.MessageBox('查询失败！','职工管理提示');
    end;
end;

procedure TForm13.Button13Click(Sender: TObject);
begin
  ExportStrGridToExcel([StringGrid1]);
end;

procedure TForm13.Button1Click(Sender: TObject);
var strBmbh:String;
begin
  if (edit1.Text <> '') and (edit2.Text <> '') and (edit3.Text <> '')and (edit9.Text <> '') and (combobox1.Text <> '') then
  begin
    try
      with ZQuery1 do
      begin
        close;
        sql.Clear;
        sql.Add('select fbmbh from bm_info where fbmmc = '''+combobox1.Text+'''');
        open;
        if not eof then
          strBmbh := fields[0].AsString;
        close;
        sql.Clear;
        sql.Add('insert into zg_info (fzgbh,fzgxm,fzgsfz,fzgmobile,fzgsyw,fzghomedh,fssbmbh,fmemo) values ('''+edit1.Text+''','''+edit2.Text+''','''+edit9.Text+''','''+edit3.Text+''','''+edit10.Text+''','''+edit11.Text+''','''+strBmbh+''','''+main.strUser+edit12.Text+''')');
        ExecSQL;
        edit1.Text := '';
        edit2.Text := '';
        edit9.Text := '';
        edit3.Text := '';
        edit10.Text := '';
        edit11.Text := '';
        edit12.Text := '';
        combobox1.Text := '';
        Application.MessageBox('新增职工成功！','职工管理提示');
        close;
        sql.Clear;
        sql.Add('select top 1 fzgbh+1 from zg_info order by CONVERT(int,fzgbh) desc');
        open;
        if not eof then
           edit1.Text := fields[0].AsString;
      end;
    Except
      Application.MessageBox('新增职工失败！','职工管理提示');
    end;
  end else
    Application.MessageBox('请将必填项目填写完整！','职工管理提示');
end;

procedure TForm13.Button3Click(Sender: TObject);
var strBmbh:string;
begin
 if (edit4.Text = '') then
   begin
   Application.MessageBox('请选择需要修改的职工！','职工管理提示');
   end else
   begin
   try
     with ZQuery1 do
     begin
       close;
       sql.Clear;
       if CheckBox1.Checked then
        sql.Add('update zg_info set fzgxm = '''+edit5.Text+''' where fzgbh = '''+edit4.Text+'''');
       if CheckBox2.Checked then
        sql.Add('update zg_info set fzgsfz = '''+edit6.Text+''' where fzgbh = '''+edit4.Text+'''');
       if CheckBox4.Checked then
        sql.Add('update zg_info set fzgmobile = '''+edit7.Text+''' where fzgbh = '''+edit4.Text+'''');
       if CheckBox3.Checked then
        sql.Add('update zg_info set fzgsyw = '''+edit8.Text+''' where fzgbh = '''+edit4.Text+'''');
       if CheckBox5.Checked then
        sql.Add('update zg_info set fzghomedh = '''+edit5.Text+''' where fzgbh = '''+edit4.Text+'''');
       if CheckBox6.Checked then
       begin
       sql.Add('select fbmbh from bm_info where fbmmc = '''+combobox2.text+'''');
       open;
       if not eof then
       strBmbh := fields[0].AsString;
       close;
       sql.Clear;
        sql.Add('update zg_info set fssbmbh = '''+strBmbh+''' where fzgbh = '''+edit4.Text+'''');
       end;
       if CheckBox7.Checked then
        sql.Add('update zg_info set fmemo = '''+edit14.Text+''' where fzgbh = '''+edit4.Text+'''');
        ExecSQL;
        edit5.ReadOnly := True;
        edit6.ReadOnly := True;
        edit7.ReadOnly := True;
        edit8.ReadOnly := True;
        edit13.ReadOnly := True;
        edit14.ReadOnly := True;
        combobox2.Enabled:= false;
        checkbox1.Checked := False;
        checkbox2.Checked := False;
        checkbox3.Checked := False;
        checkbox4.Checked := False;
        checkbox5.Checked := False;
        checkbox6.Checked := False;
        checkbox7.Checked := False;
        listbox1.Clear;
        close;
        sql.Clear;
        sql.Add('select fzgxm from zg_info');
        open;
        while not eof  do
        begin
          listbox1.Items.Append(fields[0].AsString);
          next;
        end;
        Application.MessageBox('职工信息修改成功！','职工管理提示');
        end;
     Except
       Application.MessageBox('职工信息修改失败！','职工管理提示');
   end;
     end;
end;

procedure TForm13.Button5Click(Sender: TObject);
begin
  listbox1.Clear;
  with ZQuery1 do
    begin
      close;
      sql.Clear;
      sql.Add('select fzgxm from zg_info where fzgxm like ''%'+edit15.text+'%''');
      open;
      while not eof  do
      begin
        listbox1.Items.Append(fields[0].AsString);
        next;
      end;
  end;
end;

procedure TForm13.Button6Click(Sender: TObject);
begin
  if (edit16.Text <> '') and (edit17.Text <> '')then
  begin
    try
      with ZQuery1 do
      begin
        close;
        sql.Clear;
        sql.Add('insert into bm_info (fbmbh,fbmmc,fmemo) values ('''+edit16.Text+''','''+edit17.Text+''','''+main.strUser+edit18.Text+''')');
        ExecSQL;
        edit16.Text := '';
        edit17.Text := '';
        edit18.Text := '';
        Application.MessageBox('添加部门成功！','职工管理提示');
        //PageControl1.ActivePageIndex:=1;
        close;
        sql.Clear;
        sql.Add('select IFNULL(MAX(cast(fbmbh as UNSIGNED))+1,1)from bm_info');
        open;
        if not eof then
           edit16.Text := fields[0].AsString;
      end;
    Except
      Application.MessageBox('添加部门失败！','职工管理提示');
    end;
  end else
    Application.MessageBox('请将必填项目填写完整！','职工管理提示');
end;

procedure TForm13.Button8Click(Sender: TObject);
var strBMBH : String;
begin
  try
  with ZQuery1 do
  begin
    close;
    sql.Clear;      //select IFNULL(max(cast(fckid as UNSIGNED))+1,1) from ck_info;
    sql.Add('select IFNULL(MAX(cast(fbmbh as UNSIGNED))+1,1)from bm_info');
    open;
    if not eof then
       strBMBH := fields[0].AsString
       else
       strBMBH := '1';
    edit16.Text := strBMBH;
  end;
    Except
        Application.MessageBox('查询失败！','职工管理提示');
    end;
end;

procedure TForm13.Button9Click(Sender: TObject);
begin
  listbox2.Clear;
  with ZQuery1 do
    begin
      close;
      sql.Clear;
      sql.Add('select fbmmc from bm_info where fbmmc like ''%'+edit19.text+'%'' and fisdel=''N''');
      open;
      while not eof  do
      begin
        listbox2.Items.Append(fields[0].AsString);
        next;
      end;
  end;
end;

procedure TForm13.CheckBox1Click(Sender: TObject);
begin
  if edit4.Text <> '' then
    edit5.ReadOnly := not CheckBox1.Checked;
end;

procedure TForm13.CheckBox2Click(Sender: TObject);
begin
  if edit4.Text <> '' then
    edit6.ReadOnly := not CheckBox2.Checked;
end;

procedure TForm13.CheckBox3Click(Sender: TObject);
begin
  if edit4.Text <> '' then
    edit8.ReadOnly := not CheckBox3.Checked;
end;

procedure TForm13.CheckBox4Click(Sender: TObject);
begin
  if edit4.Text <> '' then
    edit7.ReadOnly := not CheckBox4.Checked;
end;

procedure TForm13.CheckBox5Click(Sender: TObject);
begin
  if edit4.Text <> '' then
    edit13.ReadOnly := not CheckBox5.Checked;
end;

procedure TForm13.CheckBox6Click(Sender: TObject);
begin
  if edit4.Text <> '' then
    combobox2.Enabled := CheckBox6.Checked;
end;

procedure TForm13.CheckBox7Click(Sender: TObject);
begin
  if edit4.Text <> '' then
    edit14.ReadOnly := not CheckBox7.Checked;
end;

procedure TForm13.CheckBox8Click(Sender: TObject);
begin
  if edit20.Text <> '' then
  begin
    edit21.ReadOnly := not CheckBox8.Checked;
  end;
end;

procedure TForm13.CheckBox9Click(Sender: TObject);
begin
  if edit20.Text <> '' then
  begin
    edit22.ReadOnly := not CheckBox9.Checked;
  end;
end;

procedure TForm13.ComboBox1DropDown(Sender: TObject);
begin
  combobox1.Items.Clear;
  with ZQuery1 do
  begin
    close;
    sql.Clear;
    sql.Add('select fbmmc from bm_info');
    open;
    while not eof do
    begin
       combobox1.Items.Add(fields[0].asstring);
       next;
    end;
  end;
end;

procedure TForm13.ComboBox2DropDown(Sender: TObject);
begin
  combobox2.Items.Clear;
  with ZQuery1 do
  begin
    close;
    sql.Clear;
    sql.Add('select fbmmc from bm_info');
    open;
    while not eof do
    begin
       combobox2.Items.Add(fields[0].asstring);
       next;
    end;
  end;
end;
procedure TForm13.ListBox1Click(Sender: TObject);
var strZgmc:String;
var strBmbh:string;
begin
  strZgmc := listbox1.Items.Strings[listbox1.itemindex];
  with ZQuery1 do
  begin
    close;
    sql.Clear;
    sql.Add('select fzgbh,fzgxm,fzgsfz,fzgmobile,fzgsyw,fzghomedh,fssbmbh,fmemo from zg_info where fzgxm = '''+strZgmc+'''');
    open;
    if not eof then
    begin
      edit4.Text := fields[0].AsString;
      edit5.Text := fields[1].AsString;
      edit6.Text := fields[2].AsString;
      edit7.Text := fields[3].AsString;
      edit8.Text := fields[4].AsString;
      edit13.Text := fields[5].AsString;
      strBmbh := fields[6].AsString;
      edit14.Text := fields[7].AsString;
      close;
      sql.Clear;
      sql.Add('select fbmmc from bm_info where fbmmc = '''+strBmbh + '''');
      open;
      if not eof then
      combobox2.Text:=fields[0].AsString;
    end;
  end;
end;

procedure TForm13.ListBox2Click(Sender: TObject);
var strBmmc:String;
begin
  strBmmc := listbox2.Items.Strings[listbox2.itemindex];
  with ZQuery1 do
  begin
    close;
    sql.Clear;
    sql.Add('select fbmbh,fbmmc,fmemo from bm_info where fbmmc = '''+strBmmc+'''');
    open;
    if not eof then
    begin
      edit20.Text := fields[0].AsString;
      edit21.Text := fields[1].AsString;
      edit22.Text := fields[2].AsString;
    end;
  end;
end;

procedure TForm13.TabSheet2Show(Sender: TObject);
begin
listbox1.Clear;
with ZQuery1 do
  begin
    close;
    sql.Clear;
    sql.Add('select fzgxm,cast(fzgbh as UNSIGNED) as zgbh from zg_info order by zgbh');
    open;
    while not eof  do
    begin
      listbox1.Items.Append(fields[0].AsString);
      next;
    end;

  end;
end;

procedure TForm13.TabSheet3Show(Sender: TObject);
var y:integer;
begin
  stringgrid1.Cells[0,0]:='编号';
  stringgrid1.Cells[1,0]:='姓名';
  stringgrid1.Cells[2,0]:='身份证';
  stringgrid1.Cells[3,0]:='手机';
  stringgrid1.Cells[4,0]:='虚拟网';
  stringgrid1.Cells[5,0]:='宅电';
  stringgrid1.Cells[6,0]:='部门';
  stringgrid1.Cells[7,0]:='备注';

  y:=1;
  try
  with ZQuery1 do
  begin
    close;
    sql.Clear;
    sql.Add('select cast(fzgbh as UNSIGNED) as zgbh,fzgxm,fzgsfz,fzgmobile,fzgsyw,fzghomedh,fbmmc,fmemo from'+' '+'(select fzgbh,fzgxm,fzgsfz,fzgmobile,fzgsyw,fzghomedh,fssbmbh,fmemo from zg_info) as a left join(select fbmbh,fbmmc from bm_info) as b on a.fssbmbh=b.fbmbh order by zgbh');
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
      stringgrid1.Cells[6,y]:=fields[6].AsString;
      stringgrid1.Cells[7,y]:=fields[7].AsString;
      y:=y+1;
      next;
    end;
  end;
  Except
        Application.MessageBox('查询失败！','合同管理提示');
  end;
end;


procedure TForm13.TabSheet5Show(Sender: TObject);
begin
listbox2.Clear;
with ZQuery1 do
  begin
    close;
    sql.Clear;
    sql.Add('select fbmmc from bm_info');
    open;
    while not eof  do
    begin
      listbox2.Items.Append(fields[0].AsString);
      next;
    end;

  end;
end;
end.
