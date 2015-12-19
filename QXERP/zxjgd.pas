unit zxjgd;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, DB, ZAbstractRODataset, ZAbstractDataset, ZStoredProcedure,
  StdCtrls, Grids, ComCtrls, ExtCtrls;

type
  TForm50 = class(TForm)
    Bevel1: TBevel;
    Label2: TLabel;
    Label3: TLabel;
    Label1: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label16: TLabel;
    ComboBoxEx1: TComboBoxEx;
    Edit2: TEdit;
    Edit3: TEdit;
    DateTimePicker1: TDateTimePicker;
    Button1: TButton;
    Memo1: TMemo;
    StringGrid1: TStringGrid;
    Edit4: TEdit;
    ComboBox1: TComboBox;
    Button2: TButton;
    Edit5: TEdit;
    ZStoredProc1: TZStoredProc;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    Label10: TLabel;
    Edit1: TEdit;
    procedure Button1Click(Sender: TObject);
    procedure Edit4KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure ComboBox1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ComboBoxEx1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ComboBoxEx1Select(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Edit2KeyPress(Sender: TObject; var Key: Char);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form50: TForm50;
  selRowIndex:integer;
  function SplitString(Source, Deli: string ): String;stdcall;external 'dlltools.dll';

implementation

uses main;

{$R *.dfm}

procedure TForm50.Button1Click(Sender: TObject);
var
  y:integer;
begin
if application.MessageBox('确定要保存数据吗？','新增加工单管理提示',1)=1 then
  if stringgrid1.RowCount>1 then
    try
      with zstoredproc1 do
      begin
        close;
        zstoredproc1.StoredProcName:='proc_insert_jiagongdan_info';  //jgdbh,jgddate,jgsbh,czry,memo
        zstoredproc1.ParamByName('jgdbh').Value:=edit4.Text;
        zstoredproc1.ParamByName('jgsbh').Value:=splitstring(ComboBox1.Text,'|');
        zstoredproc1.ParamByName('jgddate').Value:=datetimepicker1.Date;
        zstoredproc1.ParamByName('czry').Value:=main.strUser;
        zstoredproc1.ParamByName('memo').Value:='*'+memo1.Text;
        execProc;
        zstoredproc1.StoredProcName:='proc_insert_jiagongdan_mxz';  //jgdbh,pjbh,pjsl,jgprice,memo
        for y := 1 to stringgrid1.RowCount - 1 do
        begin
          zstoredproc1.ParamByName('jgdbh').Value:=edit4.Text;
          zstoredproc1.ParamByName('pjbh').Value:=splitstring(stringgrid1.Cells[1,y],'|');
          zstoredproc1.ParamByName('pjsl').Value:=stringgrid1.Cells[2,y];
          zstoredproc1.ParamByName('jgprice').Value:=stringgrid1.Cells[3,y];
          zstoredproc1.ParamByName('memo').Value:='*'+stringgrid1.Cells[4,y];
          execProc;
        end;
      end;
      application.MessageBox('保存数据成功！','新增加工单管理提示');
      edit1.Text:='';
      edit2.Text:='';
      edit3.Text:='';
      edit4.Text:='';
      edit5.Text:='';
      comboboxex1.Text:='';
      combobox1.Text:='';
      memo1.Text:='';
      stringgrid1.RowCount:=1;
  except
    application.MessageBox('保存数据失败！','新增加工单管理提示');
  end else
    application.MessageBox('请添加加工单内的明细！','新增加工单管理提示');
end;

procedure TForm50.Button2Click(Sender: TObject);
var
  gjprice:string;
begin
  if (edit1.Text<>'') then
    gjprice:=edit1.Text
  else
    gjprice:=edit3.Text;
  if (edit4.Text<>'') and (combobox1.Text<>'') then
    if (comboboxex1.Text<>'') and (edit2.Text<>'') and (edit3.Text<>'') then
      if (strtofloat(edit3.Text)>=strtofloat(gjprice)) then
      begin
        stringgrid1.RowCount:=stringgrid1.RowCount+1;
        stringgrid1.Cells[0,stringgrid1.RowCount-1]:=inttostr(stringgrid1.RowCount-1);
        stringgrid1.Cells[1,stringgrid1.RowCount-1]:=comboboxex1.Text;
        stringgrid1.Cells[2,stringgrid1.RowCount-1]:=edit2.Text;
        stringgrid1.Cells[3,stringgrid1.RowCount-1]:=gjprice;
        stringgrid1.Cells[4,stringgrid1.RowCount-1]:=edit5.Text;
        ComboBoxEx1.Text:='';
        edit3.Text:='';
        edit5.Text:='';
        edit1.Text:='';
        ComboBoxEx1.SetFocus;
        end else
          application.MessageBox('实际价格大于参考价格！','新增加工单管理提示')
      else
        application.MessageBox('请将明细填写！','新增加工单管理提示')
    else
      application.MessageBox('请先将加工单信息填写完整！','新增加工单管理提示');
end;

procedure TForm50.ComboBox1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if key=13 then
 begin
    if combobox1.Items.Count>0 then
    ComboBox1.Items.Clear;
    try
      with zstoredproc1 do
      begin
        close;
        zstoredproc1.StoredProcName:='proc_cx_jgsmc';
        zstoredproc1.ParamByName('jgsname').Value:=ComboBox1.Text;
        open;
        while not eof do
        begin
          ComboBox1.Items.Add(fields[0].asstring);
          next;
        end;
        //combobox1.DroppedDown:=true;
      end;
  except
    application.MessageBox('数据查询失败！','新增加工单管理提示');
  end;
 end;
end;

procedure TForm50.ComboBoxEx1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=13) and (ComboBoxEx1.Text<>'') then
   begin
      edit1.Text:='';
      if ComboBoxEx1.Items.Count>0 then
      ComboBoxEx1.Items.Clear;
      //combobox1.Items.Add('*|全部供应商');
      try
        with zstoredproc1 do
        begin
          close;
          StoredProcName:='proc_cx_bcplxk_bcpbh';
          ParamByName('bcpmc').Value:=ComboBoxEx1.Text;
          open;
          while not eof do
          begin
            ComboBoxEx1.Items.Add(fields[0].asstring);
            next;
          end;
          //combobox1.DroppedDown:=true;
        end;
      except
        application.MessageBox('数据查询失败！','新增加工单管理提示');
      end;
  end;
