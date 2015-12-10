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
    TabSheet3: TTabSheet;
    Label22: TLabel;
    Edit7: TEdit;
    Label23: TLabel;
    Edit9: TEdit;
    Label24: TLabel;
    ComboBox9: TComboBox;
    Label25: TLabel;
    ComboBox10: TComboBox;
    Label26: TLabel;
    ComboBox11: TComboBox;
    Label27: TLabel;
    ComboBox12: TComboBox;
    Label28: TLabel;
    ComboBox13: TComboBox;
    Label29: TLabel;
    ComboBox14: TComboBox;
    ComboBox15: TComboBox;
    Label30: TLabel;
    ComboBox16: TComboBox;
    Label31: TLabel;
    Label32: TLabel;
    Edit13: TEdit;
    Button6: TButton;
    Button9: TButton;
    ListBox2: TListBox;
    Edit14: TEdit;
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
    procedure Edit7KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure ListBox2Click(Sender: TObject);
    procedure ComboBox5KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ComboBox6KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ComboBox7KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ComboBox8KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ComboBox9DropDown(Sender: TObject);
    procedure ComboBox10DropDown(Sender: TObject);
    procedure ComboBox11KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ComboBox12KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ComboBox13KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ComboBox14KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ComboBox16KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ComboBox15KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Button9Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
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

procedure TForm11.Button6Click(Sender: TObject);
begin
  if (edit14.Text <> '') and (edit9.Text <> '') and (combobox9.Text  <> '') and (combobox10.Text <> '') and (combobox11.Text <> '')  then
  begin
    try
      with zStoredProc1 do   //proc_insert_bcplxk_bcpkcb   bcpbh,bcpmc,bcplxbh,sscpbh,sscpbh1,memo,czry
      begin
        close;
        StoredProcName:='proc_update_bcplxk';
        ParamByName('bcpbh').Value:=edit14.Text;
        ParamByName('bcpmc').Value:=edit9.Text;
        ParamByName('bcplxbh').Value:=SplitString(combobox9.Text,'|');
        ParamByName('cpzl').Value:=combobox10.Text;
        ParamByName('sscpbh').Value:=SplitString(combobox11.Text,'|');
        if combobox12.Text='' then
        ParamByName('sscpbh1').Value:=''
        else
        ParamByName('sscpbh1').Value:=SplitString(combobox12.Text,'|');
        if combobox13.Text='' then
        ParamByName('sscpbh2').Value:=''
        else
        ParamByName('sscpbh2').Value:=SplitString(combobox13.Text,'|');
        if combobox14.Text='' then
        ParamByName('sscpbh3').Value:=''
        else
        ParamByName('sscpbh3').Value:=SplitString(combobox14.Text,'|');
        if combobox16.Text='' then
        ParamByName('sscpbh4').Value:=''
        else
        ParamByName('sscpbh4').Value:=SplitString(combobox16.Text,'|');
        if combobox15.Text='' then
        ParamByName('sscpbh5').Value:=''
        else
        ParamByName('sscpbh5').Value:=SplitString(combobox15.Text,'|');

        ParamByName('memo').Value:=edit13.Text;
        ParamByName('czry').Value:=main.strUser;
        ExecProc;
        edit14.Text :='';
        edit9.Text :='';
        combobox9.Text :='';
        combobox10.Text :='';
        combobox11.Text :='';
        combobox12.Text :='';
        combobox13.Text :='';
        combobox14.Text :='';
        combobox16.Text :='';
        combobox15.Text :='';
        edit13.Text := '';
        Application.MessageBox('新增半成品信息修改成功！','半成品管理提示');
      end;
    Except
      Application.MessageBox('新增半成品信息失败！','半成品管理提示');
    end;
  end else
    Application.MessageBox('请将必填项目填写完整！','半成品管理提示');
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

procedure TForm11.Button9Click(Sender: TObject);
begin
  edit14.Text :='';
  edit9.Text :='';
  combobox9.Text :='';
  combobox10.Text :='';
  combobox11.Text :='';
  combobox12.Text :='';
  combobox13.Text :='';
  combobox14.Text :='';
  combobox16.Text :='';
  combobox15.Text :='';
  edit13.Text := '';
end;

procedure TForm11.ComboBox10DropDown(Sender: TObject);
begin
  if combobox10.Items.Count>0 then
    ComboBox10.Items.Clear;
    //combobox1.Items.Add('*|全部供应商');
    try
      with zstoredproc1 do
      begin
        close;
        StoredProcName:='proc_cx_cplxk_cpzl';
        open;
        while not eof do
        begin
          ComboBox10.Items.Add(fields[0].asstring);
          next;
        end;
        //combobox1.DroppedDown:=true;
      end;
  except
    application.MessageBox('数据查询失败！','成品出库提示');
  end;
