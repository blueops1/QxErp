unit ccxxgl;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, DB, ZAbstractRODataset, ZAbstractDataset,
  ZStoredProcedure;

type
  TForm25 = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    PageControl2: TPageControl;
    TabSheet4: TTabSheet;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label16: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Memo1: TMemo;
    Button1: TButton;
    Button2: TButton;
    TabSheet5: TTabSheet;
    ListBox1: TListBox;
    Edit7: TEdit;
    Button3: TButton;
    Button4: TButton;
    PageControl3: TPageControl;
    TabSheet6: TTabSheet;
    Label17: TLabel;
    Label18: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Edit13: TEdit;
    Edit14: TEdit;
    Memo3: TMemo;
    Button5: TButton;
    Button6: TButton;
    TabSheet7: TTabSheet;
    ListBox2: TListBox;
    Edit19: TEdit;
    Button7: TButton;
    Button8: TButton;
    PageControl4: TPageControl;
    TabSheet8: TTabSheet;
    Label33: TLabel;
    Label34: TLabel;
    Label38: TLabel;
    Label39: TLabel;
    Label40: TLabel;
    Edit25: TEdit;
    Edit26: TEdit;
    Memo5: TMemo;
    Button9: TButton;
    Button10: TButton;
    TabSheet9: TTabSheet;
    ListBox3: TListBox;
    Edit31: TEdit;
    Button11: TButton;
    Button12: TButton;
    ComboBox1: TComboBox;
    ComboBox2: TComboBox;
    ComboBox3: TComboBox;
    TabSheet10: TTabSheet;
    PageControl5: TPageControl;
    TabSheet11: TTabSheet;
    Label49: TLabel;
    Label50: TLabel;
    Label55: TLabel;
    Label56: TLabel;
    Edit3: TEdit;
    Edit4: TEdit;
    Memo7: TMemo;
    Button13: TButton;
    Button14: TButton;
    TabSheet12: TTabSheet;
    Label64: TLabel;
    ListBox4: TListBox;
    Edit39: TEdit;
    Button15: TButton;
    Button16: TButton;
    Label65: TLabel;
    ComboBox4: TComboBox;
    ZStoredProc1: TZStoredProc;
    TabSheet13: TTabSheet;
    PageControl6: TPageControl;
    TabSheet14: TTabSheet;
    Label66: TLabel;
    Label67: TLabel;
    Label71: TLabel;
    Label72: TLabel;
    Label73: TLabel;
    Edit45: TEdit;
    Edit46: TEdit;
    Memo9: TMemo;
    Button17: TButton;
    Button18: TButton;
    TabSheet15: TTabSheet;
    ListBox5: TListBox;
    Edit47: TEdit;
    Button19: TButton;
    Button20: TButton;
    ComboBox5: TComboBox;
    Label8: TLabel;
    Label9: TLabel;
    Edit5: TEdit;
    Label10: TLabel;
    ComboBox6: TComboBox;
    Label11: TLabel;
    ComboBox7: TComboBox;
    Label12: TLabel;
    ComboBox8: TComboBox;
    Label13: TLabel;
    ComboBox9: TComboBox;
    Label14: TLabel;
    Memo2: TMemo;
    Label19: TLabel;
    Label20: TLabel;
    Edit6: TEdit;
    Label21: TLabel;
    Memo8: TMemo;
    Label22: TLabel;
    Label35: TLabel;
    Edit8: TEdit;
    Label36: TLabel;
    Memo10: TMemo;
    Label25: TLabel;
    Label26: TLabel;
    Edit9: TEdit;
    Label27: TLabel;
    Memo4: TMemo;
    Label28: TLabel;
    Label29: TLabel;
    Edit10: TEdit;
    Label30: TLabel;
    ComboBox10: TComboBox;
    Label31: TLabel;
    Memo6: TMemo;
    Label15: TLabel;
    Label37: TLabel;
    Label32: TLabel;
    Label41: TLabel;
    Label42: TLabel;
    Label43: TLabel;
    Label44: TLabel;
    Label45: TLabel;
    Label46: TLabel;
    TabSheet16: TTabSheet;
    PageControl7: TPageControl;
    TabSheet17: TTabSheet;
    Label47: TLabel;
    Label48: TLabel;
    Label51: TLabel;
    Label52: TLabel;
    Edit11: TEdit;
    Edit12: TEdit;
    Memo11: TMemo;
    Button21: TButton;
    Button22: TButton;
    TabSheet18: TTabSheet;
    Label53: TLabel;
    Label54: TLabel;
    Label57: TLabel;
    Label58: TLabel;
    Label59: TLabel;
    ListBox6: TListBox;
    Edit15: TEdit;
    Button23: TButton;
    Button24: TButton;
    Edit16: TEdit;
    Memo12: TMemo;
    Label60: TLabel;
    ComboBox11: TComboBox;
    Label61: TLabel;
    ComboBox12: TComboBox;
    Label62: TLabel;
    ComboBox13: TComboBox;
    Label63: TLabel;
    Edit17: TEdit;
    Label68: TLabel;
    Label69: TLabel;
    ComboBox14: TComboBox;
    Label70: TLabel;
    Edit18: TEdit;
    Label74: TLabel;
    procedure Edit1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Edit45KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Edit3KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Edit25KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Edit13KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Button1Click(Sender: TObject);
    procedure Button13Click(Sender: TObject);
    procedure Button17Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure ComboBox5DropDown(Sender: TObject);
    procedure ComboBox4DropDown(Sender: TObject);
    procedure ComboBox3DropDown(Sender: TObject);
    procedure ComboBox1DropDown(Sender: TObject);
    procedure ComboBox2DropDown(Sender: TObject);
    procedure Edit7KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Edit39KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Edit47KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Edit19KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Edit31KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure ListBox1Click(Sender: TObject);
    procedure ListBox4Click(Sender: TObject);
    procedure ListBox5Click(Sender: TObject);
    procedure ListBox2Click(Sender: TObject);
    procedure ListBox3Click(Sender: TObject);
    procedure ComboBox10DropDown(Sender: TObject);
    procedure ComboBox6DropDown(Sender: TObject);
    procedure ComboBox7DropDown(Sender: TObject);
    procedure ComboBox8DropDown(Sender: TObject);
    procedure ComboBox9DropDown(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button15Click(Sender: TObject);
    procedure Button19Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button11Click(Sender: TObject);
    procedure ComboBox11DropDown(Sender: TObject);
    procedure Edit11KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Button21Click(Sender: TObject);
    procedure ComboBox3Select(Sender: TObject);
    procedure Edit17KeyPress(Sender: TObject; var Key: Char);
    procedure Edit18KeyPress(Sender: TObject; var Key: Char);
    procedure Edit15KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure ListBox6Click(Sender: TObject);
    procedure ComboBox14DropDown(Sender: TObject);
    procedure ComboBox12DropDown(Sender: TObject);
    procedure Button23Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form25: TForm25;
  function SplitString(Source, Deli: string ): String;stdcall;external 'dlltools.dll';

implementation

uses main;

{$R *.dfm}

procedure TForm25.Button11Click(Sender: TObject);
begin  //proc_update_hjinfo_by_hjid
  if (edit31.Text<>'') and (edit10.Text<>'') and (combobox10.Text<>'') then
    try
      with zStoredProc1 do
      begin
        close;
        StoredProcName:='proc_update_hjinfo_by_hjid';    //hjid,hjmc,ckid,memo
        ParamByName('hjid').Value:=edit31.Text;
        ParamByName('hjmc').Value:=edit10.Text;
        ParamByName('ckid').Value:=SplitString(combobox10.Text,'|');
        ParamByName('memo').Value:=memo6.Text;
        ExecProc;
          application.MessageBox('数据修改成功！','仓储信息管理提示');
          edit31.Text:='';
          edit10.Text:='';
          combobox10.Text:='';
          memo6.Text:='';
          edit31.SetFocus;
      end;
  except
    application.MessageBox('数据修改失败！','仓储信息管理提示');
  end else
    application.MessageBox('请将必填项填写完整！','仓储信息管理提示');
end;

procedure TForm25.Button13Click(Sender: TObject);
begin
  if (edit3.Text<>'') and (edit4.Text<>'')then
    try
      with zStoredProc1 do
      begin
        close;
        StoredProcName:='proc_insert_itemlxinfo';    //itemlxid,itemlxmc,itemlxmemo
        ParamByName('itemlxid').Value:=edit3.Text;
        ParamByName('itemlxmc').Value:=edit4.Text;
        ParamByName('itemlxmemo').Value:='*'+memo7.Text;
        ExecProc;
        if ParamByName('returncode').Value=1 then
          application.MessageBox('该物品类型已经存在！','仓储信息管理提示')
        else begin
          application.MessageBox('数据保存成功！','仓储信息管理提示');
          edit3.Text:='';
          edit4.Text:='';
          memo7.Text:='';
          edit3.SetFocus;
        end;

        //fgysmc=gysmc,fgyszh=gyszh,fgyskhh=gyskhh,flxr=lxr,flxrphone=lxrphone,fmemo=memo
      end;
  except
    application.MessageBox('数据更新失败！','仓储信息管理提示');
  end else
    application.MessageBox('请将必填项填写完整！','仓储信息管理提示');
end;

procedure TForm25.Button15Click(Sender: TObject);
begin  //proc_update_itemlxinfo_by_itemlxid
  if (edit39.Text<>'') and (edit6.Text<>'')then
    try
      with zStoredProc1 do
      begin
        close;
        StoredProcName:='proc_update_itemlxinfo_by_itemlxid';    //itemlxid,itemlxmc,itemlxmemo
        ParamByName('itemlxid').Value:=edit39.Text;
        ParamByName('itemlxmc').Value:=edit6.Text;
        ParamByName('itemlxmemo').Value:=memo8.Text;
        ExecProc;
          application.MessageBox('数据修改成功！','仓储信息管理提示');
          edit39.Text:='';
          edit6.Text:='';
          memo8.Text:='';
          edit39.SetFocus;
       end;
  except
    application.MessageBox('数据修改失败！','仓储信息管理提示');
  end else
    application.MessageBox('请将必填项填写完整！','仓储信息管理提示');
end;

procedure TForm25.Button17Click(Sender: TObject);
begin
  if (edit45.Text<>'') and (edit46.Text<>'')then
    try
      with zStoredProc1 do
      begin
        close;
        StoredProcName:='proc_insert_itemdwinfo';    //itemid,itemc,itemdwid,itemlxid,ckid,hjid,memo
        ParamByName('itemdwid').Value:=edit45.Text;
        ParamByName('itemdwmc').Value:=edit46.Text;
        ParamByName('itemdwmemo').Value:='*'+memo9.Text;
        ExecProc;
        if ParamByName('returncode').Value=1 then
          application.MessageBox('该物品单位已经存在！','仓储信息管理提示')
        else begin
          application.MessageBox('数据保存成功！','仓储信息管理提示');
          edit45.Text:='';
          edit46.Text:='';
          memo9.Text:='';
          edit45.SetFocus;
        end;

        //fgysmc=gysmc,fgyszh=gyszh,fgyskhh=gyskhh,flxr=lxr,flxrphone=lxrphone,fmemo=memo
      end;
  except
    application.MessageBox('数据更新失败！','仓储信息管理提示');
  end else
    application.MessageBox('请将必填项填写完整！','仓储信息管理提示');
end;

procedure TForm25.Button19Click(Sender: TObject);
begin  //proc_update_itemdwinfo_by_itemdwid
  if (edit47.Text<>'') and (edit8.Text<>'')then
    try
      with zStoredProc1 do
      begin
        close;
        StoredProcName:='proc_update_itemdwinfo_by_itemdwid';    //itemid,itemc,itemdwid,itemlxid,ckid,hjid,memo
        ParamByName('itemdwid').Value:=edit47.Text;
        ParamByName('itemdwmc').Value:=edit8.Text;
        ParamByName('itemdwmemo').Value:=memo10.Text;
        ExecProc;
          application.MessageBox('数据修改成功！','仓储信息管理提示');
          edit47.Text:='';
          edit8.Text:='';
          memo10.Text:='';
          edit47.SetFocus;
      end;
  except
    application.MessageBox('数据修改失败！','仓储信息管理提示');
  end else
    application.MessageBox('请将必填项填写完整！','仓储信息管理提示');
end;

procedure TForm25.Button1Click(Sender: TObject);
begin
  if (edit1.Text<>'') and (edit2.Text<>'') and (combobox1.Text<>'') and (combobox2.Text<>'') and (combobox3.Text<>'') and (combobox4.Text<>'') and (combobox13.Text<>'') then
    try
      with zStoredProc1 do
      begin
        close;
        StoredProcName:='proc_insert_ckiteminfo';    //itemid,itemc,itemdwid,itemlxid,ckid,hjid,memo
        ParamByName('itemid').Value:=edit1.Text;
        ParamByName('itemmc').Value:=edit2.Text;
        ParamByName('itemdwid').Value:=SplitString(combobox4.Text,'|');
        ParamByName('itemlxid').Value:=SplitString(combobox3.Text,'|');
        ParamByName('itemrjlxid').Value:=SplitString(combobox13.Text,'|');
        ParamByName('ckid').Value:=SplitString(combobox1.Text,'|');
        ParamByName('hjid').Value:=SplitString(combobox2.Text,'|');
        ParamByName('weight').Value:=edit17.Text;
        ParamByName('memo').Value:='*'+memo1.Text;
        ExecProc;
        if ParamByName('returncode').Value=1 then
          application.MessageBox('该物品信息或者编号已经存在！','仓储信息管理提示')
        else begin
          application.MessageBox('数据保存成功！','仓储信息管理提示');
          edit1.Text:='';
          edit2.Text:='';
          combobox1.Text:='';
          combobox2.Text:='';
          combobox3.Text:='';
          combobox13.Text:='';
          combobox4.Text:='';
          edit17.Text:='';
          memo1.Text:='';
          edit1.SetFocus;
        end;

        //fgysmc=gysmc,fgyszh=gyszh,fgyskhh=gyskhh,flxr=lxr,flxrphone=lxrphone,fmemo=memo
      end;
  except
    application.MessageBox('数据更新失败！','仓储信息管理提示');
  end else
    application.MessageBox('请将必填项填写完整！','仓储信息管理提示');
end;

procedure TForm25.Button21Click(Sender: TObject);
begin
  if (edit11.Text<>'') and (edit12.Text<>'') and (combobox11.Text<>'') then
    try
      with zStoredProc1 do
      begin
        close;
        StoredProcName:='proc_insert_itemrjlxinfo';    //itemlxid,itemlxmc,itemlxmemo
        ParamByName('itemrjlxid').Value:=edit11.Text;
        ParamByName('itemrjlxmc').Value:=edit12.Text;
        ParamByName('itemyjlxid').Value:=splitstring(combobox11.Text,'|');
        ParamByName('itemrjlxmemo').Value:='*'+memo11.Text;
        ExecProc;
        if ParamByName('returncode').Value=1 then
          application.MessageBox('该科目编号已经存在！','仓储信息管理提示')
        else if ParamByName('returncode').Value=2 then
          application.MessageBox('该二级科目已经存在！','仓储信息管理提示')
        else begin
          application.MessageBox('数据保存成功！','仓储信息管理提示');
          edit11.Text:='';
          edit12.Text:='';
          memo11.Text:='';
          combobox11.Text:='';
          edit11.SetFocus;
        end;

        //fgysmc=gysmc,fgyszh=gyszh,fgyskhh=gyskhh,flxr=lxr,flxrphone=lxrphone,fmemo=memo
      end;
  except
    application.MessageBox('数据更新失败！','仓储信息管理提示');
  end else
    application.MessageBox('请将必填项填写完整！','仓储信息管理提示');
end;

procedure TForm25.Button23Click(Sender: TObject);
begin
  if (edit15.Text<>'') and (edit16.Text<>'') and (combobox12.Text<>'')then
    try
      with zStoredProc1 do
      begin
        close;
        StoredProcName:='proc_update_itemrjlxid_by_itemrjlxid';    //itemlxid,itemlxmc,itemlxmemo
        ParamByName('itemrjlxid').Value:=edit15.Text;
        ParamByName('itemyjlxid').Value:=splitstring(combobox12.Text,'|');
        ParamByName('itemrjlxmc').Value:=edit16.Text;
        ParamByName('itemrjlxmemo').Value:=memo12.Text;
        ExecProc;
          application.MessageBox('数据修改成功！','仓储信息管理提示');
          edit15.Text:='';
          edit16.Text:='';
          combobox12.Text:='';
          memo12.Text:='';
          edit15.SetFocus;
       end;
  except
    application.MessageBox('数据修改失败！','仓储信息管理提示');
  end else
    application.MessageBox('请将必填项填写完整！','仓储信息管理提示');
end;

procedure TForm25.Button3Click(Sender: TObject);
begin     //proc_update_ckiteminfo_by_itembh
  if (edit7.Text<>'') and (edit5.Text<>'') and (combobox6.Text<>'') and (combobox7.Text<>'') and (combobox8.Text<>'') and (combobox9.Text<>'') and (combobox14.Text<>'')then
    try
      with zStoredProc1 do
      begin
        close;
        StoredProcName:='proc_update_ckiteminfo_by_itembh';    //itemid,itemc,itemdwid,itemlxid,ckid,hjid,memo
        ParamByName('itemid').Value:=edit7.Text;
        ParamByName('itemmc').Value:=edit5.Text;
        ParamByName('itemdwid').Value:=SplitString(combobox6.Text,'|');
        ParamByName('itemlxid').Value:=SplitString(combobox7.Text,'|');
        ParamByName('itemrjlxid').Value:=SplitString(combobox14.Text,'|');
        ParamByName('ckid').Value:=SplitString(combobox8.Text,'|');
        ParamByName('hjid').Value:=SplitString(combobox9.Text,'|');
        ParamByName('memo').Value:=memo2.Text;
        ParamByName('weight').Value:=edit18.Text;
        ExecProc;
          application.MessageBox('数据修改成功！','仓储信息管理提示');
          edit7.Text:='';
          edit5.Text:='';
          combobox6.Text:='';
          combobox7.Text:='';
          combobox14.Text:='';
          combobox8.Text:='';
          combobox9.Text:='';
          memo2.Text:='';
          edit18.Text:='';
          edit7.SetFocus;
        //fgysmc=gysmc,fgyszh=gyszh,fgyskhh=gyskhh,flxr=lxr,flxrphone=lxrphone,fmemo=memo
      end;
  except
    application.MessageBox('数据修改失败！','仓储信息管理提示');
  end else
    application.MessageBox('请将必填项填写完整！','仓储信息管理提示');

end;

procedure TForm25.Button5Click(Sender: TObject);
begin
  if (edit13.Text<>'') and (edit14.Text<>'')then
    try
      with zStoredProc1 do
      begin
        close;
        StoredProcName:='proc_insert_ckinfo';    //ckid,ckmc,memo
        ParamByName('ckid').Value:=edit13.Text;
        ParamByName('ckmc').Value:=edit14.Text;
        ParamByName('memo').Value:='*'+memo3.Text;
        ExecProc;
        if ParamByName('returncode').Value=1 then
          application.MessageBox('该仓库信息已经存在！','仓储信息管理提示')
        else begin
          application.MessageBox('数据保存成功！','仓储信息管理提示');
          edit13.Text:='';
          edit14.Text:='';
          memo3.Text:='';
          edit13.SetFocus;
        end;

        //fgysmc=gysmc,fgyszh=gyszh,fgyskhh=gyskhh,flxr=lxr,flxrphone=lxrphone,fmemo=memo
      end;
  except
    application.MessageBox('数据更新失败！','仓储信息管理提示');
  end else
    application.MessageBox('请将必填项填写完整！','仓储信息管理提示');
end;

procedure TForm25.Button7Click(Sender: TObject);
begin  //proc_update_ckinfo_by_ckid
  if (edit19.Text<>'') and (edit9.Text<>'')then
    try
      with zStoredProc1 do
      begin
        close;
        StoredProcName:='proc_insert_ckinfo';    //ckid,ckmc,memo
        ParamByName('ckid').Value:=edit19.Text;
        ParamByName('ckmc').Value:=edit9.Text;
        ParamByName('memo').Value:=memo4.Text;
        ExecProc;
          application.MessageBox('数据修改成功！','仓储信息管理提示');
          edit19.Text:='';
          edit9.Text:='';
          memo4.Text:='';
          edit19.SetFocus;
      end;
  except
    application.MessageBox('数据修改失败！','仓储信息管理提示');
  end else
    application.MessageBox('请将必填项填写完整！','仓储信息管理提示');

end;

procedure TForm25.Button9Click(Sender: TObject);
begin
  if (edit25.Text<>'') and (edit26.Text<>'') and (combobox5.Text<>'') then
    try
      with zStoredProc1 do
      begin
        close;
        StoredProcName:='proc_insert_hjinfo';    //hjid,hjmc,ckid,memo
        ParamByName('hjid').Value:=edit25.Text;
        ParamByName('hjmc').Value:=edit26.Text;
        ParamByName('ckid').Value:=SplitString(combobox5.Text,'|');
        ParamByName('memo').Value:='*'+memo5.Text;
        ExecProc;
        if ParamByName('returncode').Value=1 then
          application.MessageBox('该货架信息已经存在！','仓储信息管理提示')
        else begin
          application.MessageBox('数据保存成功！','仓储信息管理提示');
          edit25.Text:='';
          edit26.Text:='';
          combobox5.Text:='';
          memo5.Text:='';
          edit25.SetFocus;
        end;

        //fgysmc=gysmc,fgyszh=gyszh,fgyskhh=gyskhh,flxr=lxr,flxrphone=lxrphone,fmemo=memo
      end;
  except
    application.MessageBox('数据更新失败！','仓储信息管理提示');
  end else
    application.MessageBox('请将必填项填写完整！','仓储信息管理提示');
end;

procedure TForm25.ComboBox10DropDown(Sender: TObject);
begin
  if combobox10.Items.Count>0 then
    combobox10.Items.Clear;
    try
      with zStoredProc1 do
      begin
        close;
        StoredProcName:='proc_cx_ckbhandmc';
        open;
        while not eof do
        begin
          combobox10.Items.Add(fields[0].asstring);
          next;
        end;
      end;
    except
      application.MessageBox('数据查询失败！','仓储信息管理提示');
    end;
end;

procedure TForm25.ComboBox11DropDown(Sender: TObject);
begin
  if combobox11.Items.Count>0 then
    combobox11.Items.Clear;
    try
      with zStoredProc1 do
      begin
        close;
        StoredProcName:='proc_cx_itemlxbhandmc';
        open;
        while not eof do
        begin
          combobox11.Items.Add(fields[0].asstring);
          next;
        end;
      end;
    except
      application.MessageBox('数据查询失败！','仓储信息管理提示');
    end;
end;

procedure TForm25.ComboBox12DropDown(Sender: TObject);
begin
  if combobox12.Items.Count>0 then
    combobox12.Items.Clear;
    try
      with zStoredProc1 do
      begin
        close;
        StoredProcName:='proc_cx_itemlxbhandmc';
        open;
        while not eof do
        begin
          combobox12.Items.Add(fields[0].asstring);
          next;
        end;
      end;
    except
      application.MessageBox('数据查询失败！','仓储信息管理提示');
    end;
end;

procedure TForm25.ComboBox14DropDown(Sender: TObject);
begin
  if combobox14.Items.Count>0 then
    combobox14.Items.Clear;
    try
      with zStoredProc1 do
      begin
        close;
        StoredProcName:='proc_cx_itemrjlxidandmc_by_itemyjlxid';
        ParamByName('itemyjlxid').Value:=splitstring(combobox7.Text,'|');
        open;
        while not eof do
        begin
          combobox14.Items.Add(fields[0].asstring);
          next;
        end;
      end;
    except
      application.MessageBox('数据查询失败！','仓储信息管理提示');
    end;
end;

procedure TForm25.ComboBox1DropDown(Sender: TObject);
begin
  if combobox1.Items.Count>0 then
    combobox1.Items.Clear;
    try
      with zStoredProc1 do
      begin
        close;
        StoredProcName:='proc_cx_ckbhandmc';
        open;
        while not eof do
        begin
          combobox1.Items.Add(fields[0].asstring);
          next;
        end;
      end;
    except
      application.MessageBox('数据查询失败！','仓储信息管理提示');
    end;
end;

procedure TForm25.ComboBox2DropDown(Sender: TObject);
begin
  if combobox2.Items.Count>0 then
    combobox2.Items.Clear;
    try
      with zStoredProc1 do
      begin
        close;
        StoredProcName:='proc_cx_hjbhandmc';
        open;
        while not eof do
        begin
          combobox2.Items.Add(fields[0].asstring);
          next;
        end;
      end;
    except
      application.MessageBox('数据查询失败！','仓储信息管理提示');
    end;
end;

procedure TForm25.ComboBox3DropDown(Sender: TObject);
begin
  if combobox3.Items.Count>0 then
    combobox3.Items.Clear;
    try
      with zStoredProc1 do
      begin
        close;
        StoredProcName:='proc_cx_itemlxbhandmc';
        open;
        while not eof do
        begin
          combobox3.Items.Add(fields[0].asstring);
          next;
        end;
      end;
    except
      application.MessageBox('数据查询失败！','仓储信息管理提示');
    end;
end;

procedure TForm25.ComboBox3Select(Sender: TObject);
begin
//proc_cx_itemrjlxidandmc_by_itemyjlxid
  if combobox13.Items.Count>0 then
    combobox13.Items.Clear;
    combobox13.Text:='';
    try
      with zStoredProc1 do
      begin
        close;
        StoredProcName:='proc_cx_itemrjlxidandmc_by_itemyjlxid';
        ParamByName('itemyjlxid').Value:=splitstring(combobox3.Text,'|');
        open;
        while not eof do
        begin
          combobox13.Items.Add(fields[0].asstring);
          next;
        end;
      end;
    except
      application.MessageBox('数据查询失败！','仓储信息管理提示');
    end;
end;

procedure TForm25.ComboBox4DropDown(Sender: TObject);
begin
  if combobox4.Items.Count>0 then
    combobox4.Items.Clear;
    try
      with zStoredProc1 do
      begin
        close;
        StoredProcName:='proc_cx_itemdwbhandmc';
        open;
        while not eof do
        begin
          combobox4.Items.Add(fields[0].asstring);
          next;
        end;
      end;
    except
      application.MessageBox('数据查询失败！','仓储信息管理提示');
    end;
end;

procedure TForm25.ComboBox5DropDown(Sender: TObject);
begin
  if combobox5.Items.Count>0 then
    combobox5.Items.Clear;
    try
      with zStoredProc1 do
      begin
        close;
        StoredProcName:='proc_cx_ckbhandmc';
        open;
        while not eof do
        begin
          combobox5.Items.Add(fields[0].asstring);
          next;
        end;
      end;
    except
      application.MessageBox('数据查询失败！','仓储信息管理提示');
    end;
end;

procedure TForm25.ComboBox6DropDown(Sender: TObject);
begin
  if combobox6.Items.Count>0 then
    combobox6.Items.Clear;
    try
      with zStoredProc1 do
      begin
        close;
        StoredProcName:='proc_cx_itemdwbhandmc';
        open;
        while not eof do
        begin
          combobox6.Items.Add(fields[0].asstring);
          next;
        end;
      end;
    except
      application.MessageBox('数据查询失败！','仓储信息管理提示');
    end;
end;

procedure TForm25.ComboBox7DropDown(Sender: TObject);
begin
  if combobox7.Items.Count>0 then
    combobox7.Items.Clear;
    try
      with zStoredProc1 do
      begin
        close;
        StoredProcName:='proc_cx_itemlxbhandmc';
        open;
        while not eof do
        begin
          combobox7.Items.Add(fields[0].asstring);
          next;
        end;
      end;
    except
      application.MessageBox('数据查询失败！','仓储信息管理提示');
    end;
end;

procedure TForm25.ComboBox8DropDown(Sender: TObject);
begin
  if combobox8.Items.Count>0 then
    combobox8.Items.Clear;
    try
      with zStoredProc1 do
      begin
        close;
        StoredProcName:='proc_cx_ckbhandmc';
        open;
        while not eof do
        begin
          combobox8.Items.Add(fields[0].asstring);
          next;
        end;
      end;
    except
      application.MessageBox('数据查询失败！','仓储信息管理提示');
    end;
end;

procedure TForm25.ComboBox9DropDown(Sender: TObject);
begin
  if combobox9.Items.Count>0 then
    combobox9.Items.Clear;
    try
      with zStoredProc1 do
      begin
        close;
        StoredProcName:='proc_cx_hjbhandmc';
        open;
        while not eof do
        begin
          combobox9.Items.Add(fields[0].asstring);
          next;
        end;
      end;
    except
      application.MessageBox('数据查询失败！','仓储信息管理提示');
    end;
end;

procedure TForm25.Edit11KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key=13 then
  try
    with zstoredproc1 do
    begin
      close;
      zstoredproc1.StoredProcName:='proc_cx_newitemrjlxid';
      open;
      if fields[0].AsString<>'' then
      begin
        edit11.Text:=fields[0].AsString;
        edit12.SetFocus;
      end;
    end;
  except
    application.MessageBox('数据查询失败！','仓储信息管理提示');
  end;
end;

procedure TForm25.Edit13KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  try
    with zstoredproc1 do
    begin
      close;
      zstoredproc1.StoredProcName:='proc_cx_newckid';
      open;
      if fields[0].AsString<>'' then
      begin
        edit13.Text:=fields[0].AsString;
        edit14.SetFocus;
      end else
      begin
        edit13.Text:='1';
        edit14.SetFocus;
      end;
    end;
  except
    application.MessageBox('数据查询失败！','仓储信息管理提示');
  end;
end;

procedure TForm25.Edit15KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=13) and (edit15.Text<>'') then
  try
    with zstoredproc1 do
    begin
      close;
      StoredProcName:='proc_modiitemrjlxxx_by_itemrjlxmc';
      ParamByName('itemrjlxmc').Value:=edit15.Text;
      open;
      listbox6.Clear;
      while not eof do
      begin
        listbox6.Items.Add(fields[0].asstring);
        next;
      end;
      edit15.Text:='';
      listbox6.ItemIndex:=0;
    end;
  except
    application.MessageBox('数据查询失败！','供应商管理提示');
  end;