end;

procedure TForm50.ComboBoxEx1Select(Sender: TObject);
begin
  try
    with zStoredProc1 do
    begin
      close;
      StoredProcName:='proc_cx_waixiepeijian_jgprice_by_pjbh';
      ParamByName('gjbh').Value:=SplitString(ComboBoxEx1.Text,'|');
      open;
      if not eof then
        edit3.Text:=fields[0].AsString
      else
        application.MessageBox('该物品不存在！','新增加工单管理提示');
    end;
  except
    application.MessageBox('数据查询失败！','新增加工单管理提示');
  end;
end;

procedure TForm50.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
  if not charinset(key,['-','0'..'9','.',#8]) then
    key:=#0;
  if (key='.') and (Pos('.',Edit2.Text)>0)   then
    key:=#0;
      if (key='-') and (Pos('-',Edit2.Text)>0)   then
    key:=#0;
end;

procedure TForm50.Edit2KeyPress(Sender: TObject; var Key: Char);
begin
  if not charinset(key,['-','0'..'9','.',#8]) then
    key:=#0;
  if (key='.') and (Pos('.',Edit2.Text)>0)   then
    key:=#0;
      if (key='-') and (Pos('-',Edit2.Text)>0)   then
    key:=#0;
end;

procedure TForm50.Edit4KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key=13 then
    try
      with zstoredproc1 do
      begin
        close;
        zstoredproc1.StoredProcName:='proc_cx_newwxjgdbh';
        open;
        if fields[0].AsString<>'' then
          edit4.Text:=fields[0].AsString
        else
          edit4.Text:=formatDateTime('yyyy',date)+'0001';
      end;
    except
      application.MessageBox('数据查询失败！','新增加工单管理提示');
    end;
end;

procedure TForm50.FormShow(Sender: TObject);
begin
  datetimepicker1.DateTime:=now();
  stringgrid1.Cells[0,0]:='序号';
  stringgrid1.Cells[1,0]:='配件编号';
  stringgrid1.Cells[2,0]:='加工数量';
  stringgrid1.Cells[3,0]:='加工单价';
  stringgrid1.Cells[4,0]:='备注';
end;

end.
