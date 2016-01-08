unit fhdgl;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, StdCtrls, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset,
  ExtCtrls, ZStoredProcedure;

type
  TForm19 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Edit2: TEdit;
    Label3: TLabel;
    Edit3: TEdit;
    StringGrid2: TStringGrid;
    Label4: TLabel;
    Edit4: TEdit;
    Label5: TLabel;
    Edit5: TEdit;
    ComboBox1: TComboBox;
    Label7: TLabel;
    Label8: TLabel;
    Edit7: TEdit;
    Label9: TLabel;
    Edit8: TEdit;
    Label10: TLabel;
    Edit9: TEdit;
    Label11: TLabel;
    Edit10: TEdit;
    Label12: TLabel;
    Edit11: TEdit;
    Label13: TLabel;
    Edit12: TEdit;
    Label14: TLabel;
    Edit13: TEdit;
    Button2: TButton;
    Edit14: TEdit;
    Label15: TLabel;
    Label16: TLabel;
    Edit1: TEdit;
    Bevel1: TBevel;
    ZStoredProc1: TZStoredProc;
    Label17: TLabel;
    Edit15: TEdit;
    Label6: TLabel;
    Edit6: TEdit;
    procedure Button1Click(Sender: TObject);
    procedure StringGrid1SelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure StringGrid2SelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure Button2Click(Sender: TObject);
    procedure Edit10Change(Sender: TObject);
    procedure Edit10KeyPress(Sender: TObject; var Key: Char);
    procedure Edit1Change(Sender: TObject);
    procedure ComboBox1DropDown(Sender: TObject);
    procedure ComboBox1Select(Sender: TObject);
    procedure Edit1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure Button5Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form19: TForm19;
  sARow,sARow2:integer;
  tmpString:string;
  function SmallTOBig(small:real):string;stdcall;external 'dlltools.dll';

implementation
 uses main,tjfhfjxx;
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

procedure TForm19.Button1Click(Sender: TObject);
begin
 { if (sARow<stringgrid1.RowCount) and (sARow>0) then
  begin
    stringgrid2.RowCount:=stringgrid2.RowCount+1;
    stringgrid2.Cells[0,stringgrid2.RowCount-1]:=stringgrid1.Cells[0,sARow];
    stringgrid2.Cells[1,stringgrid2.RowCount-1]:=stringgrid1.Cells[1,sARow];
    stringgrid2.Cells[2,stringgrid2.RowCount-1]:=stringgrid1.Cells[2,sARow];
    stringgrid2.Cells[3,stringgrid2.RowCount-1]:=stringgrid1.Cells[3,sARow];
    stringgrid2.Cells[4,stringgrid2.RowCount-1]:=stringgrid1.Cells[4,sARow];
    stringgrid2.Cells[5,stringgrid2.RowCount-1]:=stringgrid1.Cells[5,sARow];
    stringgrid2.FixedRows:=1;
    DeleteStringGridRow(sARow,stringgrid1);
    sARow:=0;
   end;  }

end;

procedure TForm19.Button2Click(Sender: TObject);
var
  i:integer;
  boolnull:boolean;
  errorID:string;
  gridcount:integer;
