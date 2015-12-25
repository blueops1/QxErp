unit wxdwcprk;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, DB, ZAbstractRODataset, ZAbstractDataset, ZStoredProcedure,
  StdCtrls, Grids, ComCtrls;

type
  TForm52 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Edit2: TEdit;
    DateTimePicker1: TDateTimePicker;
    Edit4: TEdit;
    StringGrid1: TStringGrid;
    Button1: TButton;
    Button2: TButton;
    ComboBox1: TComboBox;
    Edit1: TEdit;
    ZStoredProc1: TZStoredProc;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    procedure ComboBox1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Edit2KeyPress(Sender: TObject; var Key: Char);
    procedure ComboBox1Select(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form52: TForm52;
  selRowIndex:integer;
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

procedure TForm52.Button1Click(Sender: TObject);
var
  i,x:integer;
  strBcpbh: Array Of String ;
begin   //proc_insert_cpcrkmxz_cprk   cpbh,rksl,jzdate,memo
  if stringgrid1.RowCount>2 then
  try
    with zStoredProc1 do
    begin
      close;
      StoredProcName:='proc_insert_cpcrkmxz_cprk';
      for i := 1 to stringgrid1.RowCount - 2 do
      begin
        ParamByName('cpbh').Value:=SplitString(stringgrid1.Cells[1,i],'|');
        ParamByName('rksl').Value:=stringgrid1.Cells[2,i];
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
        application.MessageBox('保存数据成功！','外加工成品入库提示');
    end;
  except
    application.MessageBox('保存数据失败！','外加工成品入库提示');
  end;
end;

procedure TForm52.Button2Click(Sender: TObject);
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
      application.MessageBox('该产品已在下面列表中，请确认！','外加工成品入库提示')
    else
    begin
      if (edit2.Text<>'') and (combobox1.Text<>'') then
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
        edit1.Text:='';
        edit2.Text:='';
        edit4.Text:='';
        combobox1.SetFocus;
      end else
      application.MessageBox('请将明细填写完整！','外加工成品入库提示');
    end;
end;

procedure TForm52.ComboBox1KeyDown(Sender: TObject; var Key: Word;
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
    application.MessageBox('数据查询失败！','外加工成品入库提示');
  end;
 end;
end;

procedure TForm52.ComboBox1Select(Sender: TObject);
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
    application.MessageBox('数据查询失败！','外加工成品入库提示');
  end;
end;

procedure TForm52.Edit2KeyPress(Sender: TObject; var Key: Char);
begin
  if not charinset(key,['0'..'9','.',#8]) then
    key:=#0;
  if (key='.') and (Pos('.',Edit2.Text)>0)   then
    key:=#0;
end;

procedure TForm52.FormShow(Sender: TObject);
begin
  datetimepicker1.DateTime:=now();
end;

procedure TForm52.N1Click(Sender: TObject);
begin
  if (selRowIndex>0) and (selRowIndex<stringgrid1.RowCount) then
  begin
    DeleteStringGridRow(selRowIndex,stringgrid1);
  end;
end;

end.
