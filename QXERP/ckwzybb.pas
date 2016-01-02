﻿unit ckwzybb;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ZAbstractRODataset, ZAbstractDataset, ZStoredProcedure, Grids,
  Menus;

type
  TForm68 = class(TForm)
    StringGrid1: TStringGrid;
    ZStoredProc1: TZStoredProc;
    PopupMenu1: TPopupMenu;
    Execl1: TMenuItem;
    procedure FormShow(Sender: TObject);
    procedure Execl1Click(Sender: TObject);
    procedure StringGrid1DblClick(Sender: TObject);
    procedure StringGrid1SelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form68: TForm68;
  strcxdate:string;
  Function ExportStrGridToExcel(Args: array of const): Boolean;stdcall;external 'dlltools.dll';

implementation

uses main,kcmxzcx;

{$R *.dfm}


function GetColMaxDataLength(ASGrid: TStringGrid; ACol, AStartRow: Integer): Integer; //三个自定义函数和过程放在implementation 后面
 //----------------------------------------------------------------------------//
 //取得某一列数据的最大长度
 //----------------------------------------------------------------------------//
var
  ColIndex,RowIndex:Integer;
  MaxColLength:Integer;  //列数据的最大长度
begin
	MaxColLength := 0;
	with ASGrid do
	begin//取得列数据的最大长度     
		 for RowIndex := AStartRow to RowCount - 1 do
		 begin
			 if length(Cells[ACol, RowIndex]) > MaxColLength then
			 begin
				MaxColLength:= length(Cells[ACol, RowIndex]);
			 end;
		 end;
	end;
	result := MaxColLength;
 end;


 //----------------------------------------------------------------------------//
 //根据数据长度自动设置指定列的列宽
 //----------------------------------------------------------------------------//

procedure SetOneColWidth(ASGrid: TStringGrid; ACol: Integer);
var
  OneCharPixel:Integer;  //一个字符所占的像素数   
  RightSpaceWidth: Integer;  //右边距空隙
begin
 	 RightSpaceWidth:= 3; 	 //设置为3达到和左边距一致的效果   
	 OneCharPixel:= 12; 	 //6对应9号字[*此处最好写成一个根据字号获得像素值的函数*]   
	 ASGrid.ColWidths[ACol]:= GetColMaxDataLength(ASGrid,ACol,0)*OneCharPixel+RightSpaceWidth;
end;


 //----------------------------------------------------------------------------//
 //根据数据长度自动设置全部列的列宽
 //----------------------------------------------------------------------------//


procedure SetAllColWidth(ASGrid: TStringGrid);
var
  ColIndex: Integer; //需要设置的列
begin
  for ColIndex := 0 to ASGrid.ColCount - 1 do
	begin
		SetOneColWidth(ASGrid, ColIndex);
	end;
end;

procedure TForm68.Execl1Click(Sender: TObject);
begin
  if stringgrid1.RowCount>2 then
    ExportStrGridToExcel([stringgrid1])
  else
    application.MessageBox('列表中没有任何数据！','应收款警示管理提示');
end;

procedure TForm68.FormShow(Sender: TObject);
var
  i:integer;
