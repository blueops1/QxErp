unit newxzjgd;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Menus, DB, ZAbstractRODataset, ZAbstractDataset,
  ZStoredProcedure, ExtCtrls, Grids, ComCtrls;

type
  TForm104 = class(TForm)
    Bevel1: TBevel;
    Label2: TLabel;
    Label3: TLabel;
    Label1: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label16: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    ComboBoxEx1: TComboBoxEx;
    Edit2: TEdit;
    Edit3: TEdit;
    DateTimePicker1: TDateTimePicker;
    Button1: TButton;
    Memo1: TMemo;
    StringGrid1: TStringGrid;
    Edit4: TEdit;
    ComboBox1: TComboBox;
    Button2: TButton;
    Edit5: TEdit;
    Edit1: TEdit;
    ComboBox2: TComboBox;
    Edit6: TEdit;
    Edit7: TEdit;
    RadioGroup1: TRadioGroup;
    ZStoredProc1: TZStoredProc;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    Edit8: TEdit;
    StringGrid2: TStringGrid;
    Label14: TLabel;
    StatusBar1: TStatusBar;
    RadioGroup2: TRadioGroup;
    procedure Edit8KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure StringGrid2SelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure Edit4KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure ComboBox1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ComboBox2DropDown(Sender: TObject);
    procedure ComboBoxEx1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ComboBoxEx1Select(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure StringGrid1SelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form104: TForm104;
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

procedure TForm104.Button1Click(Sender: TObject);
var
  y:integer;
  strjglx:string;
begin
if application.MessageBox('确定要保存数据吗？','新增加工单管理提示',1)=1 then
  if stringgrid1.RowCount>1 then
    try
      with zstoredproc1 do
      begin
        close;
        zstoredproc1.StoredProcName:='proc_insert_jiagongdan_info';  //jgdbh,jgje,jgddate,jgsbh,czry,memo
        zstoredproc1.ParamByName('jgdbh').Value:=edit4.Text;
        zstoredproc1.ParamByName('jgje').Value:=edit6.Text;
        zstoredproc1.ParamByName('jgsbh').Value:=splitstring(ComboBox1.Text,'|');
        zstoredproc1.ParamByName('jgddate').Value:=datetimepicker1.Date;
        zstoredproc1.ParamByName('czry').Value:=main.strUser;
        if radiogroup1.ItemIndex=0 then
         strjglx:='清加工'
        else
          strjglx:='包工包料';
        zstoredproc1.ParamByName('memo').Value:='*价格类型:'+strjglx+'  加工说明:'+memo1.Text;
        execProc;
        zstoredproc1.StoredProcName:='proc_insert_jiagongdan_mxz';  //jgdbh,pjbh,pjsl,jgprice,memo
        for y := 1 to stringgrid1.RowCount - 2 do
        begin
          zstoredproc1.ParamByName('jgdbh').Value:=edit4.Text;
          zstoredproc1.ParamByName('pjbh').Value:=splitstring(stringgrid1.Cells[1,y],'|');
          zstoredproc1.ParamByName('pjsl').Value:=stringgrid1.Cells[2,y];
          zstoredproc1.ParamByName('jgprice').Value:=stringgrid1.Cells[3,y];
          zstoredproc1.ParamByName('jgzlbh').Value:=splitstring(stringgrid1.Cells[4,y],'|');
          zstoredproc1.ParamByName('memo').Value:='*'+stringgrid1.Cells[5,y];
          execProc;
        end;
      end;
      application.MessageBox('保存数据成功！','新增加工单管理提示');
      edit1.Text:='';
      edit2.Text:='';
      edit3.Text:='';
      edit4.Text:='';
      edit5.Text:='';
      edit6.Text:='0';
      comboboxex1.Text:='';
      combobox1.Text:='';
      memo1.Text:='';
      stringgrid1.RowCount:=2;
      stringgrid1.Rows[1].Clear;
  except
    application.MessageBox('保存数据失败！','新增加工单管理提示');
  end else
    application.MessageBox('请添加加工单内的明细！','新增加工单管理提示');
end;

procedure TForm104.Button2Click(Sender: TObject);
var
  booldouble:boolean;
  i:integer;
  gjprice:string;
begin
  if (edit1.Text<>'') then
    gjprice:=edit1.Text
  else
    gjprice:=edit3.Text;
  booldouble:=false;
  for i := 1 to stringgrid1.RowCount - 1 do
  begin
    if comboboxex1.Text=stringgrid1.Cells[1,i] then
       booldouble:=true;
  end;
    if booldouble=true then
      application.MessageBox('该产品已在下面列表中，请确认！','新增合同提示')
    else
     begin
  if (edit4.Text<>'') and (combobox1.Text<>'') then
    if (combobox2.Text<>'') and (comboboxex1.Text<>'') and (edit2.Text<>'') and (edit3.Text<>'') then
      begin
        stringgrid1.RowCount:=stringgrid1.RowCount+1;
        stringgrid1.Cells[0,stringgrid1.RowCount-2]:=inttostr(stringgrid1.RowCount-2);
        stringgrid1.Cells[1,stringgrid1.RowCount-2]:=comboboxex1.Text;
        stringgrid1.Cells[2,stringgrid1.RowCount-2]:=edit2.Text;
        stringgrid1.Cells[3,stringgrid1.RowCount-2]:=gjprice;
        stringgrid1.Cells[4,stringgrid1.RowCount-2]:=combobox2.Text;
        stringgrid1.Cells[5,stringgrid1.RowCount-2]:=edit5.Text;
        stringgrid1.rows[stringgrid1.RowCount-1].Clear;
        edit6.Text:=floattostr(strtofloat(edit6.Text)+strtofloat(gjprice)*strtofloat(edit2.Text));
        ComboBoxEx1.Text:='';
        edit3.Text:='';
        edit5.Text:='';
        edit1.Text:='';
        edit2.Text:='';
        ComboBoxEx1.SetFocus;
        end 
      else
        application.MessageBox('请将明细填写！','新增加工单管理提示')
    else
      application.MessageBox('请先将加工单信息填写完整！','新增加工单管理提示');
     end;
end;

procedure TForm104.ComboBox1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if key=13 then
 begin
    if combobox1.Items.Count>0 then
    ComboBox1.Items.Clear;
    try
      with zstoredproc1 do
      begin
        close;
        zstoredproc1.StoredProcName:='proc_cx_jgsmc';
        zstoredproc1.ParamByName('jgsname').Value:=ComboBox1.Text;
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

procedure TForm104.ComboBox2DropDown(Sender: TObject);
begin
  if combobox2.Items.Count>0 then
    combobox2.Items.Clear;
    try
      with zStoredProc1 do
      begin
        close;
        StoredProcName:='proc_cx_wxjgzl';
        open;
        while not eof do
        begin
          combobox2.Items.Add(fields[0].asstring);
          next;
        end;
      end;
    except
      application.MessageBox('查询数据失败！','加工价格信息管理提示');
    end;
end;

procedure TForm104.ComboBoxEx1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=13) and (ComboBoxEx1.Text<>'') and (combobox2.Text<>'') then
   begin
      edit1.Text:='';
      if ComboBoxEx1.Items.Count>0 then
      ComboBoxEx1.Items.Clear;
      //combobox1.Items.Add('*|全部供应商');
      try
        with zstoredproc1 do
        begin
          close;
          StoredProcName:='proc_cx_zxbcpjgd_by_cxmc';
          ParamByName('cxmc').Value:=ComboBoxEx1.Text;
          ParamByName('jgzlbh').Value:=SplitString(combobox2.Text,'|');
          open;
          while not eof do
          begin
            ComboBoxEx1.Items.Add(fields[0].asstring);
            next;
          end;
          //combobox1.DroppedDown:=true;
        end;
      except
        application.MessageBox('数据查询失败！','新增加工单管理提示');
      end;
  end;