end;

procedure TForm25.Edit17KeyPress(Sender: TObject; var Key: Char);
begin
  if not charinset(key,['-','0'..'9','.',#8]) then
    key:=#0;
  if (key='.') and (Pos('.',Edit17.Text)>0)   then
    key:=#0;
      if (key='-') and (Pos('-',Edit17.Text)>0)   then
    key:=#0;
end;

procedure TForm25.Edit18KeyPress(Sender: TObject; var Key: Char);
begin
  if not charinset(key,['-','0'..'9','.',#8]) then
    key:=#0;
  if (key='.') and (Pos('.',Edit18.Text)>0)   then
    key:=#0;
      if (key='-') and (Pos('-',Edit18.Text)>0)   then
    key:=#0;
end;

procedure TForm25.Edit19KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=13) and (edit19.Text<>'') then
  try
    with zstoredproc1 do
    begin
      close;
      StoredProcName:='proc_cx_modickxx_by_ckmc';
      ParamByName('ckmc').Value:=edit19.Text;
      open;
      listbox2.Clear;
      while not eof do
      begin
        listbox2.Items.Add(fields[0].asstring);
        next;
      end;
      edit19.Text:='';
      listbox2.ItemIndex:=0;
    end;
  except
    application.MessageBox('数据查询失败！','供应商管理提示');
  end;
end;

procedure TForm25.Edit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key=13 then
    try
      with zstoredproc1 do
      begin
        close;
        zstoredproc1.StoredProcName:='proc_cx_newitemid';
        open;
        if fields[0].AsString<>'' then
        begin
          edit1.Text:=fields[0].AsString;
          edit2.SetFocus;
        end else
        begin
          edit1.Text:='1';
          edit2.SetFocus;
        end;
      end;
    except
      application.MessageBox('数据查询失败！','仓储信息管理提示');
    end;
end;

procedure TForm25.Edit25KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  try
    with zstoredproc1 do
    begin
      close;
      zstoredproc1.StoredProcName:='proc_cx_newhjid';
      open;
      if fields[0].AsString<>'' then
      begin
        edit25.Text:=fields[0].AsString;
        edit26.SetFocus;
      end else
      begin
        edit25.Text:='1';
        edit26.SetFocus;
      end;
    end;
  except
    application.MessageBox('数据查询失败！','仓储信息管理提示');
  end;
end;

procedure TForm25.Edit31KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=13) and (edit31.Text<>'') then
  try
    with zstoredproc1 do
    begin
      close;
      StoredProcName:='proc_cx_modihjxx_by_hjmc';
      ParamByName('hjmc').Value:=edit31.Text;
      open;
      listbox3.Clear;
      while not eof do
      begin
        listbox3.Items.Add(fields[0].asstring);
        next;
      end;
      edit31.Text:='';
      listbox3.ItemIndex:=0;
    end;
  except
    application.MessageBox('数据查询失败！','供应商管理提示');
  end;
end;

procedure TForm25.Edit39KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=13) and (edit39.Text<>'') then
  try
    with zstoredproc1 do
    begin
      close;
      StoredProcName:='proc_cx_modiitemlxxx_by_itemlxmc';
      ParamByName('itemlxmc').Value:=edit39.Text;
      open;
      listbox4.Clear;
      while not eof do
      begin
        listbox4.Items.Add(fields[0].asstring);
        next;
      end;
      edit39.Text:='';
      listbox4.ItemIndex:=0;
    end;
  except
    application.MessageBox('数据查询失败！','供应商管理提示');
  end;
end;

procedure TForm25.Edit3KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key=13 then
  try
    with zstoredproc1 do
    begin
      close;
      zstoredproc1.StoredProcName:='proc_cx_newitemlxid';
      open;
      if fields[0].AsString<>'' then
      begin
        edit3.Text:=fields[0].AsString;
        edit4.SetFocus;
      end else
      begin
        edit3.Text:='1';
        edit4.SetFocus;
      end;
    end;
  except
    application.MessageBox('数据查询失败！','仓储信息管理提示');
  end;
end;

procedure TForm25.Edit45KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  try
    with zstoredproc1 do
    begin
      close;
      zstoredproc1.StoredProcName:='proc_cx_newitemdwid';
      open;
      if fields[0].AsString<>'' then
      begin
        edit45.Text:=fields[0].AsString;
        edit46.SetFocus;
      end else
      begin
        edit45.Text:='1';
        edit46.SetFocus;
      end;
    end;
  except
    application.MessageBox('数据查询失败！','仓储信息管理提示');
  end;
end;

procedure TForm25.Edit47KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=13) and (edit47.Text<>'') then
  try
    with zstoredproc1 do
    begin
      close;
      StoredProcName:='proc_cx_modiitemdwxx_by_itemdwmc';
      ParamByName('itemdwmc').Value:=edit47.Text;
      open;
      listbox5.Clear;
      while not eof do
      begin
        listbox5.Items.Add(fields[0].asstring);
        next;
      end;
      edit47.Text:='';
      listbox5.ItemIndex:=0;
    end;
  except
    application.MessageBox('数据查询失败！','仓储信息管理提示');
  end;
