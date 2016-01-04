unit xzht;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, ComCtrls, DB, ZAbstractRODataset, ZAbstractDataset,
  ZStoredProcedure, Menus;

type
  TForm28 = class(TForm)
    Label1: TLabel;
    Edit1: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label13: TLabel;
    Label19: TLabel;
    Edit11: TEdit;
    Label20: TLabel;
    Edit12: TEdit;
    Label21: TLabel;
    Edit13: TEdit;
    Label22: TLabel;
    ComboBox1: TComboBox;
    DateTimePicker1: TDateTimePicker;
    StringGrid1: TStringGrid;
    Label9: TLabel;
    Label10: TLabel;
    Edit7: TEdit;
    Label11: TLabel;
    Edit8: TEdit;
    Button1: TButton;
    Button2: TButton;
    ZStoredProc1: TZStoredProc;
    ComboBox3: TComboBox;
    Memo1: TMemo;
    ComboBox4: TComboBox;
    Edit2: TEdit;
    Label16: TLabel;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    procedure FormShow(Sender: TObject);
    procedure Edit1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure ComboBox1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ComboBox3KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ComboBox4KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Edit7KeyPress(Sender: TObject; var Key: Char);
    procedure Edit8KeyPress(Sender: TObject; var Key: Char);
    procedure Button1Click(Sender: TObject);
    procedure ComboBox1Select(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure StringGrid1SelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure ComboBox4Select(Sender: TObject);
    procedure Edit7KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Edit8KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form28: TForm28;
  selRowIndex:integer;
  function SplitString(Source, Deli: string ): String;stdcall;external 'dlltools.dll';

implementation

{$R *.dfm}

uses main;


procedure DeleteStringGridRow(vRow: Integer; StringGrid: TStringGrid);
var
  i:Integer;
begin
  if StringGrid.RowCount > vRow then
  begin
    for i:= vRow to StringGrid.RowCount - vRow do
    begin
      StringGrid.Rows[i]:= StringGrid.Rows[i+1];
    end;
    StringGrid.RowCount := StringGrid.RowCount - 1;
  end;
end;

procedure TForm28.Button1Click(Sender: TObject);
begin
  if (edit1.Text<>'') and (edit1.Text<>'') and (combobox1.Text<>'')and (edit2.Text<>'') and (combobox3.Text<>'') then
    if (edit7.Text<>'') and (edit8.Text<>'') and (combobox4.Text<>'') then
      begin
        stringgrid1.RowCount:=stringgrid1.RowCount+1;
        stringgrid1.Cells[0,stringgrid1.RowCount-1]:=inttostr(stringgrid1.RowCount-1);
        stringgrid1.Cells[1,stringgrid1.RowCount-1]:=combobox4.Text;
        stringgrid1.Cells[2,stringgrid1.RowCount-1]:=edit7.Text;
        stringgrid1.Cells[3,stringgrid1.RowCount-1]:=edit8.Text;
        edit11.Text:=floattostr(strtofloat(edit11.Text)+strtofloat(stringgrid1.Cells[2,stringgrid1.RowCount-1])*strtofloat(stringgrid1.Cells[3,stringgrid1.RowCount-1]));
        combobox4.Text:='';
        edit7.Text:='';
        edit8.Text:='';
        combobox4.SetFocus;
      end else
      application.MessageBox('请将明细填写！','新增合同提示')
  else
    application.MessageBox('请先将合同信息填写完整！','新增合同提示');
end;

procedure TForm28.Button2Click(Sender: TObject);
var
  y:integer;
begin
//proc_insert_htinfo_yskxx htbh,khbh,zgdwbh,htdate,xsybh,lxr,lxrdh,htzje,memo
//proc_insert_htcpmxb htbh,cpbh,cpdj,cpsl
if application.MessageBox('确定要保存数据吗？','新增合同提示',1)=1 then
  if stringgrid1.RowCount>1 then
    try
      with zstoredproc1 do
      begin
        close;
        zstoredproc1.StoredProcName:='proc_insert_htinfo_yskxx';
        zstoredproc1.ParamByName('htbh').Value:=edit1.Text;
        zstoredproc1.ParamByName('khbh').Value:=splitstring(ComboBox1.Text,'|');
        zstoredproc1.ParamByName('zgdwbh').Value:=splitstring(edit2.Text,'|');
        zstoredproc1.ParamByName('htdate').Value:=datetimepicker1.Date;
        zstoredproc1.ParamByName('xsybh').Value:=splitstring(ComboBox3.Text,'|');
        zstoredproc1.ParamByName('lxr').Value:=edit12.Text;
        zstoredproc1.ParamByName('lxrdh').Value:=edit13.Text;
        zstoredproc1.ParamByName('htzje').Value:=edit11.Text;
        zstoredproc1.ParamByName('memo').Value:='*'+memo1.Text;
        execProc;
        zstoredproc1.StoredProcName:='proc_insert_htcpmxb';
        for y := 1 to stringgrid1.RowCount - 1 do
        begin
          zstoredproc1.ParamByName('htbh').Value:=edit1.Text;
          zstoredproc1.ParamByName('cpbh').Value:=splitstring(stringgrid1.Cells[1,y],'|');
          zstoredproc1.ParamByName('cpdj').Value:=stringgrid1.Cells[2,y];
          zstoredproc1.ParamByName('cpsl').Value:=stringgrid1.Cells[3,y];
          execProc;
        end;
      end;
      application.MessageBox('保存数据成功！','新增合同提示');
      edit1.Text:='';
      edit2.Text:='';
      edit11.Text:='0';
      edit12.Text:='';
      edit13.Text:='';
      combobox1.Text:='';
      combobox3.Text:='';
      memo1.Text:='';
      stringgrid1.RowCount:=1;
  except
    application.MessageBox('保存数据失败！','新增合同提示');
  end else
    application.MessageBox('请添加合同内的销售明细！','新增合同提示');

end;

procedure TForm28.ComboBox1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin      //proc_cx_khandzgdwandxsy_by_cxitemandcxmc
 if key=13 then
 begin
    if combobox1.Items.Count>0 then
    ComboBox1.Items.Clear;
    //combobox1.Items.Add('*|全部供应商');
    try
      with zstoredproc1 do
      begin
        close;
        zstoredproc1.StoredProcName:='proc_cx_khandzgdwandxsy_by_cxitemandcxmc';
        zstoredproc1.ParamByName('cxitem').Value:='kh';
        zstoredproc1.ParamByName('cxmc').Value:=ComboBox1.Text;
        open;
        while not eof do
        begin
          ComboBox1.Items.Add(fields[0].asstring);
          next;
        end;
        //combobox1.DroppedDown:=true;
      end;
  except
    application.MessageBox('数据查询失败！','新增合同提示');
  end;
 end;
end;

procedure TForm28.ComboBox1Select(Sender: TObject);
begin
    try
      with zstoredproc1 do
      begin
        close;
        zstoredproc1.StoredProcName:='proc_cx_khandzgdwandxsy_by_cxitemandcxmc';
        zstoredproc1.ParamByName('cxitem').Value:='zgbykh';
        zstoredproc1.ParamByName('cxmc').Value:=SplitString(ComboBox1.Text,'|');
        open;
        if not eof then
        begin
          edit2.Text:=fields[0].asstring;
          edit12.Text:=fields[1].asstring;
          edit13.Text:=fields[2].asstring;
        end;
        //combobox1.DroppedDown:=true;
      end;
  except
    application.MessageBox('数据查询失败！','新增合同提示');
  end;
end;

procedure TForm28.ComboBox3KeyDown(Sender: TObject; var Key: Word;
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
        zstoredproc1.StoredProcName:='proc_cx_khandzgdwandxsy_by_cxitemandcxmc';
        zstoredproc1.ParamByName('cxitem').Value:='xsy';
        zstoredproc1.ParamByName('cxmc').Value:=ComboBox3.Text;
        open;
        while not eof do
        begin
          ComboBox3.Items.Add(fields[0].asstring);
          next;
        end;
        //combobox1.DroppedDown:=true;
      end;
  except
    application.MessageBox('数据查询失败！','非产品出库管理提示');
  end;
 end;
end;

procedure TForm28.ComboBox4KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin                //proc_cx_cmlxk_cpbhandmcandzl_by_cpmc
 if key=13 then
 begin
    if combobox4.Items.Count>0 then
    ComboBox4.Items.Clear;
    //combobox1.Items.Add('*|全部供应商');
    try
      with zstoredproc1 do
      begin
        close;
        zstoredproc1.StoredProcName:='proc_cx_cmlxk_cpbhandmcandzl_by_cpmc';
        zstoredproc1.ParamByName('cpmc').Value:=ComboBox4.Text;
        open;
        while not eof do
        begin
          ComboBox4.Items.Add(fields[0].asstring);
          next;
        end;
        //combobox1.DroppedDown:=true;
      end;
  except
    application.MessageBox('数据查询失败！','新增合同提示');
  end;
 end;
end;

procedure TForm28.ComboBox4Select(Sender: TObject);
begin
  edit7.SetFocus;
end;

procedure TForm28.Edit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key=13 then
  try
  with  zStoredProc1 do
  begin
    close;
    StoredProcName:='proc_cx_newhtbh';
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

procedure TForm28.Edit7KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key=13 then
    edit8.SetFocus;
end;

procedure TForm28.Edit7KeyPress(Sender: TObject; var Key: Char);
begin
  if not charinset(key,['0'..'9','.',#8]) then
    key:=#0;
  if (key='.') and (Pos('.',Edit7.Text)>0)   then
    key:=#0;
end;

procedure TForm28.Edit8KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key=13 then
    button1.SetFocus;
end;

procedure TForm28.Edit8KeyPress(Sender: TObject; var Key: Char);
begin
  if not charinset(key,['0'..'9','.',#8]) then
    key:=#0;
  if (key='.') and (Pos('.',Edit8.Text)>0)   then
    key:=#0;
end;

procedure TForm28.FormShow(Sender: TObject);
begin
  datetimepicker1.Date:=now();
  stringgrid1.Cells[0,0]:='序号';
  stringgrid1.Cells[1,0]:='产品编号';
  stringgrid1.Cells[2,0]:='产品单价';
  stringgrid1.Cells[3,0]:='产品数量';
end;

procedure TForm28.N1Click(Sender: TObject);
begin
  if (selRowIndex>0) and (selRowIndex<stringgrid1.RowCount) then
  begin
    edit11.Text:=floattostr(strtofloat(edit11.Text)-strtofloat(stringgrid1.Cells[2,selRowIndex])*strtofloat(stringgrid1.Cells[3,selRowIndex]));
    DeleteStringGridRow(selRowIndex,stringgrid1);
  end;
end;

procedure TForm28.StringGrid1SelectCell(Sender: TObject; ACol, ARow: Integer;
  var CanSelect: Boolean);
begin
  selRowIndex:=ARow;
end;

end.
