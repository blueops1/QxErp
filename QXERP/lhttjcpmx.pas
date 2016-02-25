unit lhttjcpmx;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, DB, ZAbstractRODataset, ZAbstractDataset, ZStoredProcedure,
  StdCtrls, Grids, ComCtrls;

type
  TForm59 = class(TForm)
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
    Edit1: TEdit;
    Edit11: TEdit;
    Edit12: TEdit;
    Edit13: TEdit;
    ComboBox1: TComboBox;
    StringGrid1: TStringGrid;
    Edit7: TEdit;
    Edit8: TEdit;
    Button1: TButton;
    Button2: TButton;
    ComboBox3: TComboBox;
    Memo1: TMemo;
    ComboBox4: TComboBox;
    Edit2: TEdit;
    ZStoredProc1: TZStoredProc;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    Edit3: TEdit;
    procedure Edit1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Button2Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure StringGrid1SelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure Button1Click(Sender: TObject);
    procedure ComboBox4KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ComboBox4Select(Sender: TObject);
    procedure Edit7KeyPress(Sender: TObject; var Key: Char);
    procedure Edit7KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Edit8KeyPress(Sender: TObject; var Key: Char);
    procedure Edit8KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form59: TForm59;
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
    for i:= vRow to StringGrid.RowCount - 1 do
    begin
      StringGrid.Rows[i]:= StringGrid.Rows[i+1];
    end;
    StringGrid.RowCount := StringGrid.RowCount - 1;
  end;
end;

procedure TForm59.Button1Click(Sender: TObject);
begin
  if (edit1.Text<>'') and (combobox1.Text<>'')and (combobox3.Text<>'') then
    if (edit7.Text<>'') and (edit8.Text<>'') and (combobox4.Text<>'') then
      begin
        stringgrid1.RowCount:=stringgrid1.RowCount+1;
        stringgrid1.Cells[0,stringgrid1.RowCount-1]:=inttostr(stringgrid1.RowCount-1);
        stringgrid1.Cells[1,stringgrid1.RowCount-1]:=combobox4.Text;
        stringgrid1.Cells[2,stringgrid1.RowCount-1]:=edit7.Text;
        stringgrid1.Cells[3,stringgrid1.RowCount-1]:=edit8.Text;
        edit11.Text:=floattostr(strtofloat(edit11.Text)+strtofloat(stringgrid1.Cells[2,stringgrid1.RowCount-1])*strtofloat(stringgrid1.Cells[3,stringgrid1.RowCount-1]));
        combobox4.Text:='';
        edit7.Text:='';
        edit8.Text:='';
        combobox4.SetFocus;
      end else
      application.MessageBox('请将明细填写！','新增合同提示')
  else
    application.MessageBox('请先将合同信息填写完整！','新增合同提示');
end;

procedure TForm59.Button2Click(Sender: TObject);
var
  y:integer;
begin
//proc_insert_htinfo_yskxx htbh,khbh,zgdwbh,htdate,xsybh,lxr,lxrdh,htzje,memo
//proc_insert_htcpmxb htbh,cpbh,cpdj,cpsl
if application.MessageBox('确定要保存数据吗？','老合同添加明细提示',1)=1 then
  if stringgrid1.RowCount>1 then
    try
      with zstoredproc1 do
      begin
        close;
        zstoredproc1.StoredProcName:='proc_insert_htcpmxb';
        for y := 1 to stringgrid1.RowCount - 1 do
        begin
          zstoredproc1.ParamByName('htbh').Value:=edit1.Text;
          zstoredproc1.ParamByName('cpbh').Value:=splitstring(stringgrid1.Cells[1,y],'|');
          zstoredproc1.ParamByName('cpdj').Value:=stringgrid1.Cells[2,y];
          zstoredproc1.ParamByName('cpsl').Value:=stringgrid1.Cells[3,y];
          execProc;
        end;
      end;
      application.MessageBox('保存数据成功！','老合同添加明细提示');
      edit1.Text:='';
      edit2.Text:='';
      edit11.Text:='0';
      edit12.Text:='';
      edit13.Text:='';
      combobox1.Text:='';
      combobox3.Text:='';
      memo1.Text:='';
      stringgrid1.RowCount:=1;
  except
    application.MessageBox('保存数据失败！','老合同添加明细提示');
  end else
    application.MessageBox('请添加合同内的销售明细！','老合同添加明细提示');

end;

procedure TForm59.ComboBox4KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if key=13 then
 begin
    if combobox4.Items.Count>0 then
    ComboBox4.Items.Clear;
    //combobox1.Items.Add('*|全部供应商');
    try
      with zstoredproc1 do
      begin
        close;
        zstoredproc1.StoredProcName:='proc_cx_cmlxk_cpbhandmcandzl_by_cpmc';
        zstoredproc1.ParamByName('cpmc').Value:=ComboBox4.Text;
        open;
        while not eof do
        begin
          ComboBox4.Items.Add(fields[0].asstring);
          next;
        end;
        //combobox1.DroppedDown:=true;
      end;
  except
    application.MessageBox('数据查询失败！','新增合同提示');
  end;
 end;
end;

procedure TForm59.ComboBox4Select(Sender: TObject);
begin
  edit7.SetFocus;
end;

procedure TForm59.Edit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin    //proc_cx_htinfo_by_htbh
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
      end;
    except
      application.MessageBox('查询数据失败！','老合同管理提示');
    end;
  end;

end;

procedure TForm59.Edit7KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key=13 then
    edit8.SetFocus;
end;

procedure TForm59.Edit7KeyPress(Sender: TObject; var Key: Char);
begin
  if not charinset(key,['0'..'9','.',#8]) then
    key:=#0;
  if (key='.') and (Pos('.',Edit7.Text)>0)   then
    key:=#0;
end;

procedure TForm59.Edit8KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key=13 then
    button1.SetFocus;
end;

procedure TForm59.Edit8KeyPress(Sender: TObject; var Key: Char);
begin
  if not charinset(key,['0'..'9','.',#8]) then
    key:=#0;
  if (key='.') and (Pos('.',Edit8.Text)>0)   then
    key:=#0;
end;

procedure TForm59.N1Click(Sender: TObject);
begin
  if (selRowIndex>0) and (selRowIndex<stringgrid1.RowCount) then
  begin
    edit11.Text:=floattostr(strtofloat(edit11.Text)-strtofloat(stringgrid1.Cells[2,selRowIndex])*strtofloat(stringgrid1.Cells[3,selRowIndex]));
    DeleteStringGridRow(selRowIndex,stringgrid1);
  end;
end;

procedure TForm59.StringGrid1SelectCell(Sender: TObject; ACol, ARow: Integer;
  var CanSelect: Boolean);
begin
  selRowIndex:=ARow;
end;

end.
