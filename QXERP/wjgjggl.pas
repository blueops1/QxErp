unit wjgjggl;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, DB, ZAbstractRODataset, ZAbstractDataset,
  ZStoredProcedure;

type
  TForm58 = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Label1: TLabel;
    ComboBox1: TComboBox;
    Label2: TLabel;
    Edit1: TEdit;
    Memo1: TMemo;
    Label3: TLabel;
    Button1: TButton;
    Button2: TButton;
    ComboBox2: TComboBox;
    Label4: TLabel;
    TabSheet3: TTabSheet;
    ZStoredProc1: TZStoredProc;
    Label6: TLabel;
    Label7: TLabel;
    Edit2: TEdit;
    Label8: TLabel;
    Memo2: TMemo;
    Button3: TButton;
    Button4: TButton;
    ListBox1: TListBox;
    Edit3: TEdit;
    Edit4: TEdit;
    Label5: TLabel;
    Edit5: TEdit;
    Label9: TLabel;
    Edit6: TEdit;
    procedure ComboBox2DropDown(Sender: TObject);
    procedure ComboBox1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Button1Click(Sender: TObject);
    procedure Edit3KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure ListBox1Click(Sender: TObject);
    procedure Edit2KeyPress(Sender: TObject; var Key: Char);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Edit6KeyPress(Sender: TObject; var Key: Char);
    procedure Edit5KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form58: TForm58;

implementation
  uses main;

{$R *.dfm}

procedure TForm58.Button1Click(Sender: TObject);
begin
  if (combobox2.Text<>'') and (combobox1.Text<>'') and (edit1.Text<>'') then
    try             //proc_insert_wxjgprice_info
      with zStoredProc1 do
      begin
        close;
        StoredProcName:='proc_insert_wxjgprice_info';    //gjbh,gjzlbh,jgprice,memo
        ParamByName('gjbh').Value:=SplitString(combobox1.Text,'|');
        ParamByName('gjzlbh').Value:=SplitString(combobox2.Text,'|');
        ParamByName('jgprice').Value:=edit1.Text;
        ParamByName('jgprice1').Value:=edit5.Text;
        ParamByName('memo').Value:='*'+memo1.Text;
        ExecProc;
        if ParamByName('returncode').Value=1 then
          application.MessageBox('该产品价格信息已经存在！','加工价格管理提示')
        else begin
          application.MessageBox('数据保存成功！','加工价格管理提示');
          edit1.Text:='';
          combobox1.Text:='';
          memo1.Text:='';
          combobox1.SetFocus;
        end;
      end;
  except
    application.MessageBox('数据保存失败！','加工价格管理提示');
  end else
    application.MessageBox('请将必填项填写完整！','加工价格管理提示');
end;

procedure TForm58.Button2Click(Sender: TObject);
begin
  edit1.Text:='';
  combobox1.Text:='';
  memo1.Text:='';
  combobox1.SetFocus;
end;

procedure TForm58.Button3Click(Sender: TObject);
begin   //proc_update_wxjggj_info
  if (edit2.Text<>'') and (edit4.Text<>'') then
    try             //proc_insert_wxjgprice_info
      with zStoredProc1 do
      begin
        close;
        StoredProcName:='proc_update_wxjggj_info';    //IN `id` char(10),IN `jgprice` double,IN `memo` text,gjzlbh,jgprice,memo
        ParamByName('id').Value:=SplitString(edit4.Text,'|');
        ParamByName('jgprice').Value:=edit2.Text;
        ParamByName('jgprice1').Value:=edit6.Text;
        ParamByName('memo').Value:=memo2.Text;
        ExecProc;
        application.MessageBox('数据更新成功！','加工价格管理提示');
          edit2.Text:='';
          edit4.Text:='';
          memo2.Text:='';
          edit3.SetFocus;
        end;
    except
      application.MessageBox('数据更新失败！','加工价格管理提示');
    end else
      application.MessageBox('请将必填项填写完整！','加工价格管理提示');
end;

procedure TForm58.Button4Click(Sender: TObject);
begin
  edit2.Text:='';
  edit4.Text:='';
  memo2.Text:='';
  edit3.SetFocus;
end;