begin
  stringgrid1.Cells[0,0]:='序号';
  stringgrid1.Cells[1,0]:='物品代码';
  stringgrid1.Cells[2,0]:='一级科目';
  stringgrid1.Cells[3,0]:='二级科目';
  stringgrid1.Cells[4,0]:='物品名称';
  stringgrid1.Cells[5,0]:='上月结转总数量';
  stringgrid1.Cells[6,0]:='上月结转总金额';
  stringgrid1.Cells[7,0]:='上月底前入库并已开票数量';
  stringgrid1.Cells[8,0]:='上月底前入库并已开票金额';
  stringgrid1.Cells[9,0]:='上月底前入库未开票数量';
  stringgrid1.Cells[10,0]:='上月底前入库未开票金额';
  stringgrid1.Cells[11,0]:='上月底前入库本月开票数量';
  stringgrid1.Cells[12,0]:='上月底前入库本月开票金额';
  stringgrid1.Cells[13,0]:='上月底前所有出库数量';
  stringgrid1.Cells[14,0]:='上月底前所有出库金额';
  stringgrid1.Cells[15,0]:='本月出入库数量差';
  stringgrid1.Cells[16,0]:='本月出入库金额差';
  stringgrid1.Cells[17,0]:='本月入库开票数量';
  stringgrid1.Cells[18,0]:='本月入库开票金额';
  stringgrid1.Cells[19,0]:='本月入库未开票数量';
  stringgrid1.Cells[20,0]:='本月入库未开票金额';
  stringgrid1.Cells[21,0]:='本月出库数量';
  stringgrid1.Cells[22,0]:='本月出库金额';
  stringgrid1.Cells[23,0]:='当前累计已开票总数量';
  stringgrid1.Cells[24,0]:='当前累计已开票总金额';
  stringgrid1.Cells[25,0]:='当前累计未开票总数量';
  stringgrid1.Cells[26,0]:='当前累计未开票总金额';
  stringgrid1.Cells[27,0]:='当前库存总数量';
  stringgrid1.Cells[28,0]:='当前库存总金额';
  stringgrid1.Cells[29,0]:='当前库存重量';
  try
    with zStoredProc1 do
    begin
      close;
      StoredProcName:='proc_cx_ckmonth_reports_by_cxdate';
      ParamByName('cxdate').Value:=strcxdate;
      open;
      stringgrid1.RowCount:=2;
      stringgrid1.Rows[1].Clear;
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
        stringgrid1.Cells[9,i]:=fields[8].AsString;
        stringgrid1.Cells[10,i]:=fields[9].AsString;
        stringgrid1.Cells[11,i]:=fields[10].AsString;
        stringgrid1.Cells[12,i]:=fields[11].AsString;
        stringgrid1.Cells[13,i]:=fields[12].AsString;
        stringgrid1.Cells[14,i]:=fields[13].AsString;
        stringgrid1.Cells[15,i]:=fields[14].AsString;
        stringgrid1.Cells[16,i]:=fields[15].AsString;
        stringgrid1.Cells[17,i]:=fields[16].AsString;
        stringgrid1.Cells[18,i]:=fields[17].AsString;
        stringgrid1.Cells[19,i]:=fields[18].AsString;
        stringgrid1.Cells[20,i]:=fields[19].AsString;
        stringgrid1.Cells[21,i]:=fields[20].AsString;
        stringgrid1.Cells[22,i]:=fields[21].AsString;
        stringgrid1.Cells[23,i]:=fields[22].AsString;
        stringgrid1.Cells[24,i]:=fields[23].AsString;
        stringgrid1.Cells[25,i]:=fields[24].AsString;
        stringgrid1.Cells[26,i]:=fields[25].AsString;
        stringgrid1.Cells[27,i]:=fields[26].AsString;
        stringgrid1.Cells[28,i]:=fields[27].AsString;
        stringgrid1.Cells[29,i]:=fields[28].AsString;
        i:=i+1;
        stringgrid1.Rows[stringgrid1.RowCount-1].Clear;
        next;
        //stringgrid1.Cells[30,i]:=fields[0].AsString;

      end;
      SetAllColWidth(stringgrid1);
      form68.Caption:='仓库物资月报表查询 【当前查询的月份为：'+strcxdate+'】点击右键导出数据至Excel';
    end;
  except
     application.MessageBox('查询数据失败','仓库物资月报表查询提示');
  end;
end;

procedure TForm68.StringGrid1DblClick(Sender: TObject);
begin
  if strCkitemBh<>'NULL' then
    kcmxzcx.Form45.ShowModal;
end;

procedure TForm68.StringGrid1SelectCell(Sender: TObject; ACol, ARow: Integer;
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
