unit bcpjgrk;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, DB, ZAbstractRODataset, ZAbstractDataset, ZStoredProcedure,
  ExtCtrls, Grids, StdCtrls, ComCtrls;

type
  TForm56 = class(TForm)
    Label6: TLabel;
    Edit4: TEdit;
    Label7: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Memo1: TMemo;
    StringGrid1: TStringGrid;
    Label8: TLabel;
    Bevel1: TBevel;
    ZStoredProc1: TZStoredProc;
    Edit1: TEdit;
    Edit2: TEdit;
    PopupMenu1: TPopupMenu;
    Execl1: TMenuItem;
    StringGrid2: TStringGrid;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Label1: TLabel;
    Bevel2: TBevel;
    DateTimePicker1: TDateTimePicker;
    Label2: TLabel;
    Label3: TLabel;
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure StringGrid1SelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure Edit4KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure StringGrid2SetEditText(Sender: TObject; ACol, ARow: Integer;
      const Value: string);
    procedure StringGrid2SelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure Button3Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form56: TForm56;
  sARow,sARow2:integer;
  tmpString:string;
  function SplitString(Source, Deli: string ): String;stdcall;external 'dlltools.dll';

implementation
uses main;

{$R *.dfm}

procedure DeleteStringGridRow(vRow: Integer; StringGrid: TStringGrid);
var
  i:Integer;
begin
  if StringGrid.RowCount > 1 then
  begin
    for i:= vRow to StringGrid.RowCount - vRow do
    begin
      StringGrid.Rows[i]:= StringGrid.Rows[i+1];
    end;
    StringGrid.RowCount := StringGrid.RowCount - 1;
  end;
end;

procedure TForm56.Button1Click(Sender: TObject);
var
  i:integer;
  booldouble:boolean;
begin
  booldouble:=true;
  for i := 1 to stringgrid2.RowCount-2 do
    if trim(stringgrid1.Cells[1,sARow])=trim(stringgrid2.Cells[1,i]) then
      booldouble:=false;
  if booldouble=false then
    application.MessageBox('该产品编号已经添加至入库列表!','半成品加工入库提示')
    else if (sARow<stringgrid1.RowCount-1) and (sARow>0) and (strtofloat(stringgrid1.Cells[3,sARow])>strtofloat(stringgrid1.Cells[4,sARow])) then
    begin
      stringgrid2.RowCount:=stringgrid2.RowCount+1;
      stringgrid2.Cells[0,stringgrid2.RowCount-2]:=inttostr(stringgrid2.RowCount-2);
      stringgrid2.Cells[1,stringgrid2.RowCount-2]:=stringgrid1.Cells[1,sARow];
      stringgrid2.Cells[2,stringgrid2.RowCount-2]:=stringgrid1.Cells[2,sARow];
      stringgrid2.Cells[3,stringgrid2.RowCount-2]:=floattostr(strtofloat(stringgrid1.Cells[3,sARow])-strtofloat(stringgrid1.Cells[4,sARow]));
      stringgrid2.Cells[4,stringgrid2.RowCount-2]:='';
      stringgrid2.Cells[5,stringgrid2.RowCount-2]:=stringgrid1.Cells[5,sARow];;
      stringgrid2.Rows[stringgrid2.RowCount-1].Clear;
      sARow:=0;
    end;
end;

procedure TForm56.Button2Click(Sender: TObject);
begin
  if (sARow2>0) and (sARow2<stringgrid2.RowCount-1) then
  begin
    DeleteStringGridRow(sARow2,stringgrid2);
  end;
end;

procedure TForm56.Button3Click(Sender: TObject);
var
  y:integer;
  boolnull:boolean;
begin
  boolnull:=true;
   for y := 1 to stringgrid2.RowCount - 2 do
   begin
     if (stringgrid2.Cells[4,y]='') or (stringgrid2.Cells[4,y]='0') then
        boolnull:=false;
   end;
  if boolnull=false then
    application.MessageBox('请确认入库列表中入库数为非零值！','半成品加工入库提示')
  else if application.MessageBox('确定要保存数据吗？','半成品加工入库提示',1)=1 then
  if stringgrid2.RowCount>2 then
  try
      with zstoredproc1 do
      begin
        close;
        zstoredproc1.StoredProcName:='proc_insert_bcpjgrk';  //jgdbh,pjbh,jzdate,pjrksl,czry
        for y := 1 to stringgrid2.RowCount - 2 do
        begin
          ParamByName('jgdbh').Value:=edit4.Text;
          ParamByName('pjbh').Value:=splitstring(stringgrid2.Cells[1,y],'|');
          ParamByName('jzdate').Value:=datetimepicker1.Date;
          ParamByName('pjrksl').Value:=stringgrid2.Cells[4,y];
          ParamByName('czry').Value:=main.strUser;
          ParamByName('jgzlbh').Value:=stringgrid2.Cells[5,y];
          execProc;
        end;
      end;
      edit1.Text:='';
      edit2.Text:='';
      edit4.Text:='';
      memo1.Text:='';
      stringgrid1.RowCount:=2;
      stringgrid1.Rows[1].Clear;
      stringgrid2.RowCount:=2;
      stringgrid2.Rows[1].Clear;
      application.MessageBox('保存数据成功！','半成品加工入库提示');
  except
    application.MessageBox('保存数据失败！','半成品加工入库提示');
  end else
    application.MessageBox('请添加入库单内的明细！','半成品加工入库提示');
