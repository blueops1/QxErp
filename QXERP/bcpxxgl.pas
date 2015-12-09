unit bcpxxgl;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, Grids, StdCtrls, ComCtrls, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, ZStoredProcedure;

type
  TForm11 = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label13: TLabel;
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
    Button7: TButton;
    Button8: TButton;
    Edit4: TEdit;
    Edit5: TEdit;
    Edit6: TEdit;
    TabSheet4: TTabSheet;
    Label10: TLabel;
    Edit8: TEdit;
    Label11: TLabel;
    Edit11: TEdit;
    Label15: TLabel;
    Edit12: TEdit;
    Button3: TButton;
    Button4: TButton;
    Button10: TButton;
    Label16: TLabel;
    Label17: TLabel;
    ZStoredProc1: TZStoredProc;
    ComboBox1: TComboBox;
    Label18: TLabel;
    ComboBox3: TComboBox;
    Label6: TLabel;
    ComboBox4: TComboBox;
    Label7: TLabel;
    Memo1: TMemo;
    Label12: TLabel;
    ComboBox5: TComboBox;
    Label19: TLabel;
    ComboBox6: TComboBox;
    Label20: TLabel;
    ComboBox7: TComboBox;
    Label21: TLabel;
    ComboBox8: TComboBox;
    procedure Button10Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure ListBox1Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure ComboBox2DropDown(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure TabSheet2Show(Sender: TObject);
    procedure ComboBox1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ComboBox3KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Edit1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure TabSheet1Show(Sender: TObject);
    procedure TabSheet4Show(Sender: TObject);
    procedure ComboBox4DropDown(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form11: TForm11;
  function SplitString(Source, Deli: string ): String;stdcall;external 'dlltools.dll';

implementation

uses main;

{$R *.dfm}

procedure TForm11.Button10Click(Sender: TObject);
begin                  //proc_cx_bcplxb_newbcplxbh
  try
    with zStoredProc1 do
    begin
      close;
      StoredProcName:='proc_cx_bcplxb_newbcplxbh';
      open;
      if not eof then
        edit8.Text := fields[0].AsString
      else
        edit8.Text := '1';
    end;
  Except
    Application.MessageBox('查询失败！','半成品管理提示');
  end;
end;

procedure TForm11.Button1Click(Sender: TObject);
begin
  if (edit1.Text <> '') and (edit2.Text <> '') and (combobox1.Text  <> '') and (combobox2.Text <> '') and (combobox4.Text <> '')  then
  begin
    try
      with zStoredProc1 do   //proc_insert_bcplxk_bcpkcb   bcpbh,bcpmc,bcplxbh,sscpbh,sscpbh1,memo,czry
      begin
        close;
        StoredProcName:='proc_insert_bcplxk_bcpkcb';
        ParamByName('bcpbh').Value:=edit1.Text;
        ParamByName('bcpmc').Value:=edit2.Text;
        ParamByName('bcplxbh').Value:=SplitString(combobox2.Text,'|');
        ParamByName('cpzl').Value:=combobox4.Text;
        ParamByName('sscpbh').Value:=SplitString(combobox1.Text,'|');
        if combobox3.Text='' then
        ParamByName('sscpbh1').Value:=''
        else
        ParamByName('sscpbh1').Value:=SplitString(combobox3.Text,'|');
        if combobox5.Text='' then
        ParamByName('sscpbh2').Value:=''
        else
        ParamByName('sscpbh2').Value:=SplitString(combobox5.Text,'|');
        if combobox6.Text='' then
        ParamByName('sscpbh3').Value:=''
        else
        ParamByName('sscpbh3').Value:=SplitString(combobox6.Text,'|');
        if combobox7.Text='' then
        ParamByName('sscpbh4').Value:=''
        else
        ParamByName('sscpbh4').Value:=SplitString(combobox7.Text,'|');
        if combobox8.Text='' then
        ParamByName('sscpbh5').Value:=''
        else
        ParamByName('sscpbh5').Value:=SplitString(combobox8.Text,'|');

        ParamByName('memo').Value:=edit10.Text;
        ParamByName('czry').Value:=main.strUser;
        ExecProc;
        edit1.Text := '';
        edit2.Text := '';
        edit10.Text := '';
        combobox1.Text := '';
        combobox2.Text := '';
        combobox3.Text := '';
        combobox4.Text := '';
        combobox5.Text := '';
        combobox6.Text := '';
        combobox7.Text := '';
        combobox8.Text := '';
        Application.MessageBox('新增半成品信息成功！','半成品管理提示');
        close;
        StoredProcName:='proc_cx_newbcplxbh';
        open;
        if fields[0].AsString<>'' then
          edit1.Text:=fields[0].AsString
        else
          edit1.Text:='1';
      end;
      edit2.SetFocus;
    Except
      Application.MessageBox('新增半成品信息失败！','半成品管理提示');
    end;
  end else
    Application.MessageBox('请将必填项目填写完整！','半成品管理提示');
end;


procedure TForm11.Button3Click(Sender: TObject);
begin
  if (edit8.Text<>'') and (edit11.Text <> '')then     //proc_insert_bcplxb bcplxbh,bcplxmc,memo
  begin
    try
      with zStoredProc1 do
      begin
        close;
        StoredProcName:='proc_insert_bcplxb';
        ParamByName('bcplxbh').Value:=edit8.Text;
        ParamByName('bcplxmc').Value:=edit11.Text;
        ParamByName('memo').Value:=edit12.Text;
        ExecProc;
        Application.MessageBox('新增记录成功！','半成品信息管理提示');
        edit11.Text := '';
        edit12.Text := '';
        close;
        StoredProcName:='proc_cx_bcplxb_newbcplxbh';
        open;
        if not eof then
          edit8.Text := fields[0].AsString
        else
          edit8.Text := '1';
        edit11.SetFocus;
      end;
    Except
      Application.MessageBox('新增记录失败！','半成品信息管理提示');
    end;
   end else
    Application.MessageBox('请将必填项目填写完整！','半成品信息管理提示');

end;

procedure TForm11.Button5Click(Sender: TObject);
begin                   //proc_cx_bcplxb_fbcplxbhmc_by_bcplxmc
  listbox1.Clear;
  with zStoredProc1 do
    begin
      close;
      StoredProcName:='proc_cx_bcplxb_fbcplxbhmc_by_bcplxmc';
      ParamByName('bcplxmc').Value:=edit3.Text;
      open;
      while not eof  do
      begin
        listbox1.Items.Append(fields[0].AsString);
        next;
      end;
  end;
end;

procedure TForm11.Button7Click(Sender: TObject);
begin
 if (edit4.Text <> '') and (edit5.Text <> '') then   //proc_update_bcplxb IN `bcplxbh` char(10),IN `bcplxmc` varchar(20),IN `memo` text
 begin
   try
     with zStoredProc1 do
     begin
       close;
       StoredProcName:='proc_update_bcplxb';
       ParamByName('bcplxbh').Value:=edit4.Text;
       ParamByName('bcplxmc').Value:=edit4.Text;
       ParamByName('memo').Value:=edit4.Text;
       ExecProc;
       listbox1.Clear;
       close;
       StoredProcName:='proc_cx_bcplxb_fbcplxbhmc_by_bcplxmc';
       ParamByName('bcplxmc').Value:=edit3.Text;
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
  end else
    Application.MessageBox('请选择需要修改的记录并将信息填写完整！','提示');
end;

procedure TForm11.ComboBox1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if key=13 then
 begin
    if combobox1.Items.Count>0 then
    ComboBox1.Items.Clear;
    //combobox1.Items.Add('*|全部供应商');
    try
      with zstoredproc1 do
      begin
        close;
        StoredProcName:='proc_cx_cmlxk_cpbhandmcandzl_by_cpmc';
        ParamByName('cpmc').Value:=ComboBox1.Text;
        open;
        while not eof do
        begin
          ComboBox1.Items.Add(fields[0].asstring);
          next;
        end;
        //combobox1.DroppedDown:=true;
      end;
  except
    application.MessageBox('数据查询失败！','成品出库提示');
  end;
 end;
end;

procedure TForm11.ComboBox2DropDown(Sender: TObject);
begin
  combobox2.Items.Clear;
  with zStoredProc1 do
  begin
    close;
    StoredProcName:='proc_cx_bcplxb_bcplxmc';
    open;
    while not eof do
    begin
       combobox2.Items.Add(fields[0].asstring);
       next;
    end;
  end;
end;

procedure TForm11.ComboBox3KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if key=13 then
 begin
    if combobox3.Items.Count>0 then
    ComboBox3.Items.Clear;
    //combobox1.Items.Add('*|全部供应商');
    try
      with zstoredproc1 do
      begin
        close;
        StoredProcName:='proc_cx_cmlxk_cpbhandmcandzl_by_cpmc';
        ParamByName('cpmc').Value:=ComboBox3.Text;
        open;
        while not eof do
        begin
          ComboBox3.Items.Add(fields[0].asstring);
          next;
        end;
        //combobox1.DroppedDown:=true;
      end;
  except
    application.MessageBox('数据查询失败！','成品出库提示');
  end;
 end;
end;

procedure TForm11.ComboBox4DropDown(Sender: TObject);
begin
 begin
    if combobox4.Items.Count>0 then
    ComboBox4.Items.Clear;
    //combobox1.Items.Add('*|全部供应商');
    try
      with zstoredproc1 do
      begin
        close;
        StoredProcName:='proc_cx_cplxk_cpzl';
        open;
        while not eof do
        begin
          ComboBox4.Items.Add(fields[0].asstring);
          next;
        end;
        //combobox1.DroppedDown:=true;
      end;
  except
    application.MessageBox('数据查询失败！','成品出库提示');
  end;
 end;
end;

procedure TForm11.Edit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin      //proc_cx_newbcplxbh
  if key=13 then
  try
  with  zStoredProc1 do
  begin
    close;
    StoredProcName:='proc_cx_newbcplxbh';
    open;
    if fields[0].AsString<>'' then
      edit1.Text:=fields[0].AsString
    else
      edit1.Text:='1';
  end;
  except
    application.MessageBox('数据查询失败！','新增合同提示');
  end;
end;

procedure TForm11.ListBox1Click(Sender: TObject);
var strBcplxmc:String;
begin
  if listbox1.ItemIndex>=0 then
  begin
    strBcplxmc := listbox1.Items.Strings[listbox1.itemindex];
    try
      with zStoredProc1 do
      begin
        close;
        StoredProcName:='proc_cx_bcplxb_info_by_bcplxbh';
        ParamByName('bcplxbh').Value:=SplitString(strBcplxmc,'|');
        open;
        if not eof then
        begin
          edit4.Text := fields[0].AsString;
          edit5.Text := fields[1].AsString;
          edit6.Text := fields[2].AsString;
        end;
      end;
    except
      application.MessageBox('数据查询失败！','半成品信息管理提示');
    end;
  end;
end;

procedure TForm11.TabSheet1Show(Sender: TObject);
begin
  try
    with  zStoredProc1 do
    begin
      close;
      StoredProcName:='proc_cx_newbcplxbh';
      open;
      if fields[0].AsString<>'' then
        edit1.Text:=fields[0].AsString
      else
        edit1.Text:='1';
    end;
    edit2.SetFocus;
  except
    application.MessageBox('数据查询失败！','新增合同提示');
  end;
end;

procedure TForm11.TabSheet2Show(Sender: TObject);
begin
  listbox1.Clear;
  with zStoredProc1 do
    begin
      close;
      StoredProcName:='proc_cx_bcplxb_fbcplxbhmc_by_bcplxmc';
      ParamByName('bcplxmc').Value:=edit3.Text;
      open;
      while not eof  do
      begin
        listbox1.Items.Append(fields[0].AsString);
        next;
      end;
  end;
end;

procedure TForm11.TabSheet4Show(Sender: TObject);
begin
  try
    with zStoredProc1 do
    begin
      close;
      StoredProcName:='proc_cx_bcplxb_newbcplxbh';
      open;
      if not eof then
        edit8.Text := fields[0].AsString
      else
        edit8.Text := '1';
    end;
  Except
    Application.MessageBox('查询失败！','半成品管理提示');
  end;
end;

end.
