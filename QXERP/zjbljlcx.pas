unit zjbljlcx;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DB, ZAbstractRODataset, ZAbstractDataset, ZStoredProcedure,
  ComCtrls, StdCtrls, ExtCtrls, Menus;

type
  TForm49 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    ComboBox2: TComboBox;
    Button1: TButton;
    RadioGroup1: TRadioGroup;
    DateTimePicker1: TDateTimePicker;
    ZStoredProc1: TZStoredProc;
    StringGrid1: TStringGrid;
    PopupMenu1: TPopupMenu;
    Execl1: TMenuItem;
    Button2: TButton;
    procedure ComboBox2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Button1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Execl1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form49: TForm49;
  function SplitString(Source, Deli: string ): String;stdcall;external 'dlltools.dll';
  Function ExportStrGridToExcel(Args: array of const): Boolean;stdcall;external 'dlltools.dll';
implementation
uses main;

{$R *.dfm}

procedure TForm49.Button1Click(Sender: TObject);
var
  i:integer;
begin
  if combobox2.Text<>'' then
  try
    with zStoredProc1 do
    begin
      stringgrid1.RowCount:=2;
      stringgrid1.Rows[1].Clear;
      Close;
      StoredProcName:='proc_zhijianbuliangjilu_by_zgbh_zjdate_cxxx';
      ParamByName('zgbh').Value:=SplitString(combobox2.Text,'|');
      ParamByName('zjdate').Value:=datetimepicker1.date;
      if radiogroup1.ItemIndex=2 then
        ParamByName('cxxx').Value:='all';
      if radiogroup1.ItemIndex=0 then
        ParamByName('cxxx').Value:='month';
      if radiogroup1.ItemIndex=1 then
        ParamByName('cxxx').Value:='year';
      open;
      i:=1;
      while not eof do
      begin
        stringgrid1.RowCount:=stringgrid1.RowCount+1;
        stringgrid1.Cells[0,i]:=inttostr(i);
        stringgrid1.Cells[1,i]:=fields[0].AsString;
        stringgrid1.Cells[2,i]:=fields[1].AsString;
        stringgrid1.Cells[3,i]:=fields[2].AsString;
        stringgrid1.Cells[4,i]:=fields[3].AsString;
        stringgrid1.Cells[5,i]:=fields[4].AsString;
        stringgrid1.Rows[stringgrid1.RowCount-1].Clear;
        i:=i+1;
        next;
      end;
    end;
  except
    application.MessageBox('数据查询失败！','不良质检记录查询');
  end else
    application.MessageBox('请选择需要查询的职工名称！','不良质检记录查询');
end;

procedure TForm49.Button2Click(Sender: TObject);
begin
  form1.RvDataSetConnection1.DataSet:=zstoredProc1;
  if stringgrid1.RowCount>2 then
  try
    with zStoredProc1 do
    begin
      Close;
      StoredProcName:='proc_zhijianbuliangjilu_by_zgbh_zjdate_cxxx';
      ParamByName('zgbh').Value:=SplitString(combobox2.Text,'|');
      ParamByName('zjdate').Value:=datetimepicker1.date;
      if radiogroup1.ItemIndex=2 then
        ParamByName('cxxx').Value:='all';
      if radiogroup1.ItemIndex=0 then
        ParamByName('cxxx').Value:='month';
      if radiogroup1.ItemIndex=1 then
        ParamByName('cxxx').Value:='year';
      open;
      with form1 do
      begin
        rvproject1.Open;
        rvproject1.SelectReport('zjreport',true);
        rvproject1.ClearParams;
        rvproject1.SetParam('czry',main.strUser);
        RvProject1.Execute;
        rvproject1.Close;
      end;
    end;
  except
    application.MessageBox('数据查询失败！','不良质检报告打印');
  end else
    application.MessageBox('当前不良记录为空！','不良质检报告打印');
end;

procedure TForm49.ComboBox2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if key=13 then
 begin
    if combobox2.Items.Count>0 then
    ComboBox2.Items.Clear;
    combobox2.Items.Add('*|全部');
    try
      with zstoredproc1 do
      begin
        close;
        zstoredproc1.StoredProcName:='proc_cx_zgbhandxm_by_zgxm';
        zstoredproc1.ParamByName('zgxm').Value:=ComboBox2.Text;
        open;
        while not eof do
        begin
          ComboBox2.Items.Add(fields[0].asstring);
          next;
        end;
        //combobox1.DroppedDown:=true;
      end;
  except
    application.MessageBox('数据查询失败！','不良质检记录查询');
  end;
 end;
end;

procedure TForm49.Execl1Click(Sender: TObject);
begin
  if stringgrid1.RowCount>2 then
    ExportStrGridToExcel([stringgrid1])
  else
    application.MessageBox('列表中没有任何数据！','不良质检记录查询');
end;

procedure TForm49.FormShow(Sender: TObject);
begin
  datetimepicker1.DateTime:=now();
  stringgrid1.Cells[0,0]:='序号';
  stringgrid1.Cells[1,0]:='职工姓名';
  stringgrid1.Cells[2,0]:='产品类型';
  stringgrid1.Cells[3,0]:='质检日期';
  stringgrid1.Cells[4,0]:='记录人';
  stringgrid1.Cells[5,0]:='不良质检情况';
end;

end.
