unit qjcx;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, DB, ZAbstractRODataset, ZAbstractDataset,
  ZStoredProcedure, Grids, ComCtrls, Menus;

type
  TForm38 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    StringGrid1: TStringGrid;
    ComboBox2: TComboBox;
    Button1: TButton;
    ZStoredProc1: TZStoredProc;
    RadioGroup1: TRadioGroup;
    DateTimePicker1: TDateTimePicker;
    PopupMenu1: TPopupMenu;
    Execl1: TMenuItem;
    procedure ComboBox2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Button1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Execl1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form38: TForm38;
  function SplitString(Source, Deli: string ): String;stdcall;external 'dlltools.dll';
  Function ExportStrGridToExcel(Args: array of const): Boolean;stdcall;external 'dlltools.dll';

implementation

{$R *.dfm}

uses main;

procedure TForm38.Button1Click(Sender: TObject);
//begin         //proc_cx_qingjia_info_by_zgbh_cxxx
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
      StoredProcName:='proc_cx_qingjia_info_by_zgbh_cxxx';
      ParamByName('zgbh').Value:=SplitString(combobox2.Text,'|');
      ParamByName('qjsqdate').Value:=datetimepicker1.date;
      if radiogroup1.ItemIndex=0 then
        ParamByName('cxxx').Value:='year'
      else
        ParamByName('cxxx').Value:='month';
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
        stringgrid1.Cells[6,i]:=fields[5].AsString;
        stringgrid1.Cells[7,i]:=fields[6].AsString;
        stringgrid1.Cells[8,i]:=fields[7].AsString;
        stringgrid1.Rows[stringgrid1.RowCount-1].Clear;
        i:=i+1;
        next;
      end;
    end;
  except
    application.MessageBox('数据查询失败！','请假查询');
  end else
    application.MessageBox('请选择需要查询的职工名称！','请假查询');
end;

procedure TForm38.ComboBox2KeyDown(Sender: TObject; var Key: Word;
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
    application.MessageBox('数据查询失败！','请假查询');
  end;
 end;
end;

procedure TForm38.Execl1Click(Sender: TObject);
begin
  if stringgrid1.RowCount>2 then
    ExportStrGridToExcel([stringgrid1])
  else
    application.MessageBox('列表中没有任何数据！','请假查询提示');
end;

procedure TForm38.FormShow(Sender: TObject);
begin
  datetimepicker1.DateTime:=now();
  stringgrid1.Cells[0,0]:='序号';
  stringgrid1.Cells[1,0]:='请假单编号';
  stringgrid1.Cells[2,0]:='职工姓名';
  stringgrid1.Cells[3,0]:='申请日期';
  stringgrid1.Cells[4,0]:='假期起始日期';
  stringgrid1.Cells[5,0]:='假期结束日期';
  stringgrid1.Cells[6,0]:='假期类型';
  stringgrid1.Cells[7,0]:='请假理由';
  stringgrid1.Cells[8,0]:='操作人';
end;

end.