end;

procedure TForm11.ComboBox11KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if key=13 then
 begin
    if combobox11.Items.Count>0 then
    ComboBox11.Items.Clear;
    //combobox1.Items.Add('*|全部供应商');
    try
      with zstoredproc1 do
      begin
        close;
        StoredProcName:='proc_cx_cmlxk_cpbhandmcandzl_by_cpmc';
        ParamByName('cpmc').Value:=ComboBox11.Text;
        open;
        while not eof do
        begin
          ComboBox11.Items.Add(fields[0].asstring);
          next;
        end;
        //combobox1.DroppedDown:=true;
      end;
  except
    application.MessageBox('数据查询失败！','成品出库提示');
  end;
 end;
end;

procedure TForm11.ComboBox12KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if key=13 then
 begin
    if combobox12.Items.Count>0 then
    ComboBox12.Items.Clear;
    //combobox1.Items.Add('*|全部供应商');
    try
      with zstoredproc1 do
      begin
        close;
        StoredProcName:='proc_cx_cmlxk_cpbhandmcandzl_by_cpmc';
        ParamByName('cpmc').Value:=ComboBox12.Text;
        open;
        while not eof do
        begin
          ComboBox12.Items.Add(fields[0].asstring);
          next;
        end;
        //combobox1.DroppedDown:=true;
      end;
  except
    application.MessageBox('数据查询失败！','成品出库提示');
  end;
 end;
end;

procedure TForm11.ComboBox13KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if key=13 then
 begin
    if combobox13.Items.Count>0 then
    ComboBox13.Items.Clear;
    //combobox1.Items.Add('*|全部供应商');
    try
      with zstoredproc1 do
      begin
        close;
        StoredProcName:='proc_cx_cmlxk_cpbhandmcandzl_by_cpmc';
        ParamByName('cpmc').Value:=ComboBox13.Text;
        open;
        while not eof do
        begin
          ComboBox13.Items.Add(fields[0].asstring);
          next;
        end;
        //combobox1.DroppedDown:=true;
      end;
  except
    application.MessageBox('数据查询失败！','成品出库提示');
  end;
 end;
end;

procedure TForm11.ComboBox14KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if key=13 then
 begin
    if combobox14.Items.Count>0 then
    ComboBox14.Items.Clear;
    //combobox1.Items.Add('*|全部供应商');
    try
      with zstoredproc1 do
      begin
        close;
        StoredProcName:='proc_cx_cmlxk_cpbhandmcandzl_by_cpmc';
        ParamByName('cpmc').Value:=ComboBox14.Text;
        open;
        while not eof do
        begin
          ComboBox14.Items.Add(fields[0].asstring);
          next;
        end;
        //combobox1.DroppedDown:=true;
      end;
  except
    application.MessageBox('数据查询失败！','成品出库提示');
  end;
 end;
end;

procedure TForm11.ComboBox15KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if key=13 then
 begin
    if combobox15.Items.Count>0 then
    ComboBox15.Items.Clear;
    //combobox1.Items.Add('*|全部供应商');
    try
      with zstoredproc1 do
      begin
        close;
        StoredProcName:='proc_cx_cmlxk_cpbhandmcandzl_by_cpmc';
        ParamByName('cpmc').Value:=ComboBox15.Text;
        open;
        while not eof do
        begin
          ComboBox15.Items.Add(fields[0].asstring);
          next;
        end;
        //combobox1.DroppedDown:=true;
      end;
  except
    application.MessageBox('数据查询失败！','成品出库提示');
  end;
 end;
end;

procedure TForm11.ComboBox16KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if key=13 then
 begin
    if combobox16.Items.Count>0 then
    ComboBox16.Items.Clear;
    //combobox1.Items.Add('*|全部供应商');
    try
      with zstoredproc1 do
      begin
        close;
        StoredProcName:='proc_cx_cmlxk_cpbhandmcandzl_by_cpmc';
        ParamByName('cpmc').Value:=ComboBox16.Text;
        open;
        while not eof do
        begin
          ComboBox16.Items.Add(fields[0].asstring);
          next;
        end;
        //combobox1.DroppedDown:=true;
      end;
  except
    application.MessageBox('数据查询失败！','成品出库提示');
  end;
 end;
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