end;

procedure TForm104.ComboBoxEx1Select(Sender: TObject);
begin
  try
    with zStoredProc1 do
    begin
      close;
      StoredProcName:='proc_cx_waixiepeijian_jgprice_by_pjbh';
      ParamByName('gjbh').Value:=SplitString(ComboBoxEx1.Text,'|');
      ParamByName('jgzlbh').Value:=SplitString(combobox2.Text,'|');
      open;
      if not eof then
      begin
        if radiogroup1.ItemIndex=0 then
          edit3.Text:=fields[0].AsString
        else
          edit3.Text:=fields[1].AsString;
        edit7.Text:=fields[2].AsString;
      end else
        application.MessageBox('该物品价格信息不存在！','新增加工单管理提示');
    end;
  except
    application.MessageBox('数据查询失败！','新增加工单管理提示');
  end;
end;

procedure TForm104.Edit4KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key=13 then
    try
      with zstoredproc1 do
      begin
        close;
        zstoredproc1.StoredProcName:='proc_cx_newwxjgdbh';
        open;
        if fields[0].AsString<>'' then
          edit4.Text:=fields[0].AsString
        else
          edit4.Text:=formatDateTime('yyyy',date)+'0001';
      end;
    except
      application.MessageBox('数据查询失败！','新增加工单管理提示');
    end;
end;

