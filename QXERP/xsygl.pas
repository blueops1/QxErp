unit xsygl;



interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, DB, ADODB, Mask, DBCtrls, Grids, DBGrids,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, ZStoredProcedure;

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
    ZStoredProc1: TZStoredProc;
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
  function SplitString(Source, Deli: string ): String;stdcall;external 'dlltools.dll';

implementation

uses Main;

{$R *.dfm}

procedure TForm2.Button1Click(Sender: TObject);
begin
  if (edit2.Text <> '') and (edit3.Text <> '') then
  begin
    try
      with zStoredProc1 do
      begin
        close;
        StoredProcName:='proc_insert_xsyinfo'; //xsybh,xsyxm,xsydh,xsyemail
        ParamByName('xsybh').value:=edit1.Text;
        ParamByName('xsyxm').value:=edit2.Text;
        ParamByName('xsydh').value:=edit3.Text;
        ParamByName('xsyemail').value:=edit4.Text;
        ExecProc;
        edit1.Text := '';
        edit2.Text := '';
        edit3.Text := '';
        edit4.Text := '';
        close;
        StoredProcName:='proc_cx_newxsyid';
        open;
        if not eof then
           edit1.Text := fields[0].AsString;
        edit2.setfocus;
        Application.MessageBox('新增销售员成功！','销售员管理提示');
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
     with zStoredProc1 do
     begin
       close;
       StoredProcName:='proc_update_xsyinfo';
       ParamByName('xsybh').value:=edit5.Text;
       ParamByName('xsyxm').value:=edit6.Text;
       ParamByName('xsydh').value:=edit7.Text;
       ParamByName('xsyemail').value:=edit8.Text;
       ExecProc;
       edit6.ReadOnly := True;
       edit7.ReadOnly := True;
       edit8.ReadOnly := True;
       checkbox1.Checked := False;
       checkbox2.Checked := False;
       checkbox4.Checked := False;
       listbox1.Clear;
       close;
       StoredProcName:='proc_cx_xsyinfo_of_xsyxm';
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
begin
  try
    with zStoredProc1 do
    begin
      close;
      StoredProcName:='proc_cx_newxsyid';
      open;
      if not eof then
         edit1.Text := fields[0].AsString;
    end;
  except
    Application.MessageBox('数据查询失败！','销售员管理提示');
  end;
end;

procedure TForm2.ListBox1Click(Sender: TObject);
begin
  try
    with zStoredProc1 do
    begin
      close;
      StoredProcName:='proc_cx_xsyinfo_of_xsyxm';
      ParamByName('xsybh').Value:=SplitString(listbox1.Items.Strings[listbox1.itemindex],'|');
      open;
      if not eof then
      begin
        edit5.Text := fields[0].AsString;
        edit6.Text := fields[1].AsString;
        edit7.Text := fields[2].AsString;
        edit8.Text := fields[3].AsString;
      end;
    end;
  except
    Application.MessageBox('数据查询失败！','销售员管理提示');
  end;
end;

procedure TForm2.TabSheet2Show(Sender: TObject);      //proc_cx_xsyinfo_all_xsyxm
begin
  listbox1.Clear;
  try
    with zStoredProc1 do
      begin
        close;
        StoredProcName:='proc_cx_xsyinfo_all_xsyxm ';
        open;
        while not eof  do
        begin
          listbox1.Items.Append(fields[0].AsString);
          next;
        end;
    end;
  except
    Application.MessageBox('数据查询失败！','销售员管理提示');
  end;
end;

end.
