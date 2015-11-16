unit zgdwgl;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, StdCtrls, ComCtrls, ZAbstractRODataset, ZAbstractDataset,
  ZDataset;

type
  TForm4 = class(TForm)
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
    Edit4: TEdit;
    Label8: TLabel;
    Edit5: TEdit;
    Label9: TLabel;
    Edit6: TEdit;
    Label10: TLabel;
    Edit7: TEdit;
    Label11: TLabel;
    Edit8: TEdit;
    Edit9: TEdit;
    Label12: TLabel;
    Button5: TButton;
    ZQuery1: TZQuery;
    procedure FormShow(Sender: TObject);
    procedure TabSheet2Show(Sender: TObject);
    procedure ListBox1Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure CheckBox2Click(Sender: TObject);
    procedure CheckBox4Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form4: TForm4;

implementation
uses Main;

{$R *.dfm}

procedure TForm4.Button1Click(Sender: TObject);
begin
  if (edit3.Text <> '') and (edit2.Text <> '') then
  begin
    try
      with ZQuery1 do
      begin
        close;
        sql.Clear;
        sql.Add('insert into zgdw_info (fzgdwid,fzgdwmc,fzgdwaddr,fmemo) values ('''+edit1.Text+''','''+edit3.Text+''','''+edit2.Text+''','''+main.strUser+edit4.Text+''')');
        ExecSQL;
        Application.MessageBox('新增记录成功！','提示');
        edit2.Text := '';
        edit3.Text := '';
        edit4.Text := '';
      close;
      sql.Clear;
      sql.Add('select top 1 fzgdwid+1 from zgdw_info order by CONVERT(int,fzgdwid) desc');
      open;
      if not eof then
        edit1.Text := fields[0].AsString;
      end;
      Except
      Application.MessageBox('新增记录失败！','提示');
    end;
   end else
    Application.MessageBox('请将必填项目填写完整！','提示');
end;

procedure TForm4.Button2Click(Sender: TObject);
begin
form4.Close;
end;

procedure TForm4.Button3Click(Sender: TObject);
begin
  if (edit5.Text = '') then
   begin
   Application.MessageBox('请选择需要修改的单位！','提示');
   end else
   begin
   try
     with ZQuery1 do
     begin
       close;
       sql.Clear;
       if CheckBox1.Checked then
        sql.Add('update zgdw_info set fzgdwmc = '''+edit6.Text+''' where fzgdwid = '''+edit5.Text+'''');
       if CheckBox2.Checked then
        sql.Add('update zgdw_info set fzgdwaddr = '''+edit7.Text+''' where fzgdwid = '''+edit5.Text+'''');
       if CheckBox4.Checked then
        sql.Add('update zgdw_info set fmemo = '''+edit8.Text+''' where fzgdwid = '''+edit5.Text+'''');
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
        sql.Add('select fzgdwmc from zgdw_info');
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

procedure TForm4.Button4Click(Sender: TObject);
begin
form4.Close;
end;

procedure TForm4.Button5Click(Sender: TObject);
begin
listbox1.Clear;
with ZQuery1 do
  begin
    close;
    sql.Clear;
    sql.Add('select fzgdwmc from zgdw_info where fzgdwmc like ''%'+edit9.text+'%''');
    open;
    while not eof  do
    begin
      listbox1.Items.Append(fields[0].AsString);
      next;
    end;

  end;

end;

procedure TForm4.CheckBox1Click(Sender: TObject);
begin
  if edit5.Text <> '' then
  begin
    edit6.ReadOnly := not CheckBox1.Checked;
  end;
end;

procedure TForm4.CheckBox2Click(Sender: TObject);
begin
  if edit5.Text <> '' then
  begin
    edit7.ReadOnly := not CheckBox2.Checked;
  end;
end;

procedure TForm4.CheckBox4Click(Sender: TObject);
begin
  if edit5.Text <> '' then
  begin
    edit8.ReadOnly := not CheckBox4.Checked;
  end;
end;

procedure TForm4.FormShow(Sender: TObject);
var strZgdwBH : String;
begin
  with ZQuery1 do
  begin
    close;
    sql.Clear;
    sql.Add('select max(cast(fzgdwid as unsigned))+1 from zgdw_info');
    open;
    if not eof then
       strZgdwBH := fields[0].AsString;
    edit1.Text := strZgdwBH;
  end;
end;

procedure TForm4.ListBox1Click(Sender: TObject);
var strZgdwMC:String;
begin
  strZgdwMC := listbox1.Items.Strings[listbox1.itemindex];
  with ZQuery1 do
  begin
    close;
    sql.Clear;
    sql.Add('select fzgdwid,fzgdwmc,fzgdwaddr,fmemo from zgdw_info where fzgdwmc = '''+strZgdwMC+'''');
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

procedure TForm4.TabSheet2Show(Sender: TObject);
begin
listbox1.Clear;
with ZQuery1 do
  begin
    close;
    sql.Clear;
    sql.Add('select fzgdwmc from zgdw_info');
    open;
    while not eof  do
    begin
      listbox1.Items.Append(fields[0].AsString);
      next;
    end;

  end;
end;

end.

