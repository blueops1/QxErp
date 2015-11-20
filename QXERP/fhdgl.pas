unit fhdgl;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, StdCtrls, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset,
  ExtCtrls;

type
  TForm19 = class(TForm)
    ZQuery1: TZQuery;
    Label1: TLabel;
    Label2: TLabel;
    Edit2: TEdit;
    Label3: TLabel;
    Edit3: TEdit;
    StringGrid1: TStringGrid;
    StringGrid2: TStringGrid;
    Button1: TButton;
    Button3: TButton;
    Label4: TLabel;
    Edit4: TEdit;
    Label5: TLabel;
    Edit5: TEdit;
    Edit6: TEdit;
    Label6: TLabel;
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
    Button4: TButton;
    procedure Edit2KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Button1Click(Sender: TObject);
    procedure StringGrid1SelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure StringGrid2SelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure Button3Click(Sender: TObject);
    procedure StringGrid2SetEditText(Sender: TObject; ACol, ARow: Integer;
      const Value: string);
    procedure Button2Click(Sender: TObject);
    procedure Edit10Change(Sender: TObject);
    procedure Edit10KeyPress(Sender: TObject; var Key: Char);
    procedure Edit1Change(Sender: TObject);
    procedure ComboBox1DropDown(Sender: TObject);
    procedure ComboBox1Select(Sender: TObject);
    procedure Button4Click(Sender: TObject);
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

