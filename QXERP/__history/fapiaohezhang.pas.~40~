unit fapiaohezhang;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ZAbstractRODataset, ZAbstractDataset, ZStoredProcedure, StdCtrls,
  ExtCtrls, ComCtrls, Grids;

type
  TForm23 = class(TForm)
    ComboBox1: TComboBox;
    ZStoredProc1: TZStoredProc;
    Label1: TLabel;
    StringGrid1: TStringGrid;
    StringGrid2: TStringGrid;
    ListBox1: TListBox;
    Button1: TButton;
    Button2: TButton;
    Label2: TLabel;
    DateTimePicker1: TDateTimePicker;
    Label3: TLabel;
    Memo1: TMemo;
    Label4: TLabel;
    Button3: TButton;
    Bevel1: TBevel;
    Label5: TLabel;
    Label6: TLabel;
    Bevel2: TBevel;
    Bevel3: TBevel;
    Label7: TLabel;
    Edit1: TEdit;
    Button4: TButton;
    procedure ComboBox1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ComboBox1Select(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure StringGrid1SelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form23: TForm23;
  selARow:integer;
  function SplitString(Source, Deli: string ): String;stdcall;external 'dlltools.dll';

implementation

uses main;

{$R *.dfm}

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


procedure TForm23.Button1Click(Sender: TObject);
var
  i:integer;
  booldouble:boolean;
begin
  if selARow>0 then
  begin
  booldouble:=true;
  for i := 0 to listbox1.Items.Count - 1 do
    if trim(stringgrid1.Cells[1,selARow])=trim(listbox1.Items.Text) then
      booldouble:=false;
   if booldouble then
     listbox1.Items.Add(stringgrid1.Cells[1,selARow])
     else
     application.MessageBox('该入库单已经添加至待核帐列表!','发票核帐提示');
  end else
    application.MessageBox('请选择要添加的入库单纪录行!','发票核帐提示');
end;

procedure TForm23.Button2Click(Sender: TObject);
begin
  if application.MessageBox('确定要删除当前所选入库单吗？','入库单管理提示',1)=1 then
  listbox1.DeleteSelected;
end;

procedure TForm23.Button3Click(Sender: TObject);
var
  i:integer;
begin
  if (listbox1.Count>0) and (edit1.Text<>'') then
  try
    with zstoredproc1 do
    begin
      close;
      i:=0;
      StoredProcName:='proc_update_fphz_by_rkdbh';
      for i := 0 to listbox1.Count - 1 do
      begin
        ParamByName('rkdbh').Value:=ListBox1.Items.Strings[i];
        ParamByName('fpbh').Value:=edit1.Text;
        ParamByName('fpdate').Value:=datetimepicker1.Date;
        ParamByName('fpczry').Value:=main.strUser;
        ParamByName('fpmemo').Value:='*'+memo1.Text;
        //ffpbh=fpbh,ffpdate=fpdate,ffpczry=fpczry,ffpmemo=fpmemo
        execProc;
      end;
      application.MessageBox('数据保存成功!','发票核帐提示');
      combobox1.Text:='';
      stringgrid1.RowCount:=1;
      stringgrid2.RowCount:=1;
      listbox1.Items.Clear;
      edit1.Text:='';
      memo1.Text:='';
    end;
  except
    application.MessageBox(pwidechar('编号为：'+ListBox1.Items.ValueFromIndex[i]+'的数据保存失败!'),'发票核帐提示');
  end else
    application.MessageBox(pwidechar('请确认待入库分列表及发票编号已填写完整！'),'发票核帐提示');

end;

procedure TForm23.Button4Click(Sender: TObject);
begin
  combobox1.Text:='';
  stringgrid1.RowCount:=1;
  stringgrid2.RowCount:=1;
  listbox1.Items.Clear;
  edit1.Text:='';
  memo1.Text:='';
end;

procedure TForm23.ComboBox1KeyDown(Sender: TObject; var Key: Word;
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
        zstoredproc1.StoredProcName:='proc_cx_gysmc';
        zstoredproc1.ParamByName('gysname').Value:=ComboBox1.Text;
        open;
        while not eof do
        begin
          ComboBox1.Items.Add(fields[0].asstring);
          next;
        end;
        //combobox1.DroppedDown:=true;
      end;
  except
    application.MessageBox('数据查询失败！','发票核帐提示');
  end;
 end;
end;

procedure TForm23.ComboBox1Select(Sender: TObject);
begin
  try
    with zstoredproc1 do
    begin
      close;
      StoredProcName:='proc_cx_notcheckedformla';
      ParamByName('gysbh').Value:=SplitString(combobox1.Text,'|');
      open;
      if recordcount=0 then
        stringgrid1.RowCount:=1;
      while not eof do
      begin
        stringgrid1.RowCount:=stringgrid1.RowCount+1;
        stringgrid1.Cells[0,stringgrid1.RowCount-1]:=inttostr(stringgrid1.RowCount-1);
        stringgrid1.Cells[1,stringgrid1.RowCount-1]:=fields[0].AsString;
        stringgrid1.Cells[2,stringgrid1.RowCount-1]:=fields[1].AsString;
        stringgrid1.Cells[3,stringgrid1.RowCount-1]:=fields[2].AsString;
        stringgrid1.Cells[4,stringgrid1.RowCount-1]:=fields[3].AsString;
        next;
      end;
    end;
  except
    application.MessageBox('数据查询失败！','发票核帐提示');
  end;
end;

procedure TForm23.FormShow(Sender: TObject);
begin
  datetimepicker1.DateTime:=now();
  stringgrid1.Cells[0,0]:='序号';
  stringgrid1.Cells[1,0]:='入库编号';
  stringgrid1.Cells[2,0]:='入库日期';
  stringgrid1.Cells[3,0]:='操作人';
  stringgrid1.Cells[4,0]:='备注';
  stringgrid2.Cells[0,0]:='序号';
  stringgrid2.Cells[1,0]:='入库单编号';
  stringgrid2.Cells[2,0]:='物品名称';
  stringgrid2.Cells[3,0]:='入库数量';
  stringgrid2.Cells[4,0]:='单价';
  stringgrid2.Cells[5,0]:='备注';
end;

procedure TForm23.StringGrid1SelectCell(Sender: TObject; ACol, ARow: Integer;
  var CanSelect: Boolean);
var
  y:integer;
begin
  if stringgrid2.RowCount>0 then
  begin
    stringgrid2.RowCount:=1;
    selARow:=ARow;
  end else
    selARow:=0;
  if (ARow>0) and (ARow<stringgrid1.RowCount) then
    try
    y:=1;
      with zstoredproc1 do
      begin
        close;
        StoredProcName:='proc_cx_rkdmxz_by_rkdbh';
        ParamByName('rkdbh').Value:=stringgrid1.Cells[1,ARow];
        open;
        while not eof do
        begin
          stringgrid2.RowCount:=stringgrid2.RowCount+1;
          stringgrid2.Cells[0,y]:=inttostr(y);
          stringgrid2.Cells[1,y]:=fields[1].AsString;
          stringgrid2.Cells[2,y]:=fields[2].AsString;
          stringgrid2.Cells[3,y]:=fields[3].AsString;
          stringgrid2.Cells[4,y]:=fields[4].AsString;
          stringgrid2.Cells[5,y]:=fields[5].AsString;
          y:=y+1;
          next;
        end;
      end;
    except
      application.MessageBox('数据查询失败！','发票核帐提示');
    end;
end;

end.
