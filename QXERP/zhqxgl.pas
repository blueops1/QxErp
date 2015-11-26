unit zhqxgl;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, Grids, StdCtrls, ComCtrls,StrUtils, ZAbstractRODataset,
  ZAbstractDataset, ZDataset;

type
  TForm14 = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Label2: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label17: TLabel;
    Edit2: TEdit;
    Button1: TButton;
    Button2: TButton;
    Edit9: TEdit;
    TabSheet2: TTabSheet;
    Label22: TLabel;
    ListBox1: TListBox;
    Button3: TButton;
    Button4: TButton;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox4: TCheckBox;
    CheckBox3: TCheckBox;
    CheckBox5: TCheckBox;
    CheckBox6: TCheckBox;
    CheckBox7: TCheckBox;
    Edit15: TEdit;
    Button5: TButton;
    CheckBox10: TCheckBox;
    CheckBox11: TCheckBox;
    CheckBox12: TCheckBox;
    CheckBox13: TCheckBox;
    CheckBox14: TCheckBox;
    CheckBox15: TCheckBox;
    CheckBox16: TCheckBox;
    CheckBox17: TCheckBox;
    CheckBox18: TCheckBox;
    CheckBox19: TCheckBox;
    CheckBox20: TCheckBox;
    CheckBox21: TCheckBox;
    CheckBox22: TCheckBox;
    Edit1: TEdit;
    Label1: TLabel;
    Label3: TLabel;
    Edit3: TEdit;
    CheckBox8: TCheckBox;
    ZQuery1: TZQuery;
    procedure Button1Click(Sender: TObject);
    procedure TabSheet2Show(Sender: TObject);
    procedure ListBox1Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure CheckBox8Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form14: TForm14;

implementation
uses main;

{$R *.dfm}

procedure TForm14.Button1Click(Sender: TObject);
begin
  if (edit2.Text <> '') and (edit9.Text <> '')then
  begin
    try
      with ZQuery1 do
      begin
        close;
        sql.Clear;
        sql.Add('insert into user_info (fuser,fpwd) values ('''+edit2.Text+''','''+edit9.Text+''')');
        ExecSQL;
        edit2.Text := '';
        Application.MessageBox('新增帐户成功！','帐户管理提示');
        //PageControl1.ActivePageIndex:=1;
      end;
    Except
      Application.MessageBox('新增帐户失败！','帐户管理提示');
    end;
  end else
    Application.MessageBox('请将必填项目填写完整！','帐户管理提示');
end;

procedure TForm14.Button3Click(Sender: TObject);
var strQx:String;
begin
  if checkbox4.Checked = True then    //发货管理 4 1
    strQx := '1'
  else
    strQx := '0';
  if checkbox10.Checked = True then    //销售员管理 10 2
    strQx := strQx + '1'
  else
    strQx := strQx + '0';
  if checkbox16.Checked = True then     //成品管理 16 3
    strQx := strQx + '1'
  else
    strQx := strQx + '0';
  if checkbox13.Checked = True then     //主管单位管理 13 4
    strQx := strQx + '1'
  else
    strQx := strQx + '0';
  if checkbox5.Checked = True then      //合同方管理 5 5
    strQx := strQx + '1'
  else
    strQx := strQx + '0';
  if checkbox18.Checked = True then      //合同管理 18 6
    strQx := strQx + '1'
  else
    strQx := strQx + '0';
  if checkbox19.Checked = True then       //应收款查询 19 7
    strQx := strQx + '1'
  else
    strQx := strQx + '0';
  if checkbox2.Checked = True then       //产品信息管理 2 8
    strQx := strQx + '1'
  else
    strQx := strQx + '0';
  if checkbox14.Checked = True then       //仓库管理 14 9
    strQx := strQx + '1'
  else
    strQx := strQx + '0';
  if checkbox6.Checked = True then       //应收款记帐 6 10
    strQx := strQx + '1'
  else
    strQx := strQx + '0';
  if checkbox15.Checked = True then       //半成品信息管理 15 11
    strQx := strQx + '1'
  else
    strQx := strQx + '0';
  if checkbox1.Checked = True then       //半成品管理 1 12
    strQx := strQx + '1'
  else
    strQx := strQx + '0';
  if checkbox7.Checked = True then       //职工信息管理 7 13
    strQx := strQx + '1'
  else
    strQx := strQx + '0';
  if checkbox20.Checked = True then    //暂无1 20 14
    strQx := strQx + '1'
  else
    strQx := strQx + '0';
  if checkbox12.Checked = True then    //暂无4 12 15
    strQx := strQx + '1'
  else
    strQx := strQx + '0';
  if checkbox21.Checked = True then    //暂无5 21 16
    strQx := strQx + '1'
  else
    strQx := strQx + '0';
  if checkbox3.Checked = True then    //暂无6 3 17
    strQx := strQx + '1'
  else
    strQx := strQx + '0';
  if checkbox17.Checked = True then    //暂无7 17 18
    strQx := strQx + '1'
  else
    strQx := strQx + '0';
  if checkbox11.Checked = True then    //暂无8 11 19
    strQx := strQx + '1'
  else
    strQx := strQx + '0';
  if checkbox22.Checked = True then    //帐户权限管理 22 20
    strQx := strQx + '1'
  else
    strQx := strQx + '0';
  if edit1.Text <> '' then
  begin
    try
      with ZQuery1 do
      begin
        close;
        if checkbox8.Checked then
        begin
          sql.Clear;
          sql.Add('update user_info set fpwd = '''+edit3.Text+''' where fuser = '''+edit1.text+'''');
          ExecSql;
        end;
        sql.Clear;
        sql.Add('update user_info set fqx = '''+strQx+''' where fuser = '''+edit1.text+'''');
        ExecSQL;
        checkbox1.Checked:=false;
        checkbox2.Checked:=false;
        checkbox3.Checked:=false;
        checkbox4.Checked:=false;
        checkbox5.Checked:=false;
        checkbox6.Checked:=false;
        checkbox7.Checked:=false;
        checkbox22.Checked:=false;
        checkbox21.Checked:=false;
        checkbox10.Checked:=false;
        checkbox11.Checked:=false;
        checkbox12.Checked:=false;
        checkbox13.Checked:=false;
        checkbox14.Checked:=false;
        checkbox15.Checked:=false;
        checkbox16.Checked:=false;
        checkbox17.Checked:=false;
        checkbox18.Checked:=false;
        checkbox19.Checked:=false;
        checkbox20.Checked:=false;
        edit1.Text := '';
        edit3.Text := '';
        checkbox8.Checked := false;
        edit3.ReadOnly := true;
        Application.MessageBox('修改权限成功！','帐户权限管理提示');
      end;
    Except
    Application.MessageBox('修改权限失败！','帐户权限管理提示');
    end;
  end;
end;

procedure TForm14.Button5Click(Sender: TObject);
begin
  listbox1.Clear;
  with ZQuery1 do
    begin
      close;
      sql.Clear;
      sql.Add('select fUser from user_info where fuser like ''%'+edit15.text+'%''');
      open;
      while not eof  do
      begin
        listbox1.Items.Append(fields[0].AsString);
        next;
      end;
  end;