end;

procedure TForm25.Edit7KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=13) and (edit7.Text<>'') then
  try
    with zstoredproc1 do
    begin
      close;
      StoredProcName:='proc_cx_modickitemxx_by_itemmc';
      ParamByName('itemmc').Value:=edit7.Text;
      open;
      listbox1.Clear;
      while not eof do
      begin
        listbox1.Items.Add(fields[0].asstring);
        next;
      end;
      edit7.Text:='';
      //listbox1.ItemIndex:=0;
    end;
  except
    application.MessageBox('数据查询失败！','仓储信息管理提示');
  end;
end;

procedure TForm25.ListBox1Click(Sender: TObject);
begin
    if ListBox1.Items.Strings[ListBox1.itemindex]<>'' then
    try
      with zStoredProc1 do
      begin
        close;
        StoredProcName:='proc_cx_ccxxglinfo_by_cxxmandcxbh';
        ParamByName('cxxm').Value:='ckitem';
        ParamByName('cxbh').Value:=SplitString(ListBox1.Items.Strings[ListBox1.itemindex],'|');
        open;
        if not eof then
        begin
          Edit7.Text := fields[0].AsString;
          Edit5.Text := fields[1].AsString;
          combobox6.Text := fields[2].AsString;
          combobox7.Text := fields[3].AsString;
          combobox14.Text := fields[7].AsString;
          combobox8.Text := fields[4].AsString;
          combobox9.Text := fields[5].AsString;
          Memo2.Text := fields[6].AsString;
          Edit18.Text := fields[8].AsString;
        end;
      end;
    except
      application.MessageBox('数据查询失败！','仓储信息管理提示');
    end;