procedure TForm19.Button1Click(Sender: TObject);
begin
  if (sARow<stringgrid1.RowCount) and (sARow>0) then
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
   end;

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
    if (i<>24) and (i<>33) and (form19.Components[i] is tedit)  then
      if tedit(form19.Components[i]).Text='' then
      begin
        //application.MessageBox(pwidechar(form19.Components[i].Name+'|'+inttostr(i)),'aa');
        boolnull:=false;
      end;
    if (form19.Components[i] is tcombobox)  then
      if tcombobox(form19.Components[i]).Text='' then
      begin
       // application.MessageBox(pwidechar(form19.Components[i].Name),'aa');
        boolnull:=false;
      end;
  end;
  try
  if boolnull=false then
    application.MessageBox('请把所有项目填写完整!!','发货单管理提示')
  else begin
    with zquery1 do
    begin
      close;
      sql.Clear;
      sql.Add('select ffhdid from fahuodan_info where ffhdid='+edit1.Text);
      open;
      if RecordCount>0 then
        application.MessageBox('该发货单号已经存在，请核实！','发货单明细提示')
      else begin
        errorID:='发货单明细保存错误！';
        gridcount:=stringgrid2.RowCount;
        for i := 1 to stringgrid2.rowcount-1 do
        begin
          if stringgrid2.Cells[6,i]<>'' then
            if (strtoint(stringgrid2.Cells[4,i])-strtoint(stringgrid2.Cells[5,i])-strtoint(stringgrid2.Cells[6,i])>=0) then
            begin
              sql.Clear;
              sql.Add('INSERT into fahuodan_mxz (ffhdid,fcpbh,fcpdj,ffhsl) VALUES ('''+edit1.Text+''','''+stringgrid2.Cells[0,i]+''','''+stringgrid2.Cells[3,i]+''','''+stringgrid2.Cells[6,i]+''')');
              ExecSQL;
            end else
            begin
              application.MessageBox(pwidechar('第'+inttostr(i)+'行的发货数量大于未发数量，请核实！'),'发货单明细提示');
              exit;
            end else
            begin
              application.MessageBox(pwidechar('第'+inttostr(i)+'行的发货数量为空，请填写完整'),'发货单明细提示');
              exit;
            end;
        end;
          errorID:='发货单信息保存错误！';
          sql.Clear;
          sql.Add('INSERT into fahuodan_info (ffhdid,fhtbh,fkhid,fhydid,fcddate,fmemo) VALUES ('''+edit1.Text+''','''+edit2.Text+''','''+edit6.Text+''','''+edit3.Text +''','''+datetimetostr(now())+''','''+edit5.Text +''')');
          ExecSQL;
          errorID:='货运单信息保存错误！';
          sql.Clear;
          sql.Add('insert into huoyundan_info (fhydid,fcyrid,ffhdid,fcarno,fprice,fweight,fdistance,fmemo) VALUES ('''+edit3.text+''','''+edit7.Text+''','''+edit1.Text+''','''+edit8.Text+''','''+edit10.Text+''','''+edit12.Text+''','''+edit11.Text+''','''+edit13.Text+''')');
          ExecSQL;
          application.MessageBox('新增发货单成功！','发货单管理提示');
      end;
    end;
  end;
  except
    application.MessageBox(pwidechar(errorID),'发货单管理提示');
  end;
end;

procedure TForm19.Button3Click(Sender: TObject);
begin
  if (sARow2<stringgrid2.RowCount) and (sARow2>0) then
  begin
    stringgrid1.RowCount:=stringgrid1.RowCount+1;
    stringgrid1.Cells[0,stringgrid1.RowCount-1]:=stringgrid2.Cells[0,sARow2];
    stringgrid1.Cells[1,stringgrid1.RowCount-1]:=stringgrid2.Cells[1,sARow2];
    stringgrid1.Cells[2,stringgrid1.RowCount-1]:=stringgrid2.Cells[2,sARow2];
    stringgrid1.Cells[3,stringgrid1.RowCount-1]:=stringgrid2.Cells[3,sARow2];
    stringgrid1.Cells[4,stringgrid1.RowCount-1]:=stringgrid2.Cells[4,sARow2];
    stringgrid1.Cells[5,stringgrid1.RowCount-1]:=stringgrid2.Cells[5,sARow2];
    stringgrid1.FixedRows:=1;
    DeleteStringGridRow(sARow2,stringgrid2);
    sARow2:=0;
   end;

end;

procedure TForm19.Button4Click(Sender: TObject);
begin
  with zquery1 do
  begin
    close;
    sql.Clear;
    sql.Add('select max(ffhdid)+1 from fahuodan_info');
    open;
    if fields[0].AsString<>'' then
      edit1.Text:=fields[0].AsString
    else
      edit1.Text:=formatDateTime('yyyy',date)+'0001';
  end;
end;

procedure TForm19.ComboBox1DropDown(Sender: TObject);
begin
  with ZQuery1 do
  begin
    close;
    sql.Clear;
    sql.Add('select fcyrmc from chengyunren_info');
    open;
    combobox1.Items.Clear;
    while not eof do
    begin
       combobox1.Items.Add(fields[0].asstring);
       next;
    end;
  end;
end;

procedure TForm19.ComboBox1Select(Sender: TObject);
begin
  with ZQuery1 do
  begin
    close;
    sql.Clear;
    sql.Add('select fcyrid from chengyunren_info where fcyrmc='''+combobox1.Text+'''');
    open;
    if not eof then
      edit7.Text:=fields[0].asstring;
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

procedure TForm19.Edit2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  y:integer;
begin
  if key=13 then
  begin
    try
      with zquery1 do
      begin
        close;
        sql.Clear;
        sql.Add('select a.fcpbh,b.fcpmc,b.fcpzl,a.fcpdj,a.fcpsl,a.fyfhsl FROM(SELECT fcpbh,fcpdj,fcpsl,fyfhsl from htcpmxb where fhtbh='''+edit2.Text+''') as a JOIN (select fcpbh,fcpmc,fcpzl from cplxk) as b on a.fcpbh=b.fcpbh;');
        open;
        if eof then
        begin
           application.MessageBox('该合同下无产品明细，可能是旧合同，请确认！','发货单管理提示');
           edit4.Text:='';
           edit6.Text:='';
           edit9.Text:='';
           stringgrid1.RowCount:=1;
           stringgrid2.RowCount:=1;
           edit5.Text:='';
           edit2.SelectAll;
        end else
        begin
            stringgrid1.RowCount:=zquery1.RecordCount+1;
            stringgrid2.RowCount:=1;
            y:=1;
            stringgrid1.Cells[0,0]:='产品编号';
            stringgrid1.Cells[1,0]:='产品名称';
            stringgrid1.Cells[2,0]:='产品种类';
            stringgrid1.Cells[3,0]:='销售价格';
            stringgrid1.Cells[4,0]:='销售数量';
            stringgrid1.Cells[5,0]:='已发货数量';
            stringgrid2.Cells[0,0]:='产品编号';
            stringgrid2.Cells[1,0]:='产品名称';
            stringgrid2.Cells[2,0]:='产品种类';
            stringgrid2.Cells[3,0]:='销售价格';
            stringgrid2.Cells[4,0]:='销售数量';
            stringgrid2.Cells[5,0]:='已发货数量';
            stringgrid2.Cells[6,0]:='待发货数量';
          while not eof do
          begin
            stringgrid1.Cells[0,y]:=fields[0].AsString;
            stringgrid1.Cells[1,y]:=fields[1].AsString;
            stringgrid1.Cells[2,y]:=fields[2].AsString;
            stringgrid1.Cells[3,y]:=fields[3].AsString;
            stringgrid1.Cells[4,y]:=fields[4].AsString;
            stringgrid1.Cells[5,y]:=fields[5].AsString;
            y:=y+1;
            next;
          end;
          sql.Clear;
          sql.Add('select a.fkhmc,a.fkdhid from (SELECT fkdhid,fkhmc from kh_info) as a JOIN (select fhtbh,fkhbh from ht_info where fhtbh='''+edit2.Text+''') as b on a.fkdhid=b.fkhbh');
          open;
          if not eof then
          begin
            edit4.Text:=fields[0].AsString;
            edit6.Text:=fields[1].AsString;
            edit9.Text:=fields[0].AsString;
          end else
            application.MessageBox('查询数据失败！','发货单管理提示');
        end;
      end;
    except
      application.MessageBox('查询数据失败！','发货单管理提示')
    end;
  end;
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
  tmpString:=stringgrid2.Cells[ACol,ARow];
end;

procedure TForm19.StringGrid2SetEditText(Sender: TObject; ACol, ARow: Integer;
  const Value: string);
begin
  if (ACol<>6) and (ARow>0) then
  begin
    stringgrid2.Cells[ACol,ARow]:=tmpString;
  end;
end;

end.