begin
  boolnull:=true;
  for i:=0 to 35 do
  begin
    if (i<>24) and (i<>33) and (i<>28) and (i<>22) and (i<>25) and (i<>30) and (form19.Components[i] is tedit)  then
      if tedit(form19.Components[i]).Text='' then
      begin
        //application.MessageBox(pwidechar(form19.Components[i].Name+'|'+inttostr(i)),'aa');
        boolnull:=false;
      end;
    if (form19.Components[i] is tcombobox)  then
      if tcombobox(form19.Components[i]).Text='' then
      begin
        //application.MessageBox(pwidechar(form19.Components[i].Name),'aa');
        boolnull:=false;
      end;
  end;
  try
  if boolnull=false then
    application.MessageBox('请把所有项目填写完整!!','货运单管理提示')
  else begin
    with zStoredProc1 do            //proc_insert_fahuodanmxz_fahuodaninfo_huoyundaninfo
    begin
      close;
      StoredProcName:='proc_cx_hydidisExist_by_hydid';
      ParamByName('hydid').Value:=edit3.Text;//fhdid,cpbh,cpdj,fhsl,fhdid,htbh,khid,hydid,cddate,fhdmemo,cyrid,sendwhere,carno,price,weight,distance,hydmemo
      open;
      if RecordCount>0 then
        application.MessageBox('该货运单号已经存在，请核实！','货运单管理提示')
      else begin
          errorID:='发货单信息保存错误！';    //proc_insert_fahuodan_info
          close;
          StoredProcName:='proc_update_fahuodan_hydid_by_fhdid';
          ParamByName('fhdid').Value:=edit1.Text;//fhdid,cpbh,cpdj,fhsl,fhdid,htbh,khid,hydid,cddate,fhdmemo,cyrid,sendwhere,carno,price,weight,distance,hydmemo
          ParamByName('hydid').Value:=edit3.Text;
          ExecProc;
          errorID:='货运单信息保存错误！'; //proc_insert_huoyundan_info
          close;
          StoredProcName:='proc_insert_huoyundan_info';
          ParamByName('fhdid').Value:=edit1.Text;//fhdid,cpbh,cpdj,fhsl,fhdid,htbh,khid,hydid,cddate,fhdmemo,cyrid,sendwhere,carno,price,weight,distance,hydmemo
          ParamByName('hydid').Value:=edit3.text;
          ParamByName('cyrid').Value:=edit7.Text;
          ParamByName('sendwhere').Value:=edit9.Text;
          ParamByName('carno').Value:=edit8.Text;
          ParamByName('price').Value:=edit10.Text;
          ParamByName('weight').Value:=edit12.Text;
          ParamByName('distance').Value:=edit11.Text;
          ParamByName('memo').Value:=edit13.Text;
          ExecProc;
          application.MessageBox('新增货运单成功！','货运单管理提示');
          edit1.Text:='';
          edit2.Text:='';
          edit4.Text:='';
          edit6.Text:='';
          edit15.Text:='';
          edit5.Text:='';
          edit3.Text:='';
          edit7.Text:='';
          edit8.Text:='';
          edit12.Text:='';
          edit11.Text:='';
          edit10.Text:='';
          edit13.Text:='';
          edit9.Text:='';
          edit14.Text:='';
          stringgrid2.RowCount:=2;
          stringgrid2.Rows[1].Clear;
      end;
    end;
  end;
  except
    application.MessageBox(pwidechar(errorID),'货运单管理提示');
  end;
end;

procedure TForm19.Button5Click(Sender: TObject);
begin
  tjfhfjxx.Form61.ShowModal;
end;

procedure TForm19.ComboBox1DropDown(Sender: TObject);
begin
  try
    with zStoredProc1 do       //proc_cx_chengyunren_mc
    begin
      close;
      StoredProcName:='proc_cx_chengyunren_mc';
      open;
      combobox1.Items.Clear;
      while not eof do
      begin
         combobox1.Items.Add(fields[0].asstring);
         next;
      end;
    end;
  except
    application.MessageBox('查询数据失败！','货运单管理提示');
  end;
end;

procedure TForm19.ComboBox1Select(Sender: TObject);
begin
  try
    with zStoredProc1 do   //proc_cx_chengyunrenbh_by_cyrmc
    begin
      close;
      StoredProcName:='proc_cx_chengyunrenbh_by_cyrmc';
      ParamByName('cyrmc').Value:=combobox1.Text;
      open;
      if not eof then
        edit7.Text:=fields[0].asstring;
    end;
  except
    application.MessageBox('查询数据失败！','货运单管理提示');
  end;
end;

procedure TForm19.Edit10Change(Sender: TObject);
begin
  if edit10.Text <> '' then
    edit14.Text:=smalltobig(strtofloat(edit10.Text))
   else
    edit14.Text:='';
end;

