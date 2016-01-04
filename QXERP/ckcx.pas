unit ckcx;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DB, ZAbstractRODataset, ZAbstractDataset,
  ZStoredProcedure, Menus;

type
  TForm34 = class(TForm)
    StringGrid1: TStringGrid;
    ComboBox1: TComboBox;
    ComboBox2: TComboBox;
    Button1: TButton;
    ZStoredProc1: TZStoredProc;
    Label1: TLabel;
    Label2: TLabel;
    PopupMenu1: TPopupMenu;
    Execl1: TMenuItem;
    procedure ComboBox1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ComboBox1Select(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure StringGrid1DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure StringGrid1SelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure StringGrid1DblClick(Sender: TObject);
    procedure Execl1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form34: TForm34;
  function SplitString(Source, Deli: string ): String;stdcall;external 'dlltools.dll';
  Function ExportStrGridToExcel(Args: array of const): Boolean;stdcall;external 'dlltools.dll';

implementation

{$R *.dfm}

uses main,kcmxzcx;


procedure TForm34.Button1Click(Sender: TObject);
var
  i:integer;
begin
  if (combobox1.Text<>'') and (combobox2.Text<>'') then
  try
    with zStoredProc1 do
    begin
      stringgrid1.RowCount:=2;
      stringgrid1.Rows[1].Clear;
      Close;
      StoredProcName:='proc_cx_ckitemallinfo_by_itembh_itemlxbh';
      if (SplitString(combobox1.Text,'|')='*') then
      begin
        ParamByName('itemlxbh').Value:='*';
        ParamByName('itembh').Value:='*';
      end else
      if (SplitString(combobox1.Text,'|')<>'*') and (SplitString(combobox2.Text,'|')='*') then
      begin
        ParamByName('itemlxbh').Value:=SplitString(combobox1.Text,'|');
        ParamByName('itembh').Value:='*';
      end else
      if (SplitString(combobox2.Text,'|')<>'*') then
      begin
        ParamByName('itemlxbh').Value:=SplitString(combobox1.Text,'|');
        ParamByName('itembh').Value:=SplitString(combobox2.Text,'|');
      end;
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
{        if stringgrid1.Cells[7,i]<>'0' then
          stringgrid1.Cells[8,i]:=floattostr(strtofloat(stringgrid1.Cells[6,i])/strtofloat(stringgrid1.Cells[7,i]))
        else
          stringgrid1.Cells[8,i]:='0';    }
        stringgrid1.Rows[stringgrid1.RowCount-1].Clear;
        i:=i+1;
        next;
      end;
    end;
  except
    application.MessageBox('数据查询失败！','仓库库存查询');
  end else
    application.MessageBox('请选择需要查询的类型和名称！','仓库库存查询');
end;

procedure TForm34.ComboBox1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if key=13 then
 begin
  if combobox1.Items.Count>0 then
    ComboBox1.Items.Clear;
  combobox1.Items.Add('*|全部类型');
  try
    with zstoredproc1 do
    begin
      close;
      StoredProcName:='proc_cx_itemlxinfo_by_itemlxmc';
      ParamByName('itemlxmc').Value:=ComboBox1.Text;
      open;
      while not eof do
      begin
        ComboBox1.Items.Add(fields[0].asstring);
        next;
      end;
        //combobox1.DroppedDown:=true;
    end;
  except
    application.MessageBox('数据查询失败！','常规库存跟踪信息设置');
  end;
 end;
end;

procedure TForm34.ComboBox1Select(Sender: TObject);
begin
  if combobox1.Text='*|全部类型' then
    combobox2.Text:='*|全部物品'
  else
  begin
    if combobox2.Items.Count>0 then
      ComboBox2.Items.Clear;
    combobox2.Text:='';
    combobox2.Items.Add('*|全部物品');
    try
      with zstoredproc1 do
      begin
        close;
        StoredProcName:='proc_cx_ckitemmc_by_itemlxid';
        ParamByName('itemlxid').Value:=SplitString(ComboBox1.Text,'|');
        open;
        while not eof do
        begin
          ComboBox2.Items.Add(fields[0].asstring);
          next;
        end;
      end;
    except
      application.MessageBox('数据查询失败！','材料配件入库管理提示');
    end;
  end;
end;

procedure TForm34.Execl1Click(Sender: TObject);
begin
  if stringgrid1.RowCount>2 then
    ExportStrGridToExcel([stringgrid1])
  else
    application.MessageBox('列表中没有任何数据！','仓库查询提示');
end;

procedure TForm34.FormShow(Sender: TObject);
begin      //ckitem_info.fitemid,ckitem_info.fitemmc,itemdw_info.fitemdwmc,itemlx_info.fitemlxmc,
//ckitem_info.fitemkcsl,ckitem_info.fitemljje,ckitem_info.fitemljsl
 stringgrid1.Cells[0,0]:='序号';
 stringgrid1.Cells[1,0]:='物品编号';
 stringgrid1.Cells[2,0]:='物品名称';
 stringgrid1.Cells[3,0]:='物品单位';
 stringgrid1.Cells[4,0]:='物品类型';
 stringgrid1.Cells[5,0]:='库存数量';
 stringgrid1.Cells[6,0]:='累计总额';
 stringgrid1.Cells[7,0]:='累计采购数';
 stringgrid1.Cells[8,0]:='平均单价';
 //stringgrid1.Cells[0,0]:='库存估值';
end;

procedure TForm34.StringGrid1DblClick(Sender: TObject);
begin
  if strCkitemBh<>'NULL' then
    kcmxzcx.Form45.ShowModal;
end;

procedure TForm34.StringGrid1DrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
begin
  with TStringGrid(Sender) do
  begin
  if (ARow>0) and (ARow<TStringGrid(Sender).RowCount-1) then
    if (ARow mod 2) =0 then
        Canvas.Brush.Color:=clInfoBK
        //Canvas.Font.Color:=clRed
      else
        Canvas.Brush.Color:=clMoneyGreen;
        //Canvas.Font.Color:=clWindowText;
    Canvas.FillRect(Rect);
    Canvas.TextOut(Rect.Left+2,Rect.Top+2,Cells[ACol,ARow]);
  end;

end;

procedure TForm34.StringGrid1SelectCell(Sender: TObject; ACol, ARow: Integer;
  var CanSelect: Boolean);
begin
  if stringgrid1.RowCount>2 then
  begin
    strCkitemBh:=stringgrid1.Cells[1,ARow];
    strCkItemmc:=stringgrid1.Cells[2,ARow];
  end
  else
    strCkitemBh:='NULL';
end;

end.