end;

procedure TForm25.ListBox2Click(Sender: TObject);
begin
  try
    if ListBox2.Items.Strings[ListBox2.itemindex]<>'' then
    try
      with zStoredProc1 do
      begin
        close;
        StoredProcName:='proc_cx_ccxxglinfo_by_cxxmandcxbh';
        ParamByName('cxxm').Value:='ckinfo';
        ParamByName('cxbh').Value:=SplitString(ListBox2.Items.Strings[ListBox2.itemindex],'|');
        open;
        if not eof then
        begin
          Edit19.Text := fields[1].AsString;
          Edit9.Text := fields[2].AsString;
          Memo4.Text := fields[3].AsString;
        end;
      end;
    except
      application.MessageBox('数据查询失败！','仓储信息管理提示');
    end;
  except
    application.MessageBox('数据查询失败111！','仓储信息管理提示');
  end;
end;

procedure TForm25.ListBox3Click(Sender: TObject);
begin
  try
    if ListBox3.Items.Strings[ListBox3.itemindex]<>'' then
    try
      with zStoredProc1 do
      begin
        close;
        StoredProcName:='proc_cx_ccxxglinfo_by_cxxmandcxbh';
        ParamByName('cxxm').Value:='hjinfo';
        ParamByName('cxbh').Value:=SplitString(ListBox3.Items.Strings[ListBox3.itemindex],'|');
        open;
        if not eof then
        begin
          Edit31.Text := fields[1].AsString;
          Edit10.Text := fields[2].AsString;
          combobox10.Text := fields[3].AsString;
          Memo6.Text := fields[4].AsString;
        end;
      end;
    except
      application.MessageBox('数据查询失败！','仓储信息管理提示');
    end;
  except
    application.MessageBox('数据查询失败！','仓储信息管理提示');
  end;
