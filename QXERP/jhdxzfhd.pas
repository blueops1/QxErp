unit jhdxzfhd;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset, StdCtrls, Grids;

type
  TForm40 = class(TForm)
    Label3: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label6: TLabel;
    Label5: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    Label1: TLabel;
    Edit2: TEdit;
    Edit3: TEdit;
    StringGrid2: TStringGrid;
    Edit4: TEdit;
    Edit5: TEdit;
    Edit6: TEdit;
    ComboBox1: TComboBox;
    Edit7: TEdit;
    Edit8: TEdit;
    Edit9: TEdit;
    Edit10: TEdit;
    Edit11: TEdit;
    Edit12: TEdit;
    Edit13: TEdit;
    Button2: TButton;
    Edit14: TEdit;
    Edit1: TEdit;
    ZQuery1: TZQuery;
    procedure FormShow(Sender: TObject);
    procedure ComboBox1DropDown(Sender: TObject);
    procedure Edit10KeyPress(Sender: TObject; var Key: Char);
    procedure Edit10Change(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure ComboBox1Select(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form40: TForm40;
  function SmallTOBig(small:real):string;stdcall;external 'dlltools.dll';

implementation

uses scjh;

{$R *.dfm}

procedure TForm40.Button2Click(Sender: TObject);
var
  i:integer;
  boolnull:boolean;
  errorID:string;
  gridcount:integer;
begin
  boolnull:=true;
  for i:=0 to form40.ComponentCount-1 do
  begin
    if (i<>20) and (i<>29) and (i<>24) and (form40.Components[i] is tedit)  then
      if tedit(form40.Components[i]).Text='' then
      begin
        application.MessageBox(pwidechar(form40.Components[i].Name+'|'+inttostr(i)),'aa');
        boolnull:=false;
      end;
    if (form40.Components[i] is tcombobox)  then
      if tcombobox(form40.Components[i]).Text='' then
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
        for i := 1 to stringgrid2.rowcount-2 do
        begin
          if stringgrid2.Cells[5,i]<>'' then
            if strtoint(stringgrid2.Cells[5,i])>=0 then
            begin
              sql.Clear;
              sql.Add('INSERT into fahuodan_mxz (ffhdid,fcpbh,fcpdj,ffhsl) VALUES ('''+edit1.Text+''','''+stringgrid2.Cells[1,i]+''','''+stringgrid2.Cells[4,i]+''','''+stringgrid2.Cells[5,i]+''')');
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
          sql.Add('insert into huoyundan_info (fhydid,fcyrid,ffhdid,fsendwhere,fcarno,fprice,fweight,fdistance,fmemo) VALUES ('''+edit3.text+''','''+edit7.Text+''','''+edit1.Text+''','''+edit8.Text+''','''+edit9.Text+''','''+edit10.Text+''','''+edit12.Text+''','''+edit11.Text+''','''+edit13.Text+''')');
          ExecSQL;
          sql.Clear;
          sql.Add('update jihuadan_info set fisjdbz=''Y'',fjddate='''+datetimetostr(now())+''' where fjhdbh='+scjh.tmpjhdbh);
          ExecSQL;
          application.MessageBox('新增发货单成功！','发货单管理提示');
      end;
    end;
  end;
  except
    application.MessageBox(pwidechar(errorID),'发货单管理提示');
  end;
end;

procedure TForm40.ComboBox1DropDown(Sender: TObject);
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

procedure TForm40.ComboBox1Select(Sender: TObject);
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

procedure TForm40.Edit10Change(Sender: TObject);
begin
  if edit10.Text <> '' then
    edit14.Text:=smalltobig(strtofloat(edit10.Text))
   else
    edit14.Text:='';
end;

procedure TForm40.Edit10KeyPress(Sender: TObject; var Key: Char);
begin
  if not charinset(key,['0'..'9','.',#8]) then
    key:=#0;
  if (key='.') and (Pos('.',Edit10.Text)>0)   then
    key:=#0;
end;

procedure TForm40.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  edit5.Text:='';
  edit7.Text:='';
  edit8.Text:='';
  edit10.Text:='';
  edit11.Text:='';
  edit12.Text:='';
  edit13.Text:='';
  edit14.Text:='';
  combobox1.Text:='';
  stringgrid2.RowCount:=2;
  stringgrid2.Rows[1].Clear;
  with form17 do
  begin
    ComboBox1.Text:='';
    stringgrid1.RowCount:=2;
    stringgrid1.Rows[1].Clear;
    stringgrid2.RowCount:=2;
    stringgrid2.Rows[1].Clear;
  end;
end;

procedure TForm40.FormShow(Sender: TObject);
var
  i:integer;
begin
  stringgrid2.Cells[0,0]:='序号';
  stringgrid2.Cells[1,0]:='产品编号';
  stringgrid2.Cells[2,0]:='产品名称';
  stringgrid2.Cells[3,0]:='产品种类';
  stringgrid2.Cells[4,0]:='销售价格';
  stringgrid2.Cells[5,0]:='发货数量';
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
    edit3.Text:=edit1.Text;
  end;
  edit2.Text:=scjh.Form17.StringGrid1.Cells[1,scjh.SelARow];
  edit4.Text:=scjh.Form17.StringGrid1.Cells[2,scjh.SelARow];
  edit9.Text:=scjh.Form17.StringGrid1.Cells[2,scjh.SelARow];
  edit6.Text:=scjh.Form17.StringGrid1.Cells[3,scjh.SelARow];
  stringgrid2.RowCount:=2;
  stringgrid2.Rows[1].Clear;
  for i := 1 to scjh.Form17.stringgrid2.RowCount - 2 do
  begin
    stringgrid2.RowCount:=stringgrid2.RowCount+1;
    stringgrid2.Cells[0,i]:=scjh.Form17.StringGrid2.Cells[0,i];
    stringgrid2.Cells[1,i]:=scjh.Form17.StringGrid2.Cells[1,i];
    stringgrid2.Cells[2,i]:=scjh.Form17.StringGrid2.Cells[2,i];
    stringgrid2.Cells[3,i]:=scjh.Form17.StringGrid2.Cells[3,i];
    stringgrid2.Cells[4,i]:=scjh.Form17.StringGrid2.Cells[4,i];
    stringgrid2.Cells[5,i]:=scjh.Form17.StringGrid2.Cells[5,i];
    stringgrid2.Rows[stringgrid2.RowCount-1].Clear;
  end;


end;

end.
