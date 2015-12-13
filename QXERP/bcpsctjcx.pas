unit bcpsctjcx;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ZAbstractRODataset, ZAbstractDataset, ZStoredProcedure, StdCtrls,
  ExtCtrls, Grids, ComCtrls, Menus;

type
  TForm47 = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Label2: TLabel;
    Label3: TLabel;
    DateTimePicker1: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
    Button1: TButton;
    StringGrid1: TStringGrid;
    StringGrid2: TStringGrid;
    TabSheet2: TTabSheet;
    DateTimePicker3: TDateTimePicker;
    Button2: TButton;
    StringGrid3: TStringGrid;
    StringGrid4: TStringGrid;
    ZStoredProc1: TZStoredProc;
    RadioGroup5: TRadioGroup;
    PopupMenu1: TPopupMenu;
    Execl1: TMenuItem;
    PopupMenu2: TPopupMenu;
    MenuItem1: TMenuItem;
    PopupMenu3: TPopupMenu;
    MenuItem2: TMenuItem;
    PopupMenu4: TPopupMenu;
    MenuItem3: TMenuItem;
    TabSheet3: TTabSheet;
    StringGrid5: TStringGrid;
    StringGrid6: TStringGrid;
    Button3: TButton;
    PopupMenu5: TPopupMenu;
    MenuItem4: TMenuItem;
    PopupMenu6: TPopupMenu;
    MenuItem5: TMenuItem;
    procedure Button1Click(Sender: TObject);
    procedure TabSheet1Show(Sender: TObject);
    procedure StringGrid1SelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure Button2Click(Sender: TObject);
    procedure StringGrid3SelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure TabSheet2Show(Sender: TObject);
    procedure Execl1Click(Sender: TObject);
    procedure MenuItem1Click(Sender: TObject);
    procedure MenuItem2Click(Sender: TObject);
    procedure MenuItem3Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure StringGrid5SelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure TabSheet3Show(Sender: TObject);
    procedure MenuItem4Click(Sender: TObject);
    procedure MenuItem5Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form47: TForm47;
  boolReaded:boolean;
  intSelARow:integer;
  Function ExportStrGridToExcel(Args: array of const): Boolean;stdcall;external 'dlltools.dll';

implementation

uses main;

{$R *.dfm}

procedure TForm47.Button1Click(Sender: TObject);
var y:integer;
begin
  y:=1;
  stringgrid1.RowCount:=2;
  stringgrid1.Rows[1].Clear;
  try
    with zStoredProc1 do
    begin
      close;
      StoredProcName:='proc_bcpcxtj_by_jzdate';
      ParamByName('jzdate1').Value:=datetimepicker1.DateTime;
      ParamByName('jzdate2').Value:=datetimepicker2.DateTime;
      open;
      boolReaded:=false;
      FirstResultSet;
      while not eof do
      begin
        stringgrid1.RowCount:=stringgrid1.RowCount+1;
        stringgrid1.Cells[0,y]:=fields[0].AsString;
        stringgrid1.Cells[1,y]:=fields[1].AsString;
        stringgrid1.Cells[2,y]:=fields[2].AsString;
        stringgrid1.Cells[3,y]:=fields[3].AsString;
        stringgrid1.Cells[4,y]:=fields[4].AsString;
        y := y +1;
        stringgrid1.Rows[stringgrid1.RowCount-1].Clear;
        next;
      end;
      NextResultSet;
      if not eof then
      begin
        stringgrid1.RowCount:=stringgrid1.RowCount+1;
        stringgrid1.Cells[0,y]:=fields[0].AsString;
        stringgrid1.Cells[1,y]:=fields[1].AsString;
        stringgrid1.Cells[2,y]:=fields[2].AsString;
        stringgrid1.Cells[3,y]:=fields[3].AsString;
        stringgrid1.Cells[4,y]:=fields[4].AsString;
        stringgrid1.Rows[stringgrid1.RowCount-1].Clear;
      end;
      boolReaded:=true;
    end;
  Except
    Application.MessageBox('查询失败！','半成品统计查询提示');
  end;
end;

