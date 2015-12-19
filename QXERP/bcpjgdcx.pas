unit bcpjgdcx;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, StdCtrls, ExtCtrls, DB, ZAbstractRODataset, ZAbstractDataset,
  ZStoredProcedure, Menus;

type
  TForm55 = class(TForm)
    ComboBox1: TComboBox;
    Button1: TButton;
    Label1: TLabel;
    RadioGroup1: TRadioGroup;
    StringGrid1: TStringGrid;
    ZStoredProc1: TZStoredProc;
    PopupMenu1: TPopupMenu;
    Execl1: TMenuItem;
    procedure Button1Click(Sender: TObject);
    procedure ComboBox1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure StringGrid1DblClick(Sender: TObject);
    procedure StringGrid1SelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure Execl1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form55: TForm55;
  function SplitString(Source, Deli: string ): String;stdcall;external 'dlltools.dll';

implementation
uses main,jgdcx;

{$R *.dfm}

procedure TForm55.Button1Click(Sender: TObject);
var
  i:integer;
begin      // proc_cx_bcpjgdinfo_by_cxitem_jgsbh
  stringgrid1.RowCount:=2;
  stringgrid1.Rows[1].Clear;
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
          stringgrid1.Cells[2,i]:=fields[1].AsString;
          stringgrid1.Cells[3,i]:=fields[2].AsString;
          stringgrid1.Cells[4,i]:=fields[3].AsString;
          stringgrid1.Cells[5,i]:=fields[4].AsString;
          stringgrid1.Cells[6,i]:=fields[5].AsString;
          stringgrid1.Cells[7,i]:=fields[6].AsString;
          stringgrid1.Cells[8,i]:=fields[7].AsString;
          i:=i+1;
          stringgrid1.Rows[stringgrid1.RowCount-1].Clear;
          next;
        end;
      end;
    except
       application.MessageBox('数据查询失败！','半成品加工单管理提示');
    end;
end;

procedure TForm55.ComboBox1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (key=13) then
 begin
    if combobox1.Items.Count>0 then
      ComboBox1.Items.Clear;
      combobox1.Items.Add('*|全部加工商');
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
      application.MessageBox('数据查询失败！','新增加工单管理提示');
    end;
 end;
end;

procedure TForm55.Execl1Click(Sender: TObject);
begin
  if stringgrid1.RowCount>2 then
    ExportStrGridToExcel([stringgrid1])
  else
    application.MessageBox('列表中没有任何数据！','仓库查询提示');
end;

procedure TForm55.FormShow(Sender: TObject);
begin
  stringgrid1.Cells[0,0]:='序号';
  stringgrid1.Cells[1,0]:='加工单编号';
  stringgrid1.Cells[2,0]:='发票编号';
  stringgrid1.Cells[3,0]:='发票税率';
  stringgrid1.Cells[4,0]:='出单日期';
  stringgrid1.Cells[5,0]:='发票日期';
  stringgrid1.Cells[6,0]:='加工商名称';
  stringgrid1.Cells[7,0]:='操作员';
  stringgrid1.Cells[8,0]:='备注';
end;

procedure TForm55.StringGrid1DblClick(Sender: TObject);
begin
  if strjgdbh<>'NULL' then
    jgdcx.Form54.ShowModal;
end;

procedure TForm55.StringGrid1SelectCell(Sender: TObject; ACol, ARow: Integer;
  var CanSelect: Boolean);
begin
  if stringgrid1.RowCount>2 then
  begin
    strjgdbh:=stringgrid1.Cells[1,ARow];
  end
  else
    strjgdbh:='NULL';
end;

end.