procedure TForm104.Edit8KeyDown(Sender: TObject; var Key: Word;
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
        StoredProcName:='proc_cx_htbcpweight';   //fhtbh,fhtdate,fkhmc,fxsyxm,flxr,flxrdh,fhtzje,ffhjsbz,fmemo
        ParamByName('htbh').Value:=edit8.Text;
        open;
          //FirstResultSet;
          stringgrid2.RowCount:=2;
          stringgrid2.Rows[1].Clear;
          y:=1;
          while not eof do
          begin
            stringgrid2.RowCount:=stringgrid2.RowCount+1;
            stringgrid2.Cells[0,y]:=inttostr(y);
            stringgrid2.Cells[1,y]:=fields[2].AsString+'|'+fields[3].AsString;
            stringgrid2.Cells[2,y]:=fields[4].AsString;
            stringgrid2.Cells[3,y]:=fields[5].AsString;
            stringgrid2.Cells[4,y]:=fields[6].AsString;
            stringgrid2.Cells[5,y]:=fields[7].AsString;
            stringgrid2.Cells[6,y]:=fields[8].AsString;
            stringgrid2.Rows[stringgrid2.RowCount-1].Clear;
            y:=y+1;
            next;
          end;
      end;
    except
      application.MessageBox('查询数据失败！','老合同管理提示');
    end;
  end;
end;


procedure TForm104.FormShow(Sender: TObject);
begin    //proc_cx_jgprice
  try
      with zStoredProc1 do
      begin
        close;
        StoredProcName:='proc_cx_jgprice';   //fhtbh,fhtdate,fkhmc,fxsyxm,flxr,flxrdh,fhtzje,ffhjsbz,fmemo
        open;
      if not eof then
        StatusBar1.Panels.Items[0].Text :='当前铸件加工单价为:';
        StatusBar1.Panels.Items[1].Text :=fields[2].AsString;
        StatusBar1.Panels.Items[2].Text :='当前铸件加工单价为:';
        StatusBar1.Panels.Items[3].Text :=fields[3].AsString ;
         StatusBar1.Panels.Items[4].Text :='执行日期为:';
          StatusBar1.Panels.Items[5].Text :=fields[1].AsString ;
        end;
    except
      application.MessageBox('查询数据失败！','老合同管理提示');
    end;
      datetimepicker1.DateTime:=now();
      stringgrid2.Cells[0,0]:='序号';
      stringgrid2.Cells[1,0]:='产品名称';
      stringgrid2.Cells[2,0]:='顶板重量';
      stringgrid2.Cells[3,0]:='衬板重量';
      stringgrid2.Cells[4,0]:='底盆重量';
      stringgrid2.Cells[5,0]:='重量系数';
end;


procedure TForm104.N1Click(Sender: TObject);
begin
  if (selRowIndex>0) and (selRowIndex<stringgrid1.RowCount-1) then
  begin
    edit6.Text:=floattostr(strtofloat(edit6.Text)-strtofloat(stringgrid1.Cells[2,selRowIndex])*strtofloat(stringgrid1.Cells[3,selRowIndex]));
    if strtofloat(edit6.Text)<1 then
      edit6.Text:='0';
    DeleteStringGridRow(selRowIndex,stringgrid1);
  end;
end;

procedure TForm104.StringGrid1SelectCell(Sender: TObject; ACol, ARow: Integer;
  var CanSelect: Boolean);
begin
  selRowIndex:=Arow;
end;

procedure TForm104.StringGrid2SelectCell(Sender: TObject; ACol, ARow: Integer;
  var CanSelect: Boolean);
begin
      if (ARow>0) and (stringgrid2.Cells[2,ARow]<>'') then
  begin
  case radiogroup2.ItemIndex of
    0:
    begin
      if radiogroup1.ItemIndex=0 then
        edit1.Text:=floattostr(trunc(strtofloat(stringgrid2.Cells[2,ARow])*strtofloat(StatusBar1.Panels.Items[3].Text)))
      else
        edit1.Text:=floattostr(trunc(strtofloat(stringgrid2.Cells[2,ARow])*strtofloat(stringgrid2.Cells[5,ARow])*strtofloat(StatusBar1.Panels.Items[1].Text)));
    end;
    1:
    begin
      if radiogroup1.ItemIndex=0 then
        edit1.Text:=floattostr(trunc(strtofloat(stringgrid2.Cells[3,ARow])*strtofloat(StatusBar1.Panels.Items[3].Text)))
      else
        edit1.Text:=floattostr(trunc(strtofloat(stringgrid2.Cells[3,ARow])*strtofloat(stringgrid2.Cells[5,ARow])*strtofloat(StatusBar1.Panels.Items[1].Text)));
    end;
    2:
    begin
      if radiogroup1.ItemIndex=0 then
        edit1.Text:=floattostr(trunc(strtofloat(stringgrid2.Cells[4,ARow])*strtofloat(StatusBar1.Panels.Items[3].Text)))
      else
        edit1.Text:=floattostr(trunc(strtofloat(stringgrid2.Cells[4,ARow])*strtofloat(stringgrid2.Cells[5,ARow])*strtofloat(StatusBar1.Panels.Items[1].Text)));
    end;
  end;



  end;
end;

end.