procedure TForm58.ComboBox1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key=13 then
    if(combobox2.Text<>'') then
      try
        with zStoredProc1 do
        begin
          close;
          if (SplitString(combobox2.Text,'|')='1') then
          begin
          StoredProcName:='proc_cx_bcplxk_bcpbh';
          zstoredproc1.ParamByName('bcpmc').Value:=combobox1.Text;
          end;
          if (SplitString(combobox2.Text,'|')='2') then
          begin
          StoredProcName:='proc_cx_cmlxk_cpbhandmcandzl_by_cpmc';
          zstoredproc1.ParamByName('cpmc').Value:=combobox1.Text;
          end;
          if (SplitString(combobox2.Text,'|')='3') then
          begin
          StoredProcName:='proc_cx_ckitemmc';
          zstoredproc1.ParamByName('itemname').Value:=combobox1.Text;
          end;
          open;
          if combobox1.Items.Count>0 then
            combobox1.Items.Clear;
           while not eof do
          begin
            ComboBox1.Items.Add(fields[0].asstring);
            next;
          end;
        end;
      except
        application.MessageBox('查询数据失败！','加工价格信息管理提示');
      end else
        application.MessageBox('请先选择加工类型！','加工价格信息管理提示');
end;

procedure TForm58.ComboBox2DropDown(Sender: TObject);
begin
  if combobox2.Items.Count>0 then
    combobox2.Items.Clear;
    try
      with zStoredProc1 do
      begin
        close;
        StoredProcName:='proc_cx_wxjgzl';
        open;
        while not eof do
        begin
          combobox2.Items.Add(fields[0].asstring);
          next;
        end;
      end;
    except
      application.MessageBox('查询数据失败！','加工价格信息管理提示');
    end;
end;

procedure TForm58.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
  if not charinset(key,['0'..'9','.',#8]) then
    key:=#0;
  if (key='.') and (Pos('.',Edit1.Text)>0)   then
    key:=#0;
end;

procedure TForm58.Edit2KeyPress(Sender: TObject; var Key: Char);
begin
  if not charinset(key,['0'..'9','.',#8]) then
    key:=#0;
  if (key='.') and (Pos('.',Edit2.Text)>0)   then
    key:=#0;
end;

procedure TForm58.Edit3KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if key=13 then
 begin
    listbox1.Clear;
    //combobox1.Items.Add('*|全部供应商');
    try
      with zstoredproc1 do
      begin
        close;
        StoredProcName:='proc_cx_wxjgjg_info_by_cxmc';
        ParamByName('cxmc').Value:=edit3.Text;
        open;
        firstresultset;
        while not eof do
        begin
        listbox1.Items.Append(fields[0].AsString);
        next;
        end;
        nextresultset;
        while not eof do
        begin
        listbox1.Items.Append(fields[0].AsString);
        next;
        end;
        nextresultset;
        while not eof do
        begin
        listbox1.Items.Append(fields[0].AsString);
        next;
        end;
        //combobox1.DroppedDown:=true;
      end;
  except
    application.MessageBox('数据查询失败！','加工价格信息管理提示');
  end;
 end;
end;

procedure TForm58.Edit5KeyPress(Sender: TObject; var Key: Char);
begin
  if not charinset(key,['0'..'9','.',#8]) then
    key:=#0;
  if (key='.') and (Pos('.',Edit5.Text)>0)   then
    key:=#0;
end;

procedure TForm58.Edit6KeyPress(Sender: TObject; var Key: Char);
begin
  if not charinset(key,['0'..'9','.',#8]) then
    key:=#0;
  if (key='.') and (Pos('.',Edit6.Text)>0)   then
    key:=#0;
end;

procedure TForm58.ListBox1Click(Sender: TObject);
begin
  if listbox1.ItemIndex>=0 then
  begin
    edit4.Text:=listbox1.Items.Strings[listbox1.itemindex];
    try                    //proc_cx_wxjgprice_by_id
    with zStoredProc1 do
      begin
        close;
        StoredProcName:='proc_cx_wxjgprice_by_id';
        ParamByName('id').Value:=SplitString(edit4.Text,'|');
        open;
        if not eof then
        begin
          edit2.Text:=fields[0].AsString;
          edit6.Text:=fields[1].AsString;
          memo2.Text:=fields[2].AsString;
        end;
      end;
    except
      application.MessageBox('数据查询失败！','加工价格信息管理提示');
    end;
  end;
end;

end.
