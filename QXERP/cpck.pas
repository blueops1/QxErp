unit cpck;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, DB, ZAbstractRODataset, ZAbstractDataset, ZStoredProcedure,
  StdCtrls, Grids, ComCtrls;

type
  TForm30 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Edit2: TEdit;
    Label3: TLabel;
    DateTimePicker1: TDateTimePicker;
    Label4: TLabel;
    Edit4: TEdit;
    StringGrid1: TStringGrid;
    Button1: TButton;
    Button2: TButton;
    ComboBox1: TComboBox;
    ZStoredProc1: TZStoredProc;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    Label5: TLabel;
    Edit1: TEdit;
    procedure ComboBox1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure StringGrid1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure StringGrid1SelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Edit2KeyPress(Sender: TObject; var Key: Char);
    procedure N1Click(Sender: TObject);
    procedure ComboBox1Select(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form30: TForm30;
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
    for i:= vRow to StringGrid.RowCount - 1 do
    begin
      StringGrid.Rows[i]:= StringGrid.Rows[i+1];
    end;
    StringGrid.RowCount := StringGrid.RowCount - 1;
  end;
end;

procedure TForm30.Button1Click(Sender: TObject);
var
  i:integer;
begin   //proc_insert_cpcrkmxz_cprk   cpbh,rksl,jzdate,memo
  if stringgrid1.RowCount>2 then
  try
    with zStoredProc1 do
    begin
      close;
      StoredProcName:='proc_insert_cpcrkmxz_cpck';
      for i := 1 to stringgrid1.RowCount - 2 do
      begin
        ParamByName('cpbh').Value:=SplitString(stringgrid1.Cells[1,i],'|');
        ParamByName('cksl').Value:=stringgrid1.Cells[2,i];
        ParamByName('jzdate').Value:=stringgrid1.Cells[3,i];
        ParamByName('memo').Value:='*'+stringgrid1.Cells[4,i];
        ParamByName('czry').Value:=main.strUser;
        ExecProc;
      end;
        stringgrid1.RowCount:=2;
        stringgrid1.Rows[1].Clear;
        edit1.Text:='';
        edit2.Text:='';
        edit4.Text:='';
        combobox1.Text:='';
        combobox1.SetFocus;
        combobox1.SetFocus;
        application.MessageBox('保存数据成功！','成品出库提示');
    end;
  except
    application.MessageBox('保存数据失败！','成品出库提示');
  end;
end;

procedure TForm30.Button2Click(Sender: TObject);
var
  booldouble:boolean;
  i:integer;
begin
  booldouble:=false;
  for i := 1 to stringgrid1.RowCount - 1 do
  begin
    if combobox1.Text=stringgrid1.Cells[1,i] then
       booldouble:=true;
  end;
  if booldouble=true then
      application.MessageBox('该产品已在下面列表中，请确认！','成品出库提示')
    else
    if (edit2.Text<>'') and (combobox1.Text<>'') then
      if strtofloat(edit2.Text)<=strtofloat(edit1.Text)  then
      begin
        stringgrid1.RowCount:=stringgrid1.RowCount+1;
        stringgrid1.Cells[0,stringgrid1.RowCount-2]:=inttostr(stringgrid1.RowCount-2);
        stringgrid1.Cells[1,stringgrid1.RowCount-2]:=combobox1.Text;
        stringgrid1.Cells[2,stringgrid1.RowCount-2]:=edit2.Text;
        stringgrid1.Cells[3,stringgrid1.RowCount-2]:=datetostr(datetimepicker1.Date);
        stringgrid1.Cells[4,stringgrid1.RowCount-2]:=edit4.Text;
        //stringgrid1.RowCount:=stringgrid1.RowCount-1;
        stringgrid1.Rows[stringgrid1.RowCount-1].Clear;
        combobox1.Text:='';
        edit2.Text:='';
        edit4.Text:='';
        combobox1.SetFocus;
      end else
        application.MessageBox('出库数量大于库存数量！','成品出库提示')
    else
      application.MessageBox('请将明细填写完整！','成品出库提示');
end;

procedure TForm30.ComboBox1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if key=13 then
 begin
    if combobox1.Items.Count>0 then
    ComboBox1.Items.Clear;
    edit1.Text:='';
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

procedure TForm30.ComboBox1Select(Sender: TObject);
begin
  edit1.Text:='';
  try
    with zStoredProc1 do
    begin
      close;
      StoredProcName:='proc_cx_cpkcb_by_cbph';
      ParamByName('cpbh').Value:=SplitString(combobox1.Text,'|');
      open;
      if not eof then
        edit1.Text:=fields[0].AsString;
    end;
  except
    application.MessageBox('数据查询失败！','成品出库提示');
  end;
end;

procedure TForm30.Edit2KeyPress(Sender: TObject; var Key: Char);
begin
  if not charinset(key,['-','0'..'9','.',#8]) then
    key:=#0;
  if (key='.') and (Pos('.',Edit2.Text)>0)   then
    key:=#0;
  if (key='-') and (Pos('-',Edit2.Text)>0)   then
    key:=#0;
end;

procedure TForm30.FormShow(Sender: TObject);
begin
  datetimepicker1.Date:=now();
  stringgrid1.Cells[0,0]:='序号';
  stringgrid1.Cells[1,0]:='产品编号';
  stringgrid1.Cells[2,0]:='出库数量';
  stringgrid1.Cells[3,0]:='出库日期';
  stringgrid1.Cells[4,0]:='备注';
end;

procedure TForm30.N1Click(Sender: TObject);
begin
  if (selRowIndex>0) and (selRowIndex<stringgrid1.RowCount) then
  begin
    DeleteStringGridRow(selRowIndex,stringgrid1);
  end;
end;

procedure TForm30.StringGrid1MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
  var
  tmppoint:tpoint;
begin
  tmppoint.X:=x;
  tmppoint.Y:=y;
  if button=tmousebutton.mbRight then
  popupmenu1.Popup(stringgrid1.ClientToScreen(tmppoint).X,stringgrid1.ClientToScreen(tmppoint).y);
end;

procedure TForm30.StringGrid1SelectCell(Sender: TObject; ACol, ARow: Integer;
  var CanSelect: Boolean);
begin
  selRowIndex:=ARow;
end;

end.