procedure TForm47.Button2Click(Sender: TObject);
var y:integer;
begin
  y:=1;
  stringgrid3.RowCount:=2;
  stringgrid3.Rows[1].Clear;
  try
    with zStoredProc1 do
    begin
      close;
      StoredProcName:='proc_bcpcxtj_by_jzdateofwmy_bcpbh_cxitem';
      ParamByName('jzdate').Value:=datetimepicker3.Date;
      if radiogroup5.ItemIndex=0 then
      ParamByName('cxitem').Value:='week';
      if radiogroup5.ItemIndex=1 then
      ParamByName('cxitem').Value:='month';
      if radiogroup5.ItemIndex=2 then
      ParamByName('cxitem').Value:='year';
      open;
      boolReaded:=false;
      FirstResultSet;
      while not eof do
      begin
        stringgrid3.RowCount:=stringgrid3.RowCount+1;
        stringgrid3.Cells[0,y]:=fields[0].AsString;
        stringgrid3.Cells[1,y]:=fields[1].AsString;
        stringgrid3.Cells[2,y]:=fields[2].AsString;
        stringgrid3.Cells[3,y]:=fields[3].AsString;
        stringgrid3.Cells[4,y]:=fields[4].AsString;
        y := y +1;
        stringgrid3.Rows[stringgrid3.RowCount-1].Clear;
        next;
      end;
      NextResultSet;
      if not eof then
      begin
        stringgrid3.RowCount:=stringgrid3.RowCount+1;
        stringgrid3.Cells[0,y]:=fields[0].AsString;
        stringgrid3.Cells[1,y]:=fields[1].AsString;
        stringgrid3.Cells[2,y]:=fields[2].AsString;
        stringgrid3.Cells[3,y]:=fields[3].AsString;
        stringgrid3.Cells[4,y]:=fields[4].AsString;
        stringgrid3.Rows[stringgrid3.RowCount-1].Clear;
      end;
      boolReaded:=true;
    end;
  Except
    Application.MessageBox('查询失败！','半成品统计查询提示');
  end;
end;

procedure TForm47.Button3Click(Sender: TObject);
var y:integer;          //proc_bcpcrkmxz_all
begin
  y:=1;
  stringgrid5.RowCount:=2;
  stringgrid5.Rows[1].Clear;
  try
    with zStoredProc1 do
    begin
      close;
      StoredProcName:='proc_bcpsccxtj_all';
      open;
      boolReaded:=false;
      FirstResultSet;
      while not eof do
      begin
        stringgrid5.RowCount:=stringgrid5.RowCount+1;
        stringgrid5.Cells[0,y]:=fields[0].AsString;
        stringgrid5.Cells[1,y]:=fields[1].AsString;
        stringgrid5.Cells[2,y]:=fields[2].AsString;
        stringgrid5.Cells[3,y]:=fields[3].AsString;
        stringgrid5.Cells[4,y]:=fields[4].AsString;
        stringgrid5.Cells[5,y]:=fields[5].AsString;
        y := y +1;
        stringgrid5.Rows[stringgrid5.RowCount-1].Clear;
        next;
      end;
      NextResultSet;
      if not eof then
      begin
        stringgrid5.RowCount:=stringgrid5.RowCount+1;
        stringgrid5.Cells[0,y]:=fields[0].AsString;
        stringgrid5.Cells[1,y]:=fields[1].AsString;
        stringgrid5.Cells[2,y]:=fields[2].AsString;
        stringgrid5.Cells[3,y]:=fields[3].AsString;
        stringgrid5.Cells[4,y]:=fields[4].AsString;
        stringgrid5.Cells[5,y]:=fields[5].AsString;
        stringgrid5.Rows[stringgrid5.RowCount-1].Clear;
      end;
      boolReaded:=true;
    end;
  Except
    Application.MessageBox('查询失败！','半成品统计查询提示');
  end;
end;

procedure TForm47.Execl1Click(Sender: TObject);
begin
  if stringgrid1.RowCount>2 then
    ExportStrGridToExcel([stringgrid1])
  else
    application.MessageBox('列表中没有任何数据！','半成品统计查询提示');
end;

procedure TForm47.MenuItem1Click(Sender: TObject);
begin
  if stringgrid2.RowCount>2 then
    ExportStrGridToExcel([stringgrid2])
  else
    application.MessageBox('列表中没有任何数据！','半成品统计查询提示');
end;

procedure TForm47.MenuItem2Click(Sender: TObject);
begin
  if stringgrid3.RowCount>2 then
    ExportStrGridToExcel([stringgrid3])
  else
    application.MessageBox('列表中没有任何数据！','半成品统计查询提示');
end;

procedure TForm47.MenuItem3Click(Sender: TObject);
begin
  if stringgrid4.RowCount>2 then
    ExportStrGridToExcel([stringgrid4])
  else
    application.MessageBox('列表中没有任何数据！','半成品统计查询提示');