procedure TForm19.Edit10KeyPress(Sender: TObject; var Key: Char);
begin
  if not charinset(key,['0'..'9','.',#8]) then
    key:=#0;
  if (key='.') and (Pos('.',Edit10.Text)>0)   then
    key:=#0;
end;

procedure TForm19.Edit1Change(Sender: TObject);
begin
  edit3.Text:=edit1.Text;
end;

procedure TForm19.Edit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  i:integer;
begin
if key=13 then
  try
    stringgrid2.RowCount:=2;
    stringgrid2.Rows[1].Clear;
      with zstoredproc1 do
      begin
        close;
        zstoredproc1.StoredProcName:='proc_cx_fhdxxzl_xzhyd';   //c.ffhdid,c.fhtbh,c.fkhmc,d.fxsyxm,c.fcddate,c.ffhdate,c.fisfhbz,c.fmemo
        zstoredproc1.ParamByName('fhdbh').Value:=edit1.Text;
        open;
        if ParamByName('returncode').Value=1 then
          application.MessageBox('该发货单已经生成货运单！','货运单管理提示')
        else  begin
          zstoredproc1.FirstResultSet;
          if not eof then
          begin
            edit1.Text:=fields[0].AsString;
            edit2.Text:=fields[1].AsString;
            edit4.Text:=fields[2].AsString;
            edit6.Text:=fields[4].AsString;
            edit15.Text:=fields[3].AsString;
            edit12.Text:=fields[8].AsString;
            edit5.Text:=fields[7].AsString;
            edit3.Text:=edit1.Text;
            edit9.Text:=edit4.Text;
            edit12.Text:=fields[8].AsString;
            zstoredproc1.NextResultSet;
            i:=1;
            while not eof do
            begin
              stringgrid2.RowCount:=stringgrid2.RowCount+1;
              stringgrid2.Cells[0,i]:=inttostr(i);
              stringgrid2.Cells[1,i]:=fields[0].AsString;
              stringgrid2.Cells[2,i]:=fields[1].AsString;
              stringgrid2.Cells[3,i]:=fields[2].AsString;
              stringgrid2.Cells[4,i]:=fields[3].AsString;
              stringgrid2.Cells[5,i]:=fields[4].AsString;
              stringgrid2.Cells[6,i]:=fields[5].AsString;
              i:=i+1;
              stringgrid2.Rows[stringgrid2.RowCount-1].Clear;
              next;
            end;
            zstoredproc1.NextResultSet;
            while not eof do
            begin
              stringgrid2.RowCount:=stringgrid2.RowCount+1;
              stringgrid2.Cells[0,i]:=fields[0].AsString;
              stringgrid2.Cells[2,i]:=fields[1].AsString;
              stringgrid2.Cells[3,i]:=fields[2].AsString;
              stringgrid2.Cells[4,i]:=fields[3].AsString;
              stringgrid2.Cells[5,i]:=fields[4].AsString;
              stringgrid2.Cells[6,i]:=fields[5].AsString;
              i:=i+1;
              stringgrid2.Rows[stringgrid2.RowCount-1].Clear;
              next;
            end;
          end else
        application.MessageBox('没有发现该发货单信息！','货运单管理提示');
        end;
      end;
    except
      application.MessageBox('查询数据失败！','货运单管理提示');
    end;
end;

procedure TForm19.FormShow(Sender: TObject);
begin
  stringgrid2.Cells[0,0]:='序号';
  stringgrid2.Cells[1,0]:='产品编号';
  stringgrid2.Cells[2,0]:='产品名称';
  stringgrid2.Cells[3,0]:='产品种类';
  stringgrid2.Cells[4,0]:='销售价格';
  stringgrid2.Cells[5,0]:='发货数量';
  stringgrid2.Cells[6,0]:='合计金额';
end;

procedure TForm19.StringGrid1SelectCell(Sender: TObject; ACol, ARow: Integer;
  var CanSelect: Boolean);
begin
  sARow:=ARow;
end;

procedure TForm19.StringGrid2SelectCell(Sender: TObject; ACol, ARow: Integer;
  var CanSelect: Boolean);
begin
  sARow2:=ARow;
end;

end.
