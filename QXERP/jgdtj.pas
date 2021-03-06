unit jgdtj;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ZAbstractRODataset, ZAbstractDataset, ZStoredProcedure, StdCtrls,
  Grids, Menus, ExtCtrls;

type
  TForm106 = class(TForm)
    Label1: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label18: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label6: TLabel;
    Label5: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    ComboBox1: TComboBox;
    Edit15: TEdit;
    Edit8: TEdit;
    Edit14: TEdit;
    Edit9: TEdit;
    Edit10: TEdit;
    Edit11: TEdit;
    Edit12: TEdit;
    Edit2: TEdit;
    Button1: TButton;
    Button2: TButton;
    StringGrid1: TStringGrid;
    StringGrid2: TStringGrid;
    Memo2: TMemo;
    Button3: TButton;
    Button4: TButton;
    Edit1: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    ZStoredProc1: TZStoredProc;
    StringGrid3: TStringGrid;
    Button5: TButton;
    PopupMenu1: TPopupMenu;
    EXECL1: TMenuItem;
    RadioGroup1: TRadioGroup;
    Button6: TButton;
    procedure ComboBox1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Button1Click(Sender: TObject);
    procedure StringGrid1DblClick(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure StringGrid2DblClick(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure StringGrid1SelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure StringGrid2SelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure FormShow(Sender: TObject);
    procedure EXECL1Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form106: TForm106;
  sARow,sARow2:integer;

implementation
uses main,jgdcx;

{$R *.dfm}

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

procedure TForm106.Button1Click(Sender: TObject);
var
  i:integer;
  booldouble:boolean;
begin
  booldouble:=true;
  for i := 1 to stringgrid2.RowCount-2 do
    if trim(stringgrid1.Cells[1,sARow])=trim(stringgrid2.Cells[1,i]) then
      booldouble:=false;
  if booldouble=false then
    application.MessageBox('该发货单编号已经添加至开票列表!','开票通知书提示')
    else if (sARow<stringgrid1.RowCount-1) and (sARow>0) then
    begin
      stringgrid2.RowCount:=stringgrid2.RowCount+1;
      stringgrid2.Cells[0,stringgrid2.RowCount-2]:=inttostr(stringgrid2.RowCount-2);
      stringgrid2.Cells[1,stringgrid2.RowCount-2]:=stringgrid1.Cells[1,sARow];
      stringgrid2.Cells[2,stringgrid2.RowCount-2]:=stringgrid1.Cells[2,sARow];
      stringgrid2.Cells[3,stringgrid2.RowCount-2]:=stringgrid1.Cells[2,sARow];
      stringgrid2.Cells[4,stringgrid2.RowCount-2]:=edit5.Text;
      edit4.Text:=floattostr(strtofloat(edit4.Text)+strtofloat(stringgrid1.Cells[2,sARow]));
      //stringgrid2.Cells[4,stringgrid2.RowCount-2]:='';
      edit5.Text:='';
      stringgrid2.Rows[stringgrid2.RowCount-1].Clear;
      sARow:=0;
    end;
end;

procedure TForm106.Button2Click(Sender: TObject);
begin
  if (sARow2<stringgrid2.RowCount-1) and (sARow2>0) then
  begin
    edit4.Text:=floattostr(strtofloat(edit4.Text)-strtofloat(stringgrid2.Cells[3,sARow2]));
    DeleteStringGridRow(sARow2,stringgrid2);
    sARow2:=0;
  end;
end;

procedure TForm106.Button5Click(Sender: TObject);
var
  y:integer;
begin
  y:=0;
  try
    with zstoredproc1 do       //proc_del_jgdtj_tmp
        begin
          close;
          StoredProcName:='proc_del_jgdtj_tmp';
          execProc;
          close;
          StoredProcName:='proc_insert_jgdtjbh';
          for y := 1 to stringgrid2.RowCount - 2 do
          begin
            zstoredproc1.ParamByName('jgdbh').Value:=stringgrid2.Cells[1,y];
            execProc;
          end;
        close;
        StoredProcName:='proc_cx_doujiagongdan_jiaohuomx';
        open;
        y:=1;
        stringgrid3.RowCount:=2;
        stringgrid3.Rows[1].Clear;
        while not eof do
        begin
            stringgrid3.RowCount:=stringgrid3.RowCount+1;
            stringgrid3.Cells[0,y]:=inttostr(y);
            stringgrid3.Cells[1,y]:=fields[0].AsString;
            stringgrid3.Cells[2,y]:=fields[1].AsString;
            stringgrid3.Cells[3,y]:=fields[2].AsString;
            stringgrid3.Cells[4,y]:=fields[3].AsString;
            //stringgrid1.Cells[5,i]:=fields[3].AsString;
            y:=y+1;
            stringgrid3.Rows[stringgrid3.RowCount-1].Clear;         //proc_cx_newkptzsid
          next;
        end;
          //combobox1.DroppedDown:=true;
        end;
      except
        application.MessageBox('数据查询失败！','新增加工结算单管理提示');
      end;
end;

procedure TForm106.Button6Click(Sender: TObject);
var
  i:integer;
begin      // proc_cx_bcpjgdinfo_by_cxitem_jgsbh
  stringgrid1.RowCount:=2;
  stringgrid1.Rows[1].Clear;
  stringgrid2.RowCount:=2;
  stringgrid2.Rows[1].Clear;
  edit8.Text:=combobox1.Text;
  edit15.Text:=SplitString(combobox1.Text,'|');
  if combobox1.Text<>'' then
    try
      with zStoredProc1 do
      begin
        close;
        StoredProcName:='proc_cx_bcpjgdinfo_by_cxitem_jgsbh';
        if radiogroup1.ItemIndex=0 then
          ParamByName('cxitem').Value:='wjs'
          else if radiogroup1.ItemIndex=1 then
            ParamByName('cxitem').Value:='yjs'
          else
            ParamByName('cxitem').Value:='all';
        ParamByName('jgsbh').Value:=SplitString(combobox1.Text,'|');
        open;
        i:=1;
        while not eof do
        begin
          stringgrid1.RowCount:=stringgrid1.RowCount+1;
          stringgrid1.Cells[0,i]:=inttostr(i);
          stringgrid1.Cells[1,i]:=fields[0].AsString;
          stringgrid1.Cells[2,i]:=fields[7].AsString;
          stringgrid1.Cells[3,i]:=fields[8].AsString;
          //stringgrid1.Cells[4,i]:=fields[3].AsString;
          //stringgrid1.Cells[5,i]:=fields[4].AsString;
          //stringgrid1.Cells[6,i]:=fields[5].AsString;
          //stringgrid1.Cells[7,i]:=fields[6].AsString;
          //stringgrid1.Cells[8,i]:=fields[7].AsString;
          //stringgrid1.Cells[9,i]:=fields[8].AsString;
          i:=i+1;
          stringgrid1.Rows[stringgrid1.RowCount-1].Clear;
          next;
        end;
      end;
    except
       application.MessageBox('数据查询失败！','半成品加工单管理提示');
    end;
end;

procedure TForm106.ComboBox1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (key=13) then
 begin
    if combobox1.Items.Count>0 then
      ComboBox1.Items.Clear;
    try
      with zstoredproc1 do
      begin
        close;
        StoredProcName:='proc_cx_jgsmc';
        ParamByName('jgsname').Value:=ComboBox1.Text;
        open;
        while not eof do
        begin
          ComboBox1.Items.Add(fields[0].asstring);
          next;
        end;
        //combobox1.DroppedDown:=true;
      end;
    except
      application.MessageBox('数据查询失败！','新增加工结算单管理提示');
    end;
 end;
end;

procedure TForm106.EXECL1Click(Sender: TObject);
begin
  if stringgrid3.RowCount>2 then
    ExportStrGridToExcel([stringgrid3])
  else
    application.MessageBox('列表中没有任何数据！','生产计划单信息查询');
end;

procedure TForm106.FormShow(Sender: TObject);
begin
  stringgrid1.Cells[0,0]:='序号';
  stringgrid1.Cells[1,0]:='加工单编号';
  stringgrid1.Cells[2,0]:='加工总金额';
  stringgrid1.Cells[3,0]:='备注';
  stringgrid2.Cells[0,0]:='序号';
  stringgrid2.Cells[1,0]:='加工单编号';
  stringgrid2.Cells[2,0]:='加工总金额';
  stringgrid2.Cells[3,0]:='开票金额';
  stringgrid2.Cells[4,0]:='备注';
  stringgrid3.Cells[0,0]:='序号';
  stringgrid3.Cells[1,0]:='加工件名称编号';
  stringgrid3.Cells[2,0]:='加工计划数';
  stringgrid3.Cells[3,0]:='交货总数';
  stringgrid3.Cells[4,0]:='加工单价';
end;

procedure TForm106.StringGrid1DblClick(Sender: TObject);
begin
  if strjgdbh<>'NULL' then
    jgdcx.Form54.ShowModal;
end;

procedure TForm106.StringGrid1SelectCell(Sender: TObject; ACol, ARow: Integer;
  var CanSelect: Boolean);
begin
  sARow:=ARow;
  if (stringgrid1.RowCount>2) and (ARow>0) and (ARow<stringgrid1.RowCount-1) then
  begin
    strjgdbh:=stringgrid1.Cells[1,ARow];
  end
  else
    strjgdbh:='NULL';
end;

procedure TForm106.StringGrid2DblClick(Sender: TObject);
begin
  if strjgdbh<>'NULL' then
    jgdcx.Form54.ShowModal;
end;

procedure TForm106.StringGrid2SelectCell(Sender: TObject; ACol, ARow: Integer;
  var CanSelect: Boolean);
begin
  sARow2:=ARow;
    if (stringgrid2.RowCount>2) and (ARow>0) and (ARow<stringgrid2.RowCount-1) then
  begin
    strjgdbh:=stringgrid2.Cells[1,ARow];
  end
  else
    strjgdbh:='NULL';
end;

end.
