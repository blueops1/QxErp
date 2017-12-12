unit jhdxzfhd;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset, StdCtrls, Grids,
  ZStoredProcedure, Menus;

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
    ZStoredProc1: TZStoredProc;
    Button5: TButton;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    procedure FormShow(Sender: TObject);
    procedure ComboBox1DropDown(Sender: TObject);
    procedure Edit10KeyPress(Sender: TObject; var Key: Char);
    procedure Edit10Change(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure ComboBox1Select(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button5Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure StringGrid2SelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure Edit12KeyPress(Sender: TObject; var Key: Char);
    procedure StringGrid2KeyPress(Sender: TObject; var Key: Char);
    procedure StringGrid2SetEditText(Sender: TObject; ACol, ARow: Integer;
      const Value: string);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form40: TForm40;
  selRowIndex:integer;
  oldRowCount:integer;
  tmpsl:string;
  function SmallTOBig(small:real):string;stdcall;external 'dlltools.dll';

implementation

uses main,scjh,tjfhfjxx;

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
    if (i<>20) and (i<22) and (i<>19) and (form40.Components[i] is tedit) then
      if tedit(form40.Components[i]).Text='' then
      begin
        //application.MessageBox(pwidechar(form40.Components[i].Name+'|'+inttostr(i)),'aa');
        boolnull:=false;
      end;
    {if (form40.Components[i] is tcombobox)  then
      if tcombobox(form40.Components[i]).Text='' then
      begin
       // application.MessageBox(pwidechar(form19.Components[i].Name),'aa');
        boolnull:=false;
      end; }
  end;
  if  edit12.Text='' then
    boolnull:=false;
  try
  if boolnull=false then
    application.MessageBox('���������Ŀ��д����!!','������������ʾ')
  else begin
    with zStoredProc1 do            //proc_insert_fahuodanmxz_fahuodaninfo_huoyundaninfo
    begin
      close;
      StoredProcName:='proc_cx_fhdidisExist_by_fhdid';
      ParamByName('fhdid').Value:=edit1.Text;//fhdid,cpbh,cpdj,fhsl,fhdid,htbh,khid,hydid,cddate,fhdmemo,cyrid,sendwhere,carno,price,weight,distance,hydmemo
      open;
      if RecordCount>0 then
      begin
        application.MessageBox('�����Ѿ����ڣ����������ɵ��ţ��뱣�棡','��������ϸ��ʾ');
        edit1.Text:=inttostr(strtoint(edit1.Text)+1);
      end else begin
        errorID:='��������ϸ�������';
        gridcount:=stringgrid2.RowCount;
        for i := 1 to stringgrid2.rowcount-2 do
        begin
          if (stringgrid2.Cells[5,i]<>'') then
            begin
              if stringgrid2.Cells[5,i]<>'0' then
              begin
                close;
                StoredProcName:='proc_insert_fahuodan_mxz';
                ParamByName('fhdid').Value:=edit1.Text;
                ParamByName('jhdbh').Value:=scjh.tmpjhdbh;//fhdid,cpbh,cpdj,fhsl,fhdid,htbh,khid,hydid,cddate,fhdmemo,cyrid,sendwhere,carno,price,weight,distance,hydmemo
                ParamByName('cpbh').Value:=stringgrid2.Cells[1,i];
                ParamByName('cpdj').Value:=stringgrid2.Cells[4,i];
                ParamByName('fhsl').Value:=stringgrid2.Cells[5,i];
                ExecProc;
              end;
            end else
            begin
              application.MessageBox(pwidechar('��'+inttostr(i)+'�еķ�������Ϊ�գ�����д����'),'��������ϸ��ʾ');
              exit;
            end;
        end;
          errorID:='��������Ϣ�������';    //proc_insert_fahuodan_info
          close;
          StoredProcName:='proc_insert_fahuodan_info';
          ParamByName('fhdid').Value:=edit1.Text;//fhdid,cpbh,cpdj,fhsl,fhdid,htbh,khid,hydid,cddate,fhdmemo,cyrid,sendwhere,carno,price,weight,distance,hydmemo
          ParamByName('htbh').Value:=edit2.Text;
          ParamByName('khid').Value:=edit6.Text;
          ParamByName('hydid').Value:=edit3.Text;
          if edit12.Text='' then
            ParamByName('weight').Value:='0'
          else
            ParamByName('weight').Value:=edit12.Text;
          ParamByName('cddate').Value:=datetimetostr(now());
          ParamByName('jhdbh').Value:=scjh.tmpjhdbh;
          ParamByName('memo').Value:='*'+edit5.Text;
          ExecProc;
          edit1.Text:='';
          edit2.Text:='';
          edit4.Text:='';
          edit6.Text:='';
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
          {errorID:='���˵���Ϣ�������'; //proc_insert_huoyundan_info
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
          ExecProc;  }
          application.MessageBox('�����������ɹ���','������������ʾ');
      end;
    end;
  end;
  except
    application.MessageBox(pwidechar(errorID),'������������ʾ');
  end;
end;

procedure TForm40.Button5Click(Sender: TObject);
begin
  tjfhfjxx.isfrom:='jhdzfhd';
  tjfhfjxx.Form61.ShowModal;
end;

procedure TForm40.ComboBox1DropDown(Sender: TObject);
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
    application.MessageBox('��ѯ����ʧ�ܣ�','������������ʾ');
  end;
end;

procedure TForm40.ComboBox1Select(Sender: TObject);
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
    application.MessageBox('��ѯ����ʧ�ܣ�','������������ʾ');
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

procedure TForm40.Edit12KeyPress(Sender: TObject; var Key: Char);
begin
  if not charinset(key,['0'..'9','.',#8]) then
    key:=#0;
  if (key='.') and (Pos('.',Edit12.Text)>0)   then
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
  i,y:integer;
begin
  stringgrid2.Cells[0,0]:='���';
  stringgrid2.Cells[1,0]:='��Ʒ���';
  stringgrid2.Cells[2,0]:='��Ʒ����';
  stringgrid2.Cells[3,0]:='��Ʒ����';
  stringgrid2.Cells[4,0]:='���ۼ۸�';
  stringgrid2.Cells[5,0]:='��������(�ɵ���)';
  stringgrid2.Cells[6,0]:='�ɷ�����';
  try
    with zStoredProc1 do
    begin
      close;
      StoredProcName:='proc_cx_newfhdbh';
      open;
      if fields[0].AsString<>'' then
        edit1.Text:=fields[0].AsString
      else
        edit1.Text:=formatDateTime('yyyy',date)+'0001';
    end;
    edit2.Text:=scjh.Form17.StringGrid1.Cells[1,scjh.SelARow];
    edit4.Text:=scjh.Form17.StringGrid1.Cells[2,scjh.SelARow];
    edit9.Text:=scjh.Form17.StringGrid1.Cells[2,scjh.SelARow];
    edit6.Text:=scjh.Form17.StringGrid1.Cells[3,scjh.SelARow];
    edit3.Text:=edit1.Text;
    stringgrid2.RowCount:=2;
    stringgrid2.Rows[1].Clear;
    y:=0;
    for i := 1 to scjh.Form17.stringgrid2.RowCount - 2 do
    begin
      y:=y+1;
      if (strtofloat(scjh.Form17.StringGrid2.Cells[5,i])-strtofloat(scjh.Form17.StringGrid2.Cells[8,i])>0) and (strtofloat(scjh.Form17.StringGrid2.Cells[7,i])-strtofloat(scjh.Form17.StringGrid2.Cells[6,i])>0)  then
      begin
        stringgrid2.RowCount:=stringgrid2.RowCount+1;
        stringgrid2.Cells[0,y]:=scjh.Form17.StringGrid2.Cells[0,y];
        stringgrid2.Cells[1,y]:=scjh.Form17.StringGrid2.Cells[1,i];
        stringgrid2.Cells[2,y]:=scjh.Form17.StringGrid2.Cells[2,i];
        stringgrid2.Cells[3,y]:=scjh.Form17.StringGrid2.Cells[3,i];
        stringgrid2.Cells[4,y]:=scjh.Form17.StringGrid2.Cells[4,i];
        if strtofloat(scjh.Form17.StringGrid2.Cells[7,i])-strtofloat(scjh.Form17.StringGrid2.Cells[6,i])<strtofloat(scjh.Form17.StringGrid2.Cells[5,i])-strtofloat(scjh.Form17.StringGrid2.Cells[8,i]) then
          stringgrid2.Cells[5,y]:=floattostr(strtofloat(scjh.Form17.StringGrid2.Cells[7,i])-strtofloat(scjh.Form17.StringGrid2.Cells[6,i]))
        else
          stringgrid2.Cells[5,y]:=floattostr(strtofloat(scjh.Form17.StringGrid2.Cells[5,i])-strtofloat(scjh.Form17.StringGrid2.Cells[8,i]));
        stringgrid2.Cells[6,y]:= stringgrid2.Cells[5,y];//scjh.Form17.stringgrid2.Cells[7,i];
        stringgrid2.Rows[stringgrid2.RowCount-1].Clear;
      end else
        y:=y-1;
    end;
    oldRowCount:=y
   except
     application.MessageBox('���ݲ�ѯʧ��!!','������������ʾ')
  end;
end;

procedure TForm40.N1Click(Sender: TObject);
begin
  if (selRowIndex>oldRowCount-1) and (selRowIndex<stringgrid2.RowCount-1) then
  begin
    DeleteStringGridRow(selRowIndex,stringgrid2);
  end;
end;

procedure TForm40.StringGrid2KeyPress(Sender: TObject; var Key: Char);
begin
  if not charinset(key,['0'..'9','.',#8]) then
    key:=#0;
  if (key='.') and (Pos('.',Edit2.Text)>0)   then
    key:=#0;
end;

procedure TForm40.StringGrid2SelectCell(Sender: TObject; ACol, ARow: Integer;
  var CanSelect: Boolean);
begin
  selRowIndex:=ARow;
  tmpsl:=stringgrid2.Cells[5,ARow];
    if (ARow=0) or (ARow=stringgrid2.RowCount-1) or (ACol<>5) then
    stringgrid2.Options:=[goFixedVertLine,goFixedHorzLine,goVertLine,goHorzLine]
  else
    stringgrid2.Options:=[goFixedVertLine,goFixedHorzLine,goVertLine,goHorzLine,goEditing];

end;

procedure TForm40.StringGrid2SetEditText(Sender: TObject; ACol, ARow: Integer;
  const Value: string);
begin
  if stringgrid2.Cells[5,ARow]<>'' then
  if strtofloat(stringgrid2.Cells[6,ARow])<strtofloat(stringgrid2.Cells[5,ARow]) then
    stringgrid2.Cells[5,ARow]:=tmpSl;
end;

end.