end;

procedure TForm56.Edit4KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  i,y:integer;
begin
  if (key=13) and (edit4.Text<>'') then
    try
        with zStoredProc1 do
        begin
          close;
          StoredProcName:='proc_ccx_jgdinfo_mxz_by_jgdbh';
          ParamByName('jgdbh').Value:=edit4.Text;
          open;
          firstresultset;
          if not eof  then
          begin
          edit4.Text:=fields[0].AsString;
          edit1.Text:=fields[1].AsString;
          edit2.Text:=fields[2].AsString;
          memo1.Text:=fields[3].AsString;
          end;
          stringgrid1.RowCount:=2;
          stringgrid1.Rows[1].Clear;
          stringgrid2.RowCount:=2;
          stringgrid2.Rows[1].Clear;
          i:=1;
          for y := 0 to 2 do
          begin
            nextresultset;
            while not eof do
            begin
              if fields[1].AsString<>'' then
              begin
                stringgrid1.RowCount:=stringgrid1.RowCount+1;
                stringgrid1.Cells[0,i]:=inttostr(i);
                stringgrid1.Cells[1,i]:=fields[1].AsString;
                stringgrid1.Cells[2,i]:=fields[2].AsString;
                stringgrid1.Cells[3,i]:=fields[3].AsString;
                stringgrid1.Cells[4,i]:=fields[4].AsString;
                stringgrid1.Cells[5,i]:=fields[5].AsString;
                i:=i+1;
                stringgrid1.Rows[stringgrid1.RowCount-1].Clear;
              end;
              next;
            end;
          end;
        end;
      except
        application.MessageBox('数据查询失败！','半成品加工入库提示');
      end;
end;

procedure TForm56.FormShow(Sender: TObject);
begin
  stringgrid1.Cells[0,0]:='序号';
  stringgrid1.Cells[1,0]:='工件名称';
  stringgrid1.Cells[2,0]:='工件类型';
  stringgrid1.Cells[3,0]:='加工总数';
  stringgrid1.Cells[4,0]:='已交货总数';
  stringgrid1.Cells[5,0]:='加工类型';
  stringgrid2.Cells[0,0]:='序号';
  stringgrid2.Cells[1,0]:='工件信息';
  stringgrid2.Cells[2,0]:='工件类型';
  stringgrid2.Cells[3,0]:='未交货总数';
  stringgrid2.Cells[4,0]:='入库数量';
  stringgrid2.Cells[5,0]:='加工类型';
  datetimepicker1.Date:=now();
end;

procedure TForm56.StringGrid1SelectCell(Sender: TObject; ACol, ARow: Integer;
  var CanSelect: Boolean);
begin
  sARow:=ARow;
end;

procedure TForm56.StringGrid2SelectCell(Sender: TObject; ACol, ARow: Integer;
  var CanSelect: Boolean);
begin
  sARow2:=ARow;
  tmpString:=stringgrid2.Cells[ACol,ARow];
end;

procedure TForm56.StringGrid2SetEditText(Sender: TObject; ACol, ARow: Integer;
  const Value: string);
begin
  if (stringgrid2.RowCount>2) and (ARow<stringgrid2.RowCount-1) then
  begin
    if (ACol<>4) and (ARow>0) then
    begin
      stringgrid2.Cells[ACol,ARow]:=tmpString;
        if stringgrid2.Cells[4,ARow]='' then
       stringgrid2.Cells[4,ARow]:='0';
    end else
      if stringgrid2.Cells[4,ARow]<>'' then
        if strtofloat(stringgrid2.Cells[3,ARow])<strtofloat(stringgrid2.Cells[4,ARow]) then
          stringgrid2.Cells[4,ARow]:='0'
    end else
      stringgrid2.Cells[ACol,ARow]:='';
end;

end.