end;

procedure TForm47.MenuItem4Click(Sender: TObject);
begin
  if stringgrid5.RowCount>2 then
    ExportStrGridToExcel([stringgrid5])
  else
    application.MessageBox('列表中没有任何数据！','半成品统计查询提示');
end;

procedure TForm47.MenuItem5Click(Sender: TObject);
begin
  if stringgrid6.RowCount>2 then
    ExportStrGridToExcel([stringgrid6])
  else
    application.MessageBox('列表中没有任何数据！','半成品统计查询提示');
end;

procedure TForm47.StringGrid1SelectCell(Sender: TObject; ACol, ARow: Integer;
  var CanSelect: Boolean);
var y:integer;
begin
  y:=1;
  stringgrid2.RowCount:=2;
  stringgrid2.Rows[1].Clear;
  if (stringgrid1.Cells[0,ARow]<>'') and (ARow>0) and (boolReaded=true) then
  try
    with zStoredProc1 do
    begin
      close;
      StoredProcName:='proc_cx_bcpmxz_by_jzdate_bcpbh';
      ParamByName('bcpbh').Value:=stringgrid1.Cells[0,ARow];
      ParamByName('jzdate1').Value:=datetimepicker1.DateTime;
      ParamByName('jzdate2').Value:=datetimepicker2.DateTime;
      open;
      FirstResultSet;
      while not eof do
      begin
        stringgrid2.RowCount:=stringgrid2.RowCount+1;
        stringgrid2.Cells[0,y]:=fields[0].AsString;
        stringgrid2.Cells[1,y]:=fields[1].AsString;
        stringgrid2.Cells[2,y]:=fields[2].AsString;
        stringgrid2.Cells[3,y]:=fields[3].AsString;
        stringgrid2.Cells[4,y]:=fields[4].AsString;
        y := y +1;
        stringgrid2.Rows[stringgrid2.RowCount-1].Clear;
        next;
      end;
      NextResultSet;
      if not eof then
      begin
        stringgrid2.RowCount:=stringgrid2.RowCount+1;
        stringgrid2.Cells[0,y]:=fields[0].AsString;
        stringgrid2.Cells[1,y]:=fields[1].AsString;
        stringgrid2.Cells[2,y]:=fields[2].AsString;
        stringgrid2.Cells[3,y]:=fields[3].AsString;
        stringgrid2.Cells[4,y]:=fields[4].AsString;
        stringgrid2.Rows[stringgrid2.RowCount-1].Clear;
      end;
    end;
  Except
    Application.MessageBox('查询失败！','半成品统计查询提示');
  end;
end;

procedure TForm47.StringGrid3SelectCell(Sender: TObject; ACol, ARow: Integer;
  var CanSelect: Boolean);
var y:integer;
begin
  y:=1;
  stringgrid4.RowCount:=2;
  stringgrid4.Rows[1].Clear;
  if (stringgrid3.Cells[0,ARow]<>'') and (ARow>0) and (boolReaded=true) then
  try
    with zStoredProc1 do
    begin
      close;
      StoredProcName:='proc_bcpmxz_ofwmy_by_bcpbh_jzdate_cxitem';
      ParamByName('bcpbh').Value:=stringgrid3.Cells[0,ARow];
      ParamByName('jzdate').Value:=datetimepicker3.Date;
      if radiogroup5.ItemIndex=0 then
      ParamByName('cxitem').Value:='week';
      if radiogroup5.ItemIndex=1 then
      ParamByName('cxitem').Value:='month';
      if radiogroup5.ItemIndex=2 then
      ParamByName('cxitem').Value:='year';
      open;
      FirstResultSet;
      while not eof do
      begin
        stringgrid4.RowCount:=stringgrid4.RowCount+1;
        stringgrid4.Cells[0,y]:=fields[0].AsString;
        stringgrid4.Cells[1,y]:=fields[1].AsString;
        stringgrid4.Cells[2,y]:=fields[2].AsString;
        stringgrid4.Cells[3,y]:=fields[3].AsString;
        stringgrid4.Cells[4,y]:=fields[4].AsString;
        y := y +1;
        stringgrid4.Rows[stringgrid4.RowCount-1].Clear;
        next;
      end;
      NextResultSet;
      if not eof then
      begin
        stringgrid4.RowCount:=stringgrid4.RowCount+1;
        stringgrid4.Cells[0,y]:=fields[0].AsString;
        stringgrid4.Cells[1,y]:=fields[1].AsString;
        stringgrid4.Cells[2,y]:=fields[2].AsString;
        stringgrid4.Cells[3,y]:=fields[3].AsString;
        stringgrid4.Cells[4,y]:=fields[4].AsString;
        stringgrid4.Rows[stringgrid4.RowCount-1].Clear;
      end;
    end;
  Except
    Application.MessageBox('查询失败！','半成品统计查询提示');
  end;
