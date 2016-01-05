unit jgsgl;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ZAbstractRODataset, ZAbstractDataset, ZStoredProcedure, StdCtrls,
  ComCtrls;

type
  TForm51 = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
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
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Edit6: TEdit;
    Memo1: TMemo;
    Button1: TButton;
    Button2: TButton;
    TabSheet2: TTabSheet;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    ListBox1: TListBox;
    Edit7: TEdit;
    Edit8: TEdit;
    Edit9: TEdit;
    Edit10: TEdit;
    Edit11: TEdit;
    Edit12: TEdit;
    Memo2: TMemo;
    Button3: TButton;
    Button4: TButton;
    ZStoredProc1: TZStoredProc;
    Label17: TLabel;
    Edit13: TEdit;
    Label18: TLabel;
    Edit14: TEdit;
    Edit15: TEdit;
    Label19: TLabel;
    Label20: TLabel;
    procedure Edit1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Button1Click(Sender: TObject);
    procedure Edit7KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure ListBox1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form51: TForm51;
  function SplitString(Source, Deli: string ): String;stdcall;external 'dlltools.dll';

implementation

{$R *.dfm}

procedure TForm51.Button1Click(Sender: TObject);
begin
  if (edit1.Text<>'') and (edit2.Text<>'') and (edit13.Text<>'') then
    try
      with zStoredProc1 do
      begin
        close;
        StoredProcName:='proc_insert_jgsinfo';     //jgsbh,jgsmc,jgsaddr,jgszh,jgskhh,lxr,lxrphone,memo
        ParamByName('jgsbh').Value:=edit1.Text;
        ParamByName('jgsmc').Value:=edit2.Text;
        ParamByName('jgsaddr').Value:=edit13.Text;
        ParamByName('jgszh').Value:=edit3.Text;
        ParamByName('jgskhh').Value:=edit4.Text;
        ParamByName('lxr').Value:=edit5.Text;
        ParamByName('lxrphone').Value:=edit6.Text;
        ParamByName('memo').Value:='*'+memo1.Text;
        ExecProc;
        if ParamByName('returncode').Value=1 then
          application.MessageBox('该加工商已经存在！','加工商管理提示')
        else begin
          application.MessageBox('数据保存成功！','加工商管理提示');
          edit1.Text:='';
          edit13.Text:='';
          edit2.Text:='';
          edit3.Text:='';
          edit4.Text:='';
          edit5.Text:='';
          edit6.Text:='';
          memo1.Text:='';
          edit1.SetFocus;
        end;
      end;
  except
    application.MessageBox('数据更新失败！','加工商管理提示');
  end else
    application.MessageBox('请将必填项填写完整！','加工商管理提示');
end;

procedure TForm51.Button3Click(Sender: TObject);
begin
  if (edit15.Text<>'') and (edit8.Text<>'') and (edit14.Text<>'') then
  try
    with zStoredProc1 do
    begin
      close;
      StoredProcName:='proc_update_gysinfo_by_gysid';
        ParamByName('jgsbh').Value:=edit15.Text;
        ParamByName('jgsmc').Value:=edit8.Text;
        ParamByName('jgsaddr').Value:=edit14.Text;
        ParamByName('jgszh').Value:=edit9.Text;
        ParamByName('jgskhh').Value:=edit10.Text;
        ParamByName('lxr').Value:=edit11.Text;
        ParamByName('lxrphone').Value:=edit12.Text;
        ParamByName('memo').Value:=memo2.Text;
      ExecProc;
      //fgysmc=gysmc,fgyszh=gyszh,fgyskhh=gyskhh,flxr=lxr,flxrphone=lxrphone,fmemo=memo
    end;
      application.MessageBox('数据保存成功！','加工商管理提示');
  except
    application.MessageBox('数据更新失败！','加工商管理提示');
  end;
end;

procedure TForm51.Edit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key=13 then
  try
    with zstoredproc1 do
    begin
      close;
      zstoredproc1.StoredProcName:='proc_cx_newjgsbh';
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
    application.MessageBox('数据查询失败！','加工商管理提示');
  end;
end;

procedure TForm51.Edit7KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=13) and (edit7.Text<>'') then
  try
    with zstoredproc1 do
    begin
      close;
      StoredProcName:='proc_cx_modijgsxx_by_jgsmc';
      ParamByName('jgsmc').Value:=edit7.Text;
      open;
      listbox1.Clear;
      while not eof do
      begin
        listbox1.Items.Add(fields[0].asstring);
        next;
      end;
      edit7.Text:='';
      listbox1.ItemIndex:=0;
    end;
  except
    application.MessageBox('数据查询失败！','加工商管理提示');
  end;
end;

procedure TForm51.ListBox1Click(Sender: TObject);
begin
  try
    if ListBox1.Items.Strings[ListBox1.itemindex]<>'' then
    try
      with zStoredProc1 do
      begin
        close;
        StoredProcName:='proc_cx_jgsinfo_jgsbh';
        ParamByName('jgsbh').Value:=SplitString(ListBox1.Items.Strings[ListBox1.itemindex],'|');
        open;
        if not eof then
        begin
          Edit15.Text := fields[1].AsString;
          Edit8.Text := fields[2].AsString;
          Edit14.Text := fields[3].AsString;
          Edit9.Text := fields[4].AsString;
          Edit10.Text := fields[5].AsString;
          Edit11.Text := fields[6].AsString;
          Edit12.Text := fields[7].AsString;
          Memo2.Text := fields[8].AsString;
        end;
      end;
    except
      application.MessageBox('数据查询失败！','供应商管理提示');
    end;
  except
    application.MessageBox('数据查询失败111！','供应商管理提示');
  end;
end;

end.