end;

procedure TForm14.CheckBox8Click(Sender: TObject);
begin
if edit1.Text<>'' then
  edit3.ReadOnly := not checkbox8.Checked;
end;

procedure TForm14.ListBox1Click(Sender: TObject);
var strUser:String;
var strQx:String;
begin
  strUser := listbox1.Items.Strings[listbox1.itemindex];
  edit1.Text := strUser;
  with ZQuery1 do
  begin
    close;
    sql.Clear;
    sql.Add('select fqx,fpwd from user_info where fuser = '''+strUser+'''');
    open;
    if not eof then
    begin
      strQx := fields[0].AsString;
      edit3.Text := fields[1].AsString;
    end;
    if MidStr(strQx,2,1)='0' then
      checkbox10.Checked := false
    else
      checkbox10.Checked :=true;      //销售员管理 10 2

    if MidStr(strQx,4,1)='0' then
      checkbox13.Checked := false
    else
      checkbox13.Checked :=true;     //主管单位管理 13 4
    if MidStr(strQx,5,1)='0' then
      checkbox5.Checked := false
    else
      checkbox5.Checked :=true;    //合同方管理 5 5
    if MidStr(strQx,6,1)='0' then
      checkbox18.Checked := false
    else
      checkbox18.Checked :=true;      //合同管理 18 6
    if MidStr(strQx,12,1)='0' then
      checkbox1.Checked := false
    else
      checkbox1.Checked :=true;      //半成品管理 1 12
    if MidStr(strQx,9,1)='0' then
      checkbox14.Checked := false
    else
      checkbox14.Checked :=true;      //仓库管理 14 9
    if MidStr(strQx,10,1)='0' then
      checkbox6.Checked := false
    else
      checkbox6.Checked :=true;      //应收款记帐 6 10
    if MidStr(strQx,7,1)='0' then
      checkbox19.Checked := false
    else
      checkbox19.Checked :=true;      //应收款查询 19 7
    if MidStr(strQx,8,1)='0' then
      checkbox2.Checked := false
    else
      checkbox2.Checked :=true;      //产品信息管理 2 8
    if MidStr(strQx,11,1)='0' then
      checkbox15.Checked := false
    else
      checkbox15.Checked :=true;      //半成品信息管理 15 11
    if MidStr(strQx,13,1)='0' then
      checkbox7.Checked := false
    else
      checkbox7.Checked :=true;      //职工信息管理 7 13
    if MidStr(strQx,14,1)='0' then
      checkbox20.Checked := false
    else
      checkbox20.Checked :=true;      //暂无1 20 14
    if MidStr(strQx,1,1)='0' then
      checkbox4.Checked := false
    else
      checkbox4.Checked :=true;      //暂无2 4 1
    if MidStr(strQx,3,1)='0' then
      checkbox16.Checked := false
    else
      checkbox16.Checked :=true;      //暂无3 16 3
    if MidStr(strQx,15,1)='0' then
      checkbox12.Checked := false
    else
      checkbox12.Checked :=true;      //暂无4 12 15
    if MidStr(strQx,16,1)='0' then
      checkbox21.Checked := false
    else
      checkbox21.Checked :=true;      //暂无5 21 16
    if MidStr(strQx,17,1)='0' then
      checkbox3.Checked := false
    else
      checkbox3.Checked :=true;      //暂无6 3 17
    if MidStr(strQx,18,1)='0' then
      checkbox17.Checked := false
    else
      checkbox17.Checked :=true;      //暂无7 17 18
    if MidStr(strQx,19,1)='0' then
      checkbox11.Checked := false
    else
      checkbox11.Checked :=true;      //暂无8 11 19
    if MidStr(strQx,20,1)='0' then
      checkbox22.Checked := false
    else
      checkbox22.Checked :=true;      //帐户权限管理 22 20
  end;
end;

procedure TForm14.TabSheet2Show(Sender: TObject);
begin
listbox1.Clear;
with ZQuery1 do
  begin
    close;
    sql.Clear;
    sql.Add('select fuser from user_info');
    open;
    while not eof  do
    begin
      listbox1.Items.Append(fields[0].AsString);
      next;
    end;

  end;
end;

end.