end;

procedure TForm47.StringGrid5SelectCell(Sender: TObject; ACol, ARow: Integer;
  var CanSelect: Boolean);
var y:integer;
begin
  y:=1;
  stringgrid6.RowCount:=2;
  stringgrid6.Rows[1].Clear;
  if (stringgrid5.Cells[0,ARow]<>'') and (ARow>0) and (boolReaded=true) then
  try
    with zStoredProc1 do
    begin
      close;
      StoredProcName:='proc_bcpcrkmxz_all';
      ParamByName('bcpbh').Value:= stringgrid5.Cells[0,ARow];
      open;
      FirstResultSet;
      while not eof do
      begin
        stringgrid6.RowCount:=stringgrid6.RowCount+1;
        stringgrid6.Cells[0,y]:=fields[0].AsString;
        stringgrid6.Cells[1,y]:=fields[1].AsString;
        stringgrid6.Cells[2,y]:=fields[2].AsString;
        stringgrid6.Cells[3,y]:=fields[3].AsString;
        stringgrid6.Cells[4,y]:=fields[4].AsString;
        y := y +1;
        stringgrid6.Rows[stringgrid6.RowCount-1].Clear;
        next;
      end;
      NextResultSet;
      if not eof then
      begin
        stringgrid6.RowCount:=stringgrid6.RowCount+1;
        stringgrid6.Cells[0,y]:=fields[0].AsString;
        stringgrid6.Cells[1,y]:=fields[1].AsString;
        stringgrid6.Cells[2,y]:=fields[2].AsString;
        stringgrid6.Cells[3,y]:=fields[3].AsString;
        stringgrid6.Cells[4,y]:=fields[4].AsString;
        stringgrid6.Rows[stringgrid6.RowCount-1].Clear;
      end;
    end;
  Except
    Application.MessageBox('查询失败！','半成品统计查询提示');
  end;
end;

procedure TForm47.TabSheet1Show(Sender: TObject);
begin
  datetimepicker1.DateTime:=now();
  datetimepicker2.DateTime:=now();
  stringgrid1.Cells[0,0]:='半成品编号';
  stringgrid1.Cells[1,0]:='半成品名称';
  stringgrid1.Cells[2,0]:='半成品种类';
  stringgrid1.Cells[3,0]:='入库数量';
  stringgrid1.Cells[4,0]:='出库数量';
  stringgrid2.Cells[0,0]:='半成品编号';
  stringgrid2.Cells[1,0]:='入库数量';
  stringgrid2.Cells[2,0]:='出库数量';
  stringgrid2.Cells[3,0]:='记帐日期';
  stringgrid2.Cells[4,0]:='备注';

end;

procedure TForm47.TabSheet2Show(Sender: TObject);
begin
  datetimepicker3.DateTime:=now();
  stringgrid3.Cells[0,0]:='半成品编号';
  stringgrid3.Cells[1,0]:='半成品名称';
  stringgrid3.Cells[2,0]:='半成品种类';
  stringgrid3.Cells[3,0]:='入库数量';
  stringgrid3.Cells[4,0]:='出库数量';
  stringgrid4.Cells[0,0]:='半成品编号';
  stringgrid4.Cells[1,0]:='入库数量';
  stringgrid4.Cells[2,0]:='出库数量';
  stringgrid4.Cells[3,0]:='记帐日期';
  stringgrid4.Cells[4,0]:='备注';
end;

procedure TForm47.TabSheet3Show(Sender: TObject);
begin
  stringgrid5.Cells[0,0]:='半成品编号';
  stringgrid5.Cells[1,0]:='半成品名称';
  stringgrid5.Cells[2,0]:='半成品种类';
  stringgrid5.Cells[3,0]:='入库数量';
  stringgrid5.Cells[4,0]:='出库数量';
  stringgrid5.Cells[5,0]:='库存数量';
  stringgrid6.Cells[0,0]:='半成品编号';
  stringgrid6.Cells[1,0]:='入库数量';
  stringgrid6.Cells[2,0]:='出库数量';
  stringgrid6.Cells[3,0]:='记帐日期';
  stringgrid6.Cells[4,0]:='备注';
end;

end.
