unit delhtinfo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, DB, ZAbstractRODataset, ZAbstractDataset, ZStoredProcedure,
  StdCtrls, Grids;

type
  TForm99 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label13: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label16: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Edit1: TEdit;
    Edit11: TEdit;
    Edit12: TEdit;
    Edit13: TEdit;
    ComboBox1: TComboBox;
    StringGrid1: TStringGrid;
    Edit7: TEdit;
    Edit8: TEdit;
    Button1: TButton;
    ComboBox3: TComboBox;
    Memo1: TMemo;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Memo2: TMemo;
    Edit5: TEdit;
    Edit6: TEdit;
    Edit9: TEdit;
    ZStoredProc1: TZStoredProc;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    Button2: TButton;
    procedure Edit1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Button2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form99: TForm99;

implementation

uses main;

{$R *.dfm}

procedure TForm99.Button2Click(Sender: TObject);
begin
if application.MessageBox('确定要删除该合同信息吗？','合同管理提示',1)=1 then
begin
  if (edit1.Text<>'') then
    try
      with zStoredProc1 do
      begin
        close;
        StoredProcName:='proc_del_jhd_rwd_ht_ysk_info_by_htbh';  //czxm: 1-删除计划单信息 2-删除任务单信息\合同以及应收款信息
        ParamByName('czxm').Value:=2;
        ParamByName('htbh').Value:=edit1.Text;
        ParamByName('jhdbh').Value:='111';
        ParamByName('rwdbh').Value:='111';
        execproc;
        edit1.Text:='';
        edit2.Text:='';
        edit3.Text:='';
        combobox1.Text:='';
        combobox3.Text:='';
        edit12.Text:='';
        edit13.Text:='';
        edit11.Text:='';
        memo1.Text:='';
        stringgrid1.RowCount:=2;
        stringgrid1.Rows[1].Clear;
        edit1.SetFocus;
        if ParamByName('delinfo').Value=2 then
          application.MessageBox('删除合同信息成功！','计划单查询提示')
        else
          application.MessageBox('删除合同信息失败！','计划单查询提示');
      end;
    except
      application.MessageBox('删除合同信息失败！','合同管理提示');
    end;
end;
end;

procedure TForm99.Edit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  y:integer;
begin
  if key=13 then
  begin
    try
      with zStoredProc1 do
      begin
        close;
        StoredProcName:='proc_cx_htinfo_by_htbh';   //fhtbh,fhtdate,fkhmc,fxsyxm,flxr,flxrdh,fhtzje,ffhjsbz,fmemo
        ParamByName('htbh').Value:=edit1.Text;
        open;
        if not eof then
        begin
          edit3.Text:=fields[1].AsString;
          combobox1.Text:=fields[2].AsString;
          combobox3.Text:=fields[3].AsString;
          edit12.Text:=fields[4].AsString;
          edit13.Text:=fields[5].AsString;
          edit11.Text:=fields[6].AsString;
          memo1.Text:=fields[8].AsString;
        end;
        close;
        StoredProcName:='proc_cx_htcpmzx_by_htbh';
        ParamByName('htbh').Value:=edit1.Text;
        open;
        FirstResultSet;
        stringgrid1.RowCount:=2;
        stringgrid1.Rows[1].Clear;
        y:=1;
        while not eof do
        begin
          stringgrid1.RowCount:=stringgrid1.RowCount+1;
          stringgrid1.Cells[0,y]:=inttostr(y);
          stringgrid1.Cells[1,y]:=fields[0].AsString;
          stringgrid1.Cells[2,y]:=fields[7].AsString+'|'+fields[1].AsString;
          stringgrid1.Cells[3,y]:=fields[2].AsString;
          stringgrid1.Cells[4,y]:=fields[3].AsString;
          stringgrid1.Cells[5,y]:=fields[4].AsString;
          stringgrid1.Cells[6,y]:=fields[5].AsString;
          stringgrid1.Rows[stringgrid1.RowCount-1].Clear;
          y:=y+1;
          next;
        end;
      end;
    except
      application.MessageBox('查询数据失败！','合同管理提示');
    end;
  end;

end;

procedure TForm99.FormShow(Sender: TObject);
begin
  stringgrid1.Cells[0,0]:='序号';
  stringgrid1.Cells[1,0]:='产品类型';
  stringgrid1.Cells[2,0]:='产品名称';
  stringgrid1.Cells[3,0]:='单价';
  stringgrid1.Cells[4,0]:='合同数量';
  stringgrid1.Cells[5,0]:='合计金额';
  stringgrid1.Cells[6,0]:='已发数量';
end;

end.