end;

procedure TForm25.ListBox4Click(Sender: TObject);
begin
  if ListBox4.Items.Strings[ListBox4.itemindex]<>'' then
    try
      with zStoredProc1 do
      begin
        close;
        StoredProcName:='proc_cx_ccxxglinfo_by_cxxmandcxbh';
        ParamByName('cxxm').Value:='itemlx';
        ParamByName('cxbh').Value:=SplitString(ListBox4.Items.Strings[ListBox4.itemindex],'|');
        open;
        if not eof then
        begin
          Edit39.Text := fields[1].AsString;
          Edit6.Text := fields[2].AsString;
          Memo8.Text := fields[3].AsString;
        end;
      end;
    except
      application.MessageBox('数据查询失败！','仓储信息管理提示');
    end;
end;

procedure TForm25.ListBox5Click(Sender: TObject);
begin
  try
    if ListBox5.Items.Strings[ListBox5.itemindex]<>'' then
    try
      with zStoredProc1 do
      begin
        close;
        StoredProcName:='proc_cx_ccxxglinfo_by_cxxmandcxbh';
        ParamByName('cxxm').Value:='itemdw';
        ParamByName('cxbh').Value:=SplitString(ListBox5.Items.Strings[ListBox5.itemindex],'|');
        open;
        if not eof then
        begin
          Edit47.Text := fields[1].AsString;
          Edit8.Text := fields[2].AsString;
          Memo10.Text := fields[3].AsString;
        end;
      end;
    except
      application.MessageBox('数据查询失败！','仓储信息管理提示');
    end;
  except
    application.MessageBox('数据查询失败111！','仓储信息管理提示');
  end;
end;

procedure TForm25.ListBox6Click(Sender: TObject);
begin
  if ListBox6.Items.Strings[ListBox6.itemindex]<>'' then
    try
      with zStoredProc1 do
      begin
        close;
        StoredProcName:='proc_cx_ccxxglinfo_by_cxxmandcxbh';
        ParamByName('cxxm').Value:='itemrjlx';
        ParamByName('cxbh').Value:=SplitString(ListBox6.Items.Strings[ListBox6.itemindex],'|');
        open;
        if not eof then
        begin
          Edit15.Text := fields[0].AsString;
          Edit16.Text := fields[1].AsString;
          combobox12.Text:=fields[2].AsString;
          Memo12.Text := fields[3].AsString;
        end;
      end;
    except
      application.MessageBox('数据查询失败！','仓储信息管理提示');
    end;
end;

end.
