unit cscprkgl;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ZAbstractRODataset, ZAbstractDataset, ZStoredProcedure, StdCtrls,
  ComCtrls, Grids;

type
  TForm65 = class(TForm)
    Label1: TLabel;
    Edit1: TEdit;
    Label2: TLabel;
    Memo1: TMemo;
    Label3: TLabel;
    StringGrid1: TStringGrid;
    Label6: TLabel;
    Button2: TButton;
    Edit2: TEdit;
    Edit3: TEdit;
    ZStoredProc1: TZStoredProc;
    Button1: TButton;
    Label4: TLabel;
    Label5: TLabel;
    Edit4: TEdit;
    Label7: TLabel;
    Edit5: TEdit;
    procedure Edit1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure StringGrid1SetEditText(Sender: TObject; ACol, ARow: Integer;
      const Value: string);
    procedure StringGrid1SelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form65: TForm65;
  tmpString:string;

implementation

uses main;

{$R *.dfm}

procedure TForm65.Button1Click(Sender: TObject);
begin      //proc_update_csckd_info_mxz_by_csckdid
  if edit4.Text<>'是' then
  begin
    if (edit1.Text<>'') and (stringgrid1.RowCount>2) then
    begin
      try
        with zStoredProc1 do
        begin
          close;
          StoredProcName:='proc_update_csckd_info_mxz_by_csckdid';
          ParamByName('cxitem').Value:='all';
          ParamByName('csckdid').Value:=edit1.Text;
          ParamByName('csckcpbh').Value:='0';
          ParamByName('csgksl').Value:='0';
          ExecProc;
          application.MessageBox('全部归库保存成功！','测试产品归库提示');
          edit1.Text:='';
          edit2.Text:='';
          edit3.Text:='';
          memo1.Text:='';
          stringgrid1.RowCount:=2;
          stringgrid1.Rows[1].Clear;
        end;
      except
        application.MessageBox('全部归库保存失败！','测试产品归库提示');
      end;
    end;
  end else
    application.MessageBox('该单子下测试产品已全部退回！','测试产品归库提示');
end;

procedure TForm65.Button2Click(Sender: TObject);
var
  i:integer;
begin
  if edit4.Text<>'是' then
  begin
    if (edit1.Text<>'') and (stringgrid1.RowCount>2) then
    begin
      try
        with zStoredProc1 do
        begin
          for i := 1 to stringgrid1.RowCount - 2 do
          begin
            if (stringgrid1.Cells[3,i]<>'') and (strtoint(stringgrid1.Cells[3,i])<=strtoint(stringgrid1.Cells[2,i])) then
            begin
              close;
              StoredProcName:='proc_update_csckd_info_mxz_by_csckdid';
              ParamByName('cxitem').Value:='mxz';
              ParamByName('csckdid').Value:=edit1.Text;
              ParamByName('csckcpbh').Value:=stringgrid1.Cells[2,i];
              ParamByName('csgksl').Value:=stringgrid1.Cells[3,i];
              ExecProc;
            end;
          end;
          application.MessageBox('全部归库保存成功！','测试产品归库提示');
          edit1.Text:='';
          edit2.Text:='';
          edit3.Text:='';
          memo1.Text:='';
          stringgrid1.RowCount:=2;
          stringgrid1.Rows[1].Clear;
        end;
      except
        application.MessageBox('全部归库保存失败！','测试产品归库提示');
      end;
    end;
  end else
    application.MessageBox('该单子下测试产品已全部退回！','测试产品归库提示');
end;

procedure TForm65.Edit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  i:integer;
begin        //proc_cx_ceshichukudan_info_mxz_by_csckdid
if edit1.Text<>'' then
try
    with zStoredProc1 do
    begin
      close;
      StoredProcName:='proc_cx_ceshichukudan_info_mxz_by_csckdid';
      ParamByName('csckdid').Value:=edit1.Text;
      open;
      firstresultset;
      if not eof  then
      begin
        edit1.Text:=fields[0].AsString;
        edit2.Text:=fields[1].AsString;
        edit3.Text:=fields[2].AsString;
        memo1.Text:=fields[3].AsString;
        if fields[4].AsString='Y' then
          edit4.Text:='是'
        else
          edit4.Text:='否';
        edit5.Text:=fields[5].AsString;
      end;
      stringgrid1.RowCount:=2;
      stringgrid1.Rows[1].Clear;
      i:=1;
      nextresultset;
      while not eof do
      begin
        stringgrid1.RowCount:=stringgrid1.RowCount+1;
        stringgrid1.Cells[0,i]:=inttostr(i);
        stringgrid1.Cells[1,i]:=fields[0].AsString;
        stringgrid1.Cells[2,i]:=fields[1].AsString;
        stringgrid1.Cells[3,i]:=fields[2].AsString;
        stringgrid1.Cells[4,i]:=fields[3].AsString;
        i:=i+1;
        stringgrid1.Rows[stringgrid1.RowCount-1].Clear;
        next;
      end;
    end;
  except
    application.MessageBox('数据查询失败！','测试产品归库提示');
  end;
end;

procedure TForm65.FormShow(Sender: TObject);
begin
  stringgrid1.Cells[0,0]:='序号';
  stringgrid1.Cells[1,0]:='产品名称';
  stringgrid1.Cells[2,0]:='测试数量';
  stringgrid1.Cells[3,0]:='归库数量';
  stringgrid1.Cells[4,0]:='备注';
end;

procedure TForm65.StringGrid1SelectCell(Sender: TObject; ACol, ARow: Integer;
  var CanSelect: Boolean);
begin
  tmpString:=stringgrid1.Cells[ACol,ARow];
end;

procedure TForm65.StringGrid1SetEditText(Sender: TObject; ACol, ARow: Integer;
  const Value: string);
begin
  if (stringgrid1.RowCount>2) and (ARow<stringgrid1.RowCount-1) then
  begin
    if (ACol<>3) and (ARow>0) then
    begin
      stringgrid1.Cells[ACol,ARow]:=tmpString;
        if stringgrid1.Cells[3,ARow]='' then
       stringgrid1.Cells[3,ARow]:='0';
    end else
      if stringgrid1.Cells[3,ARow]<>'' then
        if (strtofloat(stringgrid1.Cells[2,ARow])<strtofloat(stringgrid1.Cells[3,ARow])) or (strtofloat(stringgrid1.Cells[3,ARow])<=strtofloat(tmpstring)) then
          stringgrid1.Cells[3,ARow]:=tmpString
    end else
      stringgrid1.Cells[ACol,ARow]:=tmpString;
end;

end.
