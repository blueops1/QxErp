unit xsygl;



interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, DB, ADODB, Mask, DBCtrls, Grids, DBGrids,
  ZAbstractRODataset, ZAbstractDataset, ZDataset;

type
  TForm2 = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Button1: TButton;
    Button2: TButton;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    ListBox1: TListBox;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Edit5: TEdit;
    Edit6: TEdit;
    Label13: TLabel;
    Edit7: TEdit;
    Label14: TLabel;
    Edit8: TEdit;
    Label15: TLabel;
    Button3: TButton;
    Button4: TButton;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox4: TCheckBox;
    ZQuery1: TZQuery;
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure TabSheet2Show(Sender: TObject);
    procedure ListBox1Click(Sender: TObject);
    procedure CheckBox4Click(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure CheckBox2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

uses Main;

{$R *.dfm}

procedure TForm2.Button1Click(Sender: TObject);
begin
  if (edit2.Text <> '') and (edit3.Text <> '') then
  begin
    try
      with ZQuery1 do
      begin
        close;
        sql.Clear;
        sql.Add('insert into xsy_info (fxsyid,fxsyxm,fxsydh,fxsyemail) values ('''+edit1.Text+''','''+edit2.Text+''','''+edit4.Text+''')');
        ExecSQL;
        edit1.Text := '';
        edit2.Text := '';
        edit3.Text := '';
        edit4.Text := '';
        Application.MessageBox('新增销售员成功！','销售员管理提示');
        close;
        sql.Clear;
        sql.Add('select top 1 fxsyid+1 from xsy_info order by CONVERT(int,fxsyid) desc');
        open;
        if not eof then
           edit1.Text := fields[0].AsString;
      end;
    Except
      Application.MessageBox('新增销售员失败！','销售员管理提示');
    end;
  end else
    Application.MessageBox('请将必填项目填写完整！','销售员管理提示');
end;



procedure TForm2.Button3Click(Sender: TObject);
begin
  if (edit5.Text = '') then
   begin
   Application.MessageBox('请选择需要修改的人员！','提示');
   end else
   begin
   try
     with ZQuery1 do
     begin
       close;
       sql.Clear;
       if CheckBox4.Checked then
        sql.Add('update xsy_info set fxsyxm = '''+edit6.Text+''' where fxsyid = '''+edit5.Text+'''');
       if CheckBox1.Checked then
        sql.Add('update xsy_info set fxsydh = '''+edit7.Text+''' where fxsyid = '''+edit5.Text+'''');
       if CheckBox2.Checked then
        sql.Add('update xsy_info set fxsyemail = '''+edit8.Text+''' where fxsyid = '''+edit5.Text+'''');
        ExecSQL;
        edit6.ReadOnly := True;
        edit7.ReadOnly := True;
        edit8.ReadOnly := True;
        checkbox1.Checked := False;
        checkbox2.Checked := False;
        checkbox4.Checked := False;
        listbox1.Clear;
        close;
        sql.Clear;
        sql.Add('select fxsyxm from xsy_info');
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

procedure TForm2.CheckBox1Click(Sender: TObject);
begin
  if edit5.Text <> '' then
  begin
    edit7.ReadOnly := not CheckBox1.Checked;
  end;
end;

procedure TForm2.CheckBox2Click(Sender: TObject);
begin
  if edit5.Text <> '' then
  begin
    edit8.ReadOnly := not CheckBox2.Checked;
  end;
end;

procedure TForm2.CheckBox4Click(Sender: TObject);
begin
    if edit5.Text <> '' then
    begin
      edit6.ReadOnly := not CheckBox4.Checked;
     end;
end;

procedure TForm2.FormShow(Sender: TObject);
var strXsyBH : String;
begin
  with ZQuery1 do
  begin
    close;
    sql.Clear;
    sql.Add('select max(cast(fxsyid as unsigned))+1 from xsy_info');
    open;
    if not eof then
       strXsyBH := fields[0].AsString;
    edit1.Text := strXsyBH;
  end;
end;

procedure TForm2.ListBox1Click(Sender: TObject);
var strXsyName:String;
begin
  strXsyName := listbox1.Items.Strings[listbox1.itemindex];
  with ZQuery1 do
  begin
    close;
    sql.Clear;
    sql.Add('select fxsyid,fxsyxm,fxsydh,fxsyemail from xsy_info where fxsyxm = '''+strXsyName+'''');
    open;
    if not eof then
    begin
      edit5.Text := fields[0].AsString;
      edit6.Text := fields[1].AsString;
      edit7.Text := fields[2].AsString;
      edit8.Text := fields[3].AsString;
    end;
  end;
end;

procedure TForm2.TabSheet2Show(Sender: TObject);
begin
listbox1.Clear;
with ZQuery1 do
  begin
    close;
    sql.Clear;
    sql.Add('select fxsyxm from xsy_info');
    open;
    while not eof  do
    begin
      listbox1.Items.Append(fields[0].AsString);
      next;
    end;

  end;
end;

end.