procedure TForm11.ComboBox5KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if key=13 then
 begin
    if combobox5.Items.Count>0 then
    ComboBox5.Items.Clear;
    //combobox1.Items.Add('*|全部供应商');
    try
      with zstoredproc1 do
      begin
        close;
        StoredProcName:='proc_cx_cmlxk_cpbhandmcandzl_by_cpmc';
        ParamByName('cpmc').Value:=ComboBox5.Text;
        open;
        while not eof do
        begin
          ComboBox5.Items.Add(fields[0].asstring);
          next;
        end;
        //combobox1.DroppedDown:=true;
      end;
  except
    application.MessageBox('数据查询失败！','成品出库提示');
  end;
 end;
end;

procedure TForm11.ComboBox6KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if key=13 then
 begin
    if combobox6.Items.Count>0 then
    ComboBox6.Items.Clear;
    //combobox1.Items.Add('*|全部供应商');
    try
      with zstoredproc1 do
      begin
        close;
        StoredProcName:='proc_cx_cmlxk_cpbhandmcandzl_by_cpmc';
        ParamByName('cpmc').Value:=ComboBox6.Text;
        open;
        while not eof do
        begin
          ComboBox6.Items.Add(fields[0].asstring);
          next;
        end;
        //combobox1.DroppedDown:=true;
      end;
  except
    application.MessageBox('数据查询失败！','成品出库提示');
  end;
 end;
end;

procedure TForm11.ComboBox7KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if key=13 then
 begin
    if combobox7.Items.Count>0 then
    ComboBox7.Items.Clear;
    //combobox1.Items.Add('*|全部供应商');
    try
      with zstoredproc1 do
      begin
        close;
        StoredProcName:='proc_cx_cmlxk_cpbhandmcandzl_by_cpmc';
        ParamByName('cpmc').Value:=ComboBox7.Text;
        open;
        while not eof do
        begin
          ComboBox7.Items.Add(fields[0].asstring);
          next;
        end;
        //combobox1.DroppedDown:=true;
      end;
  except
    application.MessageBox('数据查询失败！','成品出库提示');
  end;
 end;
end;

procedure TForm11.ComboBox8KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if key=13 then
 begin
    if combobox8.Items.Count>0 then
    ComboBox8.Items.Clear;
    //combobox1.Items.Add('*|全部供应商');
    try
      with zstoredproc1 do
      begin
        close;
        StoredProcName:='proc_cx_cmlxk_cpbhandmcandzl_by_cpmc';
        ParamByName('cpmc').Value:=ComboBox8.Text;
        open;
        while not eof do
        begin
          ComboBox8.Items.Add(fields[0].asstring);
          next;
        end;
        //combobox1.DroppedDown:=true;
      end;
  except
    application.MessageBox('数据查询失败！','成品出库提示');
  end;
 end;
end;

procedure TForm11.ComboBox9DropDown(Sender: TObject);
begin
  combobox9.Items.Clear;
  with zStoredProc1 do
  begin
    close;
    StoredProcName:='proc_cx_bcplxb_bcplxmc';
    open;
    while not eof do
    begin
       combobox9.Items.Add(fields[0].asstring);
       next;
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

procedure TForm11.Edit7KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if key=13 then
 begin
    listbox2.Clear;
    //combobox1.Items.Add('*|全部供应商');
    try
      with zstoredproc1 do
      begin
        close;
        StoredProcName:='proc_cx_bcplxk_bcpbh';
        ParamByName('bcpmc').Value:=edit7.Text;
        open;
        while not eof do
        begin
        listbox2.Items.Append(fields[0].AsString);
        next;
        end;
        //combobox1.DroppedDown:=true;
      end;
  except
    application.MessageBox('数据查询失败！','半成品入库提示');
  end;
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

procedure TForm11.ListBox2Click(Sender: TObject);
begin
  if listbox2.ItemIndex>=0 then
  begin
    try
      with zStoredProc1 do
      begin
        close;
        StoredProcName:='proc_cx_bcplxkinfo_all_by_bcpbh';
        ParamByName('bcpbh').Value:=SplitString(listbox2.Items.Strings[listbox2.itemindex],'|');
        open;
        if not eof then
        begin
          edit14.Text := fields[0].AsString;
          edit9.Text := fields[1].AsString;
          combobox9.Text :=fields[2].AsString+'|*';
          combobox10.Text :=fields[3].AsString;
          combobox11.Text :=fields[4].AsString+'|*';
          combobox12.Text :=fields[5].AsString+'|*';
          combobox13.Text :=fields[6].AsString+'|*';
          combobox14.Text :=fields[7].AsString+'|*';
          combobox16.Text :=fields[8].AsString+'|*';
          combobox15.Text :=fields[9].AsString+'|*';
          edit13.Text := fields[10].AsString;
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
